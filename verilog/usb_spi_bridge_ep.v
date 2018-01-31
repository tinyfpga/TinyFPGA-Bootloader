module usb_spi_bridge_ep (
  input clk,
  input reset,


  ////////////////////
  // out endpoint interface 
  ////////////////////
  output out_ep_req,
  input out_ep_grant,
  input out_ep_data_avail,
  input out_ep_setup,
  output out_ep_data_get,
  input [7:0] out_ep_data,
  output out_ep_stall,
  input out_ep_acked,


  ////////////////////
  // in endpoint interface 
  ////////////////////
  output in_ep_req,
  input in_ep_grant,
  input in_ep_data_free,
  output in_ep_data_put,
  output [7:0] in_ep_data,
  output reg in_ep_data_done,
  output in_ep_stall,
  input in_ep_acked,


  ////////////////////
  // spi interface 
  ////////////////////
  output reg spi_cs_b,
  output reg spi_sck,
  output spi_mosi,
  input spi_miso,

  
  ////////////////////
  // warm boot interface
  ////////////////////
  output reg boot_to_user_design,


  ////////////////////
  // output pin interface for test
  ////////////////////
  output reg [31:0] output_pin_values,
  output reg [31:0] output_pin_enables
);

  wire spi_byte_out_xfr_ready = out_ep_grant && out_ep_data_avail;
  wire spi_byte_in_xfr_ready = in_ep_grant && in_ep_data_free;

  reg [15:0] data_out_length;
  reg [15:0] data_in_length;

  reg [8:0] spi_out_data;
  reg [8:0] spi_in_data;


  ////////////////////////////////////////////////////////////////////////////////
  // command sequencer
  ////////////////////////////////////////////////////////////////////////////////
  reg [3:0] cmd_state;
  reg [3:0] cmd_state_next;

  localparam CMD_IDLE = 0;
  localparam CMD_PRE = 1;
  localparam CMD_OP_BOOT = 2;

  //localparam CMD_OP_XFR = 3;
  localparam CMD_SAVE_DOL_LO = 3;
  localparam CMD_SAVE_DOL_HI = 4;
  localparam CMD_SAVE_DIL_LO = 5;
  localparam CMD_SAVE_DIL_HI = 6;
  localparam CMD_DO_OUT = 7;
  localparam CMD_DIR_TRANSITION = 8;
  localparam CMD_DO_IN = 9;

  reg get_cmd_out_data;
  reg spi_has_more_in_bytes;
  reg spi_has_more_out_bytes;
  reg spi_start_new_xfr;


  ////////////////////////////////////////////////////////////////////////////////
  // spi protocol engine
  ////////////////////////////////////////////////////////////////////////////////
  reg [2:0] spi_state;
  reg [2:0] spi_state_next;
  
  localparam SPI_IDLE = 0;
  localparam SPI_START = 1;
  localparam SPI_SEND_BIT_1 = 2;
  localparam SPI_SEND_BIT_2 = 3;
  localparam SPI_GET_BIT = 4;
  localparam SPI_END = 5;

  reg spi_send_bit;
  reg spi_get_bit;
  reg get_spi_out_data;
  reg put_spi_in_data;
  reg reset_spi_bit_counter;
  reg update_spi_byte_counters;

  reg [3:0] spi_bit_counter;

  ////////////////////////////////////////////////////////////////////////////////
  // other glue logic
  ////////////////////////////////////////////////////////////////////////////////
  assign out_ep_req = out_ep_data_avail;
  assign out_ep_data_get = (get_spi_out_data || get_cmd_out_data) && out_ep_grant; 
  
  assign in_ep_req = (spi_has_more_in_bytes || spi_put_last_in_byte) && in_ep_data_free;
  assign in_ep_data_put = put_spi_in_data;
  assign in_ep_data = spi_in_data[7:0];

  assign spi_mosi = spi_out_data[8];

  wire spi_byte_done = spi_bit_counter == 7;

  reg out_data_ready;
  always @(posedge clk) out_data_ready <= out_ep_grant && out_ep_data_avail; 

  reg spi_dir_transition;
  reg spi_put_last_in_byte;

  ////////////////////////////////////////////////////////////////////////////////
  // command sequencer
  ////////////////////////////////////////////////////////////////////////////////
  always @* begin
    get_cmd_out_data <= 0;
    boot_to_user_design <= 0;
    spi_put_last_in_byte <= 0;
    spi_has_more_in_bytes <= 0;
    spi_dir_transition <= 0;
    spi_has_more_out_bytes <= 0;
    in_ep_data_done <= 0;
    spi_start_new_xfr <= 0;

    case (cmd_state)
      CMD_IDLE : begin
        if (out_data_ready) begin
          get_cmd_out_data <= 1;
          cmd_state_next <= CMD_PRE;

        end else begin
          cmd_state_next <= CMD_IDLE;
        end
      end

      CMD_PRE : begin
        get_cmd_out_data <= 1;

        if (out_data_ready && out_ep_data == 0) begin
          cmd_state_next <= CMD_OP_BOOT;

        end else if (out_data_ready && out_ep_data == 1) begin  
          //cmd_state_next <= CMD_OP_XFR;    
          cmd_state_next <= CMD_SAVE_DOL_LO;    
  
        end else if (out_data_ready && out_ep_data[7]) begin
          // out_ep_data[6] // output pin value
          // out_ep_data[5] // output pin enable
          // out_ep_data[4:0] // output pin id 

          output_pin_values[out_ep_data[4:0]] <= out_ep_data[6];
          output_pin_enables[out_ep_data[4:0]] <= out_ep_data[5];

          cmd_state_next <= CMD_IDLE;

        end else begin
          cmd_state_next <= CMD_IDLE;
        end
      end

      CMD_OP_BOOT : begin
        cmd_state_next <= CMD_OP_BOOT;
        boot_to_user_design <= 1;
      end

      //CMD_OP_XFR : begin
      //  cmd_state_next <= CMD_SAVE_DOL_LO;
      //end

      CMD_SAVE_DOL_LO : begin
        if (out_data_ready) begin   
          get_cmd_out_data <= 1;
          cmd_state_next <= CMD_SAVE_DOL_HI;     
  
        end else begin
          cmd_state_next <= CMD_SAVE_DOL_LO;
        end
      end

      CMD_SAVE_DOL_HI : begin
        if (out_data_ready) begin   
          get_cmd_out_data <= 1;
          cmd_state_next <= CMD_SAVE_DIL_LO;     
  
        end else begin
          cmd_state_next <= CMD_SAVE_DOL_HI;
        end
      end

      CMD_SAVE_DIL_LO : begin
        if (out_data_ready) begin   
          get_cmd_out_data <= 1;
          cmd_state_next <= CMD_SAVE_DIL_HI;     
  
        end else begin
          cmd_state_next <= CMD_SAVE_DIL_LO;
        end
      end

      CMD_SAVE_DIL_HI : begin
        if (out_data_ready) begin   
          cmd_state_next <= CMD_DO_OUT; 
          //get_cmd_out_data <= 1;    
          spi_start_new_xfr <= 1;
  
        end else begin
          cmd_state_next <= CMD_SAVE_DIL_HI;
        end
      end

      CMD_DO_OUT : begin
        if (data_out_length == 0) begin
          if (data_in_length == 0) begin
            cmd_state_next <= CMD_IDLE;
          end else begin
            cmd_state_next <= CMD_DIR_TRANSITION;
            spi_dir_transition <= 1;
          end

        end else begin
          cmd_state_next <= CMD_DO_OUT;
          spi_has_more_out_bytes <= 1;
        end
      end

      CMD_DIR_TRANSITION : begin
        if (spi_byte_done) begin
          cmd_state_next <= CMD_DO_IN;
          spi_has_more_in_bytes <= 1;

        end else begin
          cmd_state_next <= CMD_DIR_TRANSITION;
          spi_dir_transition <= 1;
        end
      end

      CMD_DO_IN : begin
        if (data_in_length == 0) begin
          cmd_state_next <= CMD_IDLE;
          spi_put_last_in_byte <= 1;
          in_ep_data_done <= 1;

        end else begin
          cmd_state_next <= CMD_DO_IN;
          spi_has_more_in_bytes <= 1;
        end
      end

      default begin
        cmd_state_next <= CMD_IDLE;
      end
    endcase
  end

  always @(posedge clk) begin
    cmd_state <= cmd_state_next;
    
    if (get_cmd_out_data) begin
      case (cmd_state)
        CMD_SAVE_DOL_LO : data_out_length[7:0] <= out_ep_data;
        CMD_SAVE_DOL_HI : data_out_length[15:8] <= out_ep_data;
        CMD_SAVE_DIL_LO : data_in_length[7:0] <= out_ep_data;
        CMD_SAVE_DIL_HI : data_in_length[15:8] <= out_ep_data;
      endcase
    end

    if (update_spi_byte_counters) begin
      case (cmd_state)
        CMD_DO_OUT : data_out_length <= data_out_length - 1;
        CMD_DO_IN : data_in_length <= data_in_length - 1;
      endcase
    end

  end

  ////////////////////////////////////////////////////////////////////////////////
  // spi protocol engine
  ////////////////////////////////////////////////////////////////////////////////
  always @* begin
    spi_send_bit <= 0;
    spi_get_bit <= 0;
    get_spi_out_data <= 0;
    put_spi_in_data <= 0;
    reset_spi_bit_counter <= 0;
    update_spi_byte_counters <= 0;

    case (spi_state)
      SPI_IDLE : begin
        spi_cs_b <= 1;
        spi_sck <= 0;

        if (spi_start_new_xfr) begin
          spi_state_next <= SPI_START;
          reset_spi_bit_counter <= 1;

        end else begin
          spi_state_next <= SPI_IDLE;
        end
      end

      SPI_START : begin
        spi_cs_b <= 0;
        spi_sck <= 0;

        if (spi_has_more_out_bytes) begin
          get_spi_out_data <= 1;
          spi_state_next <= SPI_SEND_BIT_1;
          
        end else if (spi_has_more_in_bytes || spi_dir_transition) begin
          spi_state_next <= SPI_SEND_BIT_1;

        end else begin
          spi_state_next <= SPI_START;
        end
      end

      SPI_SEND_BIT_1 : begin
        spi_cs_b <= 0;
        spi_sck <= 0;
        spi_send_bit <= 1;

        spi_state_next <= SPI_SEND_BIT_2;
      end

      SPI_SEND_BIT_2 : begin
        spi_cs_b <= 0;
        spi_sck <= 1;

        spi_state_next <= SPI_GET_BIT;
      end

      SPI_GET_BIT : begin
        spi_cs_b <= 0;
        spi_sck <= 1;
        spi_get_bit <= 1;

        if (spi_byte_done) begin
          update_spi_byte_counters <= 1;
          spi_state_next <= SPI_END;

        end else begin
          spi_state_next <= SPI_SEND_BIT_1;
        end
      end

      SPI_END : begin
        spi_cs_b <= 0;
        spi_sck <= 0;

        if (spi_has_more_out_bytes) begin
          reset_spi_bit_counter <= 1;
          spi_state_next <= SPI_START;

        end else if (spi_dir_transition) begin
          reset_spi_bit_counter <= 1;
          spi_state_next <= SPI_START;

        end else if (spi_has_more_in_bytes) begin
          if (spi_byte_in_xfr_ready) begin
            put_spi_in_data <= 1;
            reset_spi_bit_counter <= 1;
            spi_state_next <= SPI_START;
          end else begin
            spi_state_next <= SPI_END;
          end

        end else if (spi_put_last_in_byte) begin
          if (spi_byte_in_xfr_ready) begin
            put_spi_in_data <= 1;
            reset_spi_bit_counter <= 1;
            spi_state_next <= SPI_IDLE;
          end else begin
            spi_state_next <= SPI_END;
          end

        end else begin
          spi_state_next <= SPI_IDLE;
        end
      end

      default begin
        spi_state_next <= SPI_IDLE;
      end
    endcase    
  end

  reg get_spi_out_data_q;
  always @(posedge clk) get_spi_out_data_q <= get_spi_out_data;

  always @(posedge clk) begin
    spi_state <= spi_state_next;

    if (spi_get_bit) begin
      spi_in_data <= {spi_in_data[7:0], spi_miso};
      spi_bit_counter <= spi_bit_counter + 1;
    end else if (reset_spi_bit_counter) begin
      spi_bit_counter <= 0;
    end

    if (spi_send_bit) begin
      if (get_spi_out_data_q) begin
        spi_out_data <= {out_ep_data[7:0], 1'b0};
      end else begin
        spi_out_data <= {spi_out_data[7:0], 1'b0};
      end
    end else if (get_spi_out_data_q) begin
      spi_out_data <= out_ep_data;
    end
  end 
endmodule

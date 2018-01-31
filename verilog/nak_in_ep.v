module nak_in_ep (
  input reset,

  ////////////////////
  // in endpoint interface 
  ////////////////////
  output in_ep_req,
  input in_ep_grant,
  input in_ep_data_free,
  output in_ep_data_put,
  output reg [7:0] in_ep_data,
  output in_ep_data_done,
  output in_ep_stall,
  input in_ep_acked
);
  

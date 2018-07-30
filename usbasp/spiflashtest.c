
#include <stdio.h>

// uint types
#include <unistd.h>

// memcpy
#include <memory.h>

// file handling
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

// USB
#include <libusb-1.0/libusb.h>

static struct libusb_device_handle *device_handle = NULL;
uint8_t libusb_initialized = 0, interface_claimed = 0;

int flash_read(uint8_t *data, size_t addr, size_t length)
{
  uint8_t buf[32]; // USB I/O buffer
  size_t accumulated_read = 0; // accumulate total read
  size_t payload_start = 4; // initial payload starts at byte 4 without continuation
  uint8_t data1 = 0; // currently no use
  uint8_t bRequest = 0; // currently no use
  uint16_t wIndex = 0; // currently no use
  uint16_t wValue = length <= sizeof(buf)-payload_start ? 0 : 1; // wValue: 0-no continuation, 1-continuation
  uint16_t timeout_ms = 10; // 10 ms waiting for response

  buf[0] = 0x03; // FLASH normal (slow) read
  buf[1] = (addr >> 16) & 0xFF; // MSB start address
  buf[2] = (addr >> 8) & 0xFF; // start address
  buf[3] = addr & 0xFF; // LSB start address
  
  while(accumulated_read < length)
  {
    int response;

    #if 0
    // IN request - wait for SPI to finish its transmission 
    buf[0] = 1;
    while(buf[0] == 1)
    {
      response = libusb_control_transfer(device_handle, (uint8_t)(LIBUSB_ENDPOINT_IN|LIBUSB_REQUEST_TYPE_VENDOR),
        1, 0, 0, buf, 1, timeout_ms);
      if(buf[0])
        printf("spi busy before out %d\n", buf[0]);
    }
    #endif

    // write to USB read command followed with dummy bytes
    // in order to read, we must first write command and the
    // contiue writing anything to SPI
    // every written byte will also result in reading a byte.
    // up to 32 read bytes are buffered inside of the USB device.
    // this USB buffer can be retrieved by subsequent IN command later.
    response = libusb_control_transfer(device_handle, (uint8_t)(LIBUSB_ENDPOINT_OUT|LIBUSB_REQUEST_TYPE_VENDOR|data1),
      bRequest, wValue, wIndex, buf, sizeof(buf), timeout_ms);
    if(response < 0)
    {
      fprintf(stderr, "OUT: %s\n", libusb_error_name(response));
      return -1; // something went wrong with USB
    }
    // calculate next request length (how much to read from USB)
    size_t request_size;
    if(accumulated_read + sizeof(buf) - payload_start >= length)
    {
      // printf("last packet\n");
      // end packet, trim request size to how much we really need
      request_size = length + payload_start - accumulated_read;
      wValue = 0; // terminate continuation
    }
    else
      request_size = sizeof(buf);

    #if 0
    // IN request - wait for SPI to finish its transmission 
    buf[0] = 1;
    while(buf[0] == 1)
    {
      response = libusb_control_transfer(device_handle, (uint8_t)(LIBUSB_ENDPOINT_IN|LIBUSB_REQUEST_TYPE_VENDOR),
        1, 0, 0, buf, 1, timeout_ms);
      if(buf[0])
        printf("spi busy before in %d\n", buf[0]);
    }
    #endif

    //usleep(1000000);
    // usleep(11); // sleep 11us for SPI to tranfer (usually not needed)
    response = libusb_control_transfer(device_handle, (uint8_t)(LIBUSB_ENDPOINT_IN|LIBUSB_REQUEST_TYPE_VENDOR|data1),
      bRequest, wValue, wIndex, buf, request_size, timeout_ms);
    if(response != request_size)
    {
      fprintf(stderr, "IN: %s\n", libusb_error_name(response));
      return -1; // something went wrong with USB
    }
    size_t response_size = response - payload_start;
    memcpy(data, buf+payload_start, response_size);
    data += response_size;
    accumulated_read += response_size;
    if(payload_start) // contination will result in full 32-byte payload
      payload_start = 0;
  }
  return 0; // 0 on success
}

// read from addr, length bytes and write to file
int read_to_file(char *filename, size_t addr, size_t length)
{
  // printf("reading\n");
  const int bufsize = 28; // not much speed improvement in increasing this
  uint8_t buf[2][bufsize]; // 2 buffers, both must match
  size_t accumulated_read = 0;
  int file_descriptor = open(filename, O_CREAT | O_TRUNC | O_RDWR, S_IRUSR | S_IWUSR);
  const int retry = 1000;
  while(accumulated_read < length)
  {
    int match; // repeat reading until 2 subsequent readings match
    int ib = 0; // buffer index 0/1 to match
    size_t requested_size = accumulated_read + bufsize >= length ? length - accumulated_read : bufsize;
    match = 0;
    const int match_required = 2;
    // printf("accumulated_read %d\n", accumulated_read);
    for(int i = 0; i < retry && match < match_required; i++)
  {
      buf[ib][0] = ~buf[ib^1][0]; // damage first byte for the match to initially fail unless read correct
      buf[ib][requested_size-1] = ~buf[ib^1][requested_size-1]; // damage first byte for the match to initially fail unless read correct
      int rc = flash_read(buf[ib], addr, requested_size);
      if(rc == 0 && memcmp(buf[ib], buf[ib^1], requested_size) == 0)
        match++;
      else
      {
        match = 0;
        if(i > 0)
          printf("read verify error %d\n", i);
      }
      ib ^= 1; // switch buffer
    }
    if(match < match_required)
    {
      fprintf(stderr, "failure after %d retries\n", retry);
      return -1;
    }
    write(file_descriptor, buf[0], requested_size);
    accumulated_read += requested_size;
    addr += requested_size;
  }
  close(file_descriptor);
  return 0;
}


static void print_devs(libusb_device **devs)
{
	libusb_device *dev;
	int i = 0, j = 0;
	uint8_t path[8]; 

	while ((dev = devs[i++]) != NULL) {
		struct libusb_device_descriptor desc;
		int r = libusb_get_device_descriptor(dev, &desc);
		if (r < 0) {
			fprintf(stderr, "failed to get device descriptor");
			return;
		}

		printf("%04x:%04x (bus %d, device %d)",
			desc.idVendor, desc.idProduct,
			libusb_get_bus_number(dev), libusb_get_device_address(dev));

		r = libusb_get_port_numbers(dev, path, sizeof(path));
		if (r > 0) {
			printf(" path: %d", path[0]);
			for (j = 1; j < r; j++)
				printf(".%d", path[j]);
		}
		printf("\n");
//		if(desc.idVendor == 0x16C0 && desc.idProduct == 0x05DC)
//		  vendorspecific();
	}
}

void close_usb_device(void)
{
  printf("aaaa\n");
  if(interface_claimed)
  {
    libusb_release_interface(device_handle, 0);
    interface_claimed = 0;
  }
  if(libusb_initialized)
  {
    libusb_exit(NULL);
    libusb_initialized = 0;
  }
}

int open_usb_device(uint16_t vid, uint16_t pid)
{
  int r = libusb_init(NULL);
  if (r < 0)
  {
    fprintf(stderr, "Cannot init libusb\n");
    close_usb_device();
    return -1;
  }
  libusb_initialized = 1;

  device_handle = libusb_open_device_with_vid_pid(NULL, 0x16C0, 0x05DC);
  if (!device_handle)
  {
    fprintf(stderr, "Error finding USB device\n");
    return -1;
  }

#if 1
  int rc;
  rc = libusb_claim_interface(device_handle, 0);
  if (rc < 0)
  {
    fprintf(stderr, "Error claiming interface: %s\n", libusb_error_name(rc));
    return -1;
  }
  interface_claimed = 1;
#endif
  return 0;
}

void print_hex_buf(uint8_t *buf, size_t len)
{
  for(int i = 0; i < len; i++)
  {
      if(i % 32 == 0 && i != 0)
        printf("\n");
      printf("%02x ", buf[i]);
  }
  printf("\n");
}

int send_one_packet()
{
  uint8_t buf[32];
  buf[0] = 0xAB; // 1010 1011
  buf[1] = 0x00;
  buf[2] = 0x00;
  buf[3] = 0x00;
  for(int i = 4; i < 32; i++)
    buf[i] = 0x00;
  uint16_t datalen = 32;
  uint8_t data1 = 0; // currently no use
  uint8_t bRequest = 0; // currently no use
  uint16_t wIndex = 0; // currently no use
  uint16_t wValue = 0; // wValue: 0-no continuation, 1-continuation
  uint16_t timeout_ms = 100; // 10 ms waiting for response

  int  response = libusb_control_transfer(device_handle, (uint8_t)(LIBUSB_ENDPOINT_OUT|LIBUSB_REQUEST_TYPE_VENDOR|data1),
      bRequest, wValue, wIndex, buf, datalen, timeout_ms);

#if 1
  //usleep(1000000);

  response = libusb_control_transfer(device_handle, (uint8_t)(LIBUSB_ENDPOINT_IN|LIBUSB_REQUEST_TYPE_VENDOR|data1),
      bRequest, wValue, wIndex, buf, datalen, timeout_ms);
  
  print_hex_buf(buf, datalen);
#endif
  return response;
}


int test_read(void)
{
  uint8_t buf[0x40]; // buffer 64K
  
  flash_read(buf, 0x300000, sizeof(buf)); // read complete buffer from flash address 0

  // print start of the buffer
  print_hex_buf(buf, sizeof(buf));
  return 0;
}

int main(void)
{
  // vendorspecific();

  if(open_usb_device(0x16C0, 0x05DC) < 0)
    return -1;
        
  send_one_packet();
  send_one_packet();
  //usleep(1000000);
  test_read();
  
  read_to_file("/tmp/flashcontent.bin", 0, 0x400000);  

  return 0;
}

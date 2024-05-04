#include "USBHostApp.h"

unsigned char usbhost_connect_state(VOS_HANDLE hUSB)
{
	unsigned char connectstate = PORT_STATE_DISCONNECTED;
	usbhost_ioctl_cb_t hc_iocb;

	if (hUSB)
	{
		hc_iocb.ioctl_code = VOS_IOCTL_USBHOST_GET_CONNECT_STATE;
		hc_iocb.get        = &connectstate;
		vos_dev_ioctl(hUSB, &hc_iocb);

    // repeat if connected to see if we move to enumerated
		if (connectstate == PORT_STATE_CONNECTED)
		{
			vos_dev_ioctl(hUSB, &hc_iocb);
		}
	}
	return connectstate;
}
	
VOS_HANDLE hid_attach(VOS_HANDLE hUSB, unsigned char devHID)
{
	usbhost_device_handle_ex ifHID = 0;
	usbhost_ioctl_cb_t hc_iocb;
	usbhost_ioctl_cb_class_t hc_iocb_class;
	usbHostHID_ioctl_t hid_iocb;
	usbHostHID_ioctl_cb_attach_t hid_att;
	VOS_HANDLE hHID;

	// find HID class device
	hc_iocb_class.dev_class = USB_CLASS_HID;
	hc_iocb_class.dev_subclass = USB_SUBCLASS_ANY;
	hc_iocb_class.dev_protocol = USB_PROTOCOL_ANY;

	// user ioctl to find first hub device
	hc_iocb.ioctl_code = VOS_IOCTL_USBHOST_DEVICE_FIND_HANDLE_BY_CLASS;
	hc_iocb.handle.dif = NULL;
	hc_iocb.set = &hc_iocb_class;
	hc_iocb.get = &ifHID;

	if (vos_dev_ioctl(hUSB, &hc_iocb) != USBHOST_OK)
	{
		return NULL;
	}

	// now we have a device, intialise a HID driver with it
	hHID = vos_dev_open(devHID);

	// perform attach
	hid_att.hc_handle = hUSB;
	hid_att.ifDev = ifHID;

	hid_iocb.ioctl_code = VOS_IOCTL_USBHOSTHID_ATTACH;
	hid_iocb.set = &hid_att;
	hid_iocb.get = NULL;

	if (vos_dev_ioctl(hHID, &hid_iocb) != USBHOSTHID_OK)
	{
		vos_dev_close(hHID);
		hHID = NULL;
	}

	return hHID;
}
	
unsigned char enumerate_device(usbhost_ioctl_cb_vid_pid_t *hc_iocb_vid_pid)
{
	usbhost_ioctl_cb_t hc_iocb;
	usbhost_device_handle ifDev;
	unsigned char status = 0;
	unsigned short vid, pid;
	
	while (status != PORT_STATE_ENUMERATED) {
			vos_delay_msecs(500);
			// wait for enumeration to complete
			message("Waiting for enumeration\r\n");
			status = usbhost_connect_state(hUSBHOST_1);

	}
	
	message("Enumeration complete\r\n");
	
	hUSBHOST_HID = hid_attach(hUSBHOST_1, VOS_DEV_USBHOST_HID);
	if (!hUSBHOST_HID) {
		message("No HID Device Found - code ");
		number(status);
		message("\r\n");
		return status;
	}
	
	hc_iocb.ioctl_code = VOS_IOCTL_USBHOST_DEVICE_GET_NEXT_HANDLE;
	hc_iocb.handle.dif = NULL;
	hc_iocb.get = &ifDev;
	vos_dev_ioctl(hUSBHOST_1, &hc_iocb);
	 
	hc_iocb.handle.dif = ifDev;
	if (ifDev)
	{
		hc_iocb.ioctl_code = VOS_IOCTL_USBHOST_DEVICE_GET_VID_PID;
		hc_iocb.get = hc_iocb_vid_pid;
		vos_dev_ioctl(hUSBHOST_1, &hc_iocb);
		vid = hc_iocb_vid_pid->vid;
		pid = hc_iocb_vid_pid->pid;
		message("VID: ");
		number((unsigned short)(vid >> 8));
		number((unsigned short)(vid));
		message("\r\n");
		message("PID: ");
		number((unsigned short)(pid >> 8));
		number((unsigned short)(pid));
		message("\r\n");
	}
	
	return status;
}

unsigned char get_report_descriptor(usbHostHID_ioctl_t* hid_iocb, char* buf)
{
	unsigned char status;
	
	// get report descriptor
	desc:
		hid_iocb->descriptorType = USB_DESCRIPTOR_TYPE_REPORT;
		hid_iocb->descriptorIndex = USB_HID_DESCRIPTOR_INDEX_ZERO;
		hid_iocb->Length = 0x40;
		hid_iocb->get.data=&buf[0];
		hid_iocb->ioctl_code = VOS_IOCTL_USBHOSTHID_GET_DESCRIPTOR;
		status = vos_dev_ioctl(hUSBHOST_HID, hid_iocb);
		if (status != USBHOSTHID_OK)
		{
			message("Get report descriptor failed - code ");
			number(status);
			message("\r\n");
			vos_delay_msecs(500);
			goto desc;
			return status;
		}
	
	// set idle
	hid_iocb->reportID = USB_HID_REPORT_ID_ZERO;
	hid_iocb->idleDuration = 0x20;
	hid_iocb->ioctl_code = VOS_IOCTL_USBHOSTHID_SET_IDLE;
	status = vos_dev_ioctl(hUSBHOST_HID, hid_iocb);
	if (status != USBHOSTHID_OK)
	{
		message("Set Idle failed - code ");
		number(status);
		message("\r\n");
		return status;
	}
	
	// get idle
	hid_iocb->reportID = USB_HID_REPORT_ID_ZERO;
	hid_iocb->get.data=&buf[0];
	hid_iocb->ioctl_code = VOS_IOCTL_USBHOSTHID_GET_IDLE;
	status = vos_dev_ioctl(hUSBHOST_HID, hid_iocb);
	if (status != USBHOSTHID_OK)
	{
		message("Get Idle failed - code ");
		number(status);
		message("\r\n");
		return status;
	}
	
	// get report length (typically 8 but can be up to 64)
	hid_iocb->ioctl_code = VOS_IOCTL_USBHOSTHID_GET_IN_REPORT_SIZE;
	status = vos_dev_ioctl(hUSBHOST_HID, hid_iocb);
	if (status != USBHOSTHID_OK)
	{
		message("Get Report Length failed - code ");
		number(status);
		message("\r\n");
		return status;
	}
	
	return status;
}
	
unsigned char get_report(usbHostHID_ioctl_t* hid_iocb, char* buf)
{
	unsigned char status;
	unsigned char byteCount;
	unsigned short num_read;
	unsigned short reportLen;
	

	reportLen = hid_iocb->Length;
	
	status = vos_dev_read(hUSBHOST_HID, buf, reportLen, &num_read);
	if (status == USBHOSTHID_OK) {
		message("Report: ");
		for (byteCount = 0; byteCount < num_read; byteCount++)
			number(buf[byteCount]);
		message("\r\n");
	} else {
		message("USB Read Failed - code ");
		number(status);
		message("\r\n");
	}
	
	return status;
}

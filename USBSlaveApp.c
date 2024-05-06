#include "USBSlaveApp.h"

IMPORT_USBSLAVEHIDKEYBOARD_DEFAULT_CONFIGURATION

// Modified String 1 (Manufacturer): "ACME"
unsigned char myManufacturer[10] = {
	0x0a, 0x03, 0x41, 0x00, 0x43, 0x00, 0x4D, 0x00, 0x45, 0x00
};

// Modified String 2 (Product): "My Keyboard"
unsigned char myProduct[24] = {
	0x18, 0x03, 0x4D, 0x00, 0x79, 0x00, 0x20, 0x00,	0x4b, 0x00, 
	0x65, 0x00, 0x79, 0x00, 0x62, 0x00, 0x6f, 0x00,	0x61, 0x00, 
	0x72, 0x00, 0x64, 0x00
};

// Modified String 3 (Serial Number): "73247898"
unsigned char mySerialNumber[18] = {
	0x12, 0x03, 0x37, 0x00, 0x33, 0x00, 0x32, 0x00, 0x34, 0x00,
	0x37, 0x00, 0x38, 0x00, 0x39, 0x00, 0x38, 0x00
};


unsigned char init_slave_kbd_driver(usbhost_ioctl_cb_vid_pid_t* hc_iocb_vid_pid)
{
	unsigned char status;
	common_ioctl_cb_t hidkbd_ioctl;
	usbSlaveHID_ioctl_cb_descriptors_t myDescriptors;
	
	hUSBSLAVE_HID = vos_dev_open(VOS_DEV_USBSLAVE_HID);
	
	SET_USBSLAVEHIDKEYBOARD_DEFAULT_CONFIGURATION(myDescriptors);
	
	//myDescriptors.device_descriptor->idVendor = hc_iocb_vid_pid->vid;
	//myDescriptors.device_descriptor->idProduct = hc_iocb_vid_pid->pid;
	/*VID: 17EF
	PID: 6099*/
	//myDescriptors.device_descriptor->idVendor = 0x17ef;
	//myDescriptors.device_descriptor->idProduct = 0x6099;
	myDescriptors.strings[USBSLAVEHIDKEYBOARD_DEFAULT_STRING_INDEX_MANUFACTURER] = myManufacturer;
	myDescriptors.strings[USBSLAVEHIDKEYBOARD_DEFAULT_STRING_INDEX_PRODUCT] = myProduct;
	myDescriptors.strings[USBSLAVEHIDKEYBOARD_DEFAULT_STRING_INDEX_SERIALNUMBER] = mySerialNumber;
	
	hidkbd_ioctl.ioctl_code = VOS_IOCTL_USBSLAVEHID_SET_DESCRIPTORS;
	hidkbd_ioctl.set.data = (void *) &myDescriptors;
	status = vos_dev_ioctl(hUSBSLAVE_HID, &hidkbd_ioctl);
	if (status != USBSLAVEHID_OK)
		{
			message("Set descriptors failed - code ");
			number(status);
			message("\r\n");
			return status;
		}
	
	hidkbd_ioctl.ioctl_code = VOS_IOCTL_USBSLAVEHID_ATTACH;
	hidkbd_ioctl.set.data = (void *) hUSBSLAVE_2;
	status = vos_dev_ioctl(hUSBSLAVE_HID, &hidkbd_ioctl);
	
	return status;
}

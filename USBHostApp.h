#ifndef _USBHostApp_H_
#define _USBHostApp_H_

#include "vos.h"
#include "USB.h"
#include "USBHost.h"
#include "USBHID.h"
#include "USBHostHID.h"

#include "message.h"

#define VOS_DEV_USBHOST_HID 4

extern VOS_HANDLE hUSBHOST_1;
extern VOS_HANDLE hUSBHOST_HID;

unsigned char enumerate_device(usbhost_ioctl_cb_vid_pid_t *hc_iocb_vid_pid);
unsigned char get_report_descriptor(usbHostHID_ioctl_t* hid_iocb, char* buf);
unsigned char get_report(usbHostHID_ioctl_t* hid_iocb, char* buf);

#endif /* _USBHostApp_H_ */

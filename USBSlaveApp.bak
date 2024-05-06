#ifndef _USBSlaveApp_H_
#define _USBSlaveApp_H_

#include "vos.h"
#include "USB.h"
#include "USBSlave.h"
#include "USBSlaveHID.h"
#include "USBSlaveHIDKbd.h"
#include "USBHost.h"

#include "message.h"

#define VOS_DEV_USBSLAVE_2 1
#define VOS_DEV_USBSLAVE_HID 3

extern VOS_HANDLE hUSBSLAVE_2;
extern VOS_HANDLE hUSBSLAVE_HID;

unsigned char init_slave_kbd_driver(usbhost_ioctl_cb_vid_pid_t* hc_iocb_vid_pid);

#endif /* _USBSlaveApp_H_ */

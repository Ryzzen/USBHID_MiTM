.DATA

.WEAK	"%eax"
.WEAK	"%ebx"
.WEAK	"%ecx"
.WEAK	"%r0"
.WEAK	"%r1"
.WEAK	"%r2"
.WEAK	"%r3"
usbSlaveHIDKeyboard_default_device_descriptor	.DB	18	18, 1, 16, 1, 0, 0, 0, 8, 3, 4, -19, 15, 1, 1, 1, 2, 3, 1
.GLOBAL	  DO_NOT_EXPORT "usbSlaveHIDKeyboard_default_device_descriptor"
usbSlaveHIDKeyboard_default_config_descriptor	.DB	34	9, 2, 34, 0, 1, 1, 0, -96, 50, 9, 4, 0, 0, 1, 3, 1, 1, 0, 9, 33, 16, 1, 0, 1, 34, 65, 0, 7, 5, -127, 3, 8, 0, 10
.GLOBAL	  DO_NOT_EXPORT "usbSlaveHIDKeyboard_default_config_descriptor"
usbSlaveHIDKeyboard_default_string_descriptor_0	.DB	4	4, 3, 9, 4
.GLOBAL	  DO_NOT_EXPORT "usbSlaveHIDKeyboard_default_string_descriptor_0"
usbSlaveHIDKeyboard_default_string_descriptor_1	.DB	10	10, 3, 70, 0, 84, 0, 68, 0, 73, 0
.GLOBAL	  DO_NOT_EXPORT "usbSlaveHIDKeyboard_default_string_descriptor_1"
usbSlaveHIDKeyboard_default_string_descriptor_2	.DB	26	26, 3, 85, 0, 83, 0, 66, 0, 32, 0, 75, 0, 101, 0, 121, 0, 98, 0, 111, 0, 97, 0, 114, 0, 100, 0
.GLOBAL	  DO_NOT_EXPORT "usbSlaveHIDKeyboard_default_string_descriptor_2"
usbSlaveHIDKeyboard_default_string_descriptor_3	.DB	18	18, 3, 49, 0, 50, 0, 51, 0, 52, 0, 53, 0, 54, 0, 55, 0, 56, 0
.GLOBAL	  DO_NOT_EXPORT "usbSlaveHIDKeyboard_default_string_descriptor_3"
usbSlaveHIDKeyboard_default_report_descriptor	.DB	65	5, 1, 9, 6, -95, 1, 5, 7, 25, -32, 41, -25, 21, 0, 37, 1, 117, 1, -107, 8, -127, 2, -107, 1, 117, 8, -127, 1, -107, 3, 117, 1, 5, 8, 25, 1, 41, 3, -111, 2, -107, 5, 117, 1, -111, 1, -107, 6, 117, 8, 21, 0, 38, -1, 0, 5, 7, 25, 0, 42, -1, 0, -127, 0, -64
.GLOBAL	  DO_NOT_EXPORT "usbSlaveHIDKeyboard_default_report_descriptor"
myManufacturer	.DB	10	10, 3, 65, 0, 67, 0, 77, 0, 69, 0
.GLOBAL	  DO_NOT_EXPORT "myManufacturer"
myProduct	.DB	24	24, 3, 77, 0, 121, 0, 32, 0, 75, 0, 101, 0, 121, 0, 98, 0, 111, 0, 97, 0, 114, 0, 100, 0
.GLOBAL	  DO_NOT_EXPORT "myProduct"
mySerialNumber	.DB	18	18, 3, 55, 0, 51, 0, 50, 0, 52, 0, 55, 0, 56, 0, 57, 0, 56, 0
.GLOBAL	  DO_NOT_EXPORT "mySerialNumber"
Str@0	.ASCIIZ	"Set descriptors failed - code "
Str@1	.ASCIIZ	"\r\n"
.WEAK	"hUSBSLAVE_HID"
.WEAK	"hUART"
.WEAK	"hUSBSLAVE_2"




.TEXT


.WEAK	"vos_dma_get_fifo_flow_control"

.WEAK	"vos_start_scheduler"

.WEAK	"vos_gpio_write_port"

.WEAK	"vos_signal_semaphore_from_isr"

.WEAK	"vos_malloc"

.WEAK	"vos_create_thread_ex"

.WEAK	"vos_memcpy"

.WEAK	"vos_memset"

.WEAK	"vos_get_kernel_clock"

.WEAK	"vos_gpio_disable_int"

.WEAK	"vos_get_package_type"

.WEAK	"vos_dma_get_fifo_data_register"

.WEAK	"vos_signal_semaphore"

.WEAK	"vos_gpio_wait_on_int"

.WEAK	"vos_dma_get_fifo_data"

.WEAK	"vos_iocell_get_config"

.WEAK	"vos_iomux_define_bidi"

.WEAK	"vos_gpio_set_all_mode"

.WEAK	"vos_iocell_set_config"

.WEAK	"vos_gpio_set_pin_mode"

.WEAK	"vos_get_chip_revision"

.WEAK	"vos_wait_semaphore_ex"

.WEAK	"vos_enable_interrupts"

.WEAK	"vos_dev_read"

.WEAK	"vos_dev_open"

.WEAK	"vos_halt_cpu"

.WEAK	"vos_dev_init"

.WEAK	"vos_dma_get_fifo_count"

.WEAK	"usbhost_init"

.WEAK	"vos_reset_kernel_clock"

.WEAK	"vos_gpio_set_port_mode"

.WEAK	"vos_iomux_define_input"

.WEAK	"vos_disable_interrupts"

.WEAK	"vos_get_idle_thread_tcb"

.WEAK	"vos_dma_reset"

.WEAK	"vos_dev_close"

.WEAK	"vos_wdt_clear"

.WEAK	"vos_heap_size"

.WEAK	"vos_dev_ioctl"

.WEAK	"usbslave_init"

.WEAK	"vos_dev_write"

.WEAK	"vos_get_clock_frequency"

.WEAK	"vos_set_clock_frequency"

.WEAK	"vos_dma_enable"

.WEAK	"vos_reset_vnc2"

.WEAK	"vos_heap_space"

.WEAK	"vos_iomux_define_output"

.WEAK	"vos_wdt_enable"

.WEAK	"vos_dma_wait_on_complete"

.WEAK	"vos_lock_mutex"

.WEAK	"vos_power_down"

.WEAK	"vos_init_mutex"

.WEAK	"vos_gpio_wait_on_any_int"

.WEAK	"vos_get_priority_ceiling"

.WEAK	"vos_dma_disable"

.WEAK	"vos_set_priority_ceiling"

.WEAK	"vos_dma_release"

.WEAK	"vos_iomux_disable_output"

.WEAK	"usbSlaveHID_init"

.WEAK	"vos_dma_acquire"

.WEAK	"vos_delay_msecs"

.WEAK	"vos_stack_usage"

.WEAK	"vos_get_profile"

.WEAK	"vos_gpio_wait_on_all_ints"

.WEAK	"number"

.WEAK	"vos_delay_cancel"

.WEAK	"vos_dma_retained_configure"

.WEAK	"vos_unlock_mutex"

.WEAK	"message"

.WEAK	"vos_gpio_read_all"

.WEAK	"vos_create_thread"

.WEAK	"vos_gpio_read_pin"

.WEAK	"vos_dma_configure"

.WEAK	"vos_init_cond_var"

.WEAK	"vos_wait_cond_var"

.WEAK	"vos_stop_profiler"

.WEAK	"vos_trylock_mutex"

.WEAK	"vos_free"

.WEAK	"vos_init"

.WEAK	"vos_gpio_read_port"

.WEAK	"vos_gpio_write_all"

.WEAK	"vos_set_idle_thread_tcb_size"

.WEAK	"vos_init_semaphore"

.WEAK	"vos_wait_semaphore"

.WEAK	"vos_gpio_write_pin"

.WEAK	"vos_start_profiler"

.WEAK	"vos_gpio_enable_int"

.WEAK	"vos_signal_cond_var"

init_slave_kbd_driver:	
.GLOBAL	 DO_NOT_EXPORT  "init_slave_kbd_driver"

.FUNCTION	"init_slave_kbd_driver"	
PUSH32	%r0
PUSH32	%r1
PUSH32	%r2
PUSH32	%r3
SP_DEC	$32
PUSH8	$3
SP_DEC	$2
CALL	vos_dev_open
POP16	%eax
SP_WR16	%eax	$1
SP_INC	$1
SP_RD16	hUSBSLAVE_HID	$0
SP_STORE	%r0
INC16	%r0	$2
LD16	%r1	$usbSlaveHIDKeyboard_default_device_descriptor
CPY16	(%r0)	%r1
LD16	%r1	$2
ADD16	%r1	%r0
LD16	%r2	$usbSlaveHIDKeyboard_default_config_descriptor
CPY16	(%r1)	%r2
LD16	%r2	$4
ADD16	%r2	%r0
LD16	%r1	$usbSlaveHIDKeyboard_default_string_descriptor_0
CPY16	(%r2)	%r1
LD16	%r1	$2
ADD16	%r1	%r2
LD16	%r3	$usbSlaveHIDKeyboard_default_string_descriptor_1
CPY16	(%r1)	%r3
SP_STORE	%ecx
INC16	%ecx	$16
LD16	%ebx	$4
ADD16	(%ecx)	%r2	%ebx
LD16	%r3	$usbSlaveHIDKeyboard_default_string_descriptor_2
SP_RD16	%ecx	$16
CPY16	(%ecx)	%r3
INC16	%r2	$6
LD16	%r3	$usbSlaveHIDKeyboard_default_string_descriptor_3
CPY16	(%r2)	%r3
LD16	%r3	$12
ADD16	%r3	%r0
SP_STORE	%ecx
INC16	%ecx	$18
LD16	(%ecx)	$usbSlaveHIDKeyboard_default_report_descriptor
SP_STORE	%eax
INC16	%eax	$18
CPY16	(%r3)	(%eax)
LD16	%r3	$myManufacturer
CPY16	(%r1)	%r3
LD16	%r1	$myProduct
SP_RD16	%ecx	$16
CPY16	(%ecx)	%r1
LD16	%r1	$mySerialNumber
CPY16	(%r2)	%r1
SP_STORE	%r1
INC16	%r1	$20
CPY16	%r2	%r1
LD8	(%r2)	$227
LD16	%r2	$1
ADD16	%r2	%r1
CPY16	%r0	%r0
CPY16	(%r2)	%r0
PUSH16	%r1
SP_RD16	%eax	$2
PUSH16	%eax
SP_DEC	$1
CALL	vos_dev_ioctl
POP8	%eax
SP_WR8	%eax	$33
SP_INC	$4
SP_RD8	%r0	$29
SP_RD8	%ecx	$29
CMP8	%ecx	$0
JZ	@IC1
@IC2:	
LD32	%r1	$Str@0
PUSH16	%r1
CALL	message
SP_INC	$2
PUSH8	%r0
CALL	number
SP_INC	$1
LD32	%r1	$Str@1
PUSH16	%r1
CALL	message
SP_INC	$2
SP_STORE	%eax
INC16	%eax	$51
CPY8	(%eax)	%r0
SP_INC	$32
POP32	%r3
POP32	%r2
POP32	%r1
POP32	%r0
RTS	
@IC1:	
SP_STORE	%r1
INC16	%r1	$20
CPY16	%r2	%r1
LD8	(%r2)	$225
LD16	%r2	$1
ADD16	%r2	%r1
CPY16	(%r2)	hUSBSLAVE_2
PUSH16	%r1
PUSH16	hUSBSLAVE_HID
SP_DEC	$1
CALL	vos_dev_ioctl
POP8	%eax
SP_WR8	%eax	$34
SP_INC	$4
SP_RD8	%ecx	$30
SP_WR8	%ecx	$31
SP_RD8	%eax	$30
SP_WR8	%eax	$51
SP_INC	$32
POP32	%r3
POP32	%r2
POP32	%r1
POP32	%r0
RTS	
.FUNC_END	"init_slave_kbd_driver"


.DATA

.WEAK	"%eax"
.WEAK	"%ebx"
.WEAK	"%ecx"
.WEAK	"%r0"
.WEAK	"%r1"
.WEAK	"%r2"
.WEAK	"%r3"
hUSBSLAVE_HID	.DW	1	?
.GLOBAL	  DO_NOT_EXPORT "hUSBSLAVE_HID"
buf	.DB	64	?
.GLOBAL	  DO_NOT_EXPORT "buf"
hUART	.DW	1	?
.GLOBAL	  DO_NOT_EXPORT "hUART"
hUSBHOST_1	.DW	1	?
.GLOBAL	  DO_NOT_EXPORT "hUSBHOST_1"
hUSBSLAVE_2	.DW	1	?
.GLOBAL	  DO_NOT_EXPORT "hUSBSLAVE_2"
tcbFIRMWARE	.DW	1	?
.GLOBAL	  DO_NOT_EXPORT "tcbFIRMWARE"
hUSBHOST_HID	.DW	1	?
.GLOBAL	  DO_NOT_EXPORT "hUSBHOST_HID"
Str@0	.ASCIIZ	"Application"
.WEAK	"hUSBSLAVE_HID"
.WEAK	"hUART"
.WEAK	"hUSBHOST_1"
.WEAK	"hUSBSLAVE_2"
.WEAK	"hUSBHOST_HID"




.TEXT


.WEAK	"vos_dma_get_fifo_flow_control"

.WEAK	"vos_start_scheduler"

.WEAK	"vos_gpio_write_port"

.WEAK	"vos_signal_semaphore_from_isr"

.WEAK	"vos_malloc"

.WEAK	"get_report"

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

.WEAK	"init_slave_kbd_driver"

.WEAK	"vos_iomux_define_bidi"

.WEAK	"vos_gpio_set_all_mode"

.WEAK	"vos_iocell_set_config"

.WEAK	"vos_gpio_set_pin_mode"

.WEAK	"iomux_setup"

.WEAK	"vos_get_chip_revision"

.WEAK	"vos_wait_semaphore_ex"

.WEAK	"get_report_descriptor"

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

.WEAK	"usbHostHID_init"

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

.WEAK	"enumerate_device"

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

.WEAK	"uart_init"

.WEAK	"vos_gpio_enable_int"

.WEAK	"vos_signal_cond_var"

main:	
.GLOBAL	 DO_NOT_EXPORT  "main"

.FUNCTION	"main"	
PUSH32	%r0
PUSH32	%r1
SP_DEC	$12
PUSH8	$5
PUSH16	$1
PUSH8	$50
CALL	vos_init
SP_INC	$4
PUSH8	$0
CALL	vos_set_clock_frequency
SP_INC	$1
PUSH16	$512
CALL	vos_set_idle_thread_tcb_size
SP_INC	$2
CALL	iomux_setup
PUSH8	$1
PUSH8	$1
SP_DEC	$1
CALL	usbslave_init
POP8	%eax
SP_WR8	%eax	$2
SP_INC	$2
SP_STORE	%r0
INC16	%r0	$1
CPY16	%r1	%r0
LD8	(%r1)	$64
PUSH16	%r0
PUSH8	$2
SP_DEC	$1
CALL	uart_init
POP8	%eax
SP_WR8	%eax	$5
SP_INC	$3
PUSH8	$8
PUSH8	$3
SP_DEC	$1
CALL	usbSlaveHID_init
POP8	%eax
SP_WR8	%eax	$5
SP_INC	$2
PUSH8	$4
SP_DEC	$1
CALL	usbHostHID_init
POP8	%eax
SP_WR8	%eax	$5
SP_INC	$1
SP_STORE	%r0
INC16	%r0	$5
CPY16	%r1	%r0
LD8	(%r1)	$8
LD16	%r1	$1
ADD16	%r1	%r0
LD8	(%r1)	$16
LD16	%r1	$2
ADD16	%r1	%r0
LD8	(%r1)	$2
LD16	%r1	$3
ADD16	%r1	%r0
LD8	(%r1)	$2
PUSH16	%r0
PUSH8	$-1
PUSH8	$0
SP_DEC	$1
CALL	usbhost_init
POP8	%eax
SP_WR8	%eax	$13
SP_INC	$4
LD32	%r0	$firmware
LD32	%r1	$Str@0
PUSH16	$0
PUSH16	%r1
PUSH32	%r0
PUSH16	$4096
PUSH8	$20
SP_DEC	$2
CALL	vos_create_thread_ex
POP16	%eax
SP_WR16	%eax	$21
SP_INC	$11
SP_RD16	tcbFIRMWARE	$10
CALL	vos_start_scheduler
@fl1main_loop:	
JUMP	@fl1main_loop
SP_INC	$12
POP32	%r1
POP32	%r0
RTS	
.FUNC_END	"main"

usbslave_connect:	
.GLOBAL	 DO_NOT_EXPORT  "usbslave_connect"

.FUNCTION	"usbslave_connect"	
PUSH32	%r0
PUSH32	%r1
PUSH32	%r2
SP_DEC	$14
SP_RD16	%r2	$30
SP_STORE	%r0
CPY16	%r1	%r0
LD8	(%r1)	$27
LD16	%r1	$5
ADD16	%r1	%r0
LD16	(%r1)	$0
PUSH16	%r0
PUSH16	%r2
SP_DEC	$1
CALL	vos_dev_ioctl
POP8	%eax
SP_WR8	%eax	$17
SP_INC	$4
SP_RD8	%eax	$13
SP_WR8	%eax	$29
SP_INC	$14
POP32	%r2
POP32	%r1
POP32	%r0
RTS	
.FUNC_END	"usbslave_connect"

usbslave_disconnect:	
.GLOBAL	 DO_NOT_EXPORT  "usbslave_disconnect"

.FUNCTION	"usbslave_disconnect"	
PUSH32	%r0
PUSH32	%r1
PUSH32	%r2
SP_DEC	$15
SP_RD16	%r2	$31
SP_STORE	%r0
CPY16	%r1	%r0
LD8	(%r1)	$14
LD16	%r1	$5
ADD16	%r1	%r0
LD16	(%r1)	$0
PUSH16	%r0
PUSH16	%r2
SP_DEC	$1
CALL	vos_dev_ioctl
POP8	%eax
SP_WR8	%eax	$17
SP_INC	$4
SP_RD8	%eax	$14
SP_WR8	%eax	$30
SP_INC	$15
POP32	%r2
POP32	%r1
POP32	%r0
RTS	
.FUNC_END	"usbslave_disconnect"

hid_slave_attach:	
.GLOBAL	 DO_NOT_EXPORT  "hid_slave_attach"

.FUNCTION	"hid_slave_attach"	
PUSH32	%r0
PUSH32	%r1
PUSH32	%r2
PUSH32	%r3
SP_DEC	$12
SP_RD16	%r0	$33
SP_RD8	%r2	$35
PUSH8	%r2
SP_DEC	$2
CALL	vos_dev_open
POP16	%eax
SP_WR16	%eax	$1
SP_INC	$1
SP_RD16	%r1	$0
SP_STORE	%r2
INC16	%r2	$2
CPY16	%r3	%r2
LD8	(%r3)	$225
LD16	%r3	$1
ADD16	%r3	%r2
CPY16	(%r3)	%r0
PUSH16	%r2
SP_RD16	%eax	$2
PUSH16	%eax
SP_DEC	$1
CALL	vos_dev_ioctl
POP8	%eax
SP_WR8	%eax	$15
SP_INC	$4
SP_RD8	%ecx	$11
CMP8	%ecx	$0
JZ	@IC1
@IC2:	
PUSH16	%r1
CALL	vos_dev_close
SP_INC	$2
LD16	%r1	$0
@IC1:	
SP_WR16	%r1	$31
SP_INC	$12
POP32	%r3
POP32	%r2
POP32	%r1
POP32	%r0
RTS	
.FUNC_END	"hid_slave_attach"

hid_slave_detach:	
.GLOBAL	 DO_NOT_EXPORT  "hid_slave_detach"

.FUNCTION	"hid_slave_detach"	
PUSH32	%r0
PUSH32	%r1
PUSH32	%r2
SP_DEC	$10
SP_RD16	%r0	$25
CMP16	%r0	$0
JZ	@IC5
@IC6:	
SP_STORE	%r1
CPY16	%r2	%r1
LD8	(%r2)	$226
PUSH16	%r1
PUSH16	%r0
SP_DEC	$1
CALL	vos_dev_ioctl
POP8	%eax
SP_WR8	%eax	$13
SP_INC	$4
PUSH16	%r0
CALL	vos_dev_close
SP_INC	$2
@IC5:	
SP_INC	$10
POP32	%r2
POP32	%r1
POP32	%r0
RTS	
.FUNC_END	"hid_slave_detach"

HID_detach:	
.GLOBAL	 DO_NOT_EXPORT  "HID_detach"

.FUNCTION	"HID_detach"	
PUSH32	%r0
PUSH32	%r1
PUSH32	%r2
SP_DEC	$14
SP_RD16	%r0	$29
CMP16	%r0	$0
JZ	@IC7
@IC8:	
SP_STORE	%r1
CPY16	%r2	%r1
LD8	(%r2)	$2
PUSH16	%r1
PUSH16	%r0
SP_DEC	$1
CALL	vos_dev_ioctl
POP8	%eax
SP_WR8	%eax	$17
SP_INC	$4
PUSH16	%r0
CALL	vos_dev_close
SP_INC	$2
@IC7:	
SP_INC	$14
POP32	%r2
POP32	%r1
POP32	%r0
RTS	
.FUNC_END	"HID_detach"

open_drivers:	
.GLOBAL	 DO_NOT_EXPORT  "open_drivers"

.FUNCTION	"open_drivers"	
SP_DEC	$2
PUSH8	$2
SP_DEC	$2
CALL	vos_dev_open
POP16	%eax
SP_WR16	%eax	$1
SP_INC	$1
SP_RD16	hUART	$0
SP_INC	$2
RTS	
.FUNC_END	"open_drivers"

attach_drivers:	
.GLOBAL	 DO_NOT_EXPORT  "attach_drivers"

.FUNCTION	"attach_drivers"	
SP_DEC	$2
PUSH8	$3
PUSH16	hUSBSLAVE_2
SP_DEC	$2
CALL	hid_slave_attach
POP16	%eax
SP_WR16	%eax	$3
SP_INC	$3
SP_RD16	hUSBSLAVE_HID	$0
SP_INC	$2
RTS	
.FUNC_END	"attach_drivers"

close_drivers:	
.GLOBAL	 DO_NOT_EXPORT  "close_drivers"

.FUNCTION	"close_drivers"	
PUSH16	hUSBSLAVE_2
CALL	vos_dev_close
SP_INC	$2
PUSH16	hUART
CALL	vos_dev_close
SP_INC	$2
RTS	
.FUNC_END	"close_drivers"

firmware:	
.GLOBAL	 DO_NOT_EXPORT  "firmware"

.FUNCTION	"firmware"	
PUSH32	%r0
PUSH32	%r1
PUSH32	%r2
PUSH32	%r3
SP_DEC	$34
CALL	open_drivers
SP_STORE	%r1
CPY16	%r2	%r1
LD8	(%r2)	$34
LD16	%r2	$1
ADD16	%r2	%r1
CPY16	%r3	%r2
LD32	(%r3)	$115200
PUSH16	%r1
PUSH16	hUART
SP_DEC	$1
CALL	vos_dev_ioctl
POP8	%eax
SP_WR8	%eax	$13
SP_INC	$4
CPY16	%r3	%r1
LD8	(%r3)	$35
CPY16	%r2	%r2
LD8	(%r2)	$0
PUSH16	%r1
PUSH16	hUART
SP_DEC	$1
CALL	vos_dev_ioctl
POP8	%eax
SP_WR8	%eax	$14
SP_INC	$4
@IC9:	
LD8	%ecx	$1
CMP8	%ecx	$0
JZ	@IC10
@IC11:	
PUSH8	$0
SP_DEC	$2
CALL	vos_dev_open
POP16	%eax
SP_WR16	%eax	$12
SP_INC	$1
SP_RD16	hUSBHOST_1	$11
SP_STORE	%r1
INC16	%r1	$13
PUSH16	%r1
SP_DEC	$1
CALL	enumerate_device
POP8	%eax
SP_WR8	%eax	$19
SP_INC	$2
SP_RD8	%ecx	$17
SP_WR8	%ecx	$18
CMP16	hUSBHOST_HID	$0
JZ	@IC12
@IC13:	
SP_STORE	%r1
INC16	%r1	$19
LD16	%r2	$buf
PUSH16	%r2
PUSH16	%r1
SP_DEC	$1
CALL	get_report_descriptor
POP8	%eax
SP_WR8	%eax	$36
SP_INC	$4
SP_RD8	%r0	$32
@IC14:	
CMP8	%r0	$0
JNZ	@IC15
@IC16:	
SP_STORE	%r1
INC16	%r1	$19
LD16	%r2	$buf
PUSH16	%r2
PUSH16	%r1
SP_DEC	$1
CALL	get_report
POP8	%eax
SP_WR8	%eax	$37
SP_INC	$4
SP_RD8	%r0	$33
JUMP	@IC14
@IC15:	
PUSH16	hUSBHOST_HID
CALL	HID_detach
SP_INC	$2
@IC12:	
CMP16	hUSBHOST_1	$0
JZ	@IC9
@IC20:	
PUSH16	hUSBHOST_1
CALL	vos_dev_close
SP_INC	$2
@IC19:	
JUMP	@IC9
@IC10:	
CALL	close_drivers
SP_INC	$34
POP32	%r3
POP32	%r2
POP32	%r1
POP32	%r0
RTS	
.FUNC_END	"firmware"


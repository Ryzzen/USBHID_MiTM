.DATA

.WEAK	"%eax"
.WEAK	"%ebx"
.WEAK	"%ecx"
.WEAK	"%r0"
.WEAK	"%r1"
.WEAK	"%r2"
.WEAK	"%r3"
Str@0	.ASCIIZ	"Waiting for enumeration\r\n"
Str@1	.ASCIIZ	"Enumeration complete\r\n"
Str@2	.ASCIIZ	"No HID Device Found - code "
Str@3	.ASCIIZ	"\r\n"
Str@4	.ASCIIZ	"VID: "
Str@5	.ASCIIZ	"\r\n"
Str@6	.ASCIIZ	"PID: "
Str@7	.ASCIIZ	"\r\n"
Str@8	.ASCIIZ	"Get report descriptor failed - code "
Str@9	.ASCIIZ	"\r\n"
Str@10	.ASCIIZ	"Set Idle failed - code "
Str@11	.ASCIIZ	"\r\n"
Str@12	.ASCIIZ	"Get Idle failed - code "
Str@13	.ASCIIZ	"\r\n"
Str@14	.ASCIIZ	"Get Report Length failed - code "
Str@15	.ASCIIZ	"\r\n"
Str@16	.ASCIIZ	"Report: "
Str@17	.ASCIIZ	"\r\n"
Str@18	.ASCIIZ	"USB Read Failed - code "
Str@19	.ASCIIZ	"\r\n"
.WEAK	"hUART"
.WEAK	"hUSBHOST_1"
.WEAK	"hUSBHOST_HID"




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

usbhost_connect_state:	
.GLOBAL	 DO_NOT_EXPORT  "usbhost_connect_state"

.FUNCTION	"usbhost_connect_state"	
PUSH32	%r0
PUSH32	%r1
PUSH32	%r2
PUSH32	%r3
SP_DEC	$13
SP_RD16	%r0	$33
LD8	%ecx	$0
SP_WR8	%ecx	$0
CMP16	%r0	$0
JZ	@IC1
@IC2:	
SP_STORE	%r1
INC16	%r1	$1
CPY16	%r2	%r1
LD8	(%r2)	$16
LD16	%r2	$6
ADD16	%r2	%r1
SP_STORE	%r3
INC16	%r3	$0
CPY16	(%r2)	%r3
PUSH16	%r1
PUSH16	%r0
SP_DEC	$1
CALL	vos_dev_ioctl
POP8	%eax
SP_WR8	%eax	$15
SP_INC	$4
SP_RD8	%ecx	$0
CMP8	%ecx	$1
JNZ	@IC3
@IC4:	
SP_STORE	%r1
INC16	%r1	$1
PUSH16	%r1
PUSH16	%r0
SP_DEC	$1
CALL	vos_dev_ioctl
POP8	%eax
SP_WR8	%eax	$16
SP_INC	$4
@IC3:	
@IC1:	
SP_RD8	%eax	$0
SP_WR8	%eax	$32
SP_INC	$13
POP32	%r3
POP32	%r2
POP32	%r1
POP32	%r0
RTS	
.FUNC_END	"usbhost_connect_state"

hid_attach:	
.GLOBAL	 DO_NOT_EXPORT  "hid_attach"

.FUNCTION	"hid_attach"	
PUSH32	%r0
PUSH32	%r1
PUSH32	%r2
PUSH32	%r3
SP_DEC	$40
SP_RD8	%ecx	$63
SP_WR8	%ecx	$63
SP_RD16	%ecx	$61
LD32	%ecx	$0
SP_WR32	%ecx	$0
SP_STORE	%r0
INC16	%r0	$4
CPY16	%r1	%r0
LD8	(%r1)	$3
LD16	%r1	$1
ADD16	%r1	%r0
LD8	(%r1)	$255
LD16	%r1	$2
ADD16	%r1	%r0
LD8	(%r1)	$255
SP_STORE	%r1
INC16	%r1	$7
CPY16	%r2	%r1
LD8	(%r2)	$35
LD16	%r2	$2
ADD16	%r2	%r1
CPY16	%r2	%r2
LD32	(%r2)	$0
LD16	%r2	$8
ADD16	%r2	%r1
CPY16	(%r2)	%r0
LD16	%r0	$6
ADD16	%r0	%r1
SP_STORE	%r2
CPY16	(%r0)	%r2
PUSH16	%r1
SP_RD16	%eax	$63
PUSH16	%eax
SP_DEC	$1
CALL	vos_dev_ioctl
POP8	%eax
SP_WR8	%eax	$21
SP_INC	$4
SP_RD8	%ecx	$17
CMP8	%ecx	$0
JZ	@IC7
@IC8:	
LD16	%eax	$0
SP_WR16	%eax	$59
SP_INC	$40
POP32	%r3
POP32	%r2
POP32	%r1
POP32	%r0
RTS	
@IC7:	
SP_RD16	%eax	$63
PUSH8	%eax
SP_DEC	$2
CALL	vos_dev_open
POP16	%eax
SP_WR16	%eax	$19
SP_INC	$1
SP_RD16	%r3	$18
SP_STORE	%r0
INC16	%r0	$20
SP_STORE	%eax
INC16	%eax	$61
CPY16	(%r0)	(%eax)
LD16	%r1	$2
ADD16	%r1	%r0
SP_STORE	%eax
CPY32	(%r1)	(%eax)
SP_STORE	%r1
INC16	%r1	$26
CPY16	%r2	%r1
LD8	(%r2)	$1
LD16	%r2	$9
ADD16	%r2	%r1
CPY16	(%r2)	%r0
LD16	%r0	$11
ADD16	%r0	%r1
LD16	(%r0)	$0
PUSH16	%r1
SP_RD16	%eax	$20
PUSH16	%eax
SP_DEC	$1
CALL	vos_dev_ioctl
POP8	%eax
SP_WR8	%eax	$43
SP_INC	$4
SP_RD8	%ecx	$39
CMP8	%ecx	$0
JZ	@IC11
@IC12:	
PUSH16	%r3
CALL	vos_dev_close
SP_INC	$2
LD16	%r3	$0
@IC11:	
SP_WR16	%r3	$59
SP_INC	$40
POP32	%r3
POP32	%r2
POP32	%r1
POP32	%r0
RTS	
.FUNC_END	"hid_attach"

enumerate_device:	
.GLOBAL	 DO_NOT_EXPORT  "enumerate_device"

.FUNCTION	"enumerate_device"	
PUSH32	%r0
PUSH32	%r1
PUSH32	%r2
PUSH32	%r3
SP_DEC	$19
SP_RD16	%ecx	$39
LD8	%ecx	$0
SP_WR8	%ecx	$0
@IC15:	
SP_RD8	%ecx	$0
CMP8	%ecx	$17
JZ	@IC16
@IC17:	
PUSH16	$500
SP_DEC	$1
CALL	vos_delay_msecs
POP8	%eax
SP_WR8	%eax	$3
SP_INC	$2
LD32	%r0	$Str@0
PUSH16	%r0
CALL	message
SP_INC	$2
PUSH16	hUSBHOST_1
SP_DEC	$1
CALL	usbhost_connect_state
POP8	%eax
SP_WR8	%eax	$4
SP_INC	$2
SP_RD8	%ecx	$2
SP_WR8	%ecx	$0
JUMP	@IC15
@IC16:	
LD32	%r0	$Str@1
PUSH16	%r0
CALL	message
SP_INC	$2
PUSH8	$4
PUSH16	hUSBHOST_1
SP_DEC	$2
CALL	hid_attach
POP16	%eax
SP_WR16	%eax	$6
SP_INC	$3
SP_RD16	hUSBHOST_HID	$3
SP_RD16	%ecx	$3
CMP16	%ecx	$0
JNZ	@IC20
@IC21:	
LD32	%r0	$Str@2
PUSH16	%r0
CALL	message
SP_INC	$2
SP_RD16	%eax	$0
PUSH8	%eax
CALL	number
SP_INC	$1
LD32	%r0	$Str@3
PUSH16	%r0
CALL	message
SP_INC	$2
SP_RD8	%eax	$0
SP_WR8	%eax	$38
SP_INC	$19
POP32	%r3
POP32	%r2
POP32	%r1
POP32	%r0
RTS	
@IC20:	
SP_STORE	%r0
INC16	%r0	$5
CPY16	%r1	%r0
LD8	(%r1)	$33
LD16	%r1	$2
ADD16	%r1	%r0
CPY16	%r2	%r1
LD32	(%r2)	$0
LD16	%r2	$6
ADD16	%r2	%r0
SP_STORE	%r3
INC16	%r3	$15
CPY16	(%r2)	%r3
PUSH16	%r0
PUSH16	hUSBHOST_1
SP_DEC	$1
CALL	vos_dev_ioctl
POP8	%eax
SP_WR8	%eax	$21
SP_INC	$4
CPY16	%r0	%r1
SP_RD16	%eax	$15
SHL32	%eax	$16
SAR32	%eax	$16
CPY32	(%r0)	%eax
SP_RD16	%ecx	$15
CMP16	%ecx	$0
JZ	@IC22
@IC23:	
SP_STORE	%r0
INC16	%r0	$5
CPY16	%r1	%r0
LD8	(%r1)	$36
LD16	%r1	$6
ADD16	%r1	%r0
SP_STORE	%eax
INC16	%eax	$39
CPY16	(%r1)	(%eax)
PUSH16	%r0
PUSH16	hUSBHOST_1
SP_DEC	$1
CALL	vos_dev_ioctl
POP8	%eax
SP_WR8	%eax	$22
SP_INC	$4
SP_STORE	%r1
INC16	%r1	$39
CPY16	%r0	(%r1)
CPY16	%r0	(%r0)
CPY16	%r1	(%r1)
INC16	%r1	$2
CPY16	%r1	(%r1)
LD32	%r2	$Str@4
PUSH16	%r2
CALL	message
SP_INC	$2
CPY16	%eax	%r0
AND32	%eax	$65535
LD32	%ebx	$8
SHR32	%r2	%eax	%ebx
CPY16	%r2	%r2
PUSH8	%r2
CALL	number
SP_INC	$1
PUSH8	%r0
CALL	number
SP_INC	$1
LD32	%r0	$Str@5
PUSH16	%r0
CALL	message
SP_INC	$2
LD32	%r0	$Str@6
PUSH16	%r0
CALL	message
SP_INC	$2
CPY16	%eax	%r1
AND32	%eax	$65535
LD32	%ebx	$8
SHR32	%r0	%eax	%ebx
CPY16	%r0	%r0
PUSH8	%r0
CALL	number
SP_INC	$1
PUSH8	%r1
CALL	number
SP_INC	$1
LD32	%r0	$Str@7
PUSH16	%r0
CALL	message
SP_INC	$2
@IC22:	
SP_RD8	%eax	$0
SP_WR8	%eax	$38
SP_INC	$19
POP32	%r3
POP32	%r2
POP32	%r1
POP32	%r0
RTS	
.FUNC_END	"enumerate_device"

get_report_descriptor:	
.GLOBAL	 DO_NOT_EXPORT  "get_report_descriptor"

.FUNCTION	"get_report_descriptor"	
PUSH32	%r0
PUSH32	%r1
PUSH32	%r2
PUSH32	%r3
SP_DEC	$6
SP_RD16	%ecx	$26
SP_RD16	%ecx	$28
@ICO0:	
@fl4desc:	
SP_STORE	%r0
INC16	%r0	$26
CPY16	%r1	(%r0)
INC16	%r1	$1
LD8	(%r1)	$34
CPY16	%r1	(%r0)
INC16	%r1	$2
LD8	(%r1)	$0
CPY16	%r1	(%r0)
INC16	%r1	$7
LD16	(%r1)	$64
CPY16	%r1	(%r0)
INC16	%r1	$11
CPY16	%r1	%r1
SP_RD16	%r2	$28
CPY16	(%r1)	%r2
CPY16	%r0	(%r0)
CPY16	%r0	%r0
LD8	(%r0)	$9
SP_RD16	%eax	$26
PUSH16	%eax
PUSH16	hUSBHOST_HID
SP_DEC	$1
CALL	vos_dev_ioctl
POP8	%eax
SP_WR8	%eax	$4
SP_INC	$4
SP_STORE	%eax
CPY8	%r0	(%eax)
SP_RD8	%ecx	$0
CMP8	%ecx	$0
JZ	@IC24
@IC25:	
LD32	%r1	$Str@8
PUSH16	%r1
CALL	message
SP_INC	$2
PUSH8	%r0
CALL	number
SP_INC	$1
LD32	%r1	$Str@9
PUSH16	%r1
CALL	message
SP_INC	$2
PUSH16	$500
SP_DEC	$1
CALL	vos_delay_msecs
POP8	%eax
SP_WR8	%eax	$3
SP_INC	$2
JUMP	@fl4desc
SP_STORE	%eax
INC16	%eax	$25
CPY8	(%eax)	%r0
SP_INC	$6
POP32	%r3
POP32	%r2
POP32	%r1
POP32	%r0
RTS	
@IC24:	
SP_STORE	%r1
INC16	%r1	$26
CPY16	%r2	(%r1)
INC16	%r2	$6
LD8	(%r2)	$0
CPY16	%r2	(%r1)
INC16	%r2	$3
LD8	(%r2)	$32
CPY16	%r1	(%r1)
CPY16	%r1	%r1
LD8	(%r1)	$8
SP_RD16	%eax	$26
PUSH16	%eax
PUSH16	hUSBHOST_HID
SP_DEC	$1
CALL	vos_dev_ioctl
POP8	%eax
SP_WR8	%eax	$6
SP_INC	$4
SP_RD8	%r3	$2
SP_RD8	%ecx	$2
CMP8	%ecx	$0
JZ	@IC28
@IC29:	
LD32	%r0	$Str@10
PUSH16	%r0
CALL	message
SP_INC	$2
PUSH8	%r3
CALL	number
SP_INC	$1
LD32	%r0	$Str@11
PUSH16	%r0
CALL	message
SP_INC	$2
SP_STORE	%eax
INC16	%eax	$25
CPY8	(%eax)	%r3
SP_INC	$6
POP32	%r3
POP32	%r2
POP32	%r1
POP32	%r0
RTS	
@IC28:	
SP_STORE	%r0
INC16	%r0	$26
CPY16	%r1	(%r0)
INC16	%r1	$6
LD8	(%r1)	$0
CPY16	%r1	(%r0)
INC16	%r1	$11
CPY16	%r1	%r1
SP_RD16	%r2	$28
CPY16	(%r1)	%r2
CPY16	%r0	(%r0)
CPY16	%r0	%r0
LD8	(%r0)	$7
SP_RD16	%eax	$26
PUSH16	%eax
PUSH16	hUSBHOST_HID
SP_DEC	$1
CALL	vos_dev_ioctl
POP8	%eax
SP_WR8	%eax	$7
SP_INC	$4
SP_RD8	%ecx	$3
SP_WR8	%ecx	$4
SP_RD8	%ecx	$3
CMP8	%ecx	$0
JZ	@IC32
@IC33:	
LD32	%r0	$Str@12
PUSH16	%r0
CALL	message
SP_INC	$2
SP_RD16	%eax	$4
PUSH8	%eax
CALL	number
SP_INC	$1
LD32	%r0	$Str@13
PUSH16	%r0
CALL	message
SP_INC	$2
SP_RD8	%eax	$4
SP_WR8	%eax	$25
SP_INC	$6
POP32	%r3
POP32	%r2
POP32	%r1
POP32	%r0
RTS	
@IC32:	
SP_RD16	%r0	$26
CPY16	%r0	%r0
LD8	(%r0)	$10
SP_RD16	%eax	$26
PUSH16	%eax
PUSH16	hUSBHOST_HID
SP_DEC	$1
CALL	vos_dev_ioctl
POP8	%eax
SP_WR8	%eax	$9
SP_INC	$4
SP_RD8	%r3	$5
SP_RD8	%ecx	$5
CMP8	%ecx	$0
JZ	@IC36
@IC37:	
LD32	%r0	$Str@14
PUSH16	%r0
CALL	message
SP_INC	$2
PUSH8	%r3
CALL	number
SP_INC	$1
LD32	%r0	$Str@15
PUSH16	%r0
CALL	message
SP_INC	$2
SP_STORE	%eax
INC16	%eax	$25
CPY8	(%eax)	%r3
SP_INC	$6
POP32	%r3
POP32	%r2
POP32	%r1
POP32	%r0
RTS	
@IC36:	
SP_STORE	%eax
INC16	%eax	$25
CPY8	(%eax)	%r3
SP_INC	$6
POP32	%r3
POP32	%r2
POP32	%r1
POP32	%r0
RTS	
.FUNC_END	"get_report_descriptor"

get_report:	
.GLOBAL	 DO_NOT_EXPORT  "get_report"

.FUNCTION	"get_report"	
PUSH32	%r0
PUSH32	%r1
PUSH32	%r2
PUSH32	%r3
SP_DEC	$3
SP_RD16	%r0	$25
SP_RD16	%r2	$23
INC16	%r2	$7
CPY16	%r2	(%r2)
SP_STORE	%r3
INC16	%r3	$0
PUSH16	%r3
PUSH16	%r2
PUSH16	%r0
PUSH16	hUSBHOST_HID
SP_DEC	$1
CALL	vos_dev_read
POP8	%eax
SP_WR8	%eax	$10
SP_INC	$8
SP_RD8	%r2	$2
SP_RD8	%ecx	$2
CMP8	%ecx	$0
JNZ	@IC41
@IC42:	
LD32	%r1	$Str@16
PUSH16	%r1
CALL	message
SP_INC	$2
LD8	%r1	$0
@IC45:	
SP_STORE	%eax
CMP8	%r1	(%eax)
JGE	@IC46
@IC47:	
CPY8	%eax	%r1
AND32	%eax	$255
CPY32	%r3	%eax
ADD16	%r3	%r0
CPY8	%r3	(%r3)
AND32	%r3	$255
PUSH8	%r3
CALL	number
SP_INC	$1
@IC48:	
INC8	%r1	$1
JUMP	@IC45
@IC46:	
LD32	%r3	$Str@17
PUSH16	%r3
CALL	message
SP_INC	$2
JUMP	@IC40
@IC41:	
LD32	%r3	$Str@18
PUSH16	%r3
CALL	message
SP_INC	$2
PUSH8	%r2
CALL	number
SP_INC	$1
LD32	%r3	$Str@19
PUSH16	%r3
CALL	message
SP_INC	$2
@IC40:	
SP_STORE	%eax
INC16	%eax	$22
CPY8	(%eax)	%r2
SP_INC	$3
POP32	%r3
POP32	%r2
POP32	%r1
POP32	%r0
RTS	
.FUNC_END	"get_report"


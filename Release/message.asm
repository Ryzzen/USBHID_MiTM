.DATA

.WEAK	"%eax"
.WEAK	"%ebx"
.WEAK	"%ecx"
.WEAK	"%r0"
.WEAK	"%r1"
.WEAK	"%r2"
.WEAK	"%r3"
.WEAK	"hUART"




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

.WEAK	"vos_delay_cancel"

.WEAK	"vos_dma_retained_configure"

.WEAK	"vos_unlock_mutex"

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

message:	
.GLOBAL	 DO_NOT_EXPORT  "message"

.FUNCTION	"message"	
PUSH32	%r0
PUSH32	%r1
PUSH32	%r2
PUSH32	%r3
SP_DEC	$1
SP_RD16	%ecx	$20
LD32	%r0	$0
SP_RD16	%r1	$20
@IC1:	
ADD16	%r2	%r1	%r0
CPY8	%r2	(%r2)
AND32	%r2	$255
CMP32	%r2	$0
JZ	@IC2
@IC4:	
CMP32	%r0	$255
JGES	@IC2
@IC3:	
INC32	%r0	$1
JUMP	@IC1
@IC2:	
SP_RD16	%r2	$20
CPY16	%r3	%r0
PUSH16	$0
PUSH16	%r3
PUSH16	%r2
PUSH16	hUART
SP_DEC	$1
CALL	vos_dev_write
POP8	%eax
SP_WR8	%eax	$8
SP_INC	$8
SP_INC	$1
POP32	%r3
POP32	%r2
POP32	%r1
POP32	%r0
RTS	
.FUNC_END	"message"

number:	
.GLOBAL	 DO_NOT_EXPORT  "number"

.FUNCTION	"number"	
PUSH32	%r0
PUSH32	%r1
SP_DEC	$3
SP_RD8	%r0	$14
CPY8	%eax	%r0
AND32	%eax	$255
LD32	%ebx	$4
SHR32	%r1	%eax	%ebx
LD32	%ebx	$48
ADD32	%r1	%ebx
SP_STORE	%ecx
INC16	%ecx	$0
CPY8	(%ecx)	%r1
SP_RD8	%ecx	$0
CMP8	%ecx	$57
JLE	@IC7
@IC8:	
SP_RD8	%eax	$0
AND32	%eax	$255
LD32	%r1	$7
ADD32	%r1	%eax
SP_STORE	%ecx
CPY8	(%ecx)	%r1
@IC7:	
SP_STORE	%r1
PUSH16	$0
PUSH16	$1
PUSH16	%r1
PUSH16	hUART
SP_DEC	$1
CALL	vos_dev_write
POP8	%eax
SP_WR8	%eax	$9
SP_INC	$8
CPY8	%eax	%r0
AND32	%eax	$255
LD32	%r1	$15
AND32	%r1	%eax
LD32	%ebx	$48
ADD32	%r1	%ebx
SP_STORE	%ecx
CPY8	(%ecx)	%r1
SP_RD8	%ecx	$0
CMP8	%ecx	$57
JLE	@IC11
@IC12:	
SP_RD8	%eax	$0
AND32	%eax	$255
LD32	%r1	$7
ADD32	%r1	%eax
SP_STORE	%ecx
CPY8	(%ecx)	%r1
@IC11:	
SP_STORE	%r1
PUSH16	$0
PUSH16	$1
PUSH16	%r1
PUSH16	hUART
SP_DEC	$1
CALL	vos_dev_write
POP8	%eax
SP_WR8	%eax	$10
SP_INC	$8
SP_INC	$3
POP32	%r1
POP32	%r0
RTS	
.FUNC_END	"number"


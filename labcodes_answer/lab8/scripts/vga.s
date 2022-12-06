	.file	"vga.c"
	.option nopic
	.attribute arch, "rv32i2p0_m2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	get_time
	.type	get_time, @function
get_time:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	li	a6,33603584
	addi	a6,a6,-8
	sw	a6,-20(s0)
	li	a6,33603584
	addi	a6,a6,-4
	sw	a6,-24(s0)
	lw	a6,-24(s0)
	lw	a6,0(a6)
	mv	a4,a6
	srai	a6,a6,31
	mv	a5,a6
	slli	a3,a4,0
	li	a2,0
	lw	a5,-20(s0)
	lw	a5,0(a5)
	mv	a0,a5
	srai	a5,a5,31
	mv	a1,a5
	add	a4,a2,a0
	mv	a6,a4
	sltu	a6,a6,a2
	add	a5,a3,a1
	add	a3,a6,a5
	mv	a5,a3
	sw	a4,-32(s0)
	sw	a5,-28(s0)
	lw	a4,-32(s0)
	lw	a5,-28(s0)
	mv	a0,a4
	mv	a1,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	get_time, .-get_time
	.align	2
	.globl	wait_for_tick
	.type	wait_for_tick, @function
wait_for_tick:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	li	a5,0
	li	a6,0
	sw	a5,-24(s0)
	sw	a6,-20(s0)
	call	get_time
	sw	a0,-32(s0)
	sw	a1,-28(s0)
	j	.L4
.L5:
 #APP
# 20 "scripts/vga.c" 1
	nop
# 0 "" 2
 #NO_APP
.L4:
	call	get_time
	mv	a6,a0
	mv	a7,a1
	lw	a4,-32(s0)
	lw	a5,-28(s0)
	li	a0,135168
	addi	a0,a0,-1835
	li	a1,0
	add	a2,a4,a0
	mv	t1,a2
	sltu	t1,t1,a4
	add	a3,a5,a1
	add	a5,t1,a3
	mv	a3,a5
	mv	a4,a2
	mv	a5,a3
	mv	a2,a7
	mv	a3,a5
	bgt	a2,a3,.L7
	mv	a2,a7
	mv	a3,a5
	bne	a2,a3,.L5
	mv	a3,a6
	mv	a5,a4
	bleu	a3,a5,.L5
.L7:
	nop
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	wait_for_tick, .-wait_for_tick
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
.L13:
	sw	zero,-20(s0)
	j	.L9
.L12:
	sw	zero,-24(s0)
	j	.L10
.L11:
	lw	a4,-20(s0)
	lw	a5,-24(s0)
	add	a4,a4,a5
	li	a5,-2143289344
	add	a5,a4,a5
	mv	a3,a5
	lw	a4,-24(s0)
	li	a5,-2130706432
	add	a5,a4,a5
	mv	a4,a5
	lw	a5,0(a3)
	sw	a5,0(a4)
	lw	a5,-24(s0)
	addi	a5,a5,4
	sw	a5,-24(s0)
.L10:
	lw	a4,-24(s0)
	li	a5,8192
	addi	a5,a5,-693
	ble	a4,a5,.L11
	li	a5,268435456
	li	a4,97
	sb	a4,0(a5)
	call	wait_for_tick
	lw	a4,-20(s0)
	li	a5,8192
	addi	a5,a5,-692
	add	a5,a4,a5
	sw	a5,-20(s0)
.L9:
	lw	a4,-20(s0)
	li	a5,3375104
	addi	a5,a5,-105
	ble	a4,a5,.L12
	j	.L13
	.size	main, .-main
	.ident	"GCC: (SiFive GCC 10.1.0-2020.08.2) 10.1.0"

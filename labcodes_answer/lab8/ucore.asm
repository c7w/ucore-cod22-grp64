
bin/kernel:     file format elf32-littleriscv


Disassembly of section .text:

80400000 <kern_entry>:
80400000:	00017117          	auipc	sp,0x17
80400004:	00010113          	mv	sp,sp
80400008:	0040006f          	j	8040000c <kern_init>

8040000c <kern_init>:
8040000c:	00097517          	auipc	a0,0x97
80400010:	04050513          	addi	a0,a0,64 # 8049704c <edata>
80400014:	0009b617          	auipc	a2,0x9b
80400018:	88060613          	addi	a2,a2,-1920 # 8049a894 <end>
8040001c:	ff010113          	addi	sp,sp,-16 # 80416ff0 <bootstack+0x1ff0>
80400020:	40a60633          	sub	a2,a2,a0
80400024:	00000593          	li	a1,0
80400028:	00112623          	sw	ra,12(sp)
8040002c:	148100ef          	jal	ra,80410174 <memset>
80400030:	3b9000ef          	jal	ra,80400be8 <cons_init>
80400034:	00011597          	auipc	a1,0x11
80400038:	9e458593          	addi	a1,a1,-1564 # 80410a18 <etext>
8040003c:	00011517          	auipc	a0,0x11
80400040:	9f850513          	addi	a0,a0,-1544 # 80410a34 <etext+0x1c>
80400044:	104000ef          	jal	ra,80400148 <cprintf>
80400048:	370000ef          	jal	ra,804003b8 <print_kerninfo>
8040004c:	0cd050ef          	jal	ra,80405918 <pmm_init>
80400050:	51d000ef          	jal	ra,80400d6c <pic_init>
80400054:	52d000ef          	jal	ra,80400d80 <idt_init>
80400058:	445010ef          	jal	ra,80401c9c <vmm_init>
8040005c:	3440a0ef          	jal	ra,8040a3a0 <sched_init>
80400060:	7b5090ef          	jal	ra,8040a014 <proc_init>
80400064:	6a4000ef          	jal	ra,80400708 <ide_init>
80400068:	01c030ef          	jal	ra,80403084 <swap_init>
8040006c:	270080ef          	jal	ra,804082dc <fs_init>
80400070:	2c5000ef          	jal	ra,80400b34 <clock_init>
80400074:	4fd000ef          	jal	ra,80400d70 <intr_enable>
80400078:	2140a0ef          	jal	ra,8040a28c <cpu_idle>

8040007c <strdup>:
8040007c:	ff010113          	addi	sp,sp,-16
80400080:	00112623          	sw	ra,12(sp)
80400084:	00812423          	sw	s0,8(sp)
80400088:	00912223          	sw	s1,4(sp)
8040008c:	01212023          	sw	s2,0(sp)
80400090:	00050913          	mv	s2,a0
80400094:	014100ef          	jal	ra,804100a8 <strlen>
80400098:	00050413          	mv	s0,a0
8040009c:	00150513          	addi	a0,a0,1
804000a0:	579020ef          	jal	ra,80402e18 <kmalloc>
804000a4:	00050493          	mv	s1,a0
804000a8:	00050c63          	beqz	a0,804000c0 <strdup+0x44>
804000ac:	00040613          	mv	a2,s0
804000b0:	00090593          	mv	a1,s2
804000b4:	00848433          	add	s0,s1,s0
804000b8:	12c100ef          	jal	ra,804101e4 <memcpy>
804000bc:	00040023          	sb	zero,0(s0)
804000c0:	00c12083          	lw	ra,12(sp)
804000c4:	00812403          	lw	s0,8(sp)
804000c8:	00012903          	lw	s2,0(sp)
804000cc:	00048513          	mv	a0,s1
804000d0:	00412483          	lw	s1,4(sp)
804000d4:	01010113          	addi	sp,sp,16
804000d8:	00008067          	ret

804000dc <cputch>:
804000dc:	ff010113          	addi	sp,sp,-16
804000e0:	00812423          	sw	s0,8(sp)
804000e4:	00112623          	sw	ra,12(sp)
804000e8:	00058413          	mv	s0,a1
804000ec:	315000ef          	jal	ra,80400c00 <cons_putc>
804000f0:	00042783          	lw	a5,0(s0)
804000f4:	00c12083          	lw	ra,12(sp)
804000f8:	00178793          	addi	a5,a5,1
804000fc:	00f42023          	sw	a5,0(s0)
80400100:	00812403          	lw	s0,8(sp)
80400104:	01010113          	addi	sp,sp,16
80400108:	00008067          	ret

8040010c <vcprintf>:
8040010c:	fe010113          	addi	sp,sp,-32
80400110:	00058713          	mv	a4,a1
80400114:	ffff75b7          	lui	a1,0xffff7
80400118:	00050693          	mv	a3,a0
8040011c:	00c10613          	addi	a2,sp,12
80400120:	00000517          	auipc	a0,0x0
80400124:	fbc50513          	addi	a0,a0,-68 # 804000dc <cputch>
80400128:	ad958593          	addi	a1,a1,-1319 # ffff6ad9 <end+0x7fb5c245>
8040012c:	00112e23          	sw	ra,28(sp)
80400130:	00012623          	sw	zero,12(sp)
80400134:	200100ef          	jal	ra,80410334 <vprintfmt>
80400138:	01c12083          	lw	ra,28(sp)
8040013c:	00c12503          	lw	a0,12(sp)
80400140:	02010113          	addi	sp,sp,32
80400144:	00008067          	ret

80400148 <cprintf>:
80400148:	fc010113          	addi	sp,sp,-64
8040014c:	02410313          	addi	t1,sp,36
80400150:	00050e13          	mv	t3,a0
80400154:	02b12223          	sw	a1,36(sp)
80400158:	ffff75b7          	lui	a1,0xffff7
8040015c:	02c12423          	sw	a2,40(sp)
80400160:	02d12623          	sw	a3,44(sp)
80400164:	02e12823          	sw	a4,48(sp)
80400168:	00000517          	auipc	a0,0x0
8040016c:	f7450513          	addi	a0,a0,-140 # 804000dc <cputch>
80400170:	00c10613          	addi	a2,sp,12
80400174:	00030713          	mv	a4,t1
80400178:	000e0693          	mv	a3,t3
8040017c:	ad958593          	addi	a1,a1,-1319 # ffff6ad9 <end+0x7fb5c245>
80400180:	00112e23          	sw	ra,28(sp)
80400184:	02f12a23          	sw	a5,52(sp)
80400188:	03012c23          	sw	a6,56(sp)
8040018c:	03112e23          	sw	a7,60(sp)
80400190:	00612423          	sw	t1,8(sp)
80400194:	00012623          	sw	zero,12(sp)
80400198:	19c100ef          	jal	ra,80410334 <vprintfmt>
8040019c:	01c12083          	lw	ra,28(sp)
804001a0:	00c12503          	lw	a0,12(sp)
804001a4:	04010113          	addi	sp,sp,64
804001a8:	00008067          	ret

804001ac <cputchar>:
804001ac:	2550006f          	j	80400c00 <cons_putc>

804001b0 <getchar>:
804001b0:	ff010113          	addi	sp,sp,-16
804001b4:	00112623          	sw	ra,12(sp)
804001b8:	2d1000ef          	jal	ra,80400c88 <cons_getc>
804001bc:	fe050ee3          	beqz	a0,804001b8 <getchar+0x8>
804001c0:	00c12083          	lw	ra,12(sp)
804001c4:	01010113          	addi	sp,sp,16
804001c8:	00008067          	ret

804001cc <readline>:
804001cc:	fd010113          	addi	sp,sp,-48
804001d0:	02112623          	sw	ra,44(sp)
804001d4:	02912423          	sw	s1,40(sp)
804001d8:	03212223          	sw	s2,36(sp)
804001dc:	03312023          	sw	s3,32(sp)
804001e0:	01412e23          	sw	s4,28(sp)
804001e4:	01512c23          	sw	s5,24(sp)
804001e8:	01612a23          	sw	s6,20(sp)
804001ec:	01712823          	sw	s7,16(sp)
804001f0:	00050a63          	beqz	a0,80400204 <readline+0x38>
804001f4:	00050593          	mv	a1,a0
804001f8:	00011517          	auipc	a0,0x11
804001fc:	84450513          	addi	a0,a0,-1980 # 80410a3c <etext+0x24>
80400200:	f49ff0ef          	jal	ra,80400148 <cprintf>
80400204:	00000493          	li	s1,0
80400208:	01f00913          	li	s2,31
8040020c:	00800993          	li	s3,8
80400210:	00a00a93          	li	s5,10
80400214:	00d00b13          	li	s6,13
80400218:	00097b97          	auipc	s7,0x97
8040021c:	e38b8b93          	addi	s7,s7,-456 # 80497050 <buf>
80400220:	3fe00a13          	li	s4,1022
80400224:	f8dff0ef          	jal	ra,804001b0 <getchar>
80400228:	00054a63          	bltz	a0,8040023c <readline+0x70>
8040022c:	00a95c63          	bge	s2,a0,80400244 <readline+0x78>
80400230:	029a5663          	bge	s4,s1,8040025c <readline+0x90>
80400234:	f7dff0ef          	jal	ra,804001b0 <getchar>
80400238:	fe055ae3          	bgez	a0,8040022c <readline+0x60>
8040023c:	00000513          	li	a0,0
80400240:	0540006f          	j	80400294 <readline+0xc8>
80400244:	03351a63          	bne	a0,s3,80400278 <readline+0xac>
80400248:	06049a63          	bnez	s1,804002bc <readline+0xf0>
8040024c:	f65ff0ef          	jal	ra,804001b0 <getchar>
80400250:	fe0546e3          	bltz	a0,8040023c <readline+0x70>
80400254:	fea958e3          	bge	s2,a0,80400244 <readline+0x78>
80400258:	00000493          	li	s1,0
8040025c:	00a12623          	sw	a0,12(sp)
80400260:	f4dff0ef          	jal	ra,804001ac <cputchar>
80400264:	00c12503          	lw	a0,12(sp)
80400268:	009b87b3          	add	a5,s7,s1
8040026c:	00148493          	addi	s1,s1,1
80400270:	00a78023          	sb	a0,0(a5)
80400274:	fb1ff06f          	j	80400224 <readline+0x58>
80400278:	01550463          	beq	a0,s5,80400280 <readline+0xb4>
8040027c:	fb6514e3          	bne	a0,s6,80400224 <readline+0x58>
80400280:	f2dff0ef          	jal	ra,804001ac <cputchar>
80400284:	00097517          	auipc	a0,0x97
80400288:	dcc50513          	addi	a0,a0,-564 # 80497050 <buf>
8040028c:	009504b3          	add	s1,a0,s1
80400290:	00048023          	sb	zero,0(s1)
80400294:	02c12083          	lw	ra,44(sp)
80400298:	02812483          	lw	s1,40(sp)
8040029c:	02412903          	lw	s2,36(sp)
804002a0:	02012983          	lw	s3,32(sp)
804002a4:	01c12a03          	lw	s4,28(sp)
804002a8:	01812a83          	lw	s5,24(sp)
804002ac:	01412b03          	lw	s6,20(sp)
804002b0:	01012b83          	lw	s7,16(sp)
804002b4:	03010113          	addi	sp,sp,48
804002b8:	00008067          	ret
804002bc:	00800513          	li	a0,8
804002c0:	eedff0ef          	jal	ra,804001ac <cputchar>
804002c4:	fff48493          	addi	s1,s1,-1
804002c8:	f5dff06f          	j	80400224 <readline+0x58>

804002cc <__panic>:
804002cc:	0009a317          	auipc	t1,0x9a
804002d0:	53030313          	addi	t1,t1,1328 # 8049a7fc <is_panic>
804002d4:	00032e03          	lw	t3,0(t1)
804002d8:	fc010113          	addi	sp,sp,-64
804002dc:	00112e23          	sw	ra,28(sp)
804002e0:	00812c23          	sw	s0,24(sp)
804002e4:	02d12623          	sw	a3,44(sp)
804002e8:	02e12823          	sw	a4,48(sp)
804002ec:	02f12a23          	sw	a5,52(sp)
804002f0:	03012c23          	sw	a6,56(sp)
804002f4:	03112e23          	sw	a7,60(sp)
804002f8:	040e1263          	bnez	t3,8040033c <__panic+0x70>
804002fc:	00100793          	li	a5,1
80400300:	00f32023          	sw	a5,0(t1)
80400304:	00060413          	mv	s0,a2
80400308:	02c10793          	addi	a5,sp,44
8040030c:	00058613          	mv	a2,a1
80400310:	00050593          	mv	a1,a0
80400314:	00010517          	auipc	a0,0x10
80400318:	72c50513          	addi	a0,a0,1836 # 80410a40 <etext+0x28>
8040031c:	00f12623          	sw	a5,12(sp)
80400320:	e29ff0ef          	jal	ra,80400148 <cprintf>
80400324:	00c12583          	lw	a1,12(sp)
80400328:	00040513          	mv	a0,s0
8040032c:	de1ff0ef          	jal	ra,8040010c <vcprintf>
80400330:	00012517          	auipc	a0,0x12
80400334:	38050513          	addi	a0,a0,896 # 804126b0 <default_pmm_manager+0x484>
80400338:	e11ff0ef          	jal	ra,80400148 <cprintf>
8040033c:	23d000ef          	jal	ra,80400d78 <intr_disable>
80400340:	00000513          	li	a0,0
80400344:	1d4000ef          	jal	ra,80400518 <kmonitor>
80400348:	ff9ff06f          	j	80400340 <__panic+0x74>

8040034c <__warn>:
8040034c:	fc010113          	addi	sp,sp,-64
80400350:	00058313          	mv	t1,a1
80400354:	00812c23          	sw	s0,24(sp)
80400358:	00050593          	mv	a1,a0
8040035c:	00060413          	mv	s0,a2
80400360:	02f12a23          	sw	a5,52(sp)
80400364:	00030613          	mv	a2,t1
80400368:	02c10793          	addi	a5,sp,44
8040036c:	00010517          	auipc	a0,0x10
80400370:	6f050513          	addi	a0,a0,1776 # 80410a5c <etext+0x44>
80400374:	00112e23          	sw	ra,28(sp)
80400378:	02d12623          	sw	a3,44(sp)
8040037c:	02e12823          	sw	a4,48(sp)
80400380:	03012c23          	sw	a6,56(sp)
80400384:	03112e23          	sw	a7,60(sp)
80400388:	00f12623          	sw	a5,12(sp)
8040038c:	dbdff0ef          	jal	ra,80400148 <cprintf>
80400390:	00c12583          	lw	a1,12(sp)
80400394:	00040513          	mv	a0,s0
80400398:	d75ff0ef          	jal	ra,8040010c <vcprintf>
8040039c:	00012517          	auipc	a0,0x12
804003a0:	31450513          	addi	a0,a0,788 # 804126b0 <default_pmm_manager+0x484>
804003a4:	da5ff0ef          	jal	ra,80400148 <cprintf>
804003a8:	01c12083          	lw	ra,28(sp)
804003ac:	01812403          	lw	s0,24(sp)
804003b0:	04010113          	addi	sp,sp,64
804003b4:	00008067          	ret

804003b8 <print_kerninfo>:
804003b8:	ff010113          	addi	sp,sp,-16
804003bc:	00010517          	auipc	a0,0x10
804003c0:	6c050513          	addi	a0,a0,1728 # 80410a7c <etext+0x64>
804003c4:	00112623          	sw	ra,12(sp)
804003c8:	d81ff0ef          	jal	ra,80400148 <cprintf>
804003cc:	00000597          	auipc	a1,0x0
804003d0:	c4058593          	addi	a1,a1,-960 # 8040000c <kern_init>
804003d4:	00010517          	auipc	a0,0x10
804003d8:	6c450513          	addi	a0,a0,1732 # 80410a98 <etext+0x80>
804003dc:	d6dff0ef          	jal	ra,80400148 <cprintf>
804003e0:	00010597          	auipc	a1,0x10
804003e4:	63858593          	addi	a1,a1,1592 # 80410a18 <etext>
804003e8:	00010517          	auipc	a0,0x10
804003ec:	6cc50513          	addi	a0,a0,1740 # 80410ab4 <etext+0x9c>
804003f0:	d59ff0ef          	jal	ra,80400148 <cprintf>
804003f4:	00097597          	auipc	a1,0x97
804003f8:	c5858593          	addi	a1,a1,-936 # 8049704c <edata>
804003fc:	00010517          	auipc	a0,0x10
80400400:	6d450513          	addi	a0,a0,1748 # 80410ad0 <etext+0xb8>
80400404:	d45ff0ef          	jal	ra,80400148 <cprintf>
80400408:	0009a597          	auipc	a1,0x9a
8040040c:	48c58593          	addi	a1,a1,1164 # 8049a894 <end>
80400410:	00010517          	auipc	a0,0x10
80400414:	6dc50513          	addi	a0,a0,1756 # 80410aec <etext+0xd4>
80400418:	d31ff0ef          	jal	ra,80400148 <cprintf>
8040041c:	0009b597          	auipc	a1,0x9b
80400420:	87758593          	addi	a1,a1,-1929 # 8049ac93 <end+0x3ff>
80400424:	00000797          	auipc	a5,0x0
80400428:	be878793          	addi	a5,a5,-1048 # 8040000c <kern_init>
8040042c:	40f587b3          	sub	a5,a1,a5
80400430:	41f7d593          	srai	a1,a5,0x1f
80400434:	00c12083          	lw	ra,12(sp)
80400438:	3ff5f593          	andi	a1,a1,1023
8040043c:	00f585b3          	add	a1,a1,a5
80400440:	40a5d593          	srai	a1,a1,0xa
80400444:	00010517          	auipc	a0,0x10
80400448:	6c450513          	addi	a0,a0,1732 # 80410b08 <etext+0xf0>
8040044c:	01010113          	addi	sp,sp,16
80400450:	cf9ff06f          	j	80400148 <cprintf>

80400454 <print_stackframe>:
80400454:	ff010113          	addi	sp,sp,-16
80400458:	00010617          	auipc	a2,0x10
8040045c:	6dc60613          	addi	a2,a2,1756 # 80410b34 <etext+0x11c>
80400460:	05b00593          	li	a1,91
80400464:	00010517          	auipc	a0,0x10
80400468:	6e450513          	addi	a0,a0,1764 # 80410b48 <etext+0x130>
8040046c:	00112623          	sw	ra,12(sp)
80400470:	e5dff0ef          	jal	ra,804002cc <__panic>

80400474 <mon_help>:
80400474:	ff010113          	addi	sp,sp,-16
80400478:	00010617          	auipc	a2,0x10
8040047c:	6e460613          	addi	a2,a2,1764 # 80410b5c <etext+0x144>
80400480:	00010597          	auipc	a1,0x10
80400484:	6fc58593          	addi	a1,a1,1788 # 80410b7c <etext+0x164>
80400488:	00010517          	auipc	a0,0x10
8040048c:	6fc50513          	addi	a0,a0,1788 # 80410b84 <etext+0x16c>
80400490:	00112623          	sw	ra,12(sp)
80400494:	cb5ff0ef          	jal	ra,80400148 <cprintf>
80400498:	00010617          	auipc	a2,0x10
8040049c:	6f860613          	addi	a2,a2,1784 # 80410b90 <etext+0x178>
804004a0:	00010597          	auipc	a1,0x10
804004a4:	71858593          	addi	a1,a1,1816 # 80410bb8 <etext+0x1a0>
804004a8:	00010517          	auipc	a0,0x10
804004ac:	6dc50513          	addi	a0,a0,1756 # 80410b84 <etext+0x16c>
804004b0:	c99ff0ef          	jal	ra,80400148 <cprintf>
804004b4:	00010617          	auipc	a2,0x10
804004b8:	71060613          	addi	a2,a2,1808 # 80410bc4 <etext+0x1ac>
804004bc:	00010597          	auipc	a1,0x10
804004c0:	72858593          	addi	a1,a1,1832 # 80410be4 <etext+0x1cc>
804004c4:	00010517          	auipc	a0,0x10
804004c8:	6c050513          	addi	a0,a0,1728 # 80410b84 <etext+0x16c>
804004cc:	c7dff0ef          	jal	ra,80400148 <cprintf>
804004d0:	00c12083          	lw	ra,12(sp)
804004d4:	00000513          	li	a0,0
804004d8:	01010113          	addi	sp,sp,16
804004dc:	00008067          	ret

804004e0 <mon_kerninfo>:
804004e0:	ff010113          	addi	sp,sp,-16
804004e4:	00112623          	sw	ra,12(sp)
804004e8:	ed1ff0ef          	jal	ra,804003b8 <print_kerninfo>
804004ec:	00c12083          	lw	ra,12(sp)
804004f0:	00000513          	li	a0,0
804004f4:	01010113          	addi	sp,sp,16
804004f8:	00008067          	ret

804004fc <mon_backtrace>:
804004fc:	ff010113          	addi	sp,sp,-16
80400500:	00112623          	sw	ra,12(sp)
80400504:	f51ff0ef          	jal	ra,80400454 <print_stackframe>
80400508:	00c12083          	lw	ra,12(sp)
8040050c:	00000513          	li	a0,0
80400510:	01010113          	addi	sp,sp,16
80400514:	00008067          	ret

80400518 <kmonitor>:
80400518:	f9010113          	addi	sp,sp,-112
8040051c:	05712623          	sw	s7,76(sp)
80400520:	00050b93          	mv	s7,a0
80400524:	00010517          	auipc	a0,0x10
80400528:	6cc50513          	addi	a0,a0,1740 # 80410bf0 <etext+0x1d8>
8040052c:	06112623          	sw	ra,108(sp)
80400530:	06812423          	sw	s0,104(sp)
80400534:	06912223          	sw	s1,100(sp)
80400538:	07212023          	sw	s2,96(sp)
8040053c:	05312e23          	sw	s3,92(sp)
80400540:	05412c23          	sw	s4,88(sp)
80400544:	05512a23          	sw	s5,84(sp)
80400548:	05612823          	sw	s6,80(sp)
8040054c:	05812423          	sw	s8,72(sp)
80400550:	05912223          	sw	s9,68(sp)
80400554:	05a12023          	sw	s10,64(sp)
80400558:	bf1ff0ef          	jal	ra,80400148 <cprintf>
8040055c:	00010517          	auipc	a0,0x10
80400560:	6bc50513          	addi	a0,a0,1724 # 80410c18 <etext+0x200>
80400564:	be5ff0ef          	jal	ra,80400148 <cprintf>
80400568:	000b8663          	beqz	s7,80400574 <kmonitor+0x5c>
8040056c:	000b8513          	mv	a0,s7
80400570:	24d000ef          	jal	ra,80400fbc <print_trapframe>
80400574:	00000513          	li	a0,0
80400578:	00000593          	li	a1,0
8040057c:	00000613          	li	a2,0
80400580:	00800893          	li	a7,8
80400584:	00000073          	ecall
80400588:	00010c17          	auipc	s8,0x10
8040058c:	6fcc0c13          	addi	s8,s8,1788 # 80410c84 <commands>
80400590:	00010917          	auipc	s2,0x10
80400594:	6b090913          	addi	s2,s2,1712 # 80410c40 <etext+0x228>
80400598:	00010497          	auipc	s1,0x10
8040059c:	6ac48493          	addi	s1,s1,1708 # 80410c44 <etext+0x22c>
804005a0:	00f00993          	li	s3,15
804005a4:	00010b17          	auipc	s6,0x10
804005a8:	6a8b0b13          	addi	s6,s6,1704 # 80410c4c <etext+0x234>
804005ac:	00010a17          	auipc	s4,0x10
804005b0:	5d0a0a13          	addi	s4,s4,1488 # 80410b7c <etext+0x164>
804005b4:	00300a93          	li	s5,3
804005b8:	00090513          	mv	a0,s2
804005bc:	c11ff0ef          	jal	ra,804001cc <readline>
804005c0:	00050413          	mv	s0,a0
804005c4:	fe050ae3          	beqz	a0,804005b8 <kmonitor+0xa0>
804005c8:	00054583          	lbu	a1,0(a0)
804005cc:	00000c93          	li	s9,0
804005d0:	0a059263          	bnez	a1,80400674 <kmonitor+0x15c>
804005d4:	fe0c82e3          	beqz	s9,804005b8 <kmonitor+0xa0>
804005d8:	00012583          	lw	a1,0(sp)
804005dc:	00010d17          	auipc	s10,0x10
804005e0:	6a8d0d13          	addi	s10,s10,1704 # 80410c84 <commands>
804005e4:	000a0513          	mv	a0,s4
804005e8:	00000413          	li	s0,0
804005ec:	00cd0d13          	addi	s10,s10,12
804005f0:	3290f0ef          	jal	ra,80410118 <strcmp>
804005f4:	02050063          	beqz	a0,80400614 <kmonitor+0xfc>
804005f8:	00140413          	addi	s0,s0,1
804005fc:	0f540c63          	beq	s0,s5,804006f4 <kmonitor+0x1dc>
80400600:	000d2503          	lw	a0,0(s10)
80400604:	00012583          	lw	a1,0(sp)
80400608:	00cd0d13          	addi	s10,s10,12
8040060c:	30d0f0ef          	jal	ra,80410118 <strcmp>
80400610:	fe0514e3          	bnez	a0,804005f8 <kmonitor+0xe0>
80400614:	00141793          	slli	a5,s0,0x1
80400618:	008787b3          	add	a5,a5,s0
8040061c:	00279793          	slli	a5,a5,0x2
80400620:	00fc07b3          	add	a5,s8,a5
80400624:	0087a783          	lw	a5,8(a5)
80400628:	000b8613          	mv	a2,s7
8040062c:	00410593          	addi	a1,sp,4
80400630:	fffc8513          	addi	a0,s9,-1
80400634:	000780e7          	jalr	a5
80400638:	f80550e3          	bgez	a0,804005b8 <kmonitor+0xa0>
8040063c:	06c12083          	lw	ra,108(sp)
80400640:	06812403          	lw	s0,104(sp)
80400644:	06412483          	lw	s1,100(sp)
80400648:	06012903          	lw	s2,96(sp)
8040064c:	05c12983          	lw	s3,92(sp)
80400650:	05812a03          	lw	s4,88(sp)
80400654:	05412a83          	lw	s5,84(sp)
80400658:	05012b03          	lw	s6,80(sp)
8040065c:	04c12b83          	lw	s7,76(sp)
80400660:	04812c03          	lw	s8,72(sp)
80400664:	04412c83          	lw	s9,68(sp)
80400668:	04012d03          	lw	s10,64(sp)
8040066c:	07010113          	addi	sp,sp,112
80400670:	00008067          	ret
80400674:	00048513          	mv	a0,s1
80400678:	2dd0f0ef          	jal	ra,80410154 <strchr>
8040067c:	00050c63          	beqz	a0,80400694 <kmonitor+0x17c>
80400680:	00144583          	lbu	a1,1(s0)
80400684:	00040023          	sb	zero,0(s0)
80400688:	00140413          	addi	s0,s0,1
8040068c:	f40584e3          	beqz	a1,804005d4 <kmonitor+0xbc>
80400690:	fe5ff06f          	j	80400674 <kmonitor+0x15c>
80400694:	00044783          	lbu	a5,0(s0)
80400698:	f2078ee3          	beqz	a5,804005d4 <kmonitor+0xbc>
8040069c:	053c8463          	beq	s9,s3,804006e4 <kmonitor+0x1cc>
804006a0:	002c9793          	slli	a5,s9,0x2
804006a4:	04010713          	addi	a4,sp,64
804006a8:	00f707b3          	add	a5,a4,a5
804006ac:	fc87a023          	sw	s0,-64(a5)
804006b0:	00044583          	lbu	a1,0(s0)
804006b4:	001c8c93          	addi	s9,s9,1
804006b8:	00059a63          	bnez	a1,804006cc <kmonitor+0x1b4>
804006bc:	f1dff06f          	j	804005d8 <kmonitor+0xc0>
804006c0:	00144583          	lbu	a1,1(s0)
804006c4:	00140413          	addi	s0,s0,1
804006c8:	f00586e3          	beqz	a1,804005d4 <kmonitor+0xbc>
804006cc:	00048513          	mv	a0,s1
804006d0:	2850f0ef          	jal	ra,80410154 <strchr>
804006d4:	fe0506e3          	beqz	a0,804006c0 <kmonitor+0x1a8>
804006d8:	00044583          	lbu	a1,0(s0)
804006dc:	ee058ce3          	beqz	a1,804005d4 <kmonitor+0xbc>
804006e0:	f95ff06f          	j	80400674 <kmonitor+0x15c>
804006e4:	01000593          	li	a1,16
804006e8:	000b0513          	mv	a0,s6
804006ec:	a5dff0ef          	jal	ra,80400148 <cprintf>
804006f0:	fb1ff06f          	j	804006a0 <kmonitor+0x188>
804006f4:	00012583          	lw	a1,0(sp)
804006f8:	00010517          	auipc	a0,0x10
804006fc:	57450513          	addi	a0,a0,1396 # 80410c6c <etext+0x254>
80400700:	a49ff0ef          	jal	ra,80400148 <cprintf>
80400704:	eb5ff06f          	j	804005b8 <kmonitor+0xa0>

80400708 <ide_init>:
80400708:	ff010113          	addi	sp,sp,-16
8040070c:	00097597          	auipc	a1,0x97
80400710:	d8058593          	addi	a1,a1,-640 # 8049748c <ide_devices+0x3c>
80400714:	00100513          	li	a0,1
80400718:	00812423          	sw	s0,8(sp)
8040071c:	00097797          	auipc	a5,0x97
80400720:	d207aa23          	sw	zero,-716(a5) # 80497450 <ide_devices>
80400724:	00097797          	auipc	a5,0x97
80400728:	d607a423          	sw	zero,-664(a5) # 8049748c <ide_devices+0x3c>
8040072c:	00097797          	auipc	a5,0x97
80400730:	d807ae23          	sw	zero,-612(a5) # 804974c8 <ide_devices+0x78>
80400734:	00097797          	auipc	a5,0x97
80400738:	dc07a823          	sw	zero,-560(a5) # 80497504 <ide_devices+0xb4>
8040073c:	00112623          	sw	ra,12(sp)
80400740:	00097417          	auipc	s0,0x97
80400744:	d1040413          	addi	s0,s0,-752 # 80497450 <ide_devices>
80400748:	298000ef          	jal	ra,804009e0 <ramdisk_init>
8040074c:	03c42783          	lw	a5,60(s0)
80400750:	02078663          	beqz	a5,8040077c <ide_init+0x74>
80400754:	00097597          	auipc	a1,0x97
80400758:	d7458593          	addi	a1,a1,-652 # 804974c8 <ide_devices+0x78>
8040075c:	00200513          	li	a0,2
80400760:	280000ef          	jal	ra,804009e0 <ramdisk_init>
80400764:	07842783          	lw	a5,120(s0)
80400768:	02078a63          	beqz	a5,8040079c <ide_init+0x94>
8040076c:	00c12083          	lw	ra,12(sp)
80400770:	00812403          	lw	s0,8(sp)
80400774:	01010113          	addi	sp,sp,16
80400778:	00008067          	ret
8040077c:	00010697          	auipc	a3,0x10
80400780:	52c68693          	addi	a3,a3,1324 # 80410ca8 <commands+0x24>
80400784:	00010617          	auipc	a2,0x10
80400788:	53c60613          	addi	a2,a2,1340 # 80410cc0 <commands+0x3c>
8040078c:	01100593          	li	a1,17
80400790:	00010517          	auipc	a0,0x10
80400794:	54850513          	addi	a0,a0,1352 # 80410cd8 <commands+0x54>
80400798:	b35ff0ef          	jal	ra,804002cc <__panic>
8040079c:	00010697          	auipc	a3,0x10
804007a0:	55068693          	addi	a3,a3,1360 # 80410cec <commands+0x68>
804007a4:	00010617          	auipc	a2,0x10
804007a8:	51c60613          	addi	a2,a2,1308 # 80410cc0 <commands+0x3c>
804007ac:	01400593          	li	a1,20
804007b0:	00010517          	auipc	a0,0x10
804007b4:	52850513          	addi	a0,a0,1320 # 80410cd8 <commands+0x54>
804007b8:	b15ff0ef          	jal	ra,804002cc <__panic>

804007bc <ide_device_valid>:
804007bc:	00300793          	li	a5,3
804007c0:	02a7e463          	bltu	a5,a0,804007e8 <ide_device_valid+0x2c>
804007c4:	00451793          	slli	a5,a0,0x4
804007c8:	40a78533          	sub	a0,a5,a0
804007cc:	00251513          	slli	a0,a0,0x2
804007d0:	00097797          	auipc	a5,0x97
804007d4:	c8078793          	addi	a5,a5,-896 # 80497450 <ide_devices>
804007d8:	00a78533          	add	a0,a5,a0
804007dc:	00052503          	lw	a0,0(a0)
804007e0:	00a03533          	snez	a0,a0
804007e4:	00008067          	ret
804007e8:	00000513          	li	a0,0
804007ec:	00008067          	ret

804007f0 <ide_device_size>:
804007f0:	00300793          	li	a5,3
804007f4:	02a7e663          	bltu	a5,a0,80400820 <ide_device_size+0x30>
804007f8:	00451793          	slli	a5,a0,0x4
804007fc:	40a78533          	sub	a0,a5,a0
80400800:	00251513          	slli	a0,a0,0x2
80400804:	00097797          	auipc	a5,0x97
80400808:	c4c78793          	addi	a5,a5,-948 # 80497450 <ide_devices>
8040080c:	00a787b3          	add	a5,a5,a0
80400810:	0007a503          	lw	a0,0(a5)
80400814:	00050863          	beqz	a0,80400824 <ide_device_size+0x34>
80400818:	0087a503          	lw	a0,8(a5)
8040081c:	00008067          	ret
80400820:	00000513          	li	a0,0
80400824:	00008067          	ret

80400828 <ide_read_secs>:
80400828:	ff010113          	addi	sp,sp,-16
8040082c:	00112623          	sw	ra,12(sp)
80400830:	08000713          	li	a4,128
80400834:	04d76663          	bltu	a4,a3,80400880 <ide_read_secs+0x58>
80400838:	00300713          	li	a4,3
8040083c:	04a76263          	bltu	a4,a0,80400880 <ide_read_secs+0x58>
80400840:	00451713          	slli	a4,a0,0x4
80400844:	40a70533          	sub	a0,a4,a0
80400848:	00251513          	slli	a0,a0,0x2
8040084c:	00097717          	auipc	a4,0x97
80400850:	c0470713          	addi	a4,a4,-1020 # 80497450 <ide_devices>
80400854:	00a70533          	add	a0,a4,a0
80400858:	00052703          	lw	a4,0(a0)
8040085c:	02070263          	beqz	a4,80400880 <ide_read_secs+0x58>
80400860:	10000737          	lui	a4,0x10000
80400864:	02e5fe63          	bgeu	a1,a4,804008a0 <ide_read_secs+0x78>
80400868:	00b687b3          	add	a5,a3,a1
8040086c:	02f76a63          	bltu	a4,a5,804008a0 <ide_read_secs+0x78>
80400870:	00c12083          	lw	ra,12(sp)
80400874:	03452783          	lw	a5,52(a0)
80400878:	01010113          	addi	sp,sp,16
8040087c:	00078067          	jr	a5
80400880:	00010697          	auipc	a3,0x10
80400884:	48468693          	addi	a3,a3,1156 # 80410d04 <commands+0x80>
80400888:	00010617          	auipc	a2,0x10
8040088c:	43860613          	addi	a2,a2,1080 # 80410cc0 <commands+0x3c>
80400890:	02200593          	li	a1,34
80400894:	00010517          	auipc	a0,0x10
80400898:	44450513          	addi	a0,a0,1092 # 80410cd8 <commands+0x54>
8040089c:	a31ff0ef          	jal	ra,804002cc <__panic>
804008a0:	00010697          	auipc	a3,0x10
804008a4:	48c68693          	addi	a3,a3,1164 # 80410d2c <commands+0xa8>
804008a8:	00010617          	auipc	a2,0x10
804008ac:	41860613          	addi	a2,a2,1048 # 80410cc0 <commands+0x3c>
804008b0:	02300593          	li	a1,35
804008b4:	00010517          	auipc	a0,0x10
804008b8:	42450513          	addi	a0,a0,1060 # 80410cd8 <commands+0x54>
804008bc:	a11ff0ef          	jal	ra,804002cc <__panic>

804008c0 <ide_write_secs>:
804008c0:	ff010113          	addi	sp,sp,-16
804008c4:	00112623          	sw	ra,12(sp)
804008c8:	08000713          	li	a4,128
804008cc:	04d76663          	bltu	a4,a3,80400918 <ide_write_secs+0x58>
804008d0:	00300713          	li	a4,3
804008d4:	04a76263          	bltu	a4,a0,80400918 <ide_write_secs+0x58>
804008d8:	00451713          	slli	a4,a0,0x4
804008dc:	40a70533          	sub	a0,a4,a0
804008e0:	00251513          	slli	a0,a0,0x2
804008e4:	00097717          	auipc	a4,0x97
804008e8:	b6c70713          	addi	a4,a4,-1172 # 80497450 <ide_devices>
804008ec:	00a70533          	add	a0,a4,a0
804008f0:	00052703          	lw	a4,0(a0)
804008f4:	02070263          	beqz	a4,80400918 <ide_write_secs+0x58>
804008f8:	10000737          	lui	a4,0x10000
804008fc:	02e5fe63          	bgeu	a1,a4,80400938 <ide_write_secs+0x78>
80400900:	00b687b3          	add	a5,a3,a1
80400904:	02f76a63          	bltu	a4,a5,80400938 <ide_write_secs+0x78>
80400908:	00c12083          	lw	ra,12(sp)
8040090c:	03852783          	lw	a5,56(a0)
80400910:	01010113          	addi	sp,sp,16
80400914:	00078067          	jr	a5
80400918:	00010697          	auipc	a3,0x10
8040091c:	3ec68693          	addi	a3,a3,1004 # 80410d04 <commands+0x80>
80400920:	00010617          	auipc	a2,0x10
80400924:	3a060613          	addi	a2,a2,928 # 80410cc0 <commands+0x3c>
80400928:	02900593          	li	a1,41
8040092c:	00010517          	auipc	a0,0x10
80400930:	3ac50513          	addi	a0,a0,940 # 80410cd8 <commands+0x54>
80400934:	999ff0ef          	jal	ra,804002cc <__panic>
80400938:	00010697          	auipc	a3,0x10
8040093c:	3f468693          	addi	a3,a3,1012 # 80410d2c <commands+0xa8>
80400940:	00010617          	auipc	a2,0x10
80400944:	38060613          	addi	a2,a2,896 # 80410cc0 <commands+0x3c>
80400948:	02a00593          	li	a1,42
8040094c:	00010517          	auipc	a0,0x10
80400950:	38c50513          	addi	a0,a0,908 # 80410cd8 <commands+0x54>
80400954:	979ff0ef          	jal	ra,804002cc <__panic>

80400958 <ramdisk_write>:
80400958:	00852703          	lw	a4,8(a0)
8040095c:	ff010113          	addi	sp,sp,-16
80400960:	00112623          	sw	ra,12(sp)
80400964:	40b70733          	sub	a4,a4,a1
80400968:	00058793          	mv	a5,a1
8040096c:	00060593          	mv	a1,a2
80400970:	00e6f463          	bgeu	a3,a4,80400978 <ramdisk_write+0x20>
80400974:	00068713          	mv	a4,a3
80400978:	00c52503          	lw	a0,12(a0)
8040097c:	00979793          	slli	a5,a5,0x9
80400980:	00971613          	slli	a2,a4,0x9
80400984:	00a78533          	add	a0,a5,a0
80400988:	05d0f0ef          	jal	ra,804101e4 <memcpy>
8040098c:	00c12083          	lw	ra,12(sp)
80400990:	00000513          	li	a0,0
80400994:	01010113          	addi	sp,sp,16
80400998:	00008067          	ret

8040099c <ramdisk_read>:
8040099c:	00852783          	lw	a5,8(a0)
804009a0:	ff010113          	addi	sp,sp,-16
804009a4:	00112623          	sw	ra,12(sp)
804009a8:	40b787b3          	sub	a5,a5,a1
804009ac:	00050713          	mv	a4,a0
804009b0:	00060513          	mv	a0,a2
804009b4:	00f6f463          	bgeu	a3,a5,804009bc <ramdisk_read+0x20>
804009b8:	00068793          	mv	a5,a3
804009bc:	00c72703          	lw	a4,12(a4) # 1000000c <_binary_bin_sfs_img_size+0xff8800c>
804009c0:	00959593          	slli	a1,a1,0x9
804009c4:	00979613          	slli	a2,a5,0x9
804009c8:	00e585b3          	add	a1,a1,a4
804009cc:	0190f0ef          	jal	ra,804101e4 <memcpy>
804009d0:	00c12083          	lw	ra,12(sp)
804009d4:	00000513          	li	a0,0
804009d8:	01010113          	addi	sp,sp,16
804009dc:	00008067          	ret

804009e0 <ramdisk_init>:
804009e0:	ff010113          	addi	sp,sp,-16
804009e4:	00812423          	sw	s0,8(sp)
804009e8:	00058413          	mv	s0,a1
804009ec:	00912223          	sw	s1,4(sp)
804009f0:	03c00613          	li	a2,60
804009f4:	00050493          	mv	s1,a0
804009f8:	00000593          	li	a1,0
804009fc:	00040513          	mv	a0,s0
80400a00:	00112623          	sw	ra,12(sp)
80400a04:	01212023          	sw	s2,0(sp)
80400a08:	76c0f0ef          	jal	ra,80410174 <memset>
80400a0c:	00100793          	li	a5,1
80400a10:	08f48c63          	beq	s1,a5,80400aa8 <ramdisk_init+0xc8>
80400a14:	00200793          	li	a5,2
80400a18:	00096617          	auipc	a2,0x96
80400a1c:	5e860613          	addi	a2,a2,1512 # 80497000 <swap_manager_fifo>
80400a20:	0001e917          	auipc	s2,0x1e
80400a24:	5e090913          	addi	s2,s2,1504 # 8041f000 <_binary_bin_sfs_img_start>
80400a28:	0af49a63          	bne	s1,a5,80400adc <ramdisk_init+0xfc>
80400a2c:	08c90863          	beq	s2,a2,80400abc <ramdisk_init+0xdc>
80400a30:	412604b3          	sub	s1,a2,s2
80400a34:	00048693          	mv	a3,s1
80400a38:	00090593          	mv	a1,s2
80400a3c:	fff60613          	addi	a2,a2,-1
80400a40:	00010517          	auipc	a0,0x10
80400a44:	34050513          	addi	a0,a0,832 # 80410d80 <commands+0xfc>
80400a48:	f00ff0ef          	jal	ra,80400148 <cprintf>
80400a4c:	00100793          	li	a5,1
80400a50:	00f42023          	sw	a5,0(s0)
80400a54:	0094d493          	srli	s1,s1,0x9
80400a58:	fff00793          	li	a5,-1
80400a5c:	00f42223          	sw	a5,4(s0)
80400a60:	00942423          	sw	s1,8(s0)
80400a64:	01242623          	sw	s2,12(s0)
80400a68:	01440513          	addi	a0,s0,20
80400a6c:	00010597          	auipc	a1,0x10
80400a70:	36858593          	addi	a1,a1,872 # 80410dd4 <commands+0x150>
80400a74:	6880f0ef          	jal	ra,804100fc <strcpy>
80400a78:	00000797          	auipc	a5,0x0
80400a7c:	f2478793          	addi	a5,a5,-220 # 8040099c <ramdisk_read>
80400a80:	02f42a23          	sw	a5,52(s0)
80400a84:	00000797          	auipc	a5,0x0
80400a88:	ed478793          	addi	a5,a5,-300 # 80400958 <ramdisk_write>
80400a8c:	00c12083          	lw	ra,12(sp)
80400a90:	02f42c23          	sw	a5,56(s0)
80400a94:	00812403          	lw	s0,8(sp)
80400a98:	00412483          	lw	s1,4(sp)
80400a9c:	00012903          	lw	s2,0(sp)
80400aa0:	01010113          	addi	sp,sp,16
80400aa4:	00008067          	ret
80400aa8:	0001e617          	auipc	a2,0x1e
80400aac:	55860613          	addi	a2,a2,1368 # 8041f000 <_binary_bin_sfs_img_start>
80400ab0:	00016917          	auipc	s2,0x16
80400ab4:	55090913          	addi	s2,s2,1360 # 80417000 <_binary_bin_swap_img_start>
80400ab8:	f6c91ce3          	bne	s2,a2,80400a30 <ramdisk_init+0x50>
80400abc:	00812403          	lw	s0,8(sp)
80400ac0:	00c12083          	lw	ra,12(sp)
80400ac4:	00412483          	lw	s1,4(sp)
80400ac8:	00012903          	lw	s2,0(sp)
80400acc:	00010517          	auipc	a0,0x10
80400ad0:	29c50513          	addi	a0,a0,668 # 80410d68 <commands+0xe4>
80400ad4:	01010113          	addi	sp,sp,16
80400ad8:	e70ff06f          	j	80400148 <cprintf>
80400adc:	00010617          	auipc	a2,0x10
80400ae0:	2cc60613          	addi	a2,a2,716 # 80410da8 <commands+0x124>
80400ae4:	03200593          	li	a1,50
80400ae8:	00010517          	auipc	a0,0x10
80400aec:	2d450513          	addi	a0,a0,724 # 80410dbc <commands+0x138>
80400af0:	fdcff0ef          	jal	ra,804002cc <__panic>

80400af4 <clock_set_next_event>:
80400af4:	c81027f3          	rdtimeh	a5
80400af8:	c01025f3          	rdtime	a1
80400afc:	c8102773          	rdtimeh	a4
80400b00:	fee79ae3          	bne	a5,a4,80400af4 <clock_set_next_event>
80400b04:	0009a717          	auipc	a4,0x9a
80400b08:	d0470713          	addi	a4,a4,-764 # 8049a808 <timebase>
80400b0c:	00072503          	lw	a0,0(a4)
80400b10:	00472703          	lw	a4,4(a4)
80400b14:	00000613          	li	a2,0
80400b18:	00a58533          	add	a0,a1,a0
80400b1c:	00b535b3          	sltu	a1,a0,a1
80400b20:	00e787b3          	add	a5,a5,a4
80400b24:	00f585b3          	add	a1,a1,a5
80400b28:	00000893          	li	a7,0
80400b2c:	00000073          	ecall
80400b30:	00008067          	ret

80400b34 <clock_init>:
80400b34:	ff010113          	addi	sp,sp,-16
80400b38:	00018637          	lui	a2,0x18
80400b3c:	00112623          	sw	ra,12(sp)
80400b40:	0009a797          	auipc	a5,0x9a
80400b44:	cc878793          	addi	a5,a5,-824 # 8049a808 <timebase>
80400b48:	6a060613          	addi	a2,a2,1696 # 186a0 <_binary_bin_swap_img_size+0x106a0>
80400b4c:	00000693          	li	a3,0
80400b50:	00c7a023          	sw	a2,0(a5)
80400b54:	00d7a223          	sw	a3,4(a5)
80400b58:	f9dff0ef          	jal	ra,80400af4 <clock_set_next_event>
80400b5c:	02000793          	li	a5,32
80400b60:	1047a7f3          	csrrs	a5,sie,a5
80400b64:	00c12083          	lw	ra,12(sp)
80400b68:	0009a797          	auipc	a5,0x9a
80400b6c:	c807ac23          	sw	zero,-872(a5) # 8049a800 <ticks>
80400b70:	00010517          	auipc	a0,0x10
80400b74:	27050513          	addi	a0,a0,624 # 80410de0 <commands+0x15c>
80400b78:	01010113          	addi	sp,sp,16
80400b7c:	dccff06f          	j	80400148 <cprintf>

80400b80 <serial_intr>:
80400b80:	07f00793          	li	a5,127
80400b84:	00097697          	auipc	a3,0x97
80400b88:	9bc68693          	addi	a3,a3,-1604 # 80497540 <cons>
80400b8c:	20000813          	li	a6,512
80400b90:	0080006f          	j	80400b98 <serial_intr+0x18>
80400b94:	04051663          	bnez	a0,80400be0 <serial_intr+0x60>
80400b98:	00000513          	li	a0,0
80400b9c:	00000593          	li	a1,0
80400ba0:	00000613          	li	a2,0
80400ba4:	00200893          	li	a7,2
80400ba8:	00000073          	ecall
80400bac:	02054863          	bltz	a0,80400bdc <serial_intr+0x5c>
80400bb0:	fef512e3          	bne	a0,a5,80400b94 <serial_intr+0x14>
80400bb4:	00800513          	li	a0,8
80400bb8:	2046a703          	lw	a4,516(a3)
80400bbc:	00170613          	addi	a2,a4,1
80400bc0:	00e68733          	add	a4,a3,a4
80400bc4:	20c6a223          	sw	a2,516(a3)
80400bc8:	00a70023          	sb	a0,0(a4)
80400bcc:	fd0616e3          	bne	a2,a6,80400b98 <serial_intr+0x18>
80400bd0:	00097717          	auipc	a4,0x97
80400bd4:	b6072a23          	sw	zero,-1164(a4) # 80497744 <cons+0x204>
80400bd8:	fc1ff06f          	j	80400b98 <serial_intr+0x18>
80400bdc:	00008067          	ret
80400be0:	0ff57513          	andi	a0,a0,255
80400be4:	fd5ff06f          	j	80400bb8 <serial_intr+0x38>

80400be8 <cons_init>:
80400be8:	00000513          	li	a0,0
80400bec:	00000593          	li	a1,0
80400bf0:	00000613          	li	a2,0
80400bf4:	00200893          	li	a7,2
80400bf8:	00000073          	ecall
80400bfc:	00008067          	ret

80400c00 <cons_putc>:
80400c00:	fe010113          	addi	sp,sp,-32
80400c04:	00112e23          	sw	ra,28(sp)
80400c08:	100027f3          	csrr	a5,sstatus
80400c0c:	0027f793          	andi	a5,a5,2
80400c10:	00000713          	li	a4,0
80400c14:	06079063          	bnez	a5,80400c74 <cons_putc+0x74>
80400c18:	00800793          	li	a5,8
80400c1c:	02f50263          	beq	a0,a5,80400c40 <cons_putc+0x40>
80400c20:	00000593          	li	a1,0
80400c24:	00000613          	li	a2,0
80400c28:	00100893          	li	a7,1
80400c2c:	00000073          	ecall
80400c30:	02071c63          	bnez	a4,80400c68 <cons_putc+0x68>
80400c34:	01c12083          	lw	ra,28(sp)
80400c38:	02010113          	addi	sp,sp,32
80400c3c:	00008067          	ret
80400c40:	00800513          	li	a0,8
80400c44:	00000593          	li	a1,0
80400c48:	00000613          	li	a2,0
80400c4c:	00100893          	li	a7,1
80400c50:	00000073          	ecall
80400c54:	02000513          	li	a0,32
80400c58:	00000073          	ecall
80400c5c:	00800513          	li	a0,8
80400c60:	00000073          	ecall
80400c64:	fc0708e3          	beqz	a4,80400c34 <cons_putc+0x34>
80400c68:	01c12083          	lw	ra,28(sp)
80400c6c:	02010113          	addi	sp,sp,32
80400c70:	1000006f          	j	80400d70 <intr_enable>
80400c74:	00a12623          	sw	a0,12(sp)
80400c78:	100000ef          	jal	ra,80400d78 <intr_disable>
80400c7c:	00c12503          	lw	a0,12(sp)
80400c80:	00100713          	li	a4,1
80400c84:	f95ff06f          	j	80400c18 <cons_putc+0x18>

80400c88 <cons_getc>:
80400c88:	fe010113          	addi	sp,sp,-32
80400c8c:	00112e23          	sw	ra,28(sp)
80400c90:	100027f3          	csrr	a5,sstatus
80400c94:	0027f793          	andi	a5,a5,2
80400c98:	00000813          	li	a6,0
80400c9c:	0a079e63          	bnez	a5,80400d58 <cons_getc+0xd0>
80400ca0:	00097717          	auipc	a4,0x97
80400ca4:	8a070713          	addi	a4,a4,-1888 # 80497540 <cons>
80400ca8:	07f00793          	li	a5,127
80400cac:	20000313          	li	t1,512
80400cb0:	0080006f          	j	80400cb8 <cons_getc+0x30>
80400cb4:	0a051863          	bnez	a0,80400d64 <cons_getc+0xdc>
80400cb8:	00000513          	li	a0,0
80400cbc:	00000593          	li	a1,0
80400cc0:	00000613          	li	a2,0
80400cc4:	00200893          	li	a7,2
80400cc8:	00000073          	ecall
80400ccc:	02054863          	bltz	a0,80400cfc <cons_getc+0x74>
80400cd0:	fef512e3          	bne	a0,a5,80400cb4 <cons_getc+0x2c>
80400cd4:	00800513          	li	a0,8
80400cd8:	20472683          	lw	a3,516(a4)
80400cdc:	00168613          	addi	a2,a3,1
80400ce0:	00d706b3          	add	a3,a4,a3
80400ce4:	20c72223          	sw	a2,516(a4)
80400ce8:	00a68023          	sb	a0,0(a3)
80400cec:	fc6616e3          	bne	a2,t1,80400cb8 <cons_getc+0x30>
80400cf0:	00097697          	auipc	a3,0x97
80400cf4:	a406aa23          	sw	zero,-1452(a3) # 80497744 <cons+0x204>
80400cf8:	fc1ff06f          	j	80400cb8 <cons_getc+0x30>
80400cfc:	20072783          	lw	a5,512(a4)
80400d00:	20472683          	lw	a3,516(a4)
80400d04:	00000513          	li	a0,0
80400d08:	00d78e63          	beq	a5,a3,80400d24 <cons_getc+0x9c>
80400d0c:	00178693          	addi	a3,a5,1
80400d10:	20d72023          	sw	a3,512(a4)
80400d14:	00f707b3          	add	a5,a4,a5
80400d18:	20000713          	li	a4,512
80400d1c:	0007c503          	lbu	a0,0(a5)
80400d20:	00e68a63          	beq	a3,a4,80400d34 <cons_getc+0xac>
80400d24:	00081e63          	bnez	a6,80400d40 <cons_getc+0xb8>
80400d28:	01c12083          	lw	ra,28(sp)
80400d2c:	02010113          	addi	sp,sp,32
80400d30:	00008067          	ret
80400d34:	00097797          	auipc	a5,0x97
80400d38:	a007a623          	sw	zero,-1524(a5) # 80497740 <cons+0x200>
80400d3c:	fe0806e3          	beqz	a6,80400d28 <cons_getc+0xa0>
80400d40:	00a12623          	sw	a0,12(sp)
80400d44:	02c000ef          	jal	ra,80400d70 <intr_enable>
80400d48:	01c12083          	lw	ra,28(sp)
80400d4c:	00c12503          	lw	a0,12(sp)
80400d50:	02010113          	addi	sp,sp,32
80400d54:	00008067          	ret
80400d58:	020000ef          	jal	ra,80400d78 <intr_disable>
80400d5c:	00100813          	li	a6,1
80400d60:	f41ff06f          	j	80400ca0 <cons_getc+0x18>
80400d64:	0ff57513          	andi	a0,a0,255
80400d68:	f71ff06f          	j	80400cd8 <cons_getc+0x50>

80400d6c <pic_init>:
80400d6c:	00008067          	ret

80400d70 <intr_enable>:
80400d70:	100167f3          	csrrsi	a5,sstatus,2
80400d74:	00008067          	ret

80400d78 <intr_disable>:
80400d78:	100177f3          	csrrci	a5,sstatus,2
80400d7c:	00008067          	ret

80400d80 <idt_init>:
80400d80:	14005073          	csrwi	sscratch,0
80400d84:	00001797          	auipc	a5,0x1
80400d88:	89878793          	addi	a5,a5,-1896 # 8040161c <__alltraps>
80400d8c:	10579073          	csrw	stvec,a5
80400d90:	000407b7          	lui	a5,0x40
80400d94:	1007a7f3          	csrrs	a5,sstatus,a5
80400d98:	104167f3          	csrrsi	a5,sie,2
80400d9c:	00008067          	ret

80400da0 <print_regs>:
80400da0:	00052583          	lw	a1,0(a0)
80400da4:	ff010113          	addi	sp,sp,-16
80400da8:	00812423          	sw	s0,8(sp)
80400dac:	00050413          	mv	s0,a0
80400db0:	00010517          	auipc	a0,0x10
80400db4:	04c50513          	addi	a0,a0,76 # 80410dfc <commands+0x178>
80400db8:	00112623          	sw	ra,12(sp)
80400dbc:	b8cff0ef          	jal	ra,80400148 <cprintf>
80400dc0:	00442583          	lw	a1,4(s0)
80400dc4:	00010517          	auipc	a0,0x10
80400dc8:	04c50513          	addi	a0,a0,76 # 80410e10 <commands+0x18c>
80400dcc:	b7cff0ef          	jal	ra,80400148 <cprintf>
80400dd0:	00842583          	lw	a1,8(s0)
80400dd4:	00010517          	auipc	a0,0x10
80400dd8:	05050513          	addi	a0,a0,80 # 80410e24 <commands+0x1a0>
80400ddc:	b6cff0ef          	jal	ra,80400148 <cprintf>
80400de0:	00c42583          	lw	a1,12(s0)
80400de4:	00010517          	auipc	a0,0x10
80400de8:	05450513          	addi	a0,a0,84 # 80410e38 <commands+0x1b4>
80400dec:	b5cff0ef          	jal	ra,80400148 <cprintf>
80400df0:	01042583          	lw	a1,16(s0)
80400df4:	00010517          	auipc	a0,0x10
80400df8:	05850513          	addi	a0,a0,88 # 80410e4c <commands+0x1c8>
80400dfc:	b4cff0ef          	jal	ra,80400148 <cprintf>
80400e00:	01442583          	lw	a1,20(s0)
80400e04:	00010517          	auipc	a0,0x10
80400e08:	05c50513          	addi	a0,a0,92 # 80410e60 <commands+0x1dc>
80400e0c:	b3cff0ef          	jal	ra,80400148 <cprintf>
80400e10:	01842583          	lw	a1,24(s0)
80400e14:	00010517          	auipc	a0,0x10
80400e18:	06050513          	addi	a0,a0,96 # 80410e74 <commands+0x1f0>
80400e1c:	b2cff0ef          	jal	ra,80400148 <cprintf>
80400e20:	01c42583          	lw	a1,28(s0)
80400e24:	00010517          	auipc	a0,0x10
80400e28:	06450513          	addi	a0,a0,100 # 80410e88 <commands+0x204>
80400e2c:	b1cff0ef          	jal	ra,80400148 <cprintf>
80400e30:	02042583          	lw	a1,32(s0)
80400e34:	00010517          	auipc	a0,0x10
80400e38:	06850513          	addi	a0,a0,104 # 80410e9c <commands+0x218>
80400e3c:	b0cff0ef          	jal	ra,80400148 <cprintf>
80400e40:	02442583          	lw	a1,36(s0)
80400e44:	00010517          	auipc	a0,0x10
80400e48:	06c50513          	addi	a0,a0,108 # 80410eb0 <commands+0x22c>
80400e4c:	afcff0ef          	jal	ra,80400148 <cprintf>
80400e50:	02842583          	lw	a1,40(s0)
80400e54:	00010517          	auipc	a0,0x10
80400e58:	07050513          	addi	a0,a0,112 # 80410ec4 <commands+0x240>
80400e5c:	aecff0ef          	jal	ra,80400148 <cprintf>
80400e60:	02c42583          	lw	a1,44(s0)
80400e64:	00010517          	auipc	a0,0x10
80400e68:	07450513          	addi	a0,a0,116 # 80410ed8 <commands+0x254>
80400e6c:	adcff0ef          	jal	ra,80400148 <cprintf>
80400e70:	03042583          	lw	a1,48(s0)
80400e74:	00010517          	auipc	a0,0x10
80400e78:	07850513          	addi	a0,a0,120 # 80410eec <commands+0x268>
80400e7c:	accff0ef          	jal	ra,80400148 <cprintf>
80400e80:	03442583          	lw	a1,52(s0)
80400e84:	00010517          	auipc	a0,0x10
80400e88:	07c50513          	addi	a0,a0,124 # 80410f00 <commands+0x27c>
80400e8c:	abcff0ef          	jal	ra,80400148 <cprintf>
80400e90:	03842583          	lw	a1,56(s0)
80400e94:	00010517          	auipc	a0,0x10
80400e98:	08050513          	addi	a0,a0,128 # 80410f14 <commands+0x290>
80400e9c:	aacff0ef          	jal	ra,80400148 <cprintf>
80400ea0:	03c42583          	lw	a1,60(s0)
80400ea4:	00010517          	auipc	a0,0x10
80400ea8:	08450513          	addi	a0,a0,132 # 80410f28 <commands+0x2a4>
80400eac:	a9cff0ef          	jal	ra,80400148 <cprintf>
80400eb0:	04042583          	lw	a1,64(s0)
80400eb4:	00010517          	auipc	a0,0x10
80400eb8:	08850513          	addi	a0,a0,136 # 80410f3c <commands+0x2b8>
80400ebc:	a8cff0ef          	jal	ra,80400148 <cprintf>
80400ec0:	04442583          	lw	a1,68(s0)
80400ec4:	00010517          	auipc	a0,0x10
80400ec8:	08c50513          	addi	a0,a0,140 # 80410f50 <commands+0x2cc>
80400ecc:	a7cff0ef          	jal	ra,80400148 <cprintf>
80400ed0:	04842583          	lw	a1,72(s0)
80400ed4:	00010517          	auipc	a0,0x10
80400ed8:	09050513          	addi	a0,a0,144 # 80410f64 <commands+0x2e0>
80400edc:	a6cff0ef          	jal	ra,80400148 <cprintf>
80400ee0:	04c42583          	lw	a1,76(s0)
80400ee4:	00010517          	auipc	a0,0x10
80400ee8:	09450513          	addi	a0,a0,148 # 80410f78 <commands+0x2f4>
80400eec:	a5cff0ef          	jal	ra,80400148 <cprintf>
80400ef0:	05042583          	lw	a1,80(s0)
80400ef4:	00010517          	auipc	a0,0x10
80400ef8:	09850513          	addi	a0,a0,152 # 80410f8c <commands+0x308>
80400efc:	a4cff0ef          	jal	ra,80400148 <cprintf>
80400f00:	05442583          	lw	a1,84(s0)
80400f04:	00010517          	auipc	a0,0x10
80400f08:	09c50513          	addi	a0,a0,156 # 80410fa0 <commands+0x31c>
80400f0c:	a3cff0ef          	jal	ra,80400148 <cprintf>
80400f10:	05842583          	lw	a1,88(s0)
80400f14:	00010517          	auipc	a0,0x10
80400f18:	0a050513          	addi	a0,a0,160 # 80410fb4 <commands+0x330>
80400f1c:	a2cff0ef          	jal	ra,80400148 <cprintf>
80400f20:	05c42583          	lw	a1,92(s0)
80400f24:	00010517          	auipc	a0,0x10
80400f28:	0a450513          	addi	a0,a0,164 # 80410fc8 <commands+0x344>
80400f2c:	a1cff0ef          	jal	ra,80400148 <cprintf>
80400f30:	06042583          	lw	a1,96(s0)
80400f34:	00010517          	auipc	a0,0x10
80400f38:	0a850513          	addi	a0,a0,168 # 80410fdc <commands+0x358>
80400f3c:	a0cff0ef          	jal	ra,80400148 <cprintf>
80400f40:	06442583          	lw	a1,100(s0)
80400f44:	00010517          	auipc	a0,0x10
80400f48:	0ac50513          	addi	a0,a0,172 # 80410ff0 <commands+0x36c>
80400f4c:	9fcff0ef          	jal	ra,80400148 <cprintf>
80400f50:	06842583          	lw	a1,104(s0)
80400f54:	00010517          	auipc	a0,0x10
80400f58:	0b050513          	addi	a0,a0,176 # 80411004 <commands+0x380>
80400f5c:	9ecff0ef          	jal	ra,80400148 <cprintf>
80400f60:	06c42583          	lw	a1,108(s0)
80400f64:	00010517          	auipc	a0,0x10
80400f68:	0b450513          	addi	a0,a0,180 # 80411018 <commands+0x394>
80400f6c:	9dcff0ef          	jal	ra,80400148 <cprintf>
80400f70:	07042583          	lw	a1,112(s0)
80400f74:	00010517          	auipc	a0,0x10
80400f78:	0b850513          	addi	a0,a0,184 # 8041102c <commands+0x3a8>
80400f7c:	9ccff0ef          	jal	ra,80400148 <cprintf>
80400f80:	07442583          	lw	a1,116(s0)
80400f84:	00010517          	auipc	a0,0x10
80400f88:	0bc50513          	addi	a0,a0,188 # 80411040 <commands+0x3bc>
80400f8c:	9bcff0ef          	jal	ra,80400148 <cprintf>
80400f90:	07842583          	lw	a1,120(s0)
80400f94:	00010517          	auipc	a0,0x10
80400f98:	0c050513          	addi	a0,a0,192 # 80411054 <commands+0x3d0>
80400f9c:	9acff0ef          	jal	ra,80400148 <cprintf>
80400fa0:	07c42583          	lw	a1,124(s0)
80400fa4:	00812403          	lw	s0,8(sp)
80400fa8:	00c12083          	lw	ra,12(sp)
80400fac:	00010517          	auipc	a0,0x10
80400fb0:	0bc50513          	addi	a0,a0,188 # 80411068 <commands+0x3e4>
80400fb4:	01010113          	addi	sp,sp,16
80400fb8:	990ff06f          	j	80400148 <cprintf>

80400fbc <print_trapframe>:
80400fbc:	ff010113          	addi	sp,sp,-16
80400fc0:	00812423          	sw	s0,8(sp)
80400fc4:	00050593          	mv	a1,a0
80400fc8:	00050413          	mv	s0,a0
80400fcc:	00010517          	auipc	a0,0x10
80400fd0:	0b050513          	addi	a0,a0,176 # 8041107c <commands+0x3f8>
80400fd4:	00112623          	sw	ra,12(sp)
80400fd8:	970ff0ef          	jal	ra,80400148 <cprintf>
80400fdc:	00040513          	mv	a0,s0
80400fe0:	dc1ff0ef          	jal	ra,80400da0 <print_regs>
80400fe4:	08042583          	lw	a1,128(s0)
80400fe8:	00010517          	auipc	a0,0x10
80400fec:	0a850513          	addi	a0,a0,168 # 80411090 <commands+0x40c>
80400ff0:	958ff0ef          	jal	ra,80400148 <cprintf>
80400ff4:	08442583          	lw	a1,132(s0)
80400ff8:	00010517          	auipc	a0,0x10
80400ffc:	0ac50513          	addi	a0,a0,172 # 804110a4 <commands+0x420>
80401000:	948ff0ef          	jal	ra,80400148 <cprintf>
80401004:	08842583          	lw	a1,136(s0)
80401008:	00010517          	auipc	a0,0x10
8040100c:	0b050513          	addi	a0,a0,176 # 804110b8 <commands+0x434>
80401010:	938ff0ef          	jal	ra,80400148 <cprintf>
80401014:	08c42583          	lw	a1,140(s0)
80401018:	00812403          	lw	s0,8(sp)
8040101c:	00c12083          	lw	ra,12(sp)
80401020:	00010517          	auipc	a0,0x10
80401024:	0ac50513          	addi	a0,a0,172 # 804110cc <commands+0x448>
80401028:	01010113          	addi	sp,sp,16
8040102c:	91cff06f          	j	80400148 <cprintf>

80401030 <pgfault_handler>:
80401030:	ff010113          	addi	sp,sp,-16
80401034:	00912223          	sw	s1,4(sp)
80401038:	00099497          	auipc	s1,0x99
8040103c:	7d848493          	addi	s1,s1,2008 # 8049a810 <check_mm_struct>
80401040:	0004a783          	lw	a5,0(s1)
80401044:	00812423          	sw	s0,8(sp)
80401048:	00112623          	sw	ra,12(sp)
8040104c:	00050413          	mv	s0,a0
80401050:	06078863          	beqz	a5,804010c0 <pgfault_handler+0x90>
80401054:	08852583          	lw	a1,136(a0)
80401058:	00010517          	auipc	a0,0x10
8040105c:	08850513          	addi	a0,a0,136 # 804110e0 <commands+0x45c>
80401060:	8e8ff0ef          	jal	ra,80400148 <cprintf>
80401064:	08c42583          	lw	a1,140(s0)
80401068:	00d00793          	li	a5,13
8040106c:	08f58263          	beq	a1,a5,804010f0 <pgfault_handler+0xc0>
80401070:	00f00793          	li	a5,15
80401074:	08f58663          	beq	a1,a5,80401100 <pgfault_handler+0xd0>
80401078:	00010517          	auipc	a0,0x10
8040107c:	08c50513          	addi	a0,a0,140 # 80411104 <commands+0x480>
80401080:	8c8ff0ef          	jal	ra,80400148 <cprintf>
80401084:	0004a503          	lw	a0,0(s1)
80401088:	00099797          	auipc	a5,0x99
8040108c:	7c478793          	addi	a5,a5,1988 # 8049a84c <current>
80401090:	0007a703          	lw	a4,0(a5)
80401094:	02050a63          	beqz	a0,804010c8 <pgfault_handler+0x98>
80401098:	00099797          	auipc	a5,0x99
8040109c:	7b87a783          	lw	a5,1976(a5) # 8049a850 <idleproc>
804010a0:	06e79863          	bne	a5,a4,80401110 <pgfault_handler+0xe0>
804010a4:	08842603          	lw	a2,136(s0)
804010a8:	08c42583          	lw	a1,140(s0)
804010ac:	00812403          	lw	s0,8(sp)
804010b0:	00c12083          	lw	ra,12(sp)
804010b4:	00412483          	lw	s1,4(sp)
804010b8:	01010113          	addi	sp,sp,16
804010bc:	1780106f          	j	80402234 <do_pgfault>
804010c0:	00099797          	auipc	a5,0x99
804010c4:	78c78793          	addi	a5,a5,1932 # 8049a84c <current>
804010c8:	0007a783          	lw	a5,0(a5)
804010cc:	06078263          	beqz	a5,80401130 <pgfault_handler+0x100>
804010d0:	08842603          	lw	a2,136(s0)
804010d4:	08c42583          	lw	a1,140(s0)
804010d8:	00812403          	lw	s0,8(sp)
804010dc:	00c12083          	lw	ra,12(sp)
804010e0:	00412483          	lw	s1,4(sp)
804010e4:	0187a503          	lw	a0,24(a5)
804010e8:	01010113          	addi	sp,sp,16
804010ec:	1480106f          	j	80402234 <do_pgfault>
804010f0:	00010517          	auipc	a0,0x10
804010f4:	00c50513          	addi	a0,a0,12 # 804110fc <commands+0x478>
804010f8:	850ff0ef          	jal	ra,80400148 <cprintf>
804010fc:	f89ff06f          	j	80401084 <pgfault_handler+0x54>
80401100:	00010517          	auipc	a0,0x10
80401104:	00050513          	mv	a0,a0
80401108:	840ff0ef          	jal	ra,80400148 <cprintf>
8040110c:	f79ff06f          	j	80401084 <pgfault_handler+0x54>
80401110:	00010697          	auipc	a3,0x10
80401114:	ffc68693          	addi	a3,a3,-4 # 8041110c <commands+0x488>
80401118:	00010617          	auipc	a2,0x10
8040111c:	ba860613          	addi	a2,a2,-1112 # 80410cc0 <commands+0x3c>
80401120:	08700593          	li	a1,135
80401124:	00010517          	auipc	a0,0x10
80401128:	ffc50513          	addi	a0,a0,-4 # 80411120 <commands+0x49c>
8040112c:	9a0ff0ef          	jal	ra,804002cc <__panic>
80401130:	00040513          	mv	a0,s0
80401134:	e89ff0ef          	jal	ra,80400fbc <print_trapframe>
80401138:	08842583          	lw	a1,136(s0)
8040113c:	00010517          	auipc	a0,0x10
80401140:	fa450513          	addi	a0,a0,-92 # 804110e0 <commands+0x45c>
80401144:	804ff0ef          	jal	ra,80400148 <cprintf>
80401148:	08c42583          	lw	a1,140(s0)
8040114c:	00d00793          	li	a5,13
80401150:	02f58863          	beq	a1,a5,80401180 <pgfault_handler+0x150>
80401154:	00f00793          	li	a5,15
80401158:	02f58c63          	beq	a1,a5,80401190 <pgfault_handler+0x160>
8040115c:	00010517          	auipc	a0,0x10
80401160:	fa850513          	addi	a0,a0,-88 # 80411104 <commands+0x480>
80401164:	fe5fe0ef          	jal	ra,80400148 <cprintf>
80401168:	00010617          	auipc	a2,0x10
8040116c:	fcc60613          	addi	a2,a2,-52 # 80411134 <commands+0x4b0>
80401170:	08e00593          	li	a1,142
80401174:	00010517          	auipc	a0,0x10
80401178:	fac50513          	addi	a0,a0,-84 # 80411120 <commands+0x49c>
8040117c:	950ff0ef          	jal	ra,804002cc <__panic>
80401180:	00010517          	auipc	a0,0x10
80401184:	f7c50513          	addi	a0,a0,-132 # 804110fc <commands+0x478>
80401188:	fc1fe0ef          	jal	ra,80400148 <cprintf>
8040118c:	fddff06f          	j	80401168 <pgfault_handler+0x138>
80401190:	00010517          	auipc	a0,0x10
80401194:	f7050513          	addi	a0,a0,-144 # 80411100 <commands+0x47c>
80401198:	fb1fe0ef          	jal	ra,80400148 <cprintf>
8040119c:	fcdff06f          	j	80401168 <pgfault_handler+0x138>

804011a0 <interrupt_handler>:
804011a0:	08c52783          	lw	a5,140(a0)
804011a4:	00b00713          	li	a4,11
804011a8:	00179793          	slli	a5,a5,0x1
804011ac:	0017d793          	srli	a5,a5,0x1
804011b0:	10f76463          	bltu	a4,a5,804012b8 <interrupt_handler+0x118>
804011b4:	00010717          	auipc	a4,0x10
804011b8:	0a070713          	addi	a4,a4,160 # 80411254 <commands+0x5d0>
804011bc:	00279793          	slli	a5,a5,0x2
804011c0:	00e787b3          	add	a5,a5,a4
804011c4:	0007a783          	lw	a5,0(a5)
804011c8:	ff010113          	addi	sp,sp,-16
804011cc:	00112623          	sw	ra,12(sp)
804011d0:	00e787b3          	add	a5,a5,a4
804011d4:	00078067          	jr	a5
804011d8:	00c12083          	lw	ra,12(sp)
804011dc:	00010517          	auipc	a0,0x10
804011e0:	fcc50513          	addi	a0,a0,-52 # 804111a8 <commands+0x524>
804011e4:	01010113          	addi	sp,sp,16
804011e8:	f61fe06f          	j	80400148 <cprintf>
804011ec:	00c12083          	lw	ra,12(sp)
804011f0:	00010517          	auipc	a0,0x10
804011f4:	f9850513          	addi	a0,a0,-104 # 80411188 <commands+0x504>
804011f8:	01010113          	addi	sp,sp,16
804011fc:	f4dfe06f          	j	80400148 <cprintf>
80401200:	00010517          	auipc	a0,0x10
80401204:	f6850513          	addi	a0,a0,-152 # 80411168 <commands+0x4e4>
80401208:	f41fe0ef          	jal	ra,80400148 <cprintf>
8040120c:	975ff0ef          	jal	ra,80400b80 <serial_intr>
80401210:	a79ff0ef          	jal	ra,80400c88 <cons_getc>
80401214:	00c12083          	lw	ra,12(sp)
80401218:	01010113          	addi	sp,sp,16
8040121c:	6240b06f          	j	8040c840 <dev_stdin_write>
80401220:	00c12083          	lw	ra,12(sp)
80401224:	00010517          	auipc	a0,0x10
80401228:	fa050513          	addi	a0,a0,-96 # 804111c4 <commands+0x540>
8040122c:	01010113          	addi	sp,sp,16
80401230:	f19fe06f          	j	80400148 <cprintf>
80401234:	00c12083          	lw	ra,12(sp)
80401238:	00010517          	auipc	a0,0x10
8040123c:	00050513          	mv	a0,a0
80401240:	01010113          	addi	sp,sp,16
80401244:	f05fe06f          	j	80400148 <cprintf>
80401248:	00c12083          	lw	ra,12(sp)
8040124c:	00010517          	auipc	a0,0x10
80401250:	f0050513          	addi	a0,a0,-256 # 8041114c <commands+0x4c8>
80401254:	01010113          	addi	sp,sp,16
80401258:	ef1fe06f          	j	80400148 <cprintf>
8040125c:	899ff0ef          	jal	ra,80400af4 <clock_set_next_event>
80401260:	00099717          	auipc	a4,0x99
80401264:	5a070713          	addi	a4,a4,1440 # 8049a800 <ticks>
80401268:	00072783          	lw	a5,0(a4)
8040126c:	00178793          	addi	a5,a5,1
80401270:	00f72023          	sw	a5,0(a4)
80401274:	580090ef          	jal	ra,8040a7f4 <run_timer_list>
80401278:	f95ff06f          	j	8040120c <interrupt_handler+0x6c>
8040127c:	00c12083          	lw	ra,12(sp)
80401280:	00010517          	auipc	a0,0x10
80401284:	f5c50513          	addi	a0,a0,-164 # 804111dc <commands+0x558>
80401288:	01010113          	addi	sp,sp,16
8040128c:	ebdfe06f          	j	80400148 <cprintf>
80401290:	00c12083          	lw	ra,12(sp)
80401294:	00010517          	auipc	a0,0x10
80401298:	f6450513          	addi	a0,a0,-156 # 804111f8 <commands+0x574>
8040129c:	01010113          	addi	sp,sp,16
804012a0:	ea9fe06f          	j	80400148 <cprintf>
804012a4:	00c12083          	lw	ra,12(sp)
804012a8:	00010517          	auipc	a0,0x10
804012ac:	f7050513          	addi	a0,a0,-144 # 80411218 <commands+0x594>
804012b0:	01010113          	addi	sp,sp,16
804012b4:	e95fe06f          	j	80400148 <cprintf>
804012b8:	d05ff06f          	j	80400fbc <print_trapframe>

804012bc <exception_handler>:
804012bc:	08c52783          	lw	a5,140(a0)
804012c0:	ff010113          	addi	sp,sp,-16
804012c4:	00812423          	sw	s0,8(sp)
804012c8:	00112623          	sw	ra,12(sp)
804012cc:	00912223          	sw	s1,4(sp)
804012d0:	00f00713          	li	a4,15
804012d4:	00050413          	mv	s0,a0
804012d8:	16f76463          	bltu	a4,a5,80401440 <exception_handler+0x184>
804012dc:	00010717          	auipc	a4,0x10
804012e0:	19c70713          	addi	a4,a4,412 # 80411478 <commands+0x7f4>
804012e4:	00279793          	slli	a5,a5,0x2
804012e8:	00e787b3          	add	a5,a5,a4
804012ec:	0007a783          	lw	a5,0(a5)
804012f0:	00e787b3          	add	a5,a5,a4
804012f4:	00078067          	jr	a5
804012f8:	00010517          	auipc	a0,0x10
804012fc:	04c50513          	addi	a0,a0,76 # 80411344 <commands+0x6c0>
80401300:	e49fe0ef          	jal	ra,80400148 <cprintf>
80401304:	08442783          	lw	a5,132(s0)
80401308:	00c12083          	lw	ra,12(sp)
8040130c:	00412483          	lw	s1,4(sp)
80401310:	00478793          	addi	a5,a5,4
80401314:	08f42223          	sw	a5,132(s0)
80401318:	00812403          	lw	s0,8(sp)
8040131c:	01010113          	addi	sp,sp,16
80401320:	67d0906f          	j	8040b19c <syscall>
80401324:	00010517          	auipc	a0,0x10
80401328:	04050513          	addi	a0,a0,64 # 80411364 <commands+0x6e0>
8040132c:	00812403          	lw	s0,8(sp)
80401330:	00c12083          	lw	ra,12(sp)
80401334:	00412483          	lw	s1,4(sp)
80401338:	01010113          	addi	sp,sp,16
8040133c:	e0dfe06f          	j	80400148 <cprintf>
80401340:	00010517          	auipc	a0,0x10
80401344:	04450513          	addi	a0,a0,68 # 80411384 <commands+0x700>
80401348:	fe5ff06f          	j	8040132c <exception_handler+0x70>
8040134c:	00010517          	auipc	a0,0x10
80401350:	05850513          	addi	a0,a0,88 # 804113a4 <commands+0x720>
80401354:	fd9ff06f          	j	8040132c <exception_handler+0x70>
80401358:	00010517          	auipc	a0,0x10
8040135c:	06450513          	addi	a0,a0,100 # 804113bc <commands+0x738>
80401360:	de9fe0ef          	jal	ra,80400148 <cprintf>
80401364:	00040513          	mv	a0,s0
80401368:	cc9ff0ef          	jal	ra,80401030 <pgfault_handler>
8040136c:	00050493          	mv	s1,a0
80401370:	0e051463          	bnez	a0,80401458 <exception_handler+0x19c>
80401374:	00c12083          	lw	ra,12(sp)
80401378:	00812403          	lw	s0,8(sp)
8040137c:	00412483          	lw	s1,4(sp)
80401380:	01010113          	addi	sp,sp,16
80401384:	00008067          	ret
80401388:	00010517          	auipc	a0,0x10
8040138c:	0d850513          	addi	a0,a0,216 # 80411460 <commands+0x7dc>
80401390:	db9fe0ef          	jal	ra,80400148 <cprintf>
80401394:	00040513          	mv	a0,s0
80401398:	c99ff0ef          	jal	ra,80401030 <pgfault_handler>
8040139c:	00050493          	mv	s1,a0
804013a0:	fc050ae3          	beqz	a0,80401374 <exception_handler+0xb8>
804013a4:	00040513          	mv	a0,s0
804013a8:	c15ff0ef          	jal	ra,80400fbc <print_trapframe>
804013ac:	00099797          	auipc	a5,0x99
804013b0:	4a07a783          	lw	a5,1184(a5) # 8049a84c <current>
804013b4:	12078863          	beqz	a5,804014e4 <exception_handler+0x228>
804013b8:	08042783          	lw	a5,128(s0)
804013bc:	1007f793          	andi	a5,a5,256
804013c0:	0c078a63          	beqz	a5,80401494 <exception_handler+0x1d8>
804013c4:	00048693          	mv	a3,s1
804013c8:	00010617          	auipc	a2,0x10
804013cc:	02860613          	addi	a2,a2,40 # 804113f0 <commands+0x76c>
804013d0:	11800593          	li	a1,280
804013d4:	00010517          	auipc	a0,0x10
804013d8:	d4c50513          	addi	a0,a0,-692 # 80411120 <commands+0x49c>
804013dc:	ef1fe0ef          	jal	ra,804002cc <__panic>
804013e0:	00010517          	auipc	a0,0x10
804013e4:	ea450513          	addi	a0,a0,-348 # 80411284 <commands+0x600>
804013e8:	f45ff06f          	j	8040132c <exception_handler+0x70>
804013ec:	00010517          	auipc	a0,0x10
804013f0:	eb850513          	addi	a0,a0,-328 # 804112a4 <commands+0x620>
804013f4:	f39ff06f          	j	8040132c <exception_handler+0x70>
804013f8:	00010517          	auipc	a0,0x10
804013fc:	ec850513          	addi	a0,a0,-312 # 804112c0 <commands+0x63c>
80401400:	f2dff06f          	j	8040132c <exception_handler+0x70>
80401404:	00010517          	auipc	a0,0x10
80401408:	ed450513          	addi	a0,a0,-300 # 804112d8 <commands+0x654>
8040140c:	f21ff06f          	j	8040132c <exception_handler+0x70>
80401410:	00010517          	auipc	a0,0x10
80401414:	ed450513          	addi	a0,a0,-300 # 804112e4 <commands+0x660>
80401418:	f15ff06f          	j	8040132c <exception_handler+0x70>
8040141c:	00010517          	auipc	a0,0x10
80401420:	ee450513          	addi	a0,a0,-284 # 80411300 <commands+0x67c>
80401424:	f09ff06f          	j	8040132c <exception_handler+0x70>
80401428:	00010517          	auipc	a0,0x10
8040142c:	eec50513          	addi	a0,a0,-276 # 80411314 <commands+0x690>
80401430:	efdff06f          	j	8040132c <exception_handler+0x70>
80401434:	00010517          	auipc	a0,0x10
80401438:	ef850513          	addi	a0,a0,-264 # 8041132c <commands+0x6a8>
8040143c:	ef1ff06f          	j	8040132c <exception_handler+0x70>
80401440:	00040513          	mv	a0,s0
80401444:	00812403          	lw	s0,8(sp)
80401448:	00c12083          	lw	ra,12(sp)
8040144c:	00412483          	lw	s1,4(sp)
80401450:	01010113          	addi	sp,sp,16
80401454:	b69ff06f          	j	80400fbc <print_trapframe>
80401458:	00040513          	mv	a0,s0
8040145c:	b61ff0ef          	jal	ra,80400fbc <print_trapframe>
80401460:	00099797          	auipc	a5,0x99
80401464:	3ec7a783          	lw	a5,1004(a5) # 8049a84c <current>
80401468:	08078c63          	beqz	a5,80401500 <exception_handler+0x244>
8040146c:	08042783          	lw	a5,128(s0)
80401470:	1007f793          	andi	a5,a5,256
80401474:	04078463          	beqz	a5,804014bc <exception_handler+0x200>
80401478:	00048693          	mv	a3,s1
8040147c:	00010617          	auipc	a2,0x10
80401480:	f7460613          	addi	a2,a2,-140 # 804113f0 <commands+0x76c>
80401484:	10700593          	li	a1,263
80401488:	00010517          	auipc	a0,0x10
8040148c:	c9850513          	addi	a0,a0,-872 # 80411120 <commands+0x49c>
80401490:	e3dfe0ef          	jal	ra,804002cc <__panic>
80401494:	00010517          	auipc	a0,0x10
80401498:	f8c50513          	addi	a0,a0,-116 # 80411420 <commands+0x79c>
8040149c:	cadfe0ef          	jal	ra,80400148 <cprintf>
804014a0:	00048693          	mv	a3,s1
804014a4:	00010617          	auipc	a2,0x10
804014a8:	f9060613          	addi	a2,a2,-112 # 80411434 <commands+0x7b0>
804014ac:	11c00593          	li	a1,284
804014b0:	00010517          	auipc	a0,0x10
804014b4:	c7050513          	addi	a0,a0,-912 # 80411120 <commands+0x49c>
804014b8:	e15fe0ef          	jal	ra,804002cc <__panic>
804014bc:	00010517          	auipc	a0,0x10
804014c0:	f6450513          	addi	a0,a0,-156 # 80411420 <commands+0x79c>
804014c4:	c85fe0ef          	jal	ra,80400148 <cprintf>
804014c8:	00048693          	mv	a3,s1
804014cc:	00010617          	auipc	a2,0x10
804014d0:	f6860613          	addi	a2,a2,-152 # 80411434 <commands+0x7b0>
804014d4:	10b00593          	li	a1,267
804014d8:	00010517          	auipc	a0,0x10
804014dc:	c4850513          	addi	a0,a0,-952 # 80411120 <commands+0x49c>
804014e0:	dedfe0ef          	jal	ra,804002cc <__panic>
804014e4:	00048693          	mv	a3,s1
804014e8:	00010617          	auipc	a2,0x10
804014ec:	ee860613          	addi	a2,a2,-280 # 804113d0 <commands+0x74c>
804014f0:	11500593          	li	a1,277
804014f4:	00010517          	auipc	a0,0x10
804014f8:	c2c50513          	addi	a0,a0,-980 # 80411120 <commands+0x49c>
804014fc:	dd1fe0ef          	jal	ra,804002cc <__panic>
80401500:	00048693          	mv	a3,s1
80401504:	00010617          	auipc	a2,0x10
80401508:	ecc60613          	addi	a2,a2,-308 # 804113d0 <commands+0x74c>
8040150c:	10400593          	li	a1,260
80401510:	00010517          	auipc	a0,0x10
80401514:	c1050513          	addi	a0,a0,-1008 # 80411120 <commands+0x49c>
80401518:	db5fe0ef          	jal	ra,804002cc <__panic>

8040151c <trap>:
8040151c:	ff010113          	addi	sp,sp,-16
80401520:	00112623          	sw	ra,12(sp)
80401524:	00812423          	sw	s0,8(sp)
80401528:	00912223          	sw	s1,4(sp)
8040152c:	01212023          	sw	s2,0(sp)
80401530:	0c050663          	beqz	a0,804015fc <trap+0xe0>
80401534:	00099417          	auipc	s0,0x99
80401538:	31840413          	addi	s0,s0,792 # 8049a84c <current>
8040153c:	00042703          	lw	a4,0(s0)
80401540:	08c52683          	lw	a3,140(a0)
80401544:	04070e63          	beqz	a4,804015a0 <trap+0x84>
80401548:	08052483          	lw	s1,128(a0)
8040154c:	05472903          	lw	s2,84(a4)
80401550:	04a72a23          	sw	a0,84(a4)
80401554:	1004f493          	andi	s1,s1,256
80401558:	0406c063          	bltz	a3,80401598 <trap+0x7c>
8040155c:	d61ff0ef          	jal	ra,804012bc <exception_handler>
80401560:	00042783          	lw	a5,0(s0)
80401564:	0527aa23          	sw	s2,84(a5)
80401568:	00049c63          	bnez	s1,80401580 <trap+0x64>
8040156c:	05c7a703          	lw	a4,92(a5)
80401570:	00177713          	andi	a4,a4,1
80401574:	06071c63          	bnez	a4,804015ec <trap+0xd0>
80401578:	0107a783          	lw	a5,16(a5)
8040157c:	04079c63          	bnez	a5,804015d4 <trap+0xb8>
80401580:	00c12083          	lw	ra,12(sp)
80401584:	00812403          	lw	s0,8(sp)
80401588:	00412483          	lw	s1,4(sp)
8040158c:	00012903          	lw	s2,0(sp)
80401590:	01010113          	addi	sp,sp,16
80401594:	00008067          	ret
80401598:	c09ff0ef          	jal	ra,804011a0 <interrupt_handler>
8040159c:	fc5ff06f          	j	80401560 <trap+0x44>
804015a0:	0006ce63          	bltz	a3,804015bc <trap+0xa0>
804015a4:	00812403          	lw	s0,8(sp)
804015a8:	00c12083          	lw	ra,12(sp)
804015ac:	00412483          	lw	s1,4(sp)
804015b0:	00012903          	lw	s2,0(sp)
804015b4:	01010113          	addi	sp,sp,16
804015b8:	d05ff06f          	j	804012bc <exception_handler>
804015bc:	00812403          	lw	s0,8(sp)
804015c0:	00c12083          	lw	ra,12(sp)
804015c4:	00412483          	lw	s1,4(sp)
804015c8:	00012903          	lw	s2,0(sp)
804015cc:	01010113          	addi	sp,sp,16
804015d0:	bd1ff06f          	j	804011a0 <interrupt_handler>
804015d4:	00812403          	lw	s0,8(sp)
804015d8:	00c12083          	lw	ra,12(sp)
804015dc:	00412483          	lw	s1,4(sp)
804015e0:	00012903          	lw	s2,0(sp)
804015e4:	01010113          	addi	sp,sp,16
804015e8:	7150806f          	j	8040a4fc <schedule>
804015ec:	ff700513          	li	a0,-9
804015f0:	151070ef          	jal	ra,80408f40 <do_exit>
804015f4:	00042783          	lw	a5,0(s0)
804015f8:	f81ff06f          	j	80401578 <trap+0x5c>
804015fc:	00010697          	auipc	a3,0x10
80401600:	ebc68693          	addi	a3,a3,-324 # 804114b8 <commands+0x834>
80401604:	0000f617          	auipc	a2,0xf
80401608:	6bc60613          	addi	a2,a2,1724 # 80410cc0 <commands+0x3c>
8040160c:	13800593          	li	a1,312
80401610:	00010517          	auipc	a0,0x10
80401614:	b1050513          	addi	a0,a0,-1264 # 80411120 <commands+0x49c>
80401618:	cb5fe0ef          	jal	ra,804002cc <__panic>

8040161c <__alltraps>:
8040161c:	14011173          	csrrw	sp,sscratch,sp
80401620:	00011463          	bnez	sp,80401628 <__alltraps+0xc>
80401624:	14002173          	csrr	sp,sscratch
80401628:	f7010113          	addi	sp,sp,-144
8040162c:	00012023          	sw	zero,0(sp)
80401630:	00112223          	sw	ra,4(sp)
80401634:	00312623          	sw	gp,12(sp)
80401638:	00412823          	sw	tp,16(sp)
8040163c:	00512a23          	sw	t0,20(sp)
80401640:	00612c23          	sw	t1,24(sp)
80401644:	00712e23          	sw	t2,28(sp)
80401648:	02812023          	sw	s0,32(sp)
8040164c:	02912223          	sw	s1,36(sp)
80401650:	02a12423          	sw	a0,40(sp)
80401654:	02b12623          	sw	a1,44(sp)
80401658:	02c12823          	sw	a2,48(sp)
8040165c:	02d12a23          	sw	a3,52(sp)
80401660:	02e12c23          	sw	a4,56(sp)
80401664:	02f12e23          	sw	a5,60(sp)
80401668:	05012023          	sw	a6,64(sp)
8040166c:	05112223          	sw	a7,68(sp)
80401670:	05212423          	sw	s2,72(sp)
80401674:	05312623          	sw	s3,76(sp)
80401678:	05412823          	sw	s4,80(sp)
8040167c:	05512a23          	sw	s5,84(sp)
80401680:	05612c23          	sw	s6,88(sp)
80401684:	05712e23          	sw	s7,92(sp)
80401688:	07812023          	sw	s8,96(sp)
8040168c:	07912223          	sw	s9,100(sp)
80401690:	07a12423          	sw	s10,104(sp)
80401694:	07b12623          	sw	s11,108(sp)
80401698:	07c12823          	sw	t3,112(sp)
8040169c:	07d12a23          	sw	t4,116(sp)
804016a0:	07e12c23          	sw	t5,120(sp)
804016a4:	07f12e23          	sw	t6,124(sp)
804016a8:	14001473          	csrrw	s0,sscratch,zero
804016ac:	100024f3          	csrr	s1,sstatus
804016b0:	14102973          	csrr	s2,sepc
804016b4:	143029f3          	csrr	s3,stval
804016b8:	14202a73          	csrr	s4,scause
804016bc:	00812423          	sw	s0,8(sp)
804016c0:	08912023          	sw	s1,128(sp)
804016c4:	09212223          	sw	s2,132(sp)
804016c8:	09312423          	sw	s3,136(sp)
804016cc:	09412623          	sw	s4,140(sp)
804016d0:	00010513          	mv	a0,sp
804016d4:	e49ff0ef          	jal	ra,8040151c <trap>

804016d8 <__trapret>:
804016d8:	08012483          	lw	s1,128(sp)
804016dc:	08412903          	lw	s2,132(sp)
804016e0:	1004f413          	andi	s0,s1,256
804016e4:	00041663          	bnez	s0,804016f0 <__trapret+0x18>
804016e8:	09010413          	addi	s0,sp,144
804016ec:	14041073          	csrw	sscratch,s0
804016f0:	10049073          	csrw	sstatus,s1
804016f4:	14191073          	csrw	sepc,s2
804016f8:	00412083          	lw	ra,4(sp)
804016fc:	00c12183          	lw	gp,12(sp)
80401700:	01012203          	lw	tp,16(sp)
80401704:	01412283          	lw	t0,20(sp)
80401708:	01812303          	lw	t1,24(sp)
8040170c:	01c12383          	lw	t2,28(sp)
80401710:	02012403          	lw	s0,32(sp)
80401714:	02412483          	lw	s1,36(sp)
80401718:	02812503          	lw	a0,40(sp)
8040171c:	02c12583          	lw	a1,44(sp)
80401720:	03012603          	lw	a2,48(sp)
80401724:	03412683          	lw	a3,52(sp)
80401728:	03812703          	lw	a4,56(sp)
8040172c:	03c12783          	lw	a5,60(sp)
80401730:	04012803          	lw	a6,64(sp)
80401734:	04412883          	lw	a7,68(sp)
80401738:	04812903          	lw	s2,72(sp)
8040173c:	04c12983          	lw	s3,76(sp)
80401740:	05012a03          	lw	s4,80(sp)
80401744:	05412a83          	lw	s5,84(sp)
80401748:	05812b03          	lw	s6,88(sp)
8040174c:	05c12b83          	lw	s7,92(sp)
80401750:	06012c03          	lw	s8,96(sp)
80401754:	06412c83          	lw	s9,100(sp)
80401758:	06812d03          	lw	s10,104(sp)
8040175c:	06c12d83          	lw	s11,108(sp)
80401760:	07012e03          	lw	t3,112(sp)
80401764:	07412e83          	lw	t4,116(sp)
80401768:	07812f03          	lw	t5,120(sp)
8040176c:	07c12f83          	lw	t6,124(sp)
80401770:	00812103          	lw	sp,8(sp)
80401774:	10200073          	sret

80401778 <forkrets>:
80401778:	00050113          	mv	sp,a0
8040177c:	f5dff06f          	j	804016d8 <__trapret>

80401780 <check_vma_overlap.part.0>:
80401780:	ff010113          	addi	sp,sp,-16
80401784:	00010697          	auipc	a3,0x10
80401788:	d3c68693          	addi	a3,a3,-708 # 804114c0 <commands+0x83c>
8040178c:	0000f617          	auipc	a2,0xf
80401790:	53460613          	addi	a2,a2,1332 # 80410cc0 <commands+0x3c>
80401794:	06d00593          	li	a1,109
80401798:	00010517          	auipc	a0,0x10
8040179c:	d4850513          	addi	a0,a0,-696 # 804114e0 <commands+0x85c>
804017a0:	00112623          	sw	ra,12(sp)
804017a4:	b29fe0ef          	jal	ra,804002cc <__panic>

804017a8 <mm_create>:
804017a8:	ff010113          	addi	sp,sp,-16
804017ac:	02c00513          	li	a0,44
804017b0:	00812423          	sw	s0,8(sp)
804017b4:	00112623          	sw	ra,12(sp)
804017b8:	660010ef          	jal	ra,80402e18 <kmalloc>
804017bc:	00050413          	mv	s0,a0
804017c0:	02050c63          	beqz	a0,804017f8 <mm_create+0x50>
804017c4:	00a42223          	sw	a0,4(s0)
804017c8:	00a42023          	sw	a0,0(s0)
804017cc:	00052423          	sw	zero,8(a0)
804017d0:	00052623          	sw	zero,12(a0)
804017d4:	00052823          	sw	zero,16(a0)
804017d8:	00099797          	auipc	a5,0x99
804017dc:	0547a783          	lw	a5,84(a5) # 8049a82c <swap_init_ok>
804017e0:	02079663          	bnez	a5,8040180c <mm_create+0x64>
804017e4:	00052a23          	sw	zero,20(a0)
804017e8:	00042c23          	sw	zero,24(s0)
804017ec:	00100593          	li	a1,1
804017f0:	01c40513          	addi	a0,s0,28
804017f4:	24c050ef          	jal	ra,80406a40 <sem_init>
804017f8:	00c12083          	lw	ra,12(sp)
804017fc:	00040513          	mv	a0,s0
80401800:	00812403          	lw	s0,8(sp)
80401804:	01010113          	addi	sp,sp,16
80401808:	00008067          	ret
8040180c:	01c020ef          	jal	ra,80403828 <swap_init_mm>
80401810:	fd9ff06f          	j	804017e8 <mm_create+0x40>

80401814 <vma_create>:
80401814:	ff010113          	addi	sp,sp,-16
80401818:	01212023          	sw	s2,0(sp)
8040181c:	00050913          	mv	s2,a0
80401820:	01800513          	li	a0,24
80401824:	00812423          	sw	s0,8(sp)
80401828:	00912223          	sw	s1,4(sp)
8040182c:	00112623          	sw	ra,12(sp)
80401830:	00058493          	mv	s1,a1
80401834:	00060413          	mv	s0,a2
80401838:	5e0010ef          	jal	ra,80402e18 <kmalloc>
8040183c:	00050863          	beqz	a0,8040184c <vma_create+0x38>
80401840:	01252223          	sw	s2,4(a0)
80401844:	00952423          	sw	s1,8(a0)
80401848:	00852623          	sw	s0,12(a0)
8040184c:	00c12083          	lw	ra,12(sp)
80401850:	00812403          	lw	s0,8(sp)
80401854:	00412483          	lw	s1,4(sp)
80401858:	00012903          	lw	s2,0(sp)
8040185c:	01010113          	addi	sp,sp,16
80401860:	00008067          	ret

80401864 <find_vma>:
80401864:	00050693          	mv	a3,a0
80401868:	02050a63          	beqz	a0,8040189c <find_vma+0x38>
8040186c:	00852503          	lw	a0,8(a0)
80401870:	00050663          	beqz	a0,8040187c <find_vma+0x18>
80401874:	00452783          	lw	a5,4(a0)
80401878:	02f5f663          	bgeu	a1,a5,804018a4 <find_vma+0x40>
8040187c:	0046a783          	lw	a5,4(a3)
80401880:	00f68e63          	beq	a3,a5,8040189c <find_vma+0x38>
80401884:	ff47a703          	lw	a4,-12(a5)
80401888:	00e5e663          	bltu	a1,a4,80401894 <find_vma+0x30>
8040188c:	ff87a703          	lw	a4,-8(a5)
80401890:	02e5e263          	bltu	a1,a4,804018b4 <find_vma+0x50>
80401894:	0047a783          	lw	a5,4(a5)
80401898:	fef696e3          	bne	a3,a5,80401884 <find_vma+0x20>
8040189c:	00000513          	li	a0,0
804018a0:	00008067          	ret
804018a4:	00852783          	lw	a5,8(a0)
804018a8:	fcf5fae3          	bgeu	a1,a5,8040187c <find_vma+0x18>
804018ac:	00a6a423          	sw	a0,8(a3)
804018b0:	00008067          	ret
804018b4:	ff078513          	addi	a0,a5,-16
804018b8:	00a6a423          	sw	a0,8(a3)
804018bc:	00008067          	ret

804018c0 <insert_vma_struct>:
804018c0:	0045a603          	lw	a2,4(a1)
804018c4:	0085a803          	lw	a6,8(a1)
804018c8:	ff010113          	addi	sp,sp,-16
804018cc:	00112623          	sw	ra,12(sp)
804018d0:	00050793          	mv	a5,a0
804018d4:	01066863          	bltu	a2,a6,804018e4 <insert_vma_struct+0x24>
804018d8:	07c0006f          	j	80401954 <insert_vma_struct+0x94>
804018dc:	ff47a703          	lw	a4,-12(a5)
804018e0:	06e66463          	bltu	a2,a4,80401948 <insert_vma_struct+0x88>
804018e4:	00078693          	mv	a3,a5
804018e8:	0047a783          	lw	a5,4(a5)
804018ec:	fef518e3          	bne	a0,a5,804018dc <insert_vma_struct+0x1c>
804018f0:	02a68463          	beq	a3,a0,80401918 <insert_vma_struct+0x58>
804018f4:	ff86a703          	lw	a4,-8(a3)
804018f8:	ff46a883          	lw	a7,-12(a3)
804018fc:	08e8fc63          	bgeu	a7,a4,80401994 <insert_vma_struct+0xd4>
80401900:	06e66a63          	bltu	a2,a4,80401974 <insert_vma_struct+0xb4>
80401904:	00f50a63          	beq	a0,a5,80401918 <insert_vma_struct+0x58>
80401908:	ff47a703          	lw	a4,-12(a5)
8040190c:	07076463          	bltu	a4,a6,80401974 <insert_vma_struct+0xb4>
80401910:	ff87a603          	lw	a2,-8(a5)
80401914:	02c77e63          	bgeu	a4,a2,80401950 <insert_vma_struct+0x90>
80401918:	01052703          	lw	a4,16(a0)
8040191c:	00a5a023          	sw	a0,0(a1)
80401920:	01058613          	addi	a2,a1,16
80401924:	00c7a023          	sw	a2,0(a5)
80401928:	00c6a223          	sw	a2,4(a3)
8040192c:	00c12083          	lw	ra,12(sp)
80401930:	00f5aa23          	sw	a5,20(a1)
80401934:	00d5a823          	sw	a3,16(a1)
80401938:	00170793          	addi	a5,a4,1
8040193c:	00f52823          	sw	a5,16(a0)
80401940:	01010113          	addi	sp,sp,16
80401944:	00008067          	ret
80401948:	faa696e3          	bne	a3,a0,804018f4 <insert_vma_struct+0x34>
8040194c:	fc1ff06f          	j	8040190c <insert_vma_struct+0x4c>
80401950:	e31ff0ef          	jal	ra,80401780 <check_vma_overlap.part.0>
80401954:	00010697          	auipc	a3,0x10
80401958:	b9c68693          	addi	a3,a3,-1124 # 804114f0 <commands+0x86c>
8040195c:	0000f617          	auipc	a2,0xf
80401960:	36460613          	addi	a2,a2,868 # 80410cc0 <commands+0x3c>
80401964:	07200593          	li	a1,114
80401968:	00010517          	auipc	a0,0x10
8040196c:	b7850513          	addi	a0,a0,-1160 # 804114e0 <commands+0x85c>
80401970:	95dfe0ef          	jal	ra,804002cc <__panic>
80401974:	00010697          	auipc	a3,0x10
80401978:	bb868693          	addi	a3,a3,-1096 # 8041152c <commands+0x8a8>
8040197c:	0000f617          	auipc	a2,0xf
80401980:	34460613          	addi	a2,a2,836 # 80410cc0 <commands+0x3c>
80401984:	06c00593          	li	a1,108
80401988:	00010517          	auipc	a0,0x10
8040198c:	b5850513          	addi	a0,a0,-1192 # 804114e0 <commands+0x85c>
80401990:	93dfe0ef          	jal	ra,804002cc <__panic>
80401994:	00010697          	auipc	a3,0x10
80401998:	b7868693          	addi	a3,a3,-1160 # 8041150c <commands+0x888>
8040199c:	0000f617          	auipc	a2,0xf
804019a0:	32460613          	addi	a2,a2,804 # 80410cc0 <commands+0x3c>
804019a4:	06b00593          	li	a1,107
804019a8:	00010517          	auipc	a0,0x10
804019ac:	b3850513          	addi	a0,a0,-1224 # 804114e0 <commands+0x85c>
804019b0:	91dfe0ef          	jal	ra,804002cc <__panic>

804019b4 <mm_destroy>:
804019b4:	01852783          	lw	a5,24(a0)
804019b8:	ff010113          	addi	sp,sp,-16
804019bc:	00112623          	sw	ra,12(sp)
804019c0:	00812423          	sw	s0,8(sp)
804019c4:	04079263          	bnez	a5,80401a08 <mm_destroy+0x54>
804019c8:	00050413          	mv	s0,a0
804019cc:	00452503          	lw	a0,4(a0)
804019d0:	02a40263          	beq	s0,a0,804019f4 <mm_destroy+0x40>
804019d4:	00052703          	lw	a4,0(a0)
804019d8:	00452783          	lw	a5,4(a0)
804019dc:	ff050513          	addi	a0,a0,-16
804019e0:	00f72223          	sw	a5,4(a4)
804019e4:	00e7a023          	sw	a4,0(a5)
804019e8:	54c010ef          	jal	ra,80402f34 <kfree>
804019ec:	00442503          	lw	a0,4(s0)
804019f0:	fea412e3          	bne	s0,a0,804019d4 <mm_destroy+0x20>
804019f4:	00040513          	mv	a0,s0
804019f8:	00812403          	lw	s0,8(sp)
804019fc:	00c12083          	lw	ra,12(sp)
80401a00:	01010113          	addi	sp,sp,16
80401a04:	5300106f          	j	80402f34 <kfree>
80401a08:	00010697          	auipc	a3,0x10
80401a0c:	b4468693          	addi	a3,a3,-1212 # 8041154c <commands+0x8c8>
80401a10:	0000f617          	auipc	a2,0xf
80401a14:	2b060613          	addi	a2,a2,688 # 80410cc0 <commands+0x3c>
80401a18:	09100593          	li	a1,145
80401a1c:	00010517          	auipc	a0,0x10
80401a20:	ac450513          	addi	a0,a0,-1340 # 804114e0 <commands+0x85c>
80401a24:	8a9fe0ef          	jal	ra,804002cc <__panic>

80401a28 <mm_map>:
80401a28:	fe010113          	addi	sp,sp,-32
80401a2c:	00812c23          	sw	s0,24(sp)
80401a30:	00001437          	lui	s0,0x1
80401a34:	fff40413          	addi	s0,s0,-1 # fff <_binary_bin_swap_img_size-0x7001>
80401a38:	fffff7b7          	lui	a5,0xfffff
80401a3c:	00860633          	add	a2,a2,s0
80401a40:	00b60633          	add	a2,a2,a1
80401a44:	00912a23          	sw	s1,20(sp)
80401a48:	00112e23          	sw	ra,28(sp)
80401a4c:	00f5f4b3          	and	s1,a1,a5
80401a50:	01212823          	sw	s2,16(sp)
80401a54:	01312623          	sw	s3,12(sp)
80401a58:	01412423          	sw	s4,8(sp)
80401a5c:	01512223          	sw	s5,4(sp)
80401a60:	002005b7          	lui	a1,0x200
80401a64:	00f67433          	and	s0,a2,a5
80401a68:	08b4e863          	bltu	s1,a1,80401af8 <mm_map+0xd0>
80401a6c:	0884f663          	bgeu	s1,s0,80401af8 <mm_map+0xd0>
80401a70:	800007b7          	lui	a5,0x80000
80401a74:	0887e263          	bltu	a5,s0,80401af8 <mm_map+0xd0>
80401a78:	00050993          	mv	s3,a0
80401a7c:	08050263          	beqz	a0,80401b00 <mm_map+0xd8>
80401a80:	00048593          	mv	a1,s1
80401a84:	00068a93          	mv	s5,a3
80401a88:	00070a13          	mv	s4,a4
80401a8c:	dd9ff0ef          	jal	ra,80401864 <find_vma>
80401a90:	00050663          	beqz	a0,80401a9c <mm_map+0x74>
80401a94:	00452783          	lw	a5,4(a0)
80401a98:	0687e063          	bltu	a5,s0,80401af8 <mm_map+0xd0>
80401a9c:	01800513          	li	a0,24
80401aa0:	378010ef          	jal	ra,80402e18 <kmalloc>
80401aa4:	00050913          	mv	s2,a0
80401aa8:	ffc00513          	li	a0,-4
80401aac:	02090463          	beqz	s2,80401ad4 <mm_map+0xac>
80401ab0:	00098513          	mv	a0,s3
80401ab4:	00992223          	sw	s1,4(s2)
80401ab8:	00892423          	sw	s0,8(s2)
80401abc:	01592623          	sw	s5,12(s2)
80401ac0:	00090593          	mv	a1,s2
80401ac4:	dfdff0ef          	jal	ra,804018c0 <insert_vma_struct>
80401ac8:	00000513          	li	a0,0
80401acc:	000a0463          	beqz	s4,80401ad4 <mm_map+0xac>
80401ad0:	012a2023          	sw	s2,0(s4)
80401ad4:	01c12083          	lw	ra,28(sp)
80401ad8:	01812403          	lw	s0,24(sp)
80401adc:	01412483          	lw	s1,20(sp)
80401ae0:	01012903          	lw	s2,16(sp)
80401ae4:	00c12983          	lw	s3,12(sp)
80401ae8:	00812a03          	lw	s4,8(sp)
80401aec:	00412a83          	lw	s5,4(sp)
80401af0:	02010113          	addi	sp,sp,32
80401af4:	00008067          	ret
80401af8:	ffd00513          	li	a0,-3
80401afc:	fd9ff06f          	j	80401ad4 <mm_map+0xac>
80401b00:	00010697          	auipc	a3,0x10
80401b04:	a6068693          	addi	a3,a3,-1440 # 80411560 <commands+0x8dc>
80401b08:	0000f617          	auipc	a2,0xf
80401b0c:	1b860613          	addi	a2,a2,440 # 80410cc0 <commands+0x3c>
80401b10:	0a400593          	li	a1,164
80401b14:	00010517          	auipc	a0,0x10
80401b18:	9cc50513          	addi	a0,a0,-1588 # 804114e0 <commands+0x85c>
80401b1c:	fb0fe0ef          	jal	ra,804002cc <__panic>

80401b20 <dup_mmap>:
80401b20:	fe010113          	addi	sp,sp,-32
80401b24:	00112e23          	sw	ra,28(sp)
80401b28:	00812c23          	sw	s0,24(sp)
80401b2c:	00912a23          	sw	s1,20(sp)
80401b30:	01212823          	sw	s2,16(sp)
80401b34:	01312623          	sw	s3,12(sp)
80401b38:	01412423          	sw	s4,8(sp)
80401b3c:	01512223          	sw	s5,4(sp)
80401b40:	08050e63          	beqz	a0,80401bdc <dup_mmap+0xbc>
80401b44:	00050913          	mv	s2,a0
80401b48:	00058493          	mv	s1,a1
80401b4c:	00058413          	mv	s0,a1
80401b50:	02059c63          	bnez	a1,80401b88 <dup_mmap+0x68>
80401b54:	0880006f          	j	80401bdc <dup_mmap+0xbc>
80401b58:	00090513          	mv	a0,s2
80401b5c:	0155a223          	sw	s5,4(a1) # 200004 <_binary_bin_sfs_img_size+0x188004>
80401b60:	0145a423          	sw	s4,8(a1)
80401b64:	0135a623          	sw	s3,12(a1)
80401b68:	d59ff0ef          	jal	ra,804018c0 <insert_vma_struct>
80401b6c:	ff842683          	lw	a3,-8(s0)
80401b70:	ff442603          	lw	a2,-12(s0)
80401b74:	00c4a583          	lw	a1,12(s1)
80401b78:	00c92503          	lw	a0,12(s2)
80401b7c:	00000713          	li	a4,0
80401b80:	69c030ef          	jal	ra,8040521c <copy_range>
80401b84:	02051463          	bnez	a0,80401bac <dup_mmap+0x8c>
80401b88:	00042403          	lw	s0,0(s0)
80401b8c:	04848463          	beq	s1,s0,80401bd4 <dup_mmap+0xb4>
80401b90:	01800513          	li	a0,24
80401b94:	ff442a83          	lw	s5,-12(s0)
80401b98:	ff842a03          	lw	s4,-8(s0)
80401b9c:	ffc42983          	lw	s3,-4(s0)
80401ba0:	278010ef          	jal	ra,80402e18 <kmalloc>
80401ba4:	00050593          	mv	a1,a0
80401ba8:	fa0518e3          	bnez	a0,80401b58 <dup_mmap+0x38>
80401bac:	ffc00513          	li	a0,-4
80401bb0:	01c12083          	lw	ra,28(sp)
80401bb4:	01812403          	lw	s0,24(sp)
80401bb8:	01412483          	lw	s1,20(sp)
80401bbc:	01012903          	lw	s2,16(sp)
80401bc0:	00c12983          	lw	s3,12(sp)
80401bc4:	00812a03          	lw	s4,8(sp)
80401bc8:	00412a83          	lw	s5,4(sp)
80401bcc:	02010113          	addi	sp,sp,32
80401bd0:	00008067          	ret
80401bd4:	00000513          	li	a0,0
80401bd8:	fd9ff06f          	j	80401bb0 <dup_mmap+0x90>
80401bdc:	00010697          	auipc	a3,0x10
80401be0:	99068693          	addi	a3,a3,-1648 # 8041156c <commands+0x8e8>
80401be4:	0000f617          	auipc	a2,0xf
80401be8:	0dc60613          	addi	a2,a2,220 # 80410cc0 <commands+0x3c>
80401bec:	0bc00593          	li	a1,188
80401bf0:	00010517          	auipc	a0,0x10
80401bf4:	8f050513          	addi	a0,a0,-1808 # 804114e0 <commands+0x85c>
80401bf8:	ed4fe0ef          	jal	ra,804002cc <__panic>

80401bfc <exit_mmap>:
80401bfc:	ff010113          	addi	sp,sp,-16
80401c00:	00112623          	sw	ra,12(sp)
80401c04:	00812423          	sw	s0,8(sp)
80401c08:	00912223          	sw	s1,4(sp)
80401c0c:	01212023          	sw	s2,0(sp)
80401c10:	06050663          	beqz	a0,80401c7c <exit_mmap+0x80>
80401c14:	01852783          	lw	a5,24(a0)
80401c18:	00050493          	mv	s1,a0
80401c1c:	06079063          	bnez	a5,80401c7c <exit_mmap+0x80>
80401c20:	00452403          	lw	s0,4(a0)
80401c24:	00c52903          	lw	s2,12(a0)
80401c28:	02850a63          	beq	a0,s0,80401c5c <exit_mmap+0x60>
80401c2c:	ff842603          	lw	a2,-8(s0)
80401c30:	ff442583          	lw	a1,-12(s0)
80401c34:	00090513          	mv	a0,s2
80401c38:	779020ef          	jal	ra,80404bb0 <unmap_range>
80401c3c:	00442403          	lw	s0,4(s0)
80401c40:	fe8496e3          	bne	s1,s0,80401c2c <exit_mmap+0x30>
80401c44:	00442403          	lw	s0,4(s0)
80401c48:	00848e63          	beq	s1,s0,80401c64 <exit_mmap+0x68>
80401c4c:	ff842603          	lw	a2,-8(s0)
80401c50:	ff442583          	lw	a1,-12(s0)
80401c54:	00090513          	mv	a0,s2
80401c58:	17c030ef          	jal	ra,80404dd4 <exit_range>
80401c5c:	00442403          	lw	s0,4(s0)
80401c60:	fe8496e3          	bne	s1,s0,80401c4c <exit_mmap+0x50>
80401c64:	00c12083          	lw	ra,12(sp)
80401c68:	00812403          	lw	s0,8(sp)
80401c6c:	00412483          	lw	s1,4(sp)
80401c70:	00012903          	lw	s2,0(sp)
80401c74:	01010113          	addi	sp,sp,16
80401c78:	00008067          	ret
80401c7c:	00010697          	auipc	a3,0x10
80401c80:	90c68693          	addi	a3,a3,-1780 # 80411588 <commands+0x904>
80401c84:	0000f617          	auipc	a2,0xf
80401c88:	03c60613          	addi	a2,a2,60 # 80410cc0 <commands+0x3c>
80401c8c:	0d200593          	li	a1,210
80401c90:	00010517          	auipc	a0,0x10
80401c94:	85050513          	addi	a0,a0,-1968 # 804114e0 <commands+0x85c>
80401c98:	e34fe0ef          	jal	ra,804002cc <__panic>

80401c9c <vmm_init>:
80401c9c:	fe010113          	addi	sp,sp,-32
80401ca0:	00112e23          	sw	ra,28(sp)
80401ca4:	00812c23          	sw	s0,24(sp)
80401ca8:	00912a23          	sw	s1,20(sp)
80401cac:	01212823          	sw	s2,16(sp)
80401cb0:	01312623          	sw	s3,12(sp)
80401cb4:	01412423          	sw	s4,8(sp)
80401cb8:	01512223          	sw	s5,4(sp)
80401cbc:	459020ef          	jal	ra,80404914 <nr_free_pages>
80401cc0:	455020ef          	jal	ra,80404914 <nr_free_pages>
80401cc4:	ae5ff0ef          	jal	ra,804017a8 <mm_create>
80401cc8:	00050493          	mv	s1,a0
80401ccc:	03200413          	li	s0,50
80401cd0:	02051263          	bnez	a0,80401cf4 <vmm_init+0x58>
80401cd4:	4880006f          	j	8040215c <vmm_init+0x4c0>
80401cd8:	00852223          	sw	s0,4(a0)
80401cdc:	00f52423          	sw	a5,8(a0)
80401ce0:	00052623          	sw	zero,12(a0)
80401ce4:	ffb40413          	addi	s0,s0,-5
80401ce8:	00048513          	mv	a0,s1
80401cec:	bd5ff0ef          	jal	ra,804018c0 <insert_vma_struct>
80401cf0:	02040c63          	beqz	s0,80401d28 <vmm_init+0x8c>
80401cf4:	01800513          	li	a0,24
80401cf8:	120010ef          	jal	ra,80402e18 <kmalloc>
80401cfc:	00050593          	mv	a1,a0
80401d00:	00240793          	addi	a5,s0,2
80401d04:	fc051ae3          	bnez	a0,80401cd8 <vmm_init+0x3c>
80401d08:	00010697          	auipc	a3,0x10
80401d0c:	ae068693          	addi	a3,a3,-1312 # 804117e8 <commands+0xb64>
80401d10:	0000f617          	auipc	a2,0xf
80401d14:	fb060613          	addi	a2,a2,-80 # 80410cc0 <commands+0x3c>
80401d18:	10a00593          	li	a1,266
80401d1c:	0000f517          	auipc	a0,0xf
80401d20:	7c450513          	addi	a0,a0,1988 # 804114e0 <commands+0x85c>
80401d24:	da8fe0ef          	jal	ra,804002cc <__panic>
80401d28:	03700413          	li	s0,55
80401d2c:	1f900913          	li	s2,505
80401d30:	0200006f          	j	80401d50 <vmm_init+0xb4>
80401d34:	00852223          	sw	s0,4(a0)
80401d38:	00f52423          	sw	a5,8(a0)
80401d3c:	00052623          	sw	zero,12(a0)
80401d40:	00540413          	addi	s0,s0,5
80401d44:	00048513          	mv	a0,s1
80401d48:	b79ff0ef          	jal	ra,804018c0 <insert_vma_struct>
80401d4c:	03240c63          	beq	s0,s2,80401d84 <vmm_init+0xe8>
80401d50:	01800513          	li	a0,24
80401d54:	0c4010ef          	jal	ra,80402e18 <kmalloc>
80401d58:	00050593          	mv	a1,a0
80401d5c:	00240793          	addi	a5,s0,2
80401d60:	fc051ae3          	bnez	a0,80401d34 <vmm_init+0x98>
80401d64:	00010697          	auipc	a3,0x10
80401d68:	a8468693          	addi	a3,a3,-1404 # 804117e8 <commands+0xb64>
80401d6c:	0000f617          	auipc	a2,0xf
80401d70:	f5460613          	addi	a2,a2,-172 # 80410cc0 <commands+0x3c>
80401d74:	11000593          	li	a1,272
80401d78:	0000f517          	auipc	a0,0xf
80401d7c:	76850513          	addi	a0,a0,1896 # 804114e0 <commands+0x85c>
80401d80:	d4cfe0ef          	jal	ra,804002cc <__panic>
80401d84:	0044a783          	lw	a5,4(s1)
80401d88:	00700713          	li	a4,7
80401d8c:	1fb00593          	li	a1,507
80401d90:	30f48663          	beq	s1,a5,8040209c <vmm_init+0x400>
80401d94:	ff47a683          	lw	a3,-12(a5) # 7ffffff4 <end+0xffb65760>
80401d98:	ffe70613          	addi	a2,a4,-2
80401d9c:	28d61063          	bne	a2,a3,8040201c <vmm_init+0x380>
80401da0:	ff87a683          	lw	a3,-8(a5)
80401da4:	26d71c63          	bne	a4,a3,8040201c <vmm_init+0x380>
80401da8:	00570713          	addi	a4,a4,5
80401dac:	0047a783          	lw	a5,4(a5)
80401db0:	feb710e3          	bne	a4,a1,80401d90 <vmm_init+0xf4>
80401db4:	00700a13          	li	s4,7
80401db8:	00500413          	li	s0,5
80401dbc:	1f900a93          	li	s5,505
80401dc0:	00040593          	mv	a1,s0
80401dc4:	00048513          	mv	a0,s1
80401dc8:	a9dff0ef          	jal	ra,80401864 <find_vma>
80401dcc:	00050913          	mv	s2,a0
80401dd0:	34050663          	beqz	a0,8040211c <vmm_init+0x480>
80401dd4:	00140593          	addi	a1,s0,1
80401dd8:	00048513          	mv	a0,s1
80401ddc:	a89ff0ef          	jal	ra,80401864 <find_vma>
80401de0:	00050993          	mv	s3,a0
80401de4:	30050c63          	beqz	a0,804020fc <vmm_init+0x460>
80401de8:	000a0593          	mv	a1,s4
80401dec:	00048513          	mv	a0,s1
80401df0:	a75ff0ef          	jal	ra,80401864 <find_vma>
80401df4:	2e051463          	bnez	a0,804020dc <vmm_init+0x440>
80401df8:	00340593          	addi	a1,s0,3
80401dfc:	00048513          	mv	a0,s1
80401e00:	a65ff0ef          	jal	ra,80401864 <find_vma>
80401e04:	2a051c63          	bnez	a0,804020bc <vmm_init+0x420>
80401e08:	00440593          	addi	a1,s0,4
80401e0c:	00048513          	mv	a0,s1
80401e10:	a55ff0ef          	jal	ra,80401864 <find_vma>
80401e14:	32051463          	bnez	a0,8040213c <vmm_init+0x4a0>
80401e18:	00492783          	lw	a5,4(s2)
80401e1c:	22879063          	bne	a5,s0,8040203c <vmm_init+0x3a0>
80401e20:	00892783          	lw	a5,8(s2)
80401e24:	20fa1c63          	bne	s4,a5,8040203c <vmm_init+0x3a0>
80401e28:	0049a783          	lw	a5,4(s3)
80401e2c:	22879863          	bne	a5,s0,8040205c <vmm_init+0x3c0>
80401e30:	0089a783          	lw	a5,8(s3)
80401e34:	22fa1463          	bne	s4,a5,8040205c <vmm_init+0x3c0>
80401e38:	00540413          	addi	s0,s0,5
80401e3c:	005a0a13          	addi	s4,s4,5
80401e40:	f95410e3          	bne	s0,s5,80401dc0 <vmm_init+0x124>
80401e44:	00400413          	li	s0,4
80401e48:	fff00913          	li	s2,-1
80401e4c:	00040593          	mv	a1,s0
80401e50:	00048513          	mv	a0,s1
80401e54:	a11ff0ef          	jal	ra,80401864 <find_vma>
80401e58:	02050e63          	beqz	a0,80401e94 <vmm_init+0x1f8>
80401e5c:	00852683          	lw	a3,8(a0)
80401e60:	00452603          	lw	a2,4(a0)
80401e64:	00040593          	mv	a1,s0
80401e68:	00010517          	auipc	a0,0x10
80401e6c:	84050513          	addi	a0,a0,-1984 # 804116a8 <commands+0xa24>
80401e70:	ad8fe0ef          	jal	ra,80400148 <cprintf>
80401e74:	00010697          	auipc	a3,0x10
80401e78:	85c68693          	addi	a3,a3,-1956 # 804116d0 <commands+0xa4c>
80401e7c:	0000f617          	auipc	a2,0xf
80401e80:	e4460613          	addi	a2,a2,-444 # 80410cc0 <commands+0x3c>
80401e84:	13300593          	li	a1,307
80401e88:	0000f517          	auipc	a0,0xf
80401e8c:	65850513          	addi	a0,a0,1624 # 804114e0 <commands+0x85c>
80401e90:	c3cfe0ef          	jal	ra,804002cc <__panic>
80401e94:	fff40413          	addi	s0,s0,-1
80401e98:	fb241ae3          	bne	s0,s2,80401e4c <vmm_init+0x1b0>
80401e9c:	00048513          	mv	a0,s1
80401ea0:	b15ff0ef          	jal	ra,804019b4 <mm_destroy>
80401ea4:	00010517          	auipc	a0,0x10
80401ea8:	84050513          	addi	a0,a0,-1984 # 804116e4 <commands+0xa60>
80401eac:	a9cfe0ef          	jal	ra,80400148 <cprintf>
######## check_pgfault
80401eb0:	265020ef          	jal	ra,80404914 <nr_free_pages>
80401eb4:	00050993          	mv	s3,a0
80401eb8:	8f1ff0ef          	jal	ra,804017a8 <mm_create>
80401ebc:	00099797          	auipc	a5,0x99
80401ec0:	94a7aa23          	sw	a0,-1708(a5) # 8049a810 <check_mm_struct>
80401ec4:	00050493          	mv	s1,a0
80401ec8:	34050663          	beqz	a0,80402214 <vmm_init+0x578>

80401ecc:	00099917          	auipc	s2,0x99
80401ed0:	96892903          	lw	s2,-1688(s2) # 8049a834 <boot_pgdir>
80401ed4:	00092783          	lw	a5,0(s2)
80401ed8:	01252623          	sw	s2,12(a0)
80401edc:	2a079063          	bnez	a5,8040217c <vmm_init+0x4e0>

80401ee0:	01800513          	li	a0,24
80401ee4:	735000ef          	jal	ra,80402e18 <kmalloc>
80401ee8:	00050413          	mv	s0,a0
80401eec:	18050863          	beqz	a0,8040207c <vmm_init+0x3e0>

80401ef0:	004007b7          	lui	a5,0x400
80401ef4:	00f42423          	sw	a5,8(s0)
80401ef8:	00200793          	li	a5,2
80401efc:	00050593          	mv	a1,a0
80401f00:	00042223          	sw	zero,4(s0)
80401f04:	00048513          	mv	a0,s1
80401f08:	00f42623          	sw	a5,12(s0)
80401f0c:	9b5ff0ef          	jal	ra,804018c0 <insert_vma_struct>

80401f10:	10000593          	li	a1,256
80401f14:	00048513          	mv	a0,s1
80401f18:	94dff0ef          	jal	ra,80401864 <find_vma>
80401f1c:	2ca41c63          	bne	s0,a0,804021f4 <vmm_init+0x558>

80401f20:	804ab7b7          	lui	a5,0x804ab
80401f24:	0007a583          	lw	a1,0(a5) # 804ab000 <end+0x1076c>
80401f28:	00010517          	auipc	a0,0x10
80401f2c:	82050513          	addi	a0,a0,-2016 # 80411748 <commands+0xac4>
80401f30:	a18fe0ef          	jal	ra,80400148 <cprintf>

80401f34:	10000793          	li	a5,256
80401f38:	16400713          	li	a4,356
80401f3c:	00f78023          	sb	a5,0(a5)
80401f40:	00178793          	addi	a5,a5,1
80401f44:	fee79ce3          	bne	a5,a4,80401f3c <vmm_init+0x2a0>
80401f48:	00001437          	lui	s0,0x1
80401f4c:	35640593          	addi	a1,s0,854 # 1356 <_binary_bin_swap_img_size-0x6caa>
80401f50:	0000f517          	auipc	a0,0xf
80401f54:	7f850513          	addi	a0,a0,2040 # 80411748 <commands+0xac4>
80401f58:	9f0fe0ef          	jal	ra,80400148 <cprintf>
80401f5c:	10000793          	li	a5,256
80401f60:	35640713          	addi	a4,s0,854
80401f64:	16400613          	li	a2,356
80401f68:	0007c683          	lbu	a3,0(a5)
80401f6c:	00178793          	addi	a5,a5,1
80401f70:	40d70733          	sub	a4,a4,a3
80401f74:	fec79ae3          	bne	a5,a2,80401f68 <vmm_init+0x2cc>
80401f78:	24071e63          	bnez	a4,804021d4 <vmm_init+0x538>
80401f7c:	00000593          	li	a1,0
80401f80:	00090513          	mv	a0,s2
80401f84:	7ed020ef          	jal	ra,80404f70 <page_remove>
80401f88:	00092783          	lw	a5,0(s2)
80401f8c:	00099717          	auipc	a4,0x99
80401f90:	8ac72703          	lw	a4,-1876(a4) # 8049a838 <npage>
80401f94:	00279793          	slli	a5,a5,0x2
80401f98:	00c7d793          	srli	a5,a5,0xc
80401f9c:	22e7f063          	bgeu	a5,a4,804021bc <vmm_init+0x520>
80401fa0:	00013717          	auipc	a4,0x13
80401fa4:	b1c72703          	lw	a4,-1252(a4) # 80414abc <nbase>
80401fa8:	40e787b3          	sub	a5,a5,a4
80401fac:	00579793          	slli	a5,a5,0x5
80401fb0:	00099517          	auipc	a0,0x99
80401fb4:	88c52503          	lw	a0,-1908(a0) # 8049a83c <pages>
80401fb8:	00f50533          	add	a0,a0,a5
80401fbc:	00100593          	li	a1,1
80401fc0:	0f1020ef          	jal	ra,804048b0 <free_pages>
80401fc4:	00092023          	sw	zero,0(s2)
80401fc8:	00048513          	mv	a0,s1
80401fcc:	0004a623          	sw	zero,12(s1)
80401fd0:	9e5ff0ef          	jal	ra,804019b4 <mm_destroy>
80401fd4:	00099797          	auipc	a5,0x99
80401fd8:	8207ae23          	sw	zero,-1988(a5) # 8049a810 <check_mm_struct>
80401fdc:	139020ef          	jal	ra,80404914 <nr_free_pages>
80401fe0:	1aa99e63          	bne	s3,a0,8040219c <vmm_init+0x500>
80401fe4:	0000f517          	auipc	a0,0xf
80401fe8:	7d050513          	addi	a0,a0,2000 # 804117b4 <commands+0xb30>
80401fec:	95cfe0ef          	jal	ra,80400148 <cprintf>
80401ff0:	01812403          	lw	s0,24(sp)
80401ff4:	01c12083          	lw	ra,28(sp)
80401ff8:	01412483          	lw	s1,20(sp)
80401ffc:	01012903          	lw	s2,16(sp)
80402000:	00c12983          	lw	s3,12(sp)
80402004:	00812a03          	lw	s4,8(sp)
80402008:	00412a83          	lw	s5,4(sp)
8040200c:	0000f517          	auipc	a0,0xf
80402010:	7c450513          	addi	a0,a0,1988 # 804117d0 <commands+0xb4c>
80402014:	02010113          	addi	sp,sp,32
80402018:	930fe06f          	j	80400148 <cprintf>
8040201c:	0000f697          	auipc	a3,0xf
80402020:	5a468693          	addi	a3,a3,1444 # 804115c0 <commands+0x93c>
80402024:	0000f617          	auipc	a2,0xf
80402028:	c9c60613          	addi	a2,a2,-868 # 80410cc0 <commands+0x3c>
8040202c:	11900593          	li	a1,281
80402030:	0000f517          	auipc	a0,0xf
80402034:	4b050513          	addi	a0,a0,1200 # 804114e0 <commands+0x85c>
80402038:	a94fe0ef          	jal	ra,804002cc <__panic>
8040203c:	0000f697          	auipc	a3,0xf
80402040:	60c68693          	addi	a3,a3,1548 # 80411648 <commands+0x9c4>
80402044:	0000f617          	auipc	a2,0xf
80402048:	c7c60613          	addi	a2,a2,-900 # 80410cc0 <commands+0x3c>
8040204c:	12900593          	li	a1,297
80402050:	0000f517          	auipc	a0,0xf
80402054:	49050513          	addi	a0,a0,1168 # 804114e0 <commands+0x85c>
80402058:	a74fe0ef          	jal	ra,804002cc <__panic>
8040205c:	0000f697          	auipc	a3,0xf
80402060:	61c68693          	addi	a3,a3,1564 # 80411678 <commands+0x9f4>
80402064:	0000f617          	auipc	a2,0xf
80402068:	c5c60613          	addi	a2,a2,-932 # 80410cc0 <commands+0x3c>
8040206c:	12a00593          	li	a1,298
80402070:	0000f517          	auipc	a0,0xf
80402074:	47050513          	addi	a0,a0,1136 # 804114e0 <commands+0x85c>
80402078:	a54fe0ef          	jal	ra,804002cc <__panic>
8040207c:	0000f697          	auipc	a3,0xf
80402080:	76c68693          	addi	a3,a3,1900 # 804117e8 <commands+0xb64>
80402084:	0000f617          	auipc	a2,0xf
80402088:	c3c60613          	addi	a2,a2,-964 # 80410cc0 <commands+0x3c>
8040208c:	14c00593          	li	a1,332
80402090:	0000f517          	auipc	a0,0xf
80402094:	45050513          	addi	a0,a0,1104 # 804114e0 <commands+0x85c>
80402098:	a34fe0ef          	jal	ra,804002cc <__panic>
8040209c:	0000f697          	auipc	a3,0xf
804020a0:	50c68693          	addi	a3,a3,1292 # 804115a8 <commands+0x924>
804020a4:	0000f617          	auipc	a2,0xf
804020a8:	c1c60613          	addi	a2,a2,-996 # 80410cc0 <commands+0x3c>
804020ac:	11700593          	li	a1,279
804020b0:	0000f517          	auipc	a0,0xf
804020b4:	43050513          	addi	a0,a0,1072 # 804114e0 <commands+0x85c>
804020b8:	a14fe0ef          	jal	ra,804002cc <__panic>
804020bc:	0000f697          	auipc	a3,0xf
804020c0:	56c68693          	addi	a3,a3,1388 # 80411628 <commands+0x9a4>
804020c4:	0000f617          	auipc	a2,0xf
804020c8:	bfc60613          	addi	a2,a2,-1028 # 80410cc0 <commands+0x3c>
804020cc:	12500593          	li	a1,293
804020d0:	0000f517          	auipc	a0,0xf
804020d4:	41050513          	addi	a0,a0,1040 # 804114e0 <commands+0x85c>
804020d8:	9f4fe0ef          	jal	ra,804002cc <__panic>
804020dc:	0000f697          	auipc	a3,0xf
804020e0:	53c68693          	addi	a3,a3,1340 # 80411618 <commands+0x994>
804020e4:	0000f617          	auipc	a2,0xf
804020e8:	bdc60613          	addi	a2,a2,-1060 # 80410cc0 <commands+0x3c>
804020ec:	12300593          	li	a1,291
804020f0:	0000f517          	auipc	a0,0xf
804020f4:	3f050513          	addi	a0,a0,1008 # 804114e0 <commands+0x85c>
804020f8:	9d4fe0ef          	jal	ra,804002cc <__panic>
804020fc:	0000f697          	auipc	a3,0xf
80402100:	50c68693          	addi	a3,a3,1292 # 80411608 <commands+0x984>
80402104:	0000f617          	auipc	a2,0xf
80402108:	bbc60613          	addi	a2,a2,-1092 # 80410cc0 <commands+0x3c>
8040210c:	12100593          	li	a1,289
80402110:	0000f517          	auipc	a0,0xf
80402114:	3d050513          	addi	a0,a0,976 # 804114e0 <commands+0x85c>
80402118:	9b4fe0ef          	jal	ra,804002cc <__panic>
8040211c:	0000f697          	auipc	a3,0xf
80402120:	4dc68693          	addi	a3,a3,1244 # 804115f8 <commands+0x974>
80402124:	0000f617          	auipc	a2,0xf
80402128:	b9c60613          	addi	a2,a2,-1124 # 80410cc0 <commands+0x3c>
8040212c:	11f00593          	li	a1,287
80402130:	0000f517          	auipc	a0,0xf
80402134:	3b050513          	addi	a0,a0,944 # 804114e0 <commands+0x85c>
80402138:	994fe0ef          	jal	ra,804002cc <__panic>
8040213c:	0000f697          	auipc	a3,0xf
80402140:	4fc68693          	addi	a3,a3,1276 # 80411638 <commands+0x9b4>
80402144:	0000f617          	auipc	a2,0xf
80402148:	b7c60613          	addi	a2,a2,-1156 # 80410cc0 <commands+0x3c>
8040214c:	12700593          	li	a1,295
80402150:	0000f517          	auipc	a0,0xf
80402154:	39050513          	addi	a0,a0,912 # 804114e0 <commands+0x85c>
80402158:	974fe0ef          	jal	ra,804002cc <__panic>
8040215c:	0000f697          	auipc	a3,0xf
80402160:	40468693          	addi	a3,a3,1028 # 80411560 <commands+0x8dc>
80402164:	0000f617          	auipc	a2,0xf
80402168:	b5c60613          	addi	a2,a2,-1188 # 80410cc0 <commands+0x3c>
8040216c:	10300593          	li	a1,259
80402170:	0000f517          	auipc	a0,0xf
80402174:	37050513          	addi	a0,a0,880 # 804114e0 <commands+0x85c>
80402178:	954fe0ef          	jal	ra,804002cc <__panic>
8040217c:	0000f697          	auipc	a3,0xf
80402180:	5a068693          	addi	a3,a3,1440 # 8041171c <commands+0xa98>
80402184:	0000f617          	auipc	a2,0xf
80402188:	b3c60613          	addi	a2,a2,-1220 # 80410cc0 <commands+0x3c>
8040218c:	14900593          	li	a1,329
80402190:	0000f517          	auipc	a0,0xf
80402194:	35050513          	addi	a0,a0,848 # 804114e0 <commands+0x85c>
80402198:	934fe0ef          	jal	ra,804002cc <__panic>
8040219c:	0000f697          	auipc	a3,0xf
804021a0:	5f068693          	addi	a3,a3,1520 # 8041178c <commands+0xb08>
804021a4:	0000f617          	auipc	a2,0xf
804021a8:	b1c60613          	addi	a2,a2,-1252 # 80410cc0 <commands+0x3c>
804021ac:	16c00593          	li	a1,364
804021b0:	0000f517          	auipc	a0,0xf
804021b4:	33050513          	addi	a0,a0,816 # 804114e0 <commands+0x85c>
804021b8:	914fe0ef          	jal	ra,804002cc <__panic>
804021bc:	0000f617          	auipc	a2,0xf
804021c0:	5a060613          	addi	a2,a2,1440 # 8041175c <commands+0xad8>
804021c4:	06900593          	li	a1,105
804021c8:	0000f517          	auipc	a0,0xf
804021cc:	5b450513          	addi	a0,a0,1460 # 8041177c <commands+0xaf8>
804021d0:	8fcfe0ef          	jal	ra,804002cc <__panic>
804021d4:	0000f697          	auipc	a3,0xf
804021d8:	57c68693          	addi	a3,a3,1404 # 80411750 <commands+0xacc>
804021dc:	0000f617          	auipc	a2,0xf
804021e0:	ae460613          	addi	a2,a2,-1308 # 80410cc0 <commands+0x3c>
804021e4:	16200593          	li	a1,354
804021e8:	0000f517          	auipc	a0,0xf
804021ec:	2f850513          	addi	a0,a0,760 # 804114e0 <commands+0x85c>
804021f0:	8dcfe0ef          	jal	ra,804002cc <__panic>
804021f4:	0000f697          	auipc	a3,0xf
804021f8:	53868693          	addi	a3,a3,1336 # 8041172c <commands+0xaa8>
804021fc:	0000f617          	auipc	a2,0xf
80402200:	ac460613          	addi	a2,a2,-1340 # 80410cc0 <commands+0x3c>
80402204:	15300593          	li	a1,339
80402208:	0000f517          	auipc	a0,0xf
8040220c:	2d850513          	addi	a0,a0,728 # 804114e0 <commands+0x85c>
80402210:	8bcfe0ef          	jal	ra,804002cc <__panic>
80402214:	0000f697          	auipc	a3,0xf
80402218:	4f068693          	addi	a3,a3,1264 # 80411704 <commands+0xa80>
8040221c:	0000f617          	auipc	a2,0xf
80402220:	aa460613          	addi	a2,a2,-1372 # 80410cc0 <commands+0x3c>
80402224:	14500593          	li	a1,325
80402228:	0000f517          	auipc	a0,0xf
8040222c:	2b850513          	addi	a0,a0,696 # 804114e0 <commands+0x85c>
80402230:	89cfe0ef          	jal	ra,804002cc <__panic>

80402234 <do_pgfault>:
80402234:	fd010113          	addi	sp,sp,-48
80402238:	00060593          	mv	a1,a2
8040223c:	02912223          	sw	s1,36(sp)
80402240:	03212023          	sw	s2,32(sp)
80402244:	02112623          	sw	ra,44(sp)
80402248:	02812423          	sw	s0,40(sp)
8040224c:	01312e23          	sw	s3,28(sp)
80402250:	00060493          	mv	s1,a2
80402254:	00050913          	mv	s2,a0
80402258:	e0cff0ef          	jal	ra,80401864 <find_vma>
8040225c:	00098717          	auipc	a4,0x98
80402260:	5b870713          	addi	a4,a4,1464 # 8049a814 <pgfault_num>
80402264:	00072783          	lw	a5,0(a4)
80402268:	00178793          	addi	a5,a5,1
8040226c:	00f72023          	sw	a5,0(a4)
80402270:	10050c63          	beqz	a0,80402388 <do_pgfault+0x154>
80402274:	00452783          	lw	a5,4(a0)
80402278:	10f4e863          	bltu	s1,a5,80402388 <do_pgfault+0x154>
8040227c:	00c52403          	lw	s0,12(a0)
80402280:	fffff5b7          	lui	a1,0xfffff
80402284:	00c92503          	lw	a0,12(s2)
80402288:	00247413          	andi	s0,s0,2
8040228c:	00143413          	seqz	s0,s0
80402290:	00b4f4b3          	and	s1,s1,a1
80402294:	40800433          	neg	s0,s0
80402298:	00100613          	li	a2,1
8040229c:	00048593          	mv	a1,s1
804022a0:	ff947413          	andi	s0,s0,-7
804022a4:	6c8020ef          	jal	ra,8040496c <get_pte>
804022a8:	01740413          	addi	s0,s0,23
804022ac:	10050463          	beqz	a0,804023b4 <do_pgfault+0x180>
804022b0:	00052583          	lw	a1,0(a0)
804022b4:	0a058463          	beqz	a1,8040235c <do_pgfault+0x128>
804022b8:	00098797          	auipc	a5,0x98
804022bc:	5747a783          	lw	a5,1396(a5) # 8049a82c <swap_init_ok>
804022c0:	0e078063          	beqz	a5,804023a0 <do_pgfault+0x16c>
804022c4:	00c10613          	addi	a2,sp,12
804022c8:	00048593          	mv	a1,s1
804022cc:	00090513          	mv	a0,s2
804022d0:	00012623          	sw	zero,12(sp)
804022d4:	720010ef          	jal	ra,804039f4 <swap_in>
804022d8:	00050993          	mv	s3,a0
804022dc:	04051a63          	bnez	a0,80402330 <do_pgfault+0xfc>
804022e0:	00c12583          	lw	a1,12(sp)
804022e4:	00c92503          	lw	a0,12(s2)
804022e8:	00040693          	mv	a3,s0
804022ec:	00048613          	mv	a2,s1
804022f0:	5c5020ef          	jal	ra,804050b4 <page_insert>
804022f4:	00c12603          	lw	a2,12(sp)
804022f8:	00100693          	li	a3,1
804022fc:	00048593          	mv	a1,s1
80402300:	00090513          	mv	a0,s2
80402304:	534010ef          	jal	ra,80403838 <swap_map_swappable>
80402308:	00c12783          	lw	a5,12(sp)
8040230c:	0097ae23          	sw	s1,28(a5)
80402310:	02c12083          	lw	ra,44(sp)
80402314:	02812403          	lw	s0,40(sp)
80402318:	02412483          	lw	s1,36(sp)
8040231c:	02012903          	lw	s2,32(sp)
80402320:	00098513          	mv	a0,s3
80402324:	01c12983          	lw	s3,28(sp)
80402328:	03010113          	addi	sp,sp,48
8040232c:	00008067          	ret
80402330:	0000f517          	auipc	a0,0xf
80402334:	53c50513          	addi	a0,a0,1340 # 8041186c <commands+0xbe8>
80402338:	e11fd0ef          	jal	ra,80400148 <cprintf>
8040233c:	02c12083          	lw	ra,44(sp)
80402340:	02812403          	lw	s0,40(sp)
80402344:	02412483          	lw	s1,36(sp)
80402348:	02012903          	lw	s2,32(sp)
8040234c:	00098513          	mv	a0,s3
80402350:	01c12983          	lw	s3,28(sp)
80402354:	03010113          	addi	sp,sp,48
80402358:	00008067          	ret
8040235c:	00c92503          	lw	a0,12(s2)
80402360:	00040613          	mv	a2,s0
80402364:	00048593          	mv	a1,s1
80402368:	188030ef          	jal	ra,804054f0 <pgdir_alloc_page>
8040236c:	00000993          	li	s3,0
80402370:	fa0510e3          	bnez	a0,80402310 <do_pgfault+0xdc>
80402374:	0000f517          	auipc	a0,0xf
80402378:	4d050513          	addi	a0,a0,1232 # 80411844 <commands+0xbc0>
8040237c:	dcdfd0ef          	jal	ra,80400148 <cprintf>
80402380:	ffc00993          	li	s3,-4
80402384:	f8dff06f          	j	80402310 <do_pgfault+0xdc>
80402388:	00048593          	mv	a1,s1
8040238c:	0000f517          	auipc	a0,0xf
80402390:	46850513          	addi	a0,a0,1128 # 804117f4 <commands+0xb70>
80402394:	db5fd0ef          	jal	ra,80400148 <cprintf>
80402398:	ffd00993          	li	s3,-3
8040239c:	f75ff06f          	j	80402310 <do_pgfault+0xdc>
804023a0:	0000f517          	auipc	a0,0xf
804023a4:	4ec50513          	addi	a0,a0,1260 # 8041188c <commands+0xc08>
804023a8:	da1fd0ef          	jal	ra,80400148 <cprintf>
804023ac:	ffc00993          	li	s3,-4
804023b0:	f61ff06f          	j	80402310 <do_pgfault+0xdc>
804023b4:	0000f517          	auipc	a0,0xf
804023b8:	47050513          	addi	a0,a0,1136 # 80411824 <commands+0xba0>
804023bc:	d8dfd0ef          	jal	ra,80400148 <cprintf>
804023c0:	ffc00993          	li	s3,-4
804023c4:	f4dff06f          	j	80402310 <do_pgfault+0xdc>

804023c8 <user_mem_check>:
804023c8:	fe010113          	addi	sp,sp,-32
804023cc:	00812c23          	sw	s0,24(sp)
804023d0:	00112e23          	sw	ra,28(sp)
804023d4:	00912a23          	sw	s1,20(sp)
804023d8:	01212823          	sw	s2,16(sp)
804023dc:	01312623          	sw	s3,12(sp)
804023e0:	01412423          	sw	s4,8(sp)
804023e4:	00058413          	mv	s0,a1
804023e8:	08050c63          	beqz	a0,80402480 <user_mem_check+0xb8>
804023ec:	002007b7          	lui	a5,0x200
804023f0:	06f5e663          	bltu	a1,a5,8040245c <user_mem_check+0x94>
804023f4:	00c584b3          	add	s1,a1,a2
804023f8:	0695f263          	bgeu	a1,s1,8040245c <user_mem_check+0x94>
804023fc:	800007b7          	lui	a5,0x80000
80402400:	0497ee63          	bltu	a5,s1,8040245c <user_mem_check+0x94>
80402404:	00050913          	mv	s2,a0
80402408:	00068993          	mv	s3,a3
8040240c:	00001a37          	lui	s4,0x1
80402410:	0240006f          	j	80402434 <user_mem_check+0x6c>
80402414:	0027f693          	andi	a3,a5,2
80402418:	01470733          	add	a4,a4,s4
8040241c:	0087f793          	andi	a5,a5,8
80402420:	02068e63          	beqz	a3,8040245c <user_mem_check+0x94>
80402424:	00078463          	beqz	a5,8040242c <user_mem_check+0x64>
80402428:	02e46a63          	bltu	s0,a4,8040245c <user_mem_check+0x94>
8040242c:	00852403          	lw	s0,8(a0)
80402430:	06947463          	bgeu	s0,s1,80402498 <user_mem_check+0xd0>
80402434:	00040593          	mv	a1,s0
80402438:	00090513          	mv	a0,s2
8040243c:	c28ff0ef          	jal	ra,80401864 <find_vma>
80402440:	00050e63          	beqz	a0,8040245c <user_mem_check+0x94>
80402444:	00452703          	lw	a4,4(a0)
80402448:	00e46a63          	bltu	s0,a4,8040245c <user_mem_check+0x94>
8040244c:	00c52783          	lw	a5,12(a0)
80402450:	fc0992e3          	bnez	s3,80402414 <user_mem_check+0x4c>
80402454:	0017f793          	andi	a5,a5,1
80402458:	fc079ae3          	bnez	a5,8040242c <user_mem_check+0x64>
8040245c:	00000513          	li	a0,0
80402460:	01c12083          	lw	ra,28(sp)
80402464:	01812403          	lw	s0,24(sp)
80402468:	01412483          	lw	s1,20(sp)
8040246c:	01012903          	lw	s2,16(sp)
80402470:	00c12983          	lw	s3,12(sp)
80402474:	00812a03          	lw	s4,8(sp)
80402478:	02010113          	addi	sp,sp,32
8040247c:	00008067          	ret
80402480:	804007b7          	lui	a5,0x80400
80402484:	fcf5ece3          	bltu	a1,a5,8040245c <user_mem_check+0x94>
80402488:	00c58633          	add	a2,a1,a2
8040248c:	fcc5f8e3          	bgeu	a1,a2,8040245c <user_mem_check+0x94>
80402490:	b84007b7          	lui	a5,0xb8400
80402494:	fcc7e4e3          	bltu	a5,a2,8040245c <user_mem_check+0x94>
80402498:	00100513          	li	a0,1
8040249c:	fc5ff06f          	j	80402460 <user_mem_check+0x98>

804024a0 <copy_from_user>:
804024a0:	ff010113          	addi	sp,sp,-16
804024a4:	00812423          	sw	s0,8(sp)
804024a8:	00912223          	sw	s1,4(sp)
804024ac:	00060413          	mv	s0,a2
804024b0:	00068493          	mv	s1,a3
804024b4:	01212023          	sw	s2,0(sp)
804024b8:	00070693          	mv	a3,a4
804024bc:	00058913          	mv	s2,a1
804024c0:	00048613          	mv	a2,s1
804024c4:	00040593          	mv	a1,s0
804024c8:	00112623          	sw	ra,12(sp)
804024cc:	efdff0ef          	jal	ra,804023c8 <user_mem_check>
804024d0:	00050c63          	beqz	a0,804024e8 <copy_from_user+0x48>
804024d4:	00048613          	mv	a2,s1
804024d8:	00040593          	mv	a1,s0
804024dc:	00090513          	mv	a0,s2
804024e0:	5050d0ef          	jal	ra,804101e4 <memcpy>
804024e4:	00100513          	li	a0,1
804024e8:	00c12083          	lw	ra,12(sp)
804024ec:	00812403          	lw	s0,8(sp)
804024f0:	00412483          	lw	s1,4(sp)
804024f4:	00012903          	lw	s2,0(sp)
804024f8:	01010113          	addi	sp,sp,16
804024fc:	00008067          	ret

80402500 <copy_to_user>:
80402500:	ff010113          	addi	sp,sp,-16
80402504:	00812423          	sw	s0,8(sp)
80402508:	00068413          	mv	s0,a3
8040250c:	01212023          	sw	s2,0(sp)
80402510:	00100693          	li	a3,1
80402514:	00060913          	mv	s2,a2
80402518:	00040613          	mv	a2,s0
8040251c:	00912223          	sw	s1,4(sp)
80402520:	00112623          	sw	ra,12(sp)
80402524:	00058493          	mv	s1,a1
80402528:	ea1ff0ef          	jal	ra,804023c8 <user_mem_check>
8040252c:	00050c63          	beqz	a0,80402544 <copy_to_user+0x44>
80402530:	00040613          	mv	a2,s0
80402534:	00090593          	mv	a1,s2
80402538:	00048513          	mv	a0,s1
8040253c:	4a90d0ef          	jal	ra,804101e4 <memcpy>
80402540:	00100513          	li	a0,1
80402544:	00c12083          	lw	ra,12(sp)
80402548:	00812403          	lw	s0,8(sp)
8040254c:	00412483          	lw	s1,4(sp)
80402550:	00012903          	lw	s2,0(sp)
80402554:	01010113          	addi	sp,sp,16
80402558:	00008067          	ret

8040255c <copy_string>:
8040255c:	fe010113          	addi	sp,sp,-32
80402560:	01312623          	sw	s3,12(sp)
80402564:	000019b7          	lui	s3,0x1
80402568:	013609b3          	add	s3,a2,s3
8040256c:	fffff7b7          	lui	a5,0xfffff
80402570:	00f9f9b3          	and	s3,s3,a5
80402574:	00912a23          	sw	s1,20(sp)
80402578:	01212823          	sw	s2,16(sp)
8040257c:	01412423          	sw	s4,8(sp)
80402580:	01512223          	sw	s5,4(sp)
80402584:	00112e23          	sw	ra,28(sp)
80402588:	00812c23          	sw	s0,24(sp)
8040258c:	00060493          	mv	s1,a2
80402590:	00050a93          	mv	s5,a0
80402594:	00058a13          	mv	s4,a1
80402598:	00068913          	mv	s2,a3
8040259c:	40c989b3          	sub	s3,s3,a2
804025a0:	0340006f          	j	804025d4 <copy_string+0x78>
804025a4:	32d0d0ef          	jal	ra,804100d0 <strnlen>
804025a8:	00050793          	mv	a5,a0
804025ac:	00048593          	mv	a1,s1
804025b0:	000a0513          	mv	a0,s4
804025b4:	00040613          	mv	a2,s0
804025b8:	0687ea63          	bltu	a5,s0,8040262c <copy_string+0xd0>
804025bc:	0529f463          	bgeu	s3,s2,80402604 <copy_string+0xa8>
804025c0:	4250d0ef          	jal	ra,804101e4 <memcpy>
804025c4:	008a0a33          	add	s4,s4,s0
804025c8:	008484b3          	add	s1,s1,s0
804025cc:	40890933          	sub	s2,s2,s0
804025d0:	000019b7          	lui	s3,0x1
804025d4:	00000693          	li	a3,0
804025d8:	00048593          	mv	a1,s1
804025dc:	000a8513          	mv	a0,s5
804025e0:	00090413          	mv	s0,s2
804025e4:	0129f463          	bgeu	s3,s2,804025ec <copy_string+0x90>
804025e8:	00098413          	mv	s0,s3
804025ec:	00040613          	mv	a2,s0
804025f0:	dd9ff0ef          	jal	ra,804023c8 <user_mem_check>
804025f4:	00050793          	mv	a5,a0
804025f8:	00040593          	mv	a1,s0
804025fc:	00048513          	mv	a0,s1
80402600:	fa0792e3          	bnez	a5,804025a4 <copy_string+0x48>
80402604:	00000513          	li	a0,0
80402608:	01c12083          	lw	ra,28(sp)
8040260c:	01812403          	lw	s0,24(sp)
80402610:	01412483          	lw	s1,20(sp)
80402614:	01012903          	lw	s2,16(sp)
80402618:	00c12983          	lw	s3,12(sp)
8040261c:	00812a03          	lw	s4,8(sp)
80402620:	00412a83          	lw	s5,4(sp)
80402624:	02010113          	addi	sp,sp,32
80402628:	00008067          	ret
8040262c:	00178613          	addi	a2,a5,1 # fffff001 <end+0x7fb6476d>
80402630:	3b50d0ef          	jal	ra,804101e4 <memcpy>
80402634:	00100513          	li	a0,1
80402638:	fd1ff06f          	j	80402608 <copy_string+0xac>

8040263c <_fifo_init_mm>:
8040263c:	00098797          	auipc	a5,0x98
80402640:	1dc78793          	addi	a5,a5,476 # 8049a818 <pra_list_head>
80402644:	00f52a23          	sw	a5,20(a0)
80402648:	00f7a223          	sw	a5,4(a5)
8040264c:	00f7a023          	sw	a5,0(a5)
80402650:	00000513          	li	a0,0
80402654:	00008067          	ret

80402658 <_fifo_init>:
80402658:	00000513          	li	a0,0
8040265c:	00008067          	ret

80402660 <_fifo_set_unswappable>:
80402660:	00000513          	li	a0,0
80402664:	00008067          	ret

80402668 <_fifo_tick_event>:
80402668:	00000513          	li	a0,0
8040266c:	00008067          	ret

80402670 <_fifo_check_swap>:
80402670:	fd010113          	addi	sp,sp,-48
80402674:	01312e23          	sw	s3,28(sp)
80402678:	01412c23          	sw	s4,24(sp)
8040267c:	0000f517          	auipc	a0,0xf
80402680:	23850513          	addi	a0,a0,568 # 804118b4 <commands+0xc30>
80402684:	000039b7          	lui	s3,0x3
80402688:	00c00a13          	li	s4,12
8040268c:	02812423          	sw	s0,40(sp)
80402690:	02912223          	sw	s1,36(sp)
80402694:	02112623          	sw	ra,44(sp)
80402698:	03212023          	sw	s2,32(sp)
8040269c:	01512a23          	sw	s5,20(sp)
804026a0:	01612823          	sw	s6,16(sp)
804026a4:	01712623          	sw	s7,12(sp)
804026a8:	01812423          	sw	s8,8(sp)
804026ac:	01912223          	sw	s9,4(sp)
804026b0:	00098417          	auipc	s0,0x98
804026b4:	16440413          	addi	s0,s0,356 # 8049a814 <pgfault_num>
804026b8:	a91fd0ef          	jal	ra,80400148 <cprintf>
804026bc:	01498023          	sb	s4,0(s3) # 3000 <_binary_bin_swap_img_size-0x5000>
804026c0:	00042483          	lw	s1,0(s0)
804026c4:	00400793          	li	a5,4
804026c8:	1af49263          	bne	s1,a5,8040286c <_fifo_check_swap+0x1fc>
804026cc:	0000f517          	auipc	a0,0xf
804026d0:	23850513          	addi	a0,a0,568 # 80411904 <commands+0xc80>
804026d4:	00001b37          	lui	s6,0x1
804026d8:	00a00b93          	li	s7,10
804026dc:	a6dfd0ef          	jal	ra,80400148 <cprintf>
804026e0:	017b0023          	sb	s7,0(s6) # 1000 <_binary_bin_swap_img_size-0x7000>
804026e4:	00042903          	lw	s2,0(s0)
804026e8:	30991263          	bne	s2,s1,804029ec <_fifo_check_swap+0x37c>
804026ec:	0000f517          	auipc	a0,0xf
804026f0:	24050513          	addi	a0,a0,576 # 8041192c <commands+0xca8>
804026f4:	00004c37          	lui	s8,0x4
804026f8:	00d00c93          	li	s9,13
804026fc:	a4dfd0ef          	jal	ra,80400148 <cprintf>
80402700:	019c0023          	sb	s9,0(s8) # 4000 <_binary_bin_swap_img_size-0x4000>
80402704:	00042a83          	lw	s5,0(s0)
80402708:	2d2a9263          	bne	s5,s2,804029cc <_fifo_check_swap+0x35c>
8040270c:	0000f517          	auipc	a0,0xf
80402710:	24850513          	addi	a0,a0,584 # 80411954 <commands+0xcd0>
80402714:	000024b7          	lui	s1,0x2
80402718:	00b00913          	li	s2,11
8040271c:	a2dfd0ef          	jal	ra,80400148 <cprintf>
80402720:	01248023          	sb	s2,0(s1) # 2000 <_binary_bin_swap_img_size-0x6000>
80402724:	00042783          	lw	a5,0(s0)
80402728:	29579263          	bne	a5,s5,804029ac <_fifo_check_swap+0x33c>
8040272c:	0000f517          	auipc	a0,0xf
80402730:	25050513          	addi	a0,a0,592 # 8041197c <commands+0xcf8>
80402734:	a15fd0ef          	jal	ra,80400148 <cprintf>
80402738:	000057b7          	lui	a5,0x5
8040273c:	00e00713          	li	a4,14
80402740:	00e78023          	sb	a4,0(a5) # 5000 <_binary_bin_swap_img_size-0x3000>
80402744:	00042a83          	lw	s5,0(s0)
80402748:	00500793          	li	a5,5
8040274c:	24fa9063          	bne	s5,a5,8040298c <_fifo_check_swap+0x31c>
80402750:	0000f517          	auipc	a0,0xf
80402754:	20450513          	addi	a0,a0,516 # 80411954 <commands+0xcd0>
80402758:	9f1fd0ef          	jal	ra,80400148 <cprintf>
8040275c:	01248023          	sb	s2,0(s1)
80402760:	00042783          	lw	a5,0(s0)
80402764:	21579463          	bne	a5,s5,8040296c <_fifo_check_swap+0x2fc>
80402768:	0000f517          	auipc	a0,0xf
8040276c:	19c50513          	addi	a0,a0,412 # 80411904 <commands+0xc80>
80402770:	9d9fd0ef          	jal	ra,80400148 <cprintf>
80402774:	017b0023          	sb	s7,0(s6)
80402778:	00042703          	lw	a4,0(s0)
8040277c:	00600793          	li	a5,6
80402780:	1cf71663          	bne	a4,a5,8040294c <_fifo_check_swap+0x2dc>
80402784:	0000f517          	auipc	a0,0xf
80402788:	1d050513          	addi	a0,a0,464 # 80411954 <commands+0xcd0>
8040278c:	9bdfd0ef          	jal	ra,80400148 <cprintf>
80402790:	01248023          	sb	s2,0(s1)
80402794:	00042703          	lw	a4,0(s0)
80402798:	00700793          	li	a5,7
8040279c:	18f71863          	bne	a4,a5,8040292c <_fifo_check_swap+0x2bc>
804027a0:	0000f517          	auipc	a0,0xf
804027a4:	11450513          	addi	a0,a0,276 # 804118b4 <commands+0xc30>
804027a8:	9a1fd0ef          	jal	ra,80400148 <cprintf>
804027ac:	01498023          	sb	s4,0(s3)
804027b0:	00042703          	lw	a4,0(s0)
804027b4:	00800793          	li	a5,8
804027b8:	14f71a63          	bne	a4,a5,8040290c <_fifo_check_swap+0x29c>
804027bc:	0000f517          	auipc	a0,0xf
804027c0:	17050513          	addi	a0,a0,368 # 8041192c <commands+0xca8>
804027c4:	985fd0ef          	jal	ra,80400148 <cprintf>
804027c8:	019c0023          	sb	s9,0(s8)
804027cc:	00042703          	lw	a4,0(s0)
804027d0:	00900793          	li	a5,9
804027d4:	10f71c63          	bne	a4,a5,804028ec <_fifo_check_swap+0x27c>
804027d8:	0000f517          	auipc	a0,0xf
804027dc:	1a450513          	addi	a0,a0,420 # 8041197c <commands+0xcf8>
804027e0:	969fd0ef          	jal	ra,80400148 <cprintf>
804027e4:	000057b7          	lui	a5,0x5
804027e8:	00e00713          	li	a4,14
804027ec:	00e78023          	sb	a4,0(a5) # 5000 <_binary_bin_swap_img_size-0x3000>
804027f0:	00042483          	lw	s1,0(s0)
804027f4:	00a00793          	li	a5,10
804027f8:	0cf49a63          	bne	s1,a5,804028cc <_fifo_check_swap+0x25c>
804027fc:	0000f517          	auipc	a0,0xf
80402800:	10850513          	addi	a0,a0,264 # 80411904 <commands+0xc80>
80402804:	945fd0ef          	jal	ra,80400148 <cprintf>
80402808:	00000013          	nop
8040280c:	00000013          	nop
80402810:	00000013          	nop
80402814:	00000013          	nop
80402818:	00000013          	nop
8040281c:	000017b7          	lui	a5,0x1
80402820:	0007c783          	lbu	a5,0(a5) # 1000 <_binary_bin_swap_img_size-0x7000>
80402824:	08979463          	bne	a5,s1,804028ac <_fifo_check_swap+0x23c>
80402828:	00042703          	lw	a4,0(s0)
8040282c:	00b00793          	li	a5,11
80402830:	04f71e63          	bne	a4,a5,8040288c <_fifo_check_swap+0x21c>
80402834:	02c12083          	lw	ra,44(sp)
80402838:	02812403          	lw	s0,40(sp)
8040283c:	02412483          	lw	s1,36(sp)
80402840:	02012903          	lw	s2,32(sp)
80402844:	01c12983          	lw	s3,28(sp)
80402848:	01812a03          	lw	s4,24(sp)
8040284c:	01412a83          	lw	s5,20(sp)
80402850:	01012b03          	lw	s6,16(sp)
80402854:	00c12b83          	lw	s7,12(sp)
80402858:	00812c03          	lw	s8,8(sp)
8040285c:	00412c83          	lw	s9,4(sp)
80402860:	00000513          	li	a0,0
80402864:	03010113          	addi	sp,sp,48
80402868:	00008067          	ret
8040286c:	0000f697          	auipc	a3,0xf
80402870:	07068693          	addi	a3,a3,112 # 804118dc <commands+0xc58>
80402874:	0000e617          	auipc	a2,0xe
80402878:	44c60613          	addi	a2,a2,1100 # 80410cc0 <commands+0x3c>
8040287c:	05f00593          	li	a1,95
80402880:	0000f517          	auipc	a0,0xf
80402884:	07050513          	addi	a0,a0,112 # 804118f0 <commands+0xc6c>
80402888:	a45fd0ef          	jal	ra,804002cc <__panic>
8040288c:	0000f697          	auipc	a3,0xf
80402890:	1b468693          	addi	a3,a3,436 # 80411a40 <commands+0xdbc>
80402894:	0000e617          	auipc	a2,0xe
80402898:	42c60613          	addi	a2,a2,1068 # 80410cc0 <commands+0x3c>
8040289c:	08600593          	li	a1,134
804028a0:	0000f517          	auipc	a0,0xf
804028a4:	05050513          	addi	a0,a0,80 # 804118f0 <commands+0xc6c>
804028a8:	a25fd0ef          	jal	ra,804002cc <__panic>
804028ac:	0000f697          	auipc	a3,0xf
804028b0:	17068693          	addi	a3,a3,368 # 80411a1c <commands+0xd98>
804028b4:	0000e617          	auipc	a2,0xe
804028b8:	40c60613          	addi	a2,a2,1036 # 80410cc0 <commands+0x3c>
804028bc:	08400593          	li	a1,132
804028c0:	0000f517          	auipc	a0,0xf
804028c4:	03050513          	addi	a0,a0,48 # 804118f0 <commands+0xc6c>
804028c8:	a05fd0ef          	jal	ra,804002cc <__panic>
804028cc:	0000f697          	auipc	a3,0xf
804028d0:	13c68693          	addi	a3,a3,316 # 80411a08 <commands+0xd84>
804028d4:	0000e617          	auipc	a2,0xe
804028d8:	3ec60613          	addi	a2,a2,1004 # 80410cc0 <commands+0x3c>
804028dc:	07d00593          	li	a1,125
804028e0:	0000f517          	auipc	a0,0xf
804028e4:	01050513          	addi	a0,a0,16 # 804118f0 <commands+0xc6c>
804028e8:	9e5fd0ef          	jal	ra,804002cc <__panic>
804028ec:	0000f697          	auipc	a3,0xf
804028f0:	10868693          	addi	a3,a3,264 # 804119f4 <commands+0xd70>
804028f4:	0000e617          	auipc	a2,0xe
804028f8:	3cc60613          	addi	a2,a2,972 # 80410cc0 <commands+0x3c>
804028fc:	07a00593          	li	a1,122
80402900:	0000f517          	auipc	a0,0xf
80402904:	ff050513          	addi	a0,a0,-16 # 804118f0 <commands+0xc6c>
80402908:	9c5fd0ef          	jal	ra,804002cc <__panic>
8040290c:	0000f697          	auipc	a3,0xf
80402910:	0d468693          	addi	a3,a3,212 # 804119e0 <commands+0xd5c>
80402914:	0000e617          	auipc	a2,0xe
80402918:	3ac60613          	addi	a2,a2,940 # 80410cc0 <commands+0x3c>
8040291c:	07700593          	li	a1,119
80402920:	0000f517          	auipc	a0,0xf
80402924:	fd050513          	addi	a0,a0,-48 # 804118f0 <commands+0xc6c>
80402928:	9a5fd0ef          	jal	ra,804002cc <__panic>
8040292c:	0000f697          	auipc	a3,0xf
80402930:	0a068693          	addi	a3,a3,160 # 804119cc <commands+0xd48>
80402934:	0000e617          	auipc	a2,0xe
80402938:	38c60613          	addi	a2,a2,908 # 80410cc0 <commands+0x3c>
8040293c:	07400593          	li	a1,116
80402940:	0000f517          	auipc	a0,0xf
80402944:	fb050513          	addi	a0,a0,-80 # 804118f0 <commands+0xc6c>
80402948:	985fd0ef          	jal	ra,804002cc <__panic>
8040294c:	0000f697          	auipc	a3,0xf
80402950:	06c68693          	addi	a3,a3,108 # 804119b8 <commands+0xd34>
80402954:	0000e617          	auipc	a2,0xe
80402958:	36c60613          	addi	a2,a2,876 # 80410cc0 <commands+0x3c>
8040295c:	07100593          	li	a1,113
80402960:	0000f517          	auipc	a0,0xf
80402964:	f9050513          	addi	a0,a0,-112 # 804118f0 <commands+0xc6c>
80402968:	965fd0ef          	jal	ra,804002cc <__panic>
8040296c:	0000f697          	auipc	a3,0xf
80402970:	03868693          	addi	a3,a3,56 # 804119a4 <commands+0xd20>
80402974:	0000e617          	auipc	a2,0xe
80402978:	34c60613          	addi	a2,a2,844 # 80410cc0 <commands+0x3c>
8040297c:	06e00593          	li	a1,110
80402980:	0000f517          	auipc	a0,0xf
80402984:	f7050513          	addi	a0,a0,-144 # 804118f0 <commands+0xc6c>
80402988:	945fd0ef          	jal	ra,804002cc <__panic>
8040298c:	0000f697          	auipc	a3,0xf
80402990:	01868693          	addi	a3,a3,24 # 804119a4 <commands+0xd20>
80402994:	0000e617          	auipc	a2,0xe
80402998:	32c60613          	addi	a2,a2,812 # 80410cc0 <commands+0x3c>
8040299c:	06b00593          	li	a1,107
804029a0:	0000f517          	auipc	a0,0xf
804029a4:	f5050513          	addi	a0,a0,-176 # 804118f0 <commands+0xc6c>
804029a8:	925fd0ef          	jal	ra,804002cc <__panic>
804029ac:	0000f697          	auipc	a3,0xf
804029b0:	f3068693          	addi	a3,a3,-208 # 804118dc <commands+0xc58>
804029b4:	0000e617          	auipc	a2,0xe
804029b8:	30c60613          	addi	a2,a2,780 # 80410cc0 <commands+0x3c>
804029bc:	06800593          	li	a1,104
804029c0:	0000f517          	auipc	a0,0xf
804029c4:	f3050513          	addi	a0,a0,-208 # 804118f0 <commands+0xc6c>
804029c8:	905fd0ef          	jal	ra,804002cc <__panic>
804029cc:	0000f697          	auipc	a3,0xf
804029d0:	f1068693          	addi	a3,a3,-240 # 804118dc <commands+0xc58>
804029d4:	0000e617          	auipc	a2,0xe
804029d8:	2ec60613          	addi	a2,a2,748 # 80410cc0 <commands+0x3c>
804029dc:	06500593          	li	a1,101
804029e0:	0000f517          	auipc	a0,0xf
804029e4:	f1050513          	addi	a0,a0,-240 # 804118f0 <commands+0xc6c>
804029e8:	8e5fd0ef          	jal	ra,804002cc <__panic>
804029ec:	0000f697          	auipc	a3,0xf
804029f0:	ef068693          	addi	a3,a3,-272 # 804118dc <commands+0xc58>
804029f4:	0000e617          	auipc	a2,0xe
804029f8:	2cc60613          	addi	a2,a2,716 # 80410cc0 <commands+0x3c>
804029fc:	06200593          	li	a1,98
80402a00:	0000f517          	auipc	a0,0xf
80402a04:	ef050513          	addi	a0,a0,-272 # 804118f0 <commands+0xc6c>
80402a08:	8c5fd0ef          	jal	ra,804002cc <__panic>

80402a0c <_fifo_swap_out_victim>:
80402a0c:	01452783          	lw	a5,20(a0)
80402a10:	ff010113          	addi	sp,sp,-16
80402a14:	00112623          	sw	ra,12(sp)
80402a18:	02078a63          	beqz	a5,80402a4c <_fifo_swap_out_victim+0x40>
80402a1c:	04061863          	bnez	a2,80402a6c <_fifo_swap_out_victim+0x60>
80402a20:	0047a783          	lw	a5,4(a5)
80402a24:	00c12083          	lw	ra,12(sp)
80402a28:	00000513          	li	a0,0
80402a2c:	0007a683          	lw	a3,0(a5)
80402a30:	0047a703          	lw	a4,4(a5)
80402a34:	fec78793          	addi	a5,a5,-20
80402a38:	00e6a223          	sw	a4,4(a3)
80402a3c:	00d72023          	sw	a3,0(a4)
80402a40:	00f5a023          	sw	a5,0(a1) # fffff000 <end+0x7fb6476c>
80402a44:	01010113          	addi	sp,sp,16
80402a48:	00008067          	ret
80402a4c:	0000f697          	auipc	a3,0xf
80402a50:	00868693          	addi	a3,a3,8 # 80411a54 <commands+0xdd0>
80402a54:	0000e617          	auipc	a2,0xe
80402a58:	26c60613          	addi	a2,a2,620 # 80410cc0 <commands+0x3c>
80402a5c:	05000593          	li	a1,80
80402a60:	0000f517          	auipc	a0,0xf
80402a64:	e9050513          	addi	a0,a0,-368 # 804118f0 <commands+0xc6c>
80402a68:	865fd0ef          	jal	ra,804002cc <__panic>
80402a6c:	0000f697          	auipc	a3,0xf
80402a70:	ff868693          	addi	a3,a3,-8 # 80411a64 <commands+0xde0>
80402a74:	0000e617          	auipc	a2,0xe
80402a78:	24c60613          	addi	a2,a2,588 # 80410cc0 <commands+0x3c>
80402a7c:	05100593          	li	a1,81
80402a80:	0000f517          	auipc	a0,0xf
80402a84:	e7050513          	addi	a0,a0,-400 # 804118f0 <commands+0xc6c>
80402a88:	845fd0ef          	jal	ra,804002cc <__panic>

80402a8c <_fifo_map_swappable>:
80402a8c:	01452783          	lw	a5,20(a0)
80402a90:	02078263          	beqz	a5,80402ab4 <_fifo_map_swappable+0x28>
80402a94:	0007a683          	lw	a3,0(a5)
80402a98:	01460713          	addi	a4,a2,20
80402a9c:	00e7a023          	sw	a4,0(a5)
80402aa0:	00e6a223          	sw	a4,4(a3)
80402aa4:	00000513          	li	a0,0
80402aa8:	00f62c23          	sw	a5,24(a2)
80402aac:	00d62a23          	sw	a3,20(a2)
80402ab0:	00008067          	ret
80402ab4:	ff010113          	addi	sp,sp,-16
80402ab8:	0000f697          	auipc	a3,0xf
80402abc:	fbc68693          	addi	a3,a3,-68 # 80411a74 <commands+0xdf0>
80402ac0:	0000e617          	auipc	a2,0xe
80402ac4:	20060613          	addi	a2,a2,512 # 80410cc0 <commands+0x3c>
80402ac8:	03f00593          	li	a1,63
80402acc:	0000f517          	auipc	a0,0xf
80402ad0:	e2450513          	addi	a0,a0,-476 # 804118f0 <commands+0xc6c>
80402ad4:	00112623          	sw	ra,12(sp)
80402ad8:	ff4fd0ef          	jal	ra,804002cc <__panic>

80402adc <slob_free>:
80402adc:	10050c63          	beqz	a0,80402bf4 <slob_free+0x118>
80402ae0:	ff010113          	addi	sp,sp,-16
80402ae4:	00812423          	sw	s0,8(sp)
80402ae8:	00112623          	sw	ra,12(sp)
80402aec:	00050413          	mv	s0,a0
80402af0:	0c059e63          	bnez	a1,80402bcc <slob_free+0xf0>
80402af4:	100027f3          	csrr	a5,sstatus
80402af8:	0027f793          	andi	a5,a5,2
80402afc:	00000513          	li	a0,0
80402b00:	0e079463          	bnez	a5,80402be8 <slob_free+0x10c>
80402b04:	00094617          	auipc	a2,0x94
80402b08:	53c60613          	addi	a2,a2,1340 # 80497040 <slobfree>
80402b0c:	00062783          	lw	a5,0(a2)
80402b10:	00078713          	mv	a4,a5
80402b14:	0047a783          	lw	a5,4(a5)
80402b18:	04877663          	bgeu	a4,s0,80402b64 <slob_free+0x88>
80402b1c:	00f46463          	bltu	s0,a5,80402b24 <slob_free+0x48>
80402b20:	fef768e3          	bltu	a4,a5,80402b10 <slob_free+0x34>
80402b24:	00042583          	lw	a1,0(s0)
80402b28:	00359693          	slli	a3,a1,0x3
80402b2c:	00d406b3          	add	a3,s0,a3
80402b30:	04d78663          	beq	a5,a3,80402b7c <slob_free+0xa0>
80402b34:	00072683          	lw	a3,0(a4)
80402b38:	00f42223          	sw	a5,4(s0)
80402b3c:	00369793          	slli	a5,a3,0x3
80402b40:	00f707b3          	add	a5,a4,a5
80402b44:	04f40e63          	beq	s0,a5,80402ba0 <slob_free+0xc4>
80402b48:	00872223          	sw	s0,4(a4)
80402b4c:	00e62023          	sw	a4,0(a2)
80402b50:	06051663          	bnez	a0,80402bbc <slob_free+0xe0>
80402b54:	00c12083          	lw	ra,12(sp)
80402b58:	00812403          	lw	s0,8(sp)
80402b5c:	01010113          	addi	sp,sp,16
80402b60:	00008067          	ret
80402b64:	faf766e3          	bltu	a4,a5,80402b10 <slob_free+0x34>
80402b68:	faf474e3          	bgeu	s0,a5,80402b10 <slob_free+0x34>
80402b6c:	00042583          	lw	a1,0(s0)
80402b70:	00359693          	slli	a3,a1,0x3
80402b74:	00d406b3          	add	a3,s0,a3
80402b78:	fad79ee3          	bne	a5,a3,80402b34 <slob_free+0x58>
80402b7c:	0007a683          	lw	a3,0(a5)
80402b80:	0047a783          	lw	a5,4(a5)
80402b84:	00b685b3          	add	a1,a3,a1
80402b88:	00b42023          	sw	a1,0(s0)
80402b8c:	00072683          	lw	a3,0(a4)
80402b90:	00f42223          	sw	a5,4(s0)
80402b94:	00369793          	slli	a5,a3,0x3
80402b98:	00f707b3          	add	a5,a4,a5
80402b9c:	faf416e3          	bne	s0,a5,80402b48 <slob_free+0x6c>
80402ba0:	00042783          	lw	a5,0(s0)
80402ba4:	00442583          	lw	a1,4(s0)
80402ba8:	00e62023          	sw	a4,0(a2)
80402bac:	00d786b3          	add	a3,a5,a3
80402bb0:	00d72023          	sw	a3,0(a4)
80402bb4:	00b72223          	sw	a1,4(a4)
80402bb8:	f8050ee3          	beqz	a0,80402b54 <slob_free+0x78>
80402bbc:	00812403          	lw	s0,8(sp)
80402bc0:	00c12083          	lw	ra,12(sp)
80402bc4:	01010113          	addi	sp,sp,16
80402bc8:	9a8fe06f          	j	80400d70 <intr_enable>
80402bcc:	00758593          	addi	a1,a1,7
80402bd0:	0035d593          	srli	a1,a1,0x3
80402bd4:	00b52023          	sw	a1,0(a0)
80402bd8:	100027f3          	csrr	a5,sstatus
80402bdc:	0027f793          	andi	a5,a5,2
80402be0:	00000513          	li	a0,0
80402be4:	f20780e3          	beqz	a5,80402b04 <slob_free+0x28>
80402be8:	990fe0ef          	jal	ra,80400d78 <intr_disable>
80402bec:	00100513          	li	a0,1
80402bf0:	f15ff06f          	j	80402b04 <slob_free+0x28>
80402bf4:	00008067          	ret

80402bf8 <__slob_get_free_pages.constprop.0>:
80402bf8:	00100793          	li	a5,1
80402bfc:	ff010113          	addi	sp,sp,-16
80402c00:	00a79533          	sll	a0,a5,a0
80402c04:	00112623          	sw	ra,12(sp)
80402c08:	3d5010ef          	jal	ra,804047dc <alloc_pages>
80402c0c:	04050263          	beqz	a0,80402c50 <__slob_get_free_pages.constprop.0+0x58>
80402c10:	00098697          	auipc	a3,0x98
80402c14:	c2c6a683          	lw	a3,-980(a3) # 8049a83c <pages>
80402c18:	40d50533          	sub	a0,a0,a3
80402c1c:	40555513          	srai	a0,a0,0x5
80402c20:	00012697          	auipc	a3,0x12
80402c24:	e9c6a683          	lw	a3,-356(a3) # 80414abc <nbase>
80402c28:	00d50533          	add	a0,a0,a3
80402c2c:	00c51793          	slli	a5,a0,0xc
80402c30:	00c7d793          	srli	a5,a5,0xc
80402c34:	00098717          	auipc	a4,0x98
80402c38:	c0472703          	lw	a4,-1020(a4) # 8049a838 <npage>
80402c3c:	00c51513          	slli	a0,a0,0xc
80402c40:	00e7fe63          	bgeu	a5,a4,80402c5c <__slob_get_free_pages.constprop.0+0x64>
80402c44:	00098697          	auipc	a3,0x98
80402c48:	c046a683          	lw	a3,-1020(a3) # 8049a848 <va_pa_offset>
80402c4c:	00d50533          	add	a0,a0,a3
80402c50:	00c12083          	lw	ra,12(sp)
80402c54:	01010113          	addi	sp,sp,16
80402c58:	00008067          	ret
80402c5c:	00050693          	mv	a3,a0
80402c60:	0000f617          	auipc	a2,0xf
80402c64:	e4860613          	addi	a2,a2,-440 # 80411aa8 <commands+0xe24>
80402c68:	06e00593          	li	a1,110
80402c6c:	0000f517          	auipc	a0,0xf
80402c70:	b1050513          	addi	a0,a0,-1264 # 8041177c <commands+0xaf8>
80402c74:	e58fd0ef          	jal	ra,804002cc <__panic>

80402c78 <slob_alloc.constprop.0>:
80402c78:	fe010113          	addi	sp,sp,-32
80402c7c:	00112e23          	sw	ra,28(sp)
80402c80:	00812c23          	sw	s0,24(sp)
80402c84:	00912a23          	sw	s1,20(sp)
80402c88:	01212823          	sw	s2,16(sp)
80402c8c:	01312623          	sw	s3,12(sp)
80402c90:	00850713          	addi	a4,a0,8
80402c94:	000017b7          	lui	a5,0x1
80402c98:	12f77863          	bgeu	a4,a5,80402dc8 <slob_alloc.constprop.0+0x150>
80402c9c:	00750993          	addi	s3,a0,7
80402ca0:	0039d913          	srli	s2,s3,0x3
80402ca4:	10002673          	csrr	a2,sstatus
80402ca8:	00267613          	andi	a2,a2,2
80402cac:	10061263          	bnez	a2,80402db0 <slob_alloc.constprop.0+0x138>
80402cb0:	00094497          	auipc	s1,0x94
80402cb4:	39048493          	addi	s1,s1,912 # 80497040 <slobfree>
80402cb8:	0004a683          	lw	a3,0(s1)
80402cbc:	0046a783          	lw	a5,4(a3)
80402cc0:	0007a703          	lw	a4,0(a5) # 1000 <_binary_bin_swap_img_size-0x7000>
80402cc4:	0f275c63          	bge	a4,s2,80402dbc <slob_alloc.constprop.0+0x144>
80402cc8:	00f68e63          	beq	a3,a5,80402ce4 <slob_alloc.constprop.0+0x6c>
80402ccc:	0047a403          	lw	s0,4(a5)
80402cd0:	00042703          	lw	a4,0(s0)
80402cd4:	05275463          	bge	a4,s2,80402d1c <slob_alloc.constprop.0+0xa4>
80402cd8:	0004a683          	lw	a3,0(s1)
80402cdc:	00040793          	mv	a5,s0
80402ce0:	fef696e3          	bne	a3,a5,80402ccc <slob_alloc.constprop.0+0x54>
80402ce4:	08061a63          	bnez	a2,80402d78 <slob_alloc.constprop.0+0x100>
80402ce8:	00000513          	li	a0,0
80402cec:	f0dff0ef          	jal	ra,80402bf8 <__slob_get_free_pages.constprop.0>
80402cf0:	00050413          	mv	s0,a0
80402cf4:	04050a63          	beqz	a0,80402d48 <slob_alloc.constprop.0+0xd0>
80402cf8:	000015b7          	lui	a1,0x1
80402cfc:	de1ff0ef          	jal	ra,80402adc <slob_free>
80402d00:	10002673          	csrr	a2,sstatus
80402d04:	00267613          	andi	a2,a2,2
80402d08:	06061063          	bnez	a2,80402d68 <slob_alloc.constprop.0+0xf0>
80402d0c:	0004a783          	lw	a5,0(s1)
80402d10:	0047a403          	lw	s0,4(a5)
80402d14:	00042703          	lw	a4,0(s0)
80402d18:	fd2740e3          	blt	a4,s2,80402cd8 <slob_alloc.constprop.0+0x60>
80402d1c:	08e90463          	beq	s2,a4,80402da4 <slob_alloc.constprop.0+0x12c>
80402d20:	ff89f513          	andi	a0,s3,-8
80402d24:	00a40533          	add	a0,s0,a0
80402d28:	00a7a223          	sw	a0,4(a5)
80402d2c:	00442683          	lw	a3,4(s0)
80402d30:	41270733          	sub	a4,a4,s2
80402d34:	00e52023          	sw	a4,0(a0)
80402d38:	00d52223          	sw	a3,4(a0)
80402d3c:	01242023          	sw	s2,0(s0)
80402d40:	00f4a023          	sw	a5,0(s1)
80402d44:	02061e63          	bnez	a2,80402d80 <slob_alloc.constprop.0+0x108>
80402d48:	01c12083          	lw	ra,28(sp)
80402d4c:	00040513          	mv	a0,s0
80402d50:	01812403          	lw	s0,24(sp)
80402d54:	01412483          	lw	s1,20(sp)
80402d58:	01012903          	lw	s2,16(sp)
80402d5c:	00c12983          	lw	s3,12(sp)
80402d60:	02010113          	addi	sp,sp,32
80402d64:	00008067          	ret
80402d68:	810fe0ef          	jal	ra,80400d78 <intr_disable>
80402d6c:	0004a783          	lw	a5,0(s1)
80402d70:	00100613          	li	a2,1
80402d74:	f9dff06f          	j	80402d10 <slob_alloc.constprop.0+0x98>
80402d78:	ff9fd0ef          	jal	ra,80400d70 <intr_enable>
80402d7c:	f6dff06f          	j	80402ce8 <slob_alloc.constprop.0+0x70>
80402d80:	ff1fd0ef          	jal	ra,80400d70 <intr_enable>
80402d84:	01c12083          	lw	ra,28(sp)
80402d88:	00040513          	mv	a0,s0
80402d8c:	01812403          	lw	s0,24(sp)
80402d90:	01412483          	lw	s1,20(sp)
80402d94:	01012903          	lw	s2,16(sp)
80402d98:	00c12983          	lw	s3,12(sp)
80402d9c:	02010113          	addi	sp,sp,32
80402da0:	00008067          	ret
80402da4:	00442703          	lw	a4,4(s0)
80402da8:	00e7a223          	sw	a4,4(a5)
80402dac:	f95ff06f          	j	80402d40 <slob_alloc.constprop.0+0xc8>
80402db0:	fc9fd0ef          	jal	ra,80400d78 <intr_disable>
80402db4:	00100613          	li	a2,1
80402db8:	ef9ff06f          	j	80402cb0 <slob_alloc.constprop.0+0x38>
80402dbc:	00078413          	mv	s0,a5
80402dc0:	00068793          	mv	a5,a3
80402dc4:	f59ff06f          	j	80402d1c <slob_alloc.constprop.0+0xa4>
80402dc8:	0000f697          	auipc	a3,0xf
80402dcc:	d0468693          	addi	a3,a3,-764 # 80411acc <commands+0xe48>
80402dd0:	0000e617          	auipc	a2,0xe
80402dd4:	ef060613          	addi	a2,a2,-272 # 80410cc0 <commands+0x3c>
80402dd8:	06400593          	li	a1,100
80402ddc:	0000f517          	auipc	a0,0xf
80402de0:	d1050513          	addi	a0,a0,-752 # 80411aec <commands+0xe68>
80402de4:	ce8fd0ef          	jal	ra,804002cc <__panic>

80402de8 <kmalloc_init>:
80402de8:	ff010113          	addi	sp,sp,-16
80402dec:	0000f517          	auipc	a0,0xf
80402df0:	d1450513          	addi	a0,a0,-748 # 80411b00 <commands+0xe7c>
80402df4:	00112623          	sw	ra,12(sp)
80402df8:	b50fd0ef          	jal	ra,80400148 <cprintf>
80402dfc:	00c12083          	lw	ra,12(sp)
80402e00:	0000f517          	auipc	a0,0xf
80402e04:	d1450513          	addi	a0,a0,-748 # 80411b14 <commands+0xe90>
80402e08:	01010113          	addi	sp,sp,16
80402e0c:	b3cfd06f          	j	80400148 <cprintf>

80402e10 <kallocated>:
80402e10:	00000513          	li	a0,0
80402e14:	00008067          	ret

80402e18 <kmalloc>:
80402e18:	ff010113          	addi	sp,sp,-16
80402e1c:	01212023          	sw	s2,0(sp)
80402e20:	00001937          	lui	s2,0x1
80402e24:	00812423          	sw	s0,8(sp)
80402e28:	00112623          	sw	ra,12(sp)
80402e2c:	00912223          	sw	s1,4(sp)
80402e30:	ff790793          	addi	a5,s2,-9 # ff7 <_binary_bin_swap_img_size-0x7009>
80402e34:	00050413          	mv	s0,a0
80402e38:	08a7f063          	bgeu	a5,a0,80402eb8 <kmalloc+0xa0>
80402e3c:	00c00513          	li	a0,12
80402e40:	e39ff0ef          	jal	ra,80402c78 <slob_alloc.constprop.0>
80402e44:	00050493          	mv	s1,a0
80402e48:	08050063          	beqz	a0,80402ec8 <kmalloc+0xb0>
80402e4c:	00040793          	mv	a5,s0
80402e50:	00000513          	li	a0,0
80402e54:	00895a63          	bge	s2,s0,80402e68 <kmalloc+0x50>
80402e58:	00001737          	lui	a4,0x1
80402e5c:	4017d793          	srai	a5,a5,0x1
80402e60:	00150513          	addi	a0,a0,1
80402e64:	fef74ce3          	blt	a4,a5,80402e5c <kmalloc+0x44>
80402e68:	00a4a023          	sw	a0,0(s1)
80402e6c:	d8dff0ef          	jal	ra,80402bf8 <__slob_get_free_pages.constprop.0>
80402e70:	00a4a223          	sw	a0,4(s1)
80402e74:	00050413          	mv	s0,a0
80402e78:	0a050663          	beqz	a0,80402f24 <kmalloc+0x10c>
80402e7c:	100027f3          	csrr	a5,sstatus
80402e80:	0027f793          	andi	a5,a5,2
80402e84:	06079263          	bnez	a5,80402ee8 <kmalloc+0xd0>
80402e88:	00098797          	auipc	a5,0x98
80402e8c:	99878793          	addi	a5,a5,-1640 # 8049a820 <bigblocks>
80402e90:	0007a703          	lw	a4,0(a5)
80402e94:	0097a023          	sw	s1,0(a5)
80402e98:	00e4a423          	sw	a4,8(s1)
80402e9c:	00c12083          	lw	ra,12(sp)
80402ea0:	00040513          	mv	a0,s0
80402ea4:	00812403          	lw	s0,8(sp)
80402ea8:	00412483          	lw	s1,4(sp)
80402eac:	00012903          	lw	s2,0(sp)
80402eb0:	01010113          	addi	sp,sp,16
80402eb4:	00008067          	ret
80402eb8:	00850513          	addi	a0,a0,8
80402ebc:	dbdff0ef          	jal	ra,80402c78 <slob_alloc.constprop.0>
80402ec0:	00850413          	addi	s0,a0,8
80402ec4:	fc051ce3          	bnez	a0,80402e9c <kmalloc+0x84>
80402ec8:	00000413          	li	s0,0
80402ecc:	00c12083          	lw	ra,12(sp)
80402ed0:	00040513          	mv	a0,s0
80402ed4:	00812403          	lw	s0,8(sp)
80402ed8:	00412483          	lw	s1,4(sp)
80402edc:	00012903          	lw	s2,0(sp)
80402ee0:	01010113          	addi	sp,sp,16
80402ee4:	00008067          	ret
80402ee8:	e91fd0ef          	jal	ra,80400d78 <intr_disable>
80402eec:	00098797          	auipc	a5,0x98
80402ef0:	93478793          	addi	a5,a5,-1740 # 8049a820 <bigblocks>
80402ef4:	0007a703          	lw	a4,0(a5)
80402ef8:	0097a023          	sw	s1,0(a5)
80402efc:	00e4a423          	sw	a4,8(s1)
80402f00:	e71fd0ef          	jal	ra,80400d70 <intr_enable>
80402f04:	0044a403          	lw	s0,4(s1)
80402f08:	00c12083          	lw	ra,12(sp)
80402f0c:	00412483          	lw	s1,4(sp)
80402f10:	00040513          	mv	a0,s0
80402f14:	00812403          	lw	s0,8(sp)
80402f18:	00012903          	lw	s2,0(sp)
80402f1c:	01010113          	addi	sp,sp,16
80402f20:	00008067          	ret
80402f24:	00c00593          	li	a1,12
80402f28:	00048513          	mv	a0,s1
80402f2c:	bb1ff0ef          	jal	ra,80402adc <slob_free>
80402f30:	f6dff06f          	j	80402e9c <kmalloc+0x84>

80402f34 <kfree>:
80402f34:	10050c63          	beqz	a0,8040304c <kfree+0x118>
80402f38:	ff010113          	addi	sp,sp,-16
80402f3c:	00812423          	sw	s0,8(sp)
80402f40:	00112623          	sw	ra,12(sp)
80402f44:	00912223          	sw	s1,4(sp)
80402f48:	01451793          	slli	a5,a0,0x14
80402f4c:	00050413          	mv	s0,a0
80402f50:	0a079e63          	bnez	a5,8040300c <kfree+0xd8>
80402f54:	100027f3          	csrr	a5,sstatus
80402f58:	0027f793          	andi	a5,a5,2
80402f5c:	0c079663          	bnez	a5,80403028 <kfree+0xf4>
80402f60:	00098797          	auipc	a5,0x98
80402f64:	8c07a783          	lw	a5,-1856(a5) # 8049a820 <bigblocks>
80402f68:	00000613          	li	a2,0
80402f6c:	0a078063          	beqz	a5,8040300c <kfree+0xd8>
80402f70:	00098697          	auipc	a3,0x98
80402f74:	8b068693          	addi	a3,a3,-1872 # 8049a820 <bigblocks>
80402f78:	00c0006f          	j	80402f84 <kfree+0x50>
80402f7c:	00848693          	addi	a3,s1,8
80402f80:	08078463          	beqz	a5,80403008 <kfree+0xd4>
80402f84:	0047a703          	lw	a4,4(a5)
80402f88:	00078493          	mv	s1,a5
80402f8c:	0087a783          	lw	a5,8(a5)
80402f90:	fe8716e3          	bne	a4,s0,80402f7c <kfree+0x48>
80402f94:	00f6a023          	sw	a5,0(a3)
80402f98:	0a061663          	bnez	a2,80403044 <kfree+0x110>
80402f9c:	804007b7          	lui	a5,0x80400
80402fa0:	0004a703          	lw	a4,0(s1)
80402fa4:	0cf46263          	bltu	s0,a5,80403068 <kfree+0x134>
80402fa8:	00098697          	auipc	a3,0x98
80402fac:	8a06a683          	lw	a3,-1888(a3) # 8049a848 <va_pa_offset>
80402fb0:	40d40433          	sub	s0,s0,a3
80402fb4:	00c45413          	srli	s0,s0,0xc
80402fb8:	00098797          	auipc	a5,0x98
80402fbc:	8807a783          	lw	a5,-1920(a5) # 8049a838 <npage>
80402fc0:	08f47863          	bgeu	s0,a5,80403050 <kfree+0x11c>
80402fc4:	00012517          	auipc	a0,0x12
80402fc8:	af852503          	lw	a0,-1288(a0) # 80414abc <nbase>
80402fcc:	40a40433          	sub	s0,s0,a0
80402fd0:	00541413          	slli	s0,s0,0x5
80402fd4:	00098517          	auipc	a0,0x98
80402fd8:	86852503          	lw	a0,-1944(a0) # 8049a83c <pages>
80402fdc:	00100593          	li	a1,1
80402fe0:	00850533          	add	a0,a0,s0
80402fe4:	00e595b3          	sll	a1,a1,a4
80402fe8:	0c9010ef          	jal	ra,804048b0 <free_pages>
80402fec:	00812403          	lw	s0,8(sp)
80402ff0:	00c12083          	lw	ra,12(sp)
80402ff4:	00048513          	mv	a0,s1
80402ff8:	00412483          	lw	s1,4(sp)
80402ffc:	00c00593          	li	a1,12
80403000:	01010113          	addi	sp,sp,16
80403004:	ad9ff06f          	j	80402adc <slob_free>
80403008:	02061a63          	bnez	a2,8040303c <kfree+0x108>
8040300c:	ff840513          	addi	a0,s0,-8
80403010:	00812403          	lw	s0,8(sp)
80403014:	00c12083          	lw	ra,12(sp)
80403018:	00412483          	lw	s1,4(sp)
8040301c:	00000593          	li	a1,0
80403020:	01010113          	addi	sp,sp,16
80403024:	ab9ff06f          	j	80402adc <slob_free>
80403028:	d51fd0ef          	jal	ra,80400d78 <intr_disable>
8040302c:	00097797          	auipc	a5,0x97
80403030:	7f47a783          	lw	a5,2036(a5) # 8049a820 <bigblocks>
80403034:	00100613          	li	a2,1
80403038:	f2079ce3          	bnez	a5,80402f70 <kfree+0x3c>
8040303c:	d35fd0ef          	jal	ra,80400d70 <intr_enable>
80403040:	fcdff06f          	j	8040300c <kfree+0xd8>
80403044:	d2dfd0ef          	jal	ra,80400d70 <intr_enable>
80403048:	f55ff06f          	j	80402f9c <kfree+0x68>
8040304c:	00008067          	ret
80403050:	0000e617          	auipc	a2,0xe
80403054:	70c60613          	addi	a2,a2,1804 # 8041175c <commands+0xad8>
80403058:	06900593          	li	a1,105
8040305c:	0000e517          	auipc	a0,0xe
80403060:	72050513          	addi	a0,a0,1824 # 8041177c <commands+0xaf8>
80403064:	a68fd0ef          	jal	ra,804002cc <__panic>
80403068:	00040693          	mv	a3,s0
8040306c:	0000f617          	auipc	a2,0xf
80403070:	ac460613          	addi	a2,a2,-1340 # 80411b30 <commands+0xeac>
80403074:	07000593          	li	a1,112
80403078:	0000e517          	auipc	a0,0xe
8040307c:	70450513          	addi	a0,a0,1796 # 8041177c <commands+0xaf8>
80403080:	a4cfd0ef          	jal	ra,804002cc <__panic>

80403084 <swap_init>:
80403084:	fa010113          	addi	sp,sp,-96
80403088:	04112e23          	sw	ra,92(sp)
8040308c:	04812c23          	sw	s0,88(sp)
80403090:	04912a23          	sw	s1,84(sp)
80403094:	05212823          	sw	s2,80(sp)
80403098:	05312623          	sw	s3,76(sp)
8040309c:	05412423          	sw	s4,72(sp)
804030a0:	05512223          	sw	s5,68(sp)
804030a4:	05612023          	sw	s6,64(sp)
804030a8:	03712e23          	sw	s7,60(sp)
804030ac:	03812c23          	sw	s8,56(sp)
804030b0:	03912a23          	sw	s9,52(sp)
804030b4:	03a12823          	sw	s10,48(sp)
804030b8:	03b12623          	sw	s11,44(sp)
804030bc:	1a4080ef          	jal	ra,8040b260 <swapfs_init>
804030c0:	00097697          	auipc	a3,0x97
804030c4:	7646a683          	lw	a3,1892(a3) # 8049a824 <max_swap_offset>
804030c8:	010007b7          	lui	a5,0x1000
804030cc:	ff968713          	addi	a4,a3,-7
804030d0:	ff878793          	addi	a5,a5,-8 # fffff8 <_binary_bin_sfs_img_size+0xf87ff8>
804030d4:	4ee7ee63          	bltu	a5,a4,804035d0 <swap_init+0x54c>
804030d8:	00094797          	auipc	a5,0x94
804030dc:	f2878793          	addi	a5,a5,-216 # 80497000 <swap_manager_fifo>
804030e0:	0047a703          	lw	a4,4(a5)
804030e4:	00097697          	auipc	a3,0x97
804030e8:	74468693          	addi	a3,a3,1860 # 8049a828 <sm>
804030ec:	00f6a023          	sw	a5,0(a3)
804030f0:	000700e7          	jalr	a4 # 1000 <_binary_bin_swap_img_size-0x7000>
804030f4:	00050913          	mv	s2,a0
804030f8:	04050263          	beqz	a0,8040313c <swap_init+0xb8>
804030fc:	05c12083          	lw	ra,92(sp)
80403100:	05812403          	lw	s0,88(sp)
80403104:	05412483          	lw	s1,84(sp)
80403108:	04c12983          	lw	s3,76(sp)
8040310c:	04812a03          	lw	s4,72(sp)
80403110:	04412a83          	lw	s5,68(sp)
80403114:	04012b03          	lw	s6,64(sp)
80403118:	03c12b83          	lw	s7,60(sp)
8040311c:	03812c03          	lw	s8,56(sp)
80403120:	03412c83          	lw	s9,52(sp)
80403124:	03012d03          	lw	s10,48(sp)
80403128:	02c12d83          	lw	s11,44(sp)
8040312c:	00090513          	mv	a0,s2
80403130:	05012903          	lw	s2,80(sp)
80403134:	06010113          	addi	sp,sp,96
80403138:	00008067          	ret
8040313c:	00097797          	auipc	a5,0x97
80403140:	6ec78793          	addi	a5,a5,1772 # 8049a828 <sm>
80403144:	0007a783          	lw	a5,0(a5)
80403148:	0000f517          	auipc	a0,0xf
8040314c:	a3850513          	addi	a0,a0,-1480 # 80411b80 <commands+0xefc>
80403150:	00094417          	auipc	s0,0x94
80403154:	66840413          	addi	s0,s0,1640 # 804977b8 <free_area>
80403158:	0007a583          	lw	a1,0(a5)
8040315c:	00100793          	li	a5,1
80403160:	00097717          	auipc	a4,0x97
80403164:	6cf72623          	sw	a5,1740(a4) # 8049a82c <swap_init_ok>
80403168:	fe1fc0ef          	jal	ra,80400148 <cprintf>
8040316c:	00442783          	lw	a5,4(s0)
80403170:	00000d93          	li	s11,0
80403174:	00000d13          	li	s10,0
80403178:	3a878063          	beq	a5,s0,80403518 <swap_init+0x494>
8040317c:	ff87a683          	lw	a3,-8(a5)
80403180:	0026f693          	andi	a3,a3,2
80403184:	38068e63          	beqz	a3,80403520 <swap_init+0x49c>
80403188:	ffc7a683          	lw	a3,-4(a5)
8040318c:	0047a783          	lw	a5,4(a5)
80403190:	001d0d13          	addi	s10,s10,1
80403194:	00dd8db3          	add	s11,s11,a3
80403198:	000d8493          	mv	s1,s11
8040319c:	fe8790e3          	bne	a5,s0,8040317c <swap_init+0xf8>
804031a0:	774010ef          	jal	ra,80404914 <nr_free_pages>
804031a4:	54a49263          	bne	s1,a0,804036e8 <swap_init+0x664>
804031a8:	000d8613          	mv	a2,s11
804031ac:	000d0593          	mv	a1,s10
804031b0:	0000f517          	auipc	a0,0xf
804031b4:	a1050513          	addi	a0,a0,-1520 # 80411bc0 <commands+0xf3c>
804031b8:	f91fc0ef          	jal	ra,80400148 <cprintf>
804031bc:	decfe0ef          	jal	ra,804017a8 <mm_create>
804031c0:	00050a13          	mv	s4,a0
804031c4:	60050263          	beqz	a0,804037c8 <swap_init+0x744>
804031c8:	00097797          	auipc	a5,0x97
804031cc:	64878793          	addi	a5,a5,1608 # 8049a810 <check_mm_struct>
804031d0:	0007a683          	lw	a3,0(a5)
804031d4:	60069a63          	bnez	a3,804037e8 <swap_init+0x764>
804031d8:	00097a97          	auipc	s5,0x97
804031dc:	65caaa83          	lw	s5,1628(s5) # 8049a834 <boot_pgdir>
804031e0:	000aa683          	lw	a3,0(s5)
804031e4:	00a7a023          	sw	a0,0(a5)
804031e8:	01552623          	sw	s5,12(a0)
804031ec:	48069e63          	bnez	a3,80403688 <swap_init+0x604>
804031f0:	000065b7          	lui	a1,0x6
804031f4:	00300613          	li	a2,3
804031f8:	00001537          	lui	a0,0x1
804031fc:	e18fe0ef          	jal	ra,80401814 <vma_create>
80403200:	00050593          	mv	a1,a0
80403204:	4a050263          	beqz	a0,804036a8 <swap_init+0x624>
80403208:	000a0513          	mv	a0,s4
8040320c:	eb4fe0ef          	jal	ra,804018c0 <insert_vma_struct>
80403210:	0000f517          	auipc	a0,0xf
80403214:	9f050513          	addi	a0,a0,-1552 # 80411c00 <commands+0xf7c>
80403218:	f31fc0ef          	jal	ra,80400148 <cprintf>
8040321c:	00ca2503          	lw	a0,12(s4) # 100c <_binary_bin_swap_img_size-0x6ff4>
80403220:	00100613          	li	a2,1
80403224:	000015b7          	lui	a1,0x1
80403228:	744010ef          	jal	ra,8040496c <get_pte>
8040322c:	48050e63          	beqz	a0,804036c8 <swap_init+0x644>
80403230:	0000f517          	auipc	a0,0xf
80403234:	a1850513          	addi	a0,a0,-1512 # 80411c48 <commands+0xfc4>
80403238:	00094497          	auipc	s1,0x94
8040323c:	52048493          	addi	s1,s1,1312 # 80497758 <check_rp>
80403240:	f09fc0ef          	jal	ra,80400148 <cprintf>
80403244:	00094997          	auipc	s3,0x94
80403248:	52498993          	addi	s3,s3,1316 # 80497768 <swap_in_seq_no>
8040324c:	00048b13          	mv	s6,s1
80403250:	00100513          	li	a0,1
80403254:	588010ef          	jal	ra,804047dc <alloc_pages>
80403258:	00ab2023          	sw	a0,0(s6)
8040325c:	34050a63          	beqz	a0,804035b0 <swap_init+0x52c>
80403260:	00452783          	lw	a5,4(a0)
80403264:	0027f793          	andi	a5,a5,2
80403268:	32079463          	bnez	a5,80403590 <swap_init+0x50c>
8040326c:	004b0b13          	addi	s6,s6,4
80403270:	ff3b10e3          	bne	s6,s3,80403250 <swap_init+0x1cc>
80403274:	00042783          	lw	a5,0(s0)
80403278:	00442b83          	lw	s7,4(s0)
8040327c:	00842023          	sw	s0,0(s0)
80403280:	00f12c23          	sw	a5,24(sp)
80403284:	00842783          	lw	a5,8(s0)
80403288:	00842223          	sw	s0,4(s0)
8040328c:	00094b17          	auipc	s6,0x94
80403290:	4ccb0b13          	addi	s6,s6,1228 # 80497758 <check_rp>
80403294:	00f12e23          	sw	a5,28(sp)
80403298:	00094797          	auipc	a5,0x94
8040329c:	5207a423          	sw	zero,1320(a5) # 804977c0 <free_area+0x8>
804032a0:	000b2503          	lw	a0,0(s6)
804032a4:	00100593          	li	a1,1
804032a8:	004b0b13          	addi	s6,s6,4
804032ac:	604010ef          	jal	ra,804048b0 <free_pages>
804032b0:	ff3b18e3          	bne	s6,s3,804032a0 <swap_init+0x21c>
804032b4:	00842b03          	lw	s6,8(s0)
804032b8:	00400793          	li	a5,4
804032bc:	54fb1663          	bne	s6,a5,80403808 <swap_init+0x784>
804032c0:	0000f517          	auipc	a0,0xf
804032c4:	a0050513          	addi	a0,a0,-1536 # 80411cc0 <commands+0x103c>
804032c8:	e81fc0ef          	jal	ra,80400148 <cprintf>
804032cc:	000015b7          	lui	a1,0x1
804032d0:	00097797          	auipc	a5,0x97
804032d4:	5407a223          	sw	zero,1348(a5) # 8049a814 <pgfault_num>
804032d8:	00a00513          	li	a0,10
804032dc:	00097797          	auipc	a5,0x97
804032e0:	53878793          	addi	a5,a5,1336 # 8049a814 <pgfault_num>
804032e4:	00a58023          	sb	a0,0(a1) # 1000 <_binary_bin_swap_img_size-0x7000>
804032e8:	0007a603          	lw	a2,0(a5)
804032ec:	00100893          	li	a7,1
804032f0:	49161c63          	bne	a2,a7,80403788 <swap_init+0x704>
804032f4:	00a58823          	sb	a0,16(a1)
804032f8:	0007a583          	lw	a1,0(a5)
804032fc:	4ac59663          	bne	a1,a2,804037a8 <swap_init+0x724>
80403300:	000025b7          	lui	a1,0x2
80403304:	00b00513          	li	a0,11
80403308:	00a58023          	sb	a0,0(a1) # 2000 <_binary_bin_swap_img_size-0x6000>
8040330c:	0007a603          	lw	a2,0(a5)
80403310:	00200893          	li	a7,2
80403314:	3f161a63          	bne	a2,a7,80403708 <swap_init+0x684>
80403318:	00a58823          	sb	a0,16(a1)
8040331c:	0007a583          	lw	a1,0(a5)
80403320:	40c59463          	bne	a1,a2,80403728 <swap_init+0x6a4>
80403324:	000035b7          	lui	a1,0x3
80403328:	00c00513          	li	a0,12
8040332c:	00a58023          	sb	a0,0(a1) # 3000 <_binary_bin_swap_img_size-0x5000>
80403330:	0007a603          	lw	a2,0(a5)
80403334:	00300893          	li	a7,3
80403338:	41161863          	bne	a2,a7,80403748 <swap_init+0x6c4>
8040333c:	00a58823          	sb	a0,16(a1)
80403340:	0007a583          	lw	a1,0(a5)
80403344:	42c59263          	bne	a1,a2,80403768 <swap_init+0x6e4>
80403348:	000045b7          	lui	a1,0x4
8040334c:	00d00513          	li	a0,13
80403350:	00a58023          	sb	a0,0(a1) # 4000 <_binary_bin_swap_img_size-0x4000>
80403354:	0007a603          	lw	a2,0(a5)
80403358:	2b661863          	bne	a2,s6,80403608 <swap_init+0x584>
8040335c:	00a58823          	sb	a0,16(a1)
80403360:	0007a783          	lw	a5,0(a5)
80403364:	2cc79263          	bne	a5,a2,80403628 <swap_init+0x5a4>
80403368:	00842783          	lw	a5,8(s0)
8040336c:	2c079e63          	bnez	a5,80403648 <swap_init+0x5c4>
80403370:	00094797          	auipc	a5,0x94
80403374:	3f878793          	addi	a5,a5,1016 # 80497768 <swap_in_seq_no>
80403378:	00094617          	auipc	a2,0x94
8040337c:	41860613          	addi	a2,a2,1048 # 80497790 <swap_out_seq_no>
80403380:	00094517          	auipc	a0,0x94
80403384:	41050513          	addi	a0,a0,1040 # 80497790 <swap_out_seq_no>
80403388:	fff00593          	li	a1,-1
8040338c:	00b7a023          	sw	a1,0(a5)
80403390:	00b62023          	sw	a1,0(a2)
80403394:	00478793          	addi	a5,a5,4
80403398:	00460613          	addi	a2,a2,4
8040339c:	fef518e3          	bne	a0,a5,8040338c <swap_init+0x308>
804033a0:	00094897          	auipc	a7,0x94
804033a4:	3a888893          	addi	a7,a7,936 # 80497748 <check_ptep>
804033a8:	00094317          	auipc	t1,0x94
804033ac:	3b030313          	addi	t1,t1,944 # 80497758 <check_rp>
804033b0:	000015b7          	lui	a1,0x1
804033b4:	00097c17          	auipc	s8,0x97
804033b8:	484c0c13          	addi	s8,s8,1156 # 8049a838 <npage>
804033bc:	00097c97          	auipc	s9,0x97
804033c0:	480c8c93          	addi	s9,s9,1152 # 8049a83c <pages>
804033c4:	0008a023          	sw	zero,0(a7)
804033c8:	00000613          	li	a2,0
804033cc:	000a8513          	mv	a0,s5
804033d0:	00612a23          	sw	t1,20(sp)
804033d4:	00b12823          	sw	a1,16(sp)
804033d8:	01112623          	sw	a7,12(sp)
804033dc:	590010ef          	jal	ra,8040496c <get_pte>
804033e0:	00c12883          	lw	a7,12(sp)
804033e4:	01012583          	lw	a1,16(sp)
804033e8:	01412303          	lw	t1,20(sp)
804033ec:	00a8a023          	sw	a0,0(a7)
804033f0:	1e050c63          	beqz	a0,804035e8 <swap_init+0x564>
804033f4:	00052783          	lw	a5,0(a0)
804033f8:	0017f613          	andi	a2,a5,1
804033fc:	16060263          	beqz	a2,80403560 <swap_init+0x4dc>
80403400:	000c2603          	lw	a2,0(s8)
80403404:	00279793          	slli	a5,a5,0x2
80403408:	00c7d793          	srli	a5,a5,0xc
8040340c:	16c7f663          	bgeu	a5,a2,80403578 <swap_init+0x4f4>
80403410:	00011717          	auipc	a4,0x11
80403414:	6ac70713          	addi	a4,a4,1708 # 80414abc <nbase>
80403418:	00072b03          	lw	s6,0(a4)
8040341c:	000ca603          	lw	a2,0(s9)
80403420:	00032503          	lw	a0,0(t1)
80403424:	416787b3          	sub	a5,a5,s6
80403428:	00579793          	slli	a5,a5,0x5
8040342c:	00f607b3          	add	a5,a2,a5
80403430:	10f51863          	bne	a0,a5,80403540 <swap_init+0x4bc>
80403434:	000017b7          	lui	a5,0x1
80403438:	00f585b3          	add	a1,a1,a5
8040343c:	000057b7          	lui	a5,0x5
80403440:	00488893          	addi	a7,a7,4
80403444:	00430313          	addi	t1,t1,4
80403448:	f6f59ee3          	bne	a1,a5,804033c4 <swap_init+0x340>
8040344c:	0000f517          	auipc	a0,0xf
80403450:	94c50513          	addi	a0,a0,-1716 # 80411d98 <commands+0x1114>
80403454:	cf5fc0ef          	jal	ra,80400148 <cprintf>
80403458:	00097797          	auipc	a5,0x97
8040345c:	3d078793          	addi	a5,a5,976 # 8049a828 <sm>
80403460:	0007a783          	lw	a5,0(a5)
80403464:	01c7a783          	lw	a5,28(a5)
80403468:	000780e7          	jalr	a5
8040346c:	1e051e63          	bnez	a0,80403668 <swap_init+0x5e4>
80403470:	0004a503          	lw	a0,0(s1)
80403474:	00100593          	li	a1,1
80403478:	00448493          	addi	s1,s1,4
8040347c:	434010ef          	jal	ra,804048b0 <free_pages>
80403480:	ff3498e3          	bne	s1,s3,80403470 <swap_init+0x3ec>
80403484:	000aa783          	lw	a5,0(s5)
80403488:	000c2603          	lw	a2,0(s8)
8040348c:	00279793          	slli	a5,a5,0x2
80403490:	00c7d793          	srli	a5,a5,0xc
80403494:	0ec7f263          	bgeu	a5,a2,80403578 <swap_init+0x4f4>
80403498:	000ca503          	lw	a0,0(s9)
8040349c:	416787b3          	sub	a5,a5,s6
804034a0:	00579793          	slli	a5,a5,0x5
804034a4:	00f50533          	add	a0,a0,a5
804034a8:	00100593          	li	a1,1
804034ac:	404010ef          	jal	ra,804048b0 <free_pages>
804034b0:	000aa023          	sw	zero,0(s5)
804034b4:	000a2623          	sw	zero,12(s4)
804034b8:	000a0513          	mv	a0,s4
804034bc:	cf8fe0ef          	jal	ra,804019b4 <mm_destroy>
804034c0:	00097797          	auipc	a5,0x97
804034c4:	3407a823          	sw	zero,848(a5) # 8049a810 <check_mm_struct>
804034c8:	01c12783          	lw	a5,28(sp)
804034cc:	01742223          	sw	s7,4(s0)
804034d0:	00f42423          	sw	a5,8(s0)
804034d4:	01812783          	lw	a5,24(sp)
804034d8:	00f42023          	sw	a5,0(s0)
804034dc:	008b8c63          	beq	s7,s0,804034f4 <swap_init+0x470>
804034e0:	ffcba783          	lw	a5,-4(s7)
804034e4:	004bab83          	lw	s7,4(s7)
804034e8:	fffd0d13          	addi	s10,s10,-1
804034ec:	40fd8db3          	sub	s11,s11,a5
804034f0:	fe8b98e3          	bne	s7,s0,804034e0 <swap_init+0x45c>
804034f4:	000d8613          	mv	a2,s11
804034f8:	000d0593          	mv	a1,s10
804034fc:	0000f517          	auipc	a0,0xf
80403500:	8d050513          	addi	a0,a0,-1840 # 80411dcc <commands+0x1148>
80403504:	c45fc0ef          	jal	ra,80400148 <cprintf>
80403508:	0000f517          	auipc	a0,0xf
8040350c:	8e050513          	addi	a0,a0,-1824 # 80411de8 <commands+0x1164>
80403510:	c39fc0ef          	jal	ra,80400148 <cprintf>
80403514:	be9ff06f          	j	804030fc <swap_init+0x78>
80403518:	00000493          	li	s1,0
8040351c:	c85ff06f          	j	804031a0 <swap_init+0x11c>
80403520:	0000e697          	auipc	a3,0xe
80403524:	67468693          	addi	a3,a3,1652 # 80411b94 <commands+0xf10>
80403528:	0000d617          	auipc	a2,0xd
8040352c:	79860613          	addi	a2,a2,1944 # 80410cc0 <commands+0x3c>
80403530:	0a200593          	li	a1,162
80403534:	0000e517          	auipc	a0,0xe
80403538:	63c50513          	addi	a0,a0,1596 # 80411b70 <commands+0xeec>
8040353c:	d91fc0ef          	jal	ra,804002cc <__panic>
80403540:	0000f697          	auipc	a3,0xf
80403544:	83068693          	addi	a3,a3,-2000 # 80411d70 <commands+0x10ec>
80403548:	0000d617          	auipc	a2,0xd
8040354c:	77860613          	addi	a2,a2,1912 # 80410cc0 <commands+0x3c>
80403550:	0e400593          	li	a1,228
80403554:	0000e517          	auipc	a0,0xe
80403558:	61c50513          	addi	a0,a0,1564 # 80411b70 <commands+0xeec>
8040355c:	d71fc0ef          	jal	ra,804002cc <__panic>
80403560:	0000e617          	auipc	a2,0xe
80403564:	7ec60613          	addi	a2,a2,2028 # 80411d4c <commands+0x10c8>
80403568:	07400593          	li	a1,116
8040356c:	0000e517          	auipc	a0,0xe
80403570:	21050513          	addi	a0,a0,528 # 8041177c <commands+0xaf8>
80403574:	d59fc0ef          	jal	ra,804002cc <__panic>
80403578:	0000e617          	auipc	a2,0xe
8040357c:	1e460613          	addi	a2,a2,484 # 8041175c <commands+0xad8>
80403580:	06900593          	li	a1,105
80403584:	0000e517          	auipc	a0,0xe
80403588:	1f850513          	addi	a0,a0,504 # 8041177c <commands+0xaf8>
8040358c:	d41fc0ef          	jal	ra,804002cc <__panic>
80403590:	0000e697          	auipc	a3,0xe
80403594:	6f068693          	addi	a3,a3,1776 # 80411c80 <commands+0xffc>
80403598:	0000d617          	auipc	a2,0xd
8040359c:	72860613          	addi	a2,a2,1832 # 80410cc0 <commands+0x3c>
804035a0:	0c400593          	li	a1,196
804035a4:	0000e517          	auipc	a0,0xe
804035a8:	5cc50513          	addi	a0,a0,1484 # 80411b70 <commands+0xeec>
804035ac:	d21fc0ef          	jal	ra,804002cc <__panic>
804035b0:	0000e697          	auipc	a3,0xe
804035b4:	6bc68693          	addi	a3,a3,1724 # 80411c6c <commands+0xfe8>
804035b8:	0000d617          	auipc	a2,0xd
804035bc:	70860613          	addi	a2,a2,1800 # 80410cc0 <commands+0x3c>
804035c0:	0c300593          	li	a1,195
804035c4:	0000e517          	auipc	a0,0xe
804035c8:	5ac50513          	addi	a0,a0,1452 # 80411b70 <commands+0xeec>
804035cc:	d01fc0ef          	jal	ra,804002cc <__panic>
804035d0:	0000e617          	auipc	a2,0xe
804035d4:	58460613          	addi	a2,a2,1412 # 80411b54 <commands+0xed0>
804035d8:	02500593          	li	a1,37
804035dc:	0000e517          	auipc	a0,0xe
804035e0:	59450513          	addi	a0,a0,1428 # 80411b70 <commands+0xeec>
804035e4:	ce9fc0ef          	jal	ra,804002cc <__panic>
804035e8:	0000e697          	auipc	a3,0xe
804035ec:	74c68693          	addi	a3,a3,1868 # 80411d34 <commands+0x10b0>
804035f0:	0000d617          	auipc	a2,0xd
804035f4:	6d060613          	addi	a2,a2,1744 # 80410cc0 <commands+0x3c>
804035f8:	0e300593          	li	a1,227
804035fc:	0000e517          	auipc	a0,0xe
80403600:	57450513          	addi	a0,a0,1396 # 80411b70 <commands+0xeec>
80403604:	cc9fc0ef          	jal	ra,804002cc <__panic>
80403608:	0000e697          	auipc	a3,0xe
8040360c:	2d468693          	addi	a3,a3,724 # 804118dc <commands+0xc58>
80403610:	0000d617          	auipc	a2,0xd
80403614:	6b060613          	addi	a2,a2,1712 # 80410cc0 <commands+0x3c>
80403618:	08900593          	li	a1,137
8040361c:	0000e517          	auipc	a0,0xe
80403620:	55450513          	addi	a0,a0,1364 # 80411b70 <commands+0xeec>
80403624:	ca9fc0ef          	jal	ra,804002cc <__panic>
80403628:	0000e697          	auipc	a3,0xe
8040362c:	2b468693          	addi	a3,a3,692 # 804118dc <commands+0xc58>
80403630:	0000d617          	auipc	a2,0xd
80403634:	69060613          	addi	a2,a2,1680 # 80410cc0 <commands+0x3c>
80403638:	08b00593          	li	a1,139
8040363c:	0000e517          	auipc	a0,0xe
80403640:	53450513          	addi	a0,a0,1332 # 80411b70 <commands+0xeec>
80403644:	c89fc0ef          	jal	ra,804002cc <__panic>
80403648:	0000e697          	auipc	a3,0xe
8040364c:	6dc68693          	addi	a3,a3,1756 # 80411d24 <commands+0x10a0>
80403650:	0000d617          	auipc	a2,0xd
80403654:	67060613          	addi	a2,a2,1648 # 80410cc0 <commands+0x3c>
80403658:	0da00593          	li	a1,218
8040365c:	0000e517          	auipc	a0,0xe
80403660:	51450513          	addi	a0,a0,1300 # 80411b70 <commands+0xeec>
80403664:	c69fc0ef          	jal	ra,804002cc <__panic>
80403668:	0000e697          	auipc	a3,0xe
8040366c:	75868693          	addi	a3,a3,1880 # 80411dc0 <commands+0x113c>
80403670:	0000d617          	auipc	a2,0xd
80403674:	65060613          	addi	a2,a2,1616 # 80410cc0 <commands+0x3c>
80403678:	0ea00593          	li	a1,234
8040367c:	0000e517          	auipc	a0,0xe
80403680:	4f450513          	addi	a0,a0,1268 # 80411b70 <commands+0xeec>
80403684:	c49fc0ef          	jal	ra,804002cc <__panic>
80403688:	0000e697          	auipc	a3,0xe
8040368c:	09468693          	addi	a3,a3,148 # 8041171c <commands+0xa98>
80403690:	0000d617          	auipc	a2,0xd
80403694:	63060613          	addi	a2,a2,1584 # 80410cc0 <commands+0x3c>
80403698:	0b200593          	li	a1,178
8040369c:	0000e517          	auipc	a0,0xe
804036a0:	4d450513          	addi	a0,a0,1236 # 80411b70 <commands+0xeec>
804036a4:	c29fc0ef          	jal	ra,804002cc <__panic>
804036a8:	0000e697          	auipc	a3,0xe
804036ac:	14068693          	addi	a3,a3,320 # 804117e8 <commands+0xb64>
804036b0:	0000d617          	auipc	a2,0xd
804036b4:	61060613          	addi	a2,a2,1552 # 80410cc0 <commands+0x3c>
804036b8:	0b600593          	li	a1,182
804036bc:	0000e517          	auipc	a0,0xe
804036c0:	4b450513          	addi	a0,a0,1204 # 80411b70 <commands+0xeec>
804036c4:	c09fc0ef          	jal	ra,804002cc <__panic>
804036c8:	0000e697          	auipc	a3,0xe
804036cc:	56c68693          	addi	a3,a3,1388 # 80411c34 <commands+0xfb0>
804036d0:	0000d617          	auipc	a2,0xd
804036d4:	5f060613          	addi	a2,a2,1520 # 80410cc0 <commands+0x3c>
804036d8:	0be00593          	li	a1,190
804036dc:	0000e517          	auipc	a0,0xe
804036e0:	49450513          	addi	a0,a0,1172 # 80411b70 <commands+0xeec>
804036e4:	be9fc0ef          	jal	ra,804002cc <__panic>
804036e8:	0000e697          	auipc	a3,0xe
804036ec:	4bc68693          	addi	a3,a3,1212 # 80411ba4 <commands+0xf20>
804036f0:	0000d617          	auipc	a2,0xd
804036f4:	5d060613          	addi	a2,a2,1488 # 80410cc0 <commands+0x3c>
804036f8:	0a500593          	li	a1,165
804036fc:	0000e517          	auipc	a0,0xe
80403700:	47450513          	addi	a0,a0,1140 # 80411b70 <commands+0xeec>
80403704:	bc9fc0ef          	jal	ra,804002cc <__panic>
80403708:	0000e697          	auipc	a3,0xe
8040370c:	5f468693          	addi	a3,a3,1524 # 80411cfc <commands+0x1078>
80403710:	0000d617          	auipc	a2,0xd
80403714:	5b060613          	addi	a2,a2,1456 # 80410cc0 <commands+0x3c>
80403718:	08100593          	li	a1,129
8040371c:	0000e517          	auipc	a0,0xe
80403720:	45450513          	addi	a0,a0,1108 # 80411b70 <commands+0xeec>
80403724:	ba9fc0ef          	jal	ra,804002cc <__panic>
80403728:	0000e697          	auipc	a3,0xe
8040372c:	5d468693          	addi	a3,a3,1492 # 80411cfc <commands+0x1078>
80403730:	0000d617          	auipc	a2,0xd
80403734:	59060613          	addi	a2,a2,1424 # 80410cc0 <commands+0x3c>
80403738:	08300593          	li	a1,131
8040373c:	0000e517          	auipc	a0,0xe
80403740:	43450513          	addi	a0,a0,1076 # 80411b70 <commands+0xeec>
80403744:	b89fc0ef          	jal	ra,804002cc <__panic>
80403748:	0000e697          	auipc	a3,0xe
8040374c:	5c868693          	addi	a3,a3,1480 # 80411d10 <commands+0x108c>
80403750:	0000d617          	auipc	a2,0xd
80403754:	57060613          	addi	a2,a2,1392 # 80410cc0 <commands+0x3c>
80403758:	08500593          	li	a1,133
8040375c:	0000e517          	auipc	a0,0xe
80403760:	41450513          	addi	a0,a0,1044 # 80411b70 <commands+0xeec>
80403764:	b69fc0ef          	jal	ra,804002cc <__panic>
80403768:	0000e697          	auipc	a3,0xe
8040376c:	5a868693          	addi	a3,a3,1448 # 80411d10 <commands+0x108c>
80403770:	0000d617          	auipc	a2,0xd
80403774:	55060613          	addi	a2,a2,1360 # 80410cc0 <commands+0x3c>
80403778:	08700593          	li	a1,135
8040377c:	0000e517          	auipc	a0,0xe
80403780:	3f450513          	addi	a0,a0,1012 # 80411b70 <commands+0xeec>
80403784:	b49fc0ef          	jal	ra,804002cc <__panic>
80403788:	0000e697          	auipc	a3,0xe
8040378c:	56068693          	addi	a3,a3,1376 # 80411ce8 <commands+0x1064>
80403790:	0000d617          	auipc	a2,0xd
80403794:	53060613          	addi	a2,a2,1328 # 80410cc0 <commands+0x3c>
80403798:	07d00593          	li	a1,125
8040379c:	0000e517          	auipc	a0,0xe
804037a0:	3d450513          	addi	a0,a0,980 # 80411b70 <commands+0xeec>
804037a4:	b29fc0ef          	jal	ra,804002cc <__panic>
804037a8:	0000e697          	auipc	a3,0xe
804037ac:	54068693          	addi	a3,a3,1344 # 80411ce8 <commands+0x1064>
804037b0:	0000d617          	auipc	a2,0xd
804037b4:	51060613          	addi	a2,a2,1296 # 80410cc0 <commands+0x3c>
804037b8:	07f00593          	li	a1,127
804037bc:	0000e517          	auipc	a0,0xe
804037c0:	3b450513          	addi	a0,a0,948 # 80411b70 <commands+0xeec>
804037c4:	b09fc0ef          	jal	ra,804002cc <__panic>
804037c8:	0000e697          	auipc	a3,0xe
804037cc:	d9868693          	addi	a3,a3,-616 # 80411560 <commands+0x8dc>
804037d0:	0000d617          	auipc	a2,0xd
804037d4:	4f060613          	addi	a2,a2,1264 # 80410cc0 <commands+0x3c>
804037d8:	0aa00593          	li	a1,170
804037dc:	0000e517          	auipc	a0,0xe
804037e0:	39450513          	addi	a0,a0,916 # 80411b70 <commands+0xeec>
804037e4:	ae9fc0ef          	jal	ra,804002cc <__panic>
804037e8:	0000e697          	auipc	a3,0xe
804037ec:	40068693          	addi	a3,a3,1024 # 80411be8 <commands+0xf64>
804037f0:	0000d617          	auipc	a2,0xd
804037f4:	4d060613          	addi	a2,a2,1232 # 80410cc0 <commands+0x3c>
804037f8:	0ad00593          	li	a1,173
804037fc:	0000e517          	auipc	a0,0xe
80403800:	37450513          	addi	a0,a0,884 # 80411b70 <commands+0xeec>
80403804:	ac9fc0ef          	jal	ra,804002cc <__panic>
80403808:	0000e697          	auipc	a3,0xe
8040380c:	49468693          	addi	a3,a3,1172 # 80411c9c <commands+0x1018>
80403810:	0000d617          	auipc	a2,0xd
80403814:	4b060613          	addi	a2,a2,1200 # 80410cc0 <commands+0x3c>
80403818:	0d100593          	li	a1,209
8040381c:	0000e517          	auipc	a0,0xe
80403820:	35450513          	addi	a0,a0,852 # 80411b70 <commands+0xeec>
80403824:	aa9fc0ef          	jal	ra,804002cc <__panic>

80403828 <swap_init_mm>:
80403828:	00097797          	auipc	a5,0x97
8040382c:	0007a783          	lw	a5,0(a5) # 8049a828 <sm>
80403830:	0087a783          	lw	a5,8(a5)
80403834:	00078067          	jr	a5

80403838 <swap_map_swappable>:
80403838:	00097797          	auipc	a5,0x97
8040383c:	ff07a783          	lw	a5,-16(a5) # 8049a828 <sm>
80403840:	0107a783          	lw	a5,16(a5)
80403844:	00078067          	jr	a5

80403848 <swap_out>:
80403848:	fc010113          	addi	sp,sp,-64
8040384c:	02112e23          	sw	ra,60(sp)
80403850:	02812c23          	sw	s0,56(sp)
80403854:	02912a23          	sw	s1,52(sp)
80403858:	03212823          	sw	s2,48(sp)
8040385c:	03312623          	sw	s3,44(sp)
80403860:	03412423          	sw	s4,40(sp)
80403864:	03512223          	sw	s5,36(sp)
80403868:	03612023          	sw	s6,32(sp)
8040386c:	01712e23          	sw	s7,28(sp)
80403870:	01812c23          	sw	s8,24(sp)
80403874:	14058c63          	beqz	a1,804039cc <swap_out+0x184>
80403878:	00058a13          	mv	s4,a1
8040387c:	00050913          	mv	s2,a0
80403880:	00060a93          	mv	s5,a2
80403884:	00000413          	li	s0,0
80403888:	00097997          	auipc	s3,0x97
8040388c:	fa098993          	addi	s3,s3,-96 # 8049a828 <sm>
80403890:	0000eb17          	auipc	s6,0xe
80403894:	5d4b0b13          	addi	s6,s6,1492 # 80411e64 <commands+0x11e0>
80403898:	0000eb97          	auipc	s7,0xe
8040389c:	5b4b8b93          	addi	s7,s7,1460 # 80411e4c <commands+0x11c8>
804038a0:	0580006f          	j	804038f8 <swap_out+0xb0>
804038a4:	00c12783          	lw	a5,12(sp)
804038a8:	00048613          	mv	a2,s1
804038ac:	00040593          	mv	a1,s0
804038b0:	01c7a683          	lw	a3,28(a5)
804038b4:	000b0513          	mv	a0,s6
804038b8:	00140413          	addi	s0,s0,1
804038bc:	00c6d693          	srli	a3,a3,0xc
804038c0:	00168693          	addi	a3,a3,1
804038c4:	885fc0ef          	jal	ra,80400148 <cprintf>
804038c8:	00c12503          	lw	a0,12(sp)
804038cc:	00100593          	li	a1,1
804038d0:	01c52783          	lw	a5,28(a0)
804038d4:	00c7d793          	srli	a5,a5,0xc
804038d8:	00178793          	addi	a5,a5,1
804038dc:	00879793          	slli	a5,a5,0x8
804038e0:	00fc2023          	sw	a5,0(s8)
804038e4:	7cd000ef          	jal	ra,804048b0 <free_pages>
804038e8:	00c92503          	lw	a0,12(s2)
804038ec:	00048593          	mv	a1,s1
804038f0:	3f9010ef          	jal	ra,804054e8 <tlb_invalidate>
804038f4:	088a0863          	beq	s4,s0,80403984 <swap_out+0x13c>
804038f8:	0009a783          	lw	a5,0(s3)
804038fc:	000a8613          	mv	a2,s5
80403900:	00c10593          	addi	a1,sp,12
80403904:	0187a783          	lw	a5,24(a5)
80403908:	00090513          	mv	a0,s2
8040390c:	000780e7          	jalr	a5
80403910:	0a051463          	bnez	a0,804039b8 <swap_out+0x170>
80403914:	00c12783          	lw	a5,12(sp)
80403918:	00c92503          	lw	a0,12(s2)
8040391c:	00000613          	li	a2,0
80403920:	01c7a483          	lw	s1,28(a5)
80403924:	00048593          	mv	a1,s1
80403928:	044010ef          	jal	ra,8040496c <get_pte>
8040392c:	00052783          	lw	a5,0(a0)
80403930:	00050c13          	mv	s8,a0
80403934:	0017f793          	andi	a5,a5,1
80403938:	08078e63          	beqz	a5,804039d4 <swap_out+0x18c>
8040393c:	00c12583          	lw	a1,12(sp)
80403940:	01c5a783          	lw	a5,28(a1) # 101c <_binary_bin_swap_img_size-0x6fe4>
80403944:	00c7d793          	srli	a5,a5,0xc
80403948:	00178793          	addi	a5,a5,1
8040394c:	00879513          	slli	a0,a5,0x8
80403950:	209070ef          	jal	ra,8040b358 <swapfs_write>
80403954:	f40508e3          	beqz	a0,804038a4 <swap_out+0x5c>
80403958:	000b8513          	mv	a0,s7
8040395c:	fecfc0ef          	jal	ra,80400148 <cprintf>
80403960:	0009a783          	lw	a5,0(s3)
80403964:	00c12603          	lw	a2,12(sp)
80403968:	00000693          	li	a3,0
8040396c:	0107a783          	lw	a5,16(a5)
80403970:	00048593          	mv	a1,s1
80403974:	00090513          	mv	a0,s2
80403978:	00140413          	addi	s0,s0,1
8040397c:	000780e7          	jalr	a5
80403980:	f68a1ce3          	bne	s4,s0,804038f8 <swap_out+0xb0>
80403984:	03c12083          	lw	ra,60(sp)
80403988:	00040513          	mv	a0,s0
8040398c:	03812403          	lw	s0,56(sp)
80403990:	03412483          	lw	s1,52(sp)
80403994:	03012903          	lw	s2,48(sp)
80403998:	02c12983          	lw	s3,44(sp)
8040399c:	02812a03          	lw	s4,40(sp)
804039a0:	02412a83          	lw	s5,36(sp)
804039a4:	02012b03          	lw	s6,32(sp)
804039a8:	01c12b83          	lw	s7,28(sp)
804039ac:	01812c03          	lw	s8,24(sp)
804039b0:	04010113          	addi	sp,sp,64
804039b4:	00008067          	ret
804039b8:	00040593          	mv	a1,s0
804039bc:	0000e517          	auipc	a0,0xe
804039c0:	44850513          	addi	a0,a0,1096 # 80411e04 <commands+0x1180>
804039c4:	f84fc0ef          	jal	ra,80400148 <cprintf>
804039c8:	fbdff06f          	j	80403984 <swap_out+0x13c>
804039cc:	00000413          	li	s0,0
804039d0:	fb5ff06f          	j	80403984 <swap_out+0x13c>
804039d4:	0000e697          	auipc	a3,0xe
804039d8:	46068693          	addi	a3,a3,1120 # 80411e34 <commands+0x11b0>
804039dc:	0000d617          	auipc	a2,0xd
804039e0:	2e460613          	addi	a2,a2,740 # 80410cc0 <commands+0x3c>
804039e4:	05500593          	li	a1,85
804039e8:	0000e517          	auipc	a0,0xe
804039ec:	18850513          	addi	a0,a0,392 # 80411b70 <commands+0xeec>
804039f0:	8ddfc0ef          	jal	ra,804002cc <__panic>

804039f4 <swap_in>:
804039f4:	fe010113          	addi	sp,sp,-32
804039f8:	01212823          	sw	s2,16(sp)
804039fc:	00050913          	mv	s2,a0
80403a00:	00100513          	li	a0,1
80403a04:	00912a23          	sw	s1,20(sp)
80403a08:	01312623          	sw	s3,12(sp)
80403a0c:	00112e23          	sw	ra,28(sp)
80403a10:	00812c23          	sw	s0,24(sp)
80403a14:	00058493          	mv	s1,a1
80403a18:	00060993          	mv	s3,a2
80403a1c:	5c1000ef          	jal	ra,804047dc <alloc_pages>
80403a20:	06050263          	beqz	a0,80403a84 <swap_in+0x90>
80403a24:	00050413          	mv	s0,a0
80403a28:	00c92503          	lw	a0,12(s2)
80403a2c:	00000613          	li	a2,0
80403a30:	00048593          	mv	a1,s1
80403a34:	739000ef          	jal	ra,8040496c <get_pte>
80403a38:	00050913          	mv	s2,a0
80403a3c:	00052503          	lw	a0,0(a0)
80403a40:	00040593          	mv	a1,s0
80403a44:	069070ef          	jal	ra,8040b2ac <swapfs_read>
80403a48:	00092583          	lw	a1,0(s2)
80403a4c:	00048613          	mv	a2,s1
80403a50:	0000e517          	auipc	a0,0xe
80403a54:	46450513          	addi	a0,a0,1124 # 80411eb4 <commands+0x1230>
80403a58:	0085d593          	srli	a1,a1,0x8
80403a5c:	eecfc0ef          	jal	ra,80400148 <cprintf>
80403a60:	01c12083          	lw	ra,28(sp)
80403a64:	0089a023          	sw	s0,0(s3)
80403a68:	01812403          	lw	s0,24(sp)
80403a6c:	01412483          	lw	s1,20(sp)
80403a70:	01012903          	lw	s2,16(sp)
80403a74:	00c12983          	lw	s3,12(sp)
80403a78:	00000513          	li	a0,0
80403a7c:	02010113          	addi	sp,sp,32
80403a80:	00008067          	ret
80403a84:	0000e697          	auipc	a3,0xe
80403a88:	42068693          	addi	a3,a3,1056 # 80411ea4 <commands+0x1220>
80403a8c:	0000d617          	auipc	a2,0xd
80403a90:	23460613          	addi	a2,a2,564 # 80410cc0 <commands+0x3c>
80403a94:	06b00593          	li	a1,107
80403a98:	0000e517          	auipc	a0,0xe
80403a9c:	0d850513          	addi	a0,a0,216 # 80411b70 <commands+0xeec>
80403aa0:	82dfc0ef          	jal	ra,804002cc <__panic>

80403aa4 <default_init>:
80403aa4:	00094797          	auipc	a5,0x94
80403aa8:	d1478793          	addi	a5,a5,-748 # 804977b8 <free_area>
80403aac:	00f7a223          	sw	a5,4(a5)
80403ab0:	00f7a023          	sw	a5,0(a5)
80403ab4:	0007a423          	sw	zero,8(a5)
80403ab8:	00008067          	ret

80403abc <default_nr_free_pages>:
80403abc:	00094517          	auipc	a0,0x94
80403ac0:	d0452503          	lw	a0,-764(a0) # 804977c0 <free_area+0x8>
80403ac4:	00008067          	ret

80403ac8 <default_check>:
80403ac8:	fd010113          	addi	sp,sp,-48
80403acc:	02912223          	sw	s1,36(sp)
80403ad0:	00094497          	auipc	s1,0x94
80403ad4:	ce848493          	addi	s1,s1,-792 # 804977b8 <free_area>
80403ad8:	0044a783          	lw	a5,4(s1)
80403adc:	02112623          	sw	ra,44(sp)
80403ae0:	02812423          	sw	s0,40(sp)
80403ae4:	03212023          	sw	s2,32(sp)
80403ae8:	01312e23          	sw	s3,28(sp)
80403aec:	01412c23          	sw	s4,24(sp)
80403af0:	01512a23          	sw	s5,20(sp)
80403af4:	01612823          	sw	s6,16(sp)
80403af8:	01712623          	sw	s7,12(sp)
80403afc:	01812423          	sw	s8,8(sp)
80403b00:	38978a63          	beq	a5,s1,80403e94 <default_check+0x3cc>
80403b04:	00000413          	li	s0,0
80403b08:	00000913          	li	s2,0
80403b0c:	ff87a703          	lw	a4,-8(a5)
80403b10:	00277713          	andi	a4,a4,2
80403b14:	38070863          	beqz	a4,80403ea4 <default_check+0x3dc>
80403b18:	ffc7a703          	lw	a4,-4(a5)
80403b1c:	0047a783          	lw	a5,4(a5)
80403b20:	00190913          	addi	s2,s2,1
80403b24:	00e40433          	add	s0,s0,a4
80403b28:	00040993          	mv	s3,s0
80403b2c:	fe9790e3          	bne	a5,s1,80403b0c <default_check+0x44>
80403b30:	5e5000ef          	jal	ra,80404914 <nr_free_pages>
80403b34:	7d351863          	bne	a0,s3,80404304 <default_check+0x83c>
80403b38:	00100513          	li	a0,1
80403b3c:	4a1000ef          	jal	ra,804047dc <alloc_pages>
80403b40:	00050a93          	mv	s5,a0
80403b44:	50050063          	beqz	a0,80404044 <default_check+0x57c>
80403b48:	00100513          	li	a0,1
80403b4c:	491000ef          	jal	ra,804047dc <alloc_pages>
80403b50:	00050993          	mv	s3,a0
80403b54:	7c050863          	beqz	a0,80404324 <default_check+0x85c>
80403b58:	00100513          	li	a0,1
80403b5c:	481000ef          	jal	ra,804047dc <alloc_pages>
80403b60:	00050a13          	mv	s4,a0
80403b64:	56050063          	beqz	a0,804040c4 <default_check+0x5fc>
80403b68:	353a8e63          	beq	s5,s3,80403ec4 <default_check+0x3fc>
80403b6c:	34aa8c63          	beq	s5,a0,80403ec4 <default_check+0x3fc>
80403b70:	34a98a63          	beq	s3,a0,80403ec4 <default_check+0x3fc>
80403b74:	000aa783          	lw	a5,0(s5)
80403b78:	36079663          	bnez	a5,80403ee4 <default_check+0x41c>
80403b7c:	0009a783          	lw	a5,0(s3)
80403b80:	36079263          	bnez	a5,80403ee4 <default_check+0x41c>
80403b84:	00052783          	lw	a5,0(a0)
80403b88:	34079e63          	bnez	a5,80403ee4 <default_check+0x41c>
80403b8c:	00097797          	auipc	a5,0x97
80403b90:	cb07a783          	lw	a5,-848(a5) # 8049a83c <pages>
80403b94:	40fa8733          	sub	a4,s5,a5
80403b98:	00011617          	auipc	a2,0x11
80403b9c:	f2462603          	lw	a2,-220(a2) # 80414abc <nbase>
80403ba0:	40575713          	srai	a4,a4,0x5
80403ba4:	00c70733          	add	a4,a4,a2
80403ba8:	00097697          	auipc	a3,0x97
80403bac:	c906a683          	lw	a3,-880(a3) # 8049a838 <npage>
80403bb0:	00c69693          	slli	a3,a3,0xc
80403bb4:	00c71713          	slli	a4,a4,0xc
80403bb8:	34d77663          	bgeu	a4,a3,80403f04 <default_check+0x43c>
80403bbc:	40f98733          	sub	a4,s3,a5
80403bc0:	40575713          	srai	a4,a4,0x5
80403bc4:	00c70733          	add	a4,a4,a2
80403bc8:	00c71713          	slli	a4,a4,0xc
80403bcc:	56d77c63          	bgeu	a4,a3,80404144 <default_check+0x67c>
80403bd0:	40f507b3          	sub	a5,a0,a5
80403bd4:	4057d793          	srai	a5,a5,0x5
80403bd8:	00c787b3          	add	a5,a5,a2
80403bdc:	00c79793          	slli	a5,a5,0xc
80403be0:	3cd7f263          	bgeu	a5,a3,80403fa4 <default_check+0x4dc>
80403be4:	00100513          	li	a0,1
80403be8:	0004ac03          	lw	s8,0(s1)
80403bec:	0044ab83          	lw	s7,4(s1)
80403bf0:	0084ab03          	lw	s6,8(s1)
80403bf4:	0094a223          	sw	s1,4(s1)
80403bf8:	0094a023          	sw	s1,0(s1)
80403bfc:	00094797          	auipc	a5,0x94
80403c00:	bc07a223          	sw	zero,-1084(a5) # 804977c0 <free_area+0x8>
80403c04:	3d9000ef          	jal	ra,804047dc <alloc_pages>
80403c08:	36051e63          	bnez	a0,80403f84 <default_check+0x4bc>
80403c0c:	00100593          	li	a1,1
80403c10:	000a8513          	mv	a0,s5
80403c14:	49d000ef          	jal	ra,804048b0 <free_pages>
80403c18:	00100593          	li	a1,1
80403c1c:	00098513          	mv	a0,s3
80403c20:	491000ef          	jal	ra,804048b0 <free_pages>
80403c24:	00100593          	li	a1,1
80403c28:	000a0513          	mv	a0,s4
80403c2c:	485000ef          	jal	ra,804048b0 <free_pages>
80403c30:	0084a703          	lw	a4,8(s1)
80403c34:	00300793          	li	a5,3
80403c38:	32f71663          	bne	a4,a5,80403f64 <default_check+0x49c>
80403c3c:	00100513          	li	a0,1
80403c40:	39d000ef          	jal	ra,804047dc <alloc_pages>
80403c44:	00050993          	mv	s3,a0
80403c48:	2e050e63          	beqz	a0,80403f44 <default_check+0x47c>
80403c4c:	00100513          	li	a0,1
80403c50:	38d000ef          	jal	ra,804047dc <alloc_pages>
80403c54:	00050a93          	mv	s5,a0
80403c58:	44050663          	beqz	a0,804040a4 <default_check+0x5dc>
80403c5c:	00100513          	li	a0,1
80403c60:	37d000ef          	jal	ra,804047dc <alloc_pages>
80403c64:	00050a13          	mv	s4,a0
80403c68:	40050e63          	beqz	a0,80404084 <default_check+0x5bc>
80403c6c:	00100513          	li	a0,1
80403c70:	36d000ef          	jal	ra,804047dc <alloc_pages>
80403c74:	3e051863          	bnez	a0,80404064 <default_check+0x59c>
80403c78:	00100593          	li	a1,1
80403c7c:	00098513          	mv	a0,s3
80403c80:	431000ef          	jal	ra,804048b0 <free_pages>
80403c84:	0044a783          	lw	a5,4(s1)
80403c88:	28978e63          	beq	a5,s1,80403f24 <default_check+0x45c>
80403c8c:	00100513          	li	a0,1
80403c90:	34d000ef          	jal	ra,804047dc <alloc_pages>
80403c94:	38a99863          	bne	s3,a0,80404024 <default_check+0x55c>
80403c98:	00100513          	li	a0,1
80403c9c:	341000ef          	jal	ra,804047dc <alloc_pages>
80403ca0:	36051263          	bnez	a0,80404004 <default_check+0x53c>
80403ca4:	0084a783          	lw	a5,8(s1)
80403ca8:	32079e63          	bnez	a5,80403fe4 <default_check+0x51c>
80403cac:	00098513          	mv	a0,s3
80403cb0:	00100593          	li	a1,1
80403cb4:	0184a023          	sw	s8,0(s1)
80403cb8:	0174a223          	sw	s7,4(s1)
80403cbc:	0164a423          	sw	s6,8(s1)
80403cc0:	3f1000ef          	jal	ra,804048b0 <free_pages>
80403cc4:	00100593          	li	a1,1
80403cc8:	000a8513          	mv	a0,s5
80403ccc:	3e5000ef          	jal	ra,804048b0 <free_pages>
80403cd0:	00100593          	li	a1,1
80403cd4:	000a0513          	mv	a0,s4
80403cd8:	3d9000ef          	jal	ra,804048b0 <free_pages>
80403cdc:	00500513          	li	a0,5
80403ce0:	2fd000ef          	jal	ra,804047dc <alloc_pages>
80403ce4:	00050993          	mv	s3,a0
80403ce8:	2c050e63          	beqz	a0,80403fc4 <default_check+0x4fc>
80403cec:	00452783          	lw	a5,4(a0)
80403cf0:	0017d793          	srli	a5,a5,0x1
80403cf4:	0017f793          	andi	a5,a5,1
80403cf8:	5a079663          	bnez	a5,804042a4 <default_check+0x7dc>
80403cfc:	00100513          	li	a0,1
80403d00:	0004ab03          	lw	s6,0(s1)
80403d04:	0044aa83          	lw	s5,4(s1)
80403d08:	0094a023          	sw	s1,0(s1)
80403d0c:	0094a223          	sw	s1,4(s1)
80403d10:	2cd000ef          	jal	ra,804047dc <alloc_pages>
80403d14:	56051863          	bnez	a0,80404284 <default_check+0x7bc>
80403d18:	04098a13          	addi	s4,s3,64
80403d1c:	000a0513          	mv	a0,s4
80403d20:	00300593          	li	a1,3
80403d24:	0084ab83          	lw	s7,8(s1)
80403d28:	00094797          	auipc	a5,0x94
80403d2c:	a807ac23          	sw	zero,-1384(a5) # 804977c0 <free_area+0x8>
80403d30:	381000ef          	jal	ra,804048b0 <free_pages>
80403d34:	00400513          	li	a0,4
80403d38:	2a5000ef          	jal	ra,804047dc <alloc_pages>
80403d3c:	52051463          	bnez	a0,80404264 <default_check+0x79c>
80403d40:	0449a783          	lw	a5,68(s3)
80403d44:	0017d793          	srli	a5,a5,0x1
80403d48:	0017f793          	andi	a5,a5,1
80403d4c:	4e078c63          	beqz	a5,80404244 <default_check+0x77c>
80403d50:	0489a703          	lw	a4,72(s3)
80403d54:	00300793          	li	a5,3
80403d58:	4ef71663          	bne	a4,a5,80404244 <default_check+0x77c>
80403d5c:	00300513          	li	a0,3
80403d60:	27d000ef          	jal	ra,804047dc <alloc_pages>
80403d64:	00050c13          	mv	s8,a0
80403d68:	4a050e63          	beqz	a0,80404224 <default_check+0x75c>
80403d6c:	00100513          	li	a0,1
80403d70:	26d000ef          	jal	ra,804047dc <alloc_pages>
80403d74:	48051863          	bnez	a0,80404204 <default_check+0x73c>
80403d78:	478a1663          	bne	s4,s8,804041e4 <default_check+0x71c>
80403d7c:	00100593          	li	a1,1
80403d80:	00098513          	mv	a0,s3
80403d84:	32d000ef          	jal	ra,804048b0 <free_pages>
80403d88:	00300593          	li	a1,3
80403d8c:	000a0513          	mv	a0,s4
80403d90:	321000ef          	jal	ra,804048b0 <free_pages>
80403d94:	0049a783          	lw	a5,4(s3)
80403d98:	02098c13          	addi	s8,s3,32
80403d9c:	0017d793          	srli	a5,a5,0x1
80403da0:	0017f793          	andi	a5,a5,1
80403da4:	42078063          	beqz	a5,804041c4 <default_check+0x6fc>
80403da8:	0089a703          	lw	a4,8(s3)
80403dac:	00100793          	li	a5,1
80403db0:	40f71a63          	bne	a4,a5,804041c4 <default_check+0x6fc>
80403db4:	004a2783          	lw	a5,4(s4)
80403db8:	0017d793          	srli	a5,a5,0x1
80403dbc:	0017f793          	andi	a5,a5,1
80403dc0:	3e078263          	beqz	a5,804041a4 <default_check+0x6dc>
80403dc4:	008a2703          	lw	a4,8(s4)
80403dc8:	00300793          	li	a5,3
80403dcc:	3cf71c63          	bne	a4,a5,804041a4 <default_check+0x6dc>
80403dd0:	00100513          	li	a0,1
80403dd4:	209000ef          	jal	ra,804047dc <alloc_pages>
80403dd8:	3aa99663          	bne	s3,a0,80404184 <default_check+0x6bc>
80403ddc:	00100593          	li	a1,1
80403de0:	2d1000ef          	jal	ra,804048b0 <free_pages>
80403de4:	00200513          	li	a0,2
80403de8:	1f5000ef          	jal	ra,804047dc <alloc_pages>
80403dec:	36aa1c63          	bne	s4,a0,80404164 <default_check+0x69c>
80403df0:	00200593          	li	a1,2
80403df4:	2bd000ef          	jal	ra,804048b0 <free_pages>
80403df8:	00100593          	li	a1,1
80403dfc:	000c0513          	mv	a0,s8
80403e00:	2b1000ef          	jal	ra,804048b0 <free_pages>
80403e04:	00500513          	li	a0,5
80403e08:	1d5000ef          	jal	ra,804047dc <alloc_pages>
80403e0c:	00050993          	mv	s3,a0
80403e10:	4a050a63          	beqz	a0,804042c4 <default_check+0x7fc>
80403e14:	00100513          	li	a0,1
80403e18:	1c5000ef          	jal	ra,804047dc <alloc_pages>
80403e1c:	30051463          	bnez	a0,80404124 <default_check+0x65c>
80403e20:	0084a783          	lw	a5,8(s1)
80403e24:	2e079063          	bnez	a5,80404104 <default_check+0x63c>
80403e28:	00500593          	li	a1,5
80403e2c:	00098513          	mv	a0,s3
80403e30:	0174a423          	sw	s7,8(s1)
80403e34:	0164a023          	sw	s6,0(s1)
80403e38:	0154a223          	sw	s5,4(s1)
80403e3c:	275000ef          	jal	ra,804048b0 <free_pages>
80403e40:	0044a783          	lw	a5,4(s1)
80403e44:	00978c63          	beq	a5,s1,80403e5c <default_check+0x394>
80403e48:	ffc7a703          	lw	a4,-4(a5)
80403e4c:	0047a783          	lw	a5,4(a5)
80403e50:	fff90913          	addi	s2,s2,-1
80403e54:	40e40433          	sub	s0,s0,a4
80403e58:	fe9798e3          	bne	a5,s1,80403e48 <default_check+0x380>
80403e5c:	28091463          	bnez	s2,804040e4 <default_check+0x61c>
80403e60:	48041263          	bnez	s0,804042e4 <default_check+0x81c>
80403e64:	02c12083          	lw	ra,44(sp)
80403e68:	02812403          	lw	s0,40(sp)
80403e6c:	02412483          	lw	s1,36(sp)
80403e70:	02012903          	lw	s2,32(sp)
80403e74:	01c12983          	lw	s3,28(sp)
80403e78:	01812a03          	lw	s4,24(sp)
80403e7c:	01412a83          	lw	s5,20(sp)
80403e80:	01012b03          	lw	s6,16(sp)
80403e84:	00c12b83          	lw	s7,12(sp)
80403e88:	00812c03          	lw	s8,8(sp)
80403e8c:	03010113          	addi	sp,sp,48
80403e90:	00008067          	ret
80403e94:	00000993          	li	s3,0
80403e98:	00000413          	li	s0,0
80403e9c:	00000913          	li	s2,0
80403ea0:	c91ff06f          	j	80403b30 <default_check+0x68>
80403ea4:	0000e697          	auipc	a3,0xe
80403ea8:	cf068693          	addi	a3,a3,-784 # 80411b94 <commands+0xf10>
80403eac:	0000d617          	auipc	a2,0xd
80403eb0:	e1460613          	addi	a2,a2,-492 # 80410cc0 <commands+0x3c>
80403eb4:	0f000593          	li	a1,240
80403eb8:	0000e517          	auipc	a0,0xe
80403ebc:	03c50513          	addi	a0,a0,60 # 80411ef4 <commands+0x1270>
80403ec0:	c0cfc0ef          	jal	ra,804002cc <__panic>
80403ec4:	0000e697          	auipc	a3,0xe
80403ec8:	09c68693          	addi	a3,a3,156 # 80411f60 <commands+0x12dc>
80403ecc:	0000d617          	auipc	a2,0xd
80403ed0:	df460613          	addi	a2,a2,-524 # 80410cc0 <commands+0x3c>
80403ed4:	0bd00593          	li	a1,189
80403ed8:	0000e517          	auipc	a0,0xe
80403edc:	01c50513          	addi	a0,a0,28 # 80411ef4 <commands+0x1270>
80403ee0:	becfc0ef          	jal	ra,804002cc <__panic>
80403ee4:	0000e697          	auipc	a3,0xe
80403ee8:	0a068693          	addi	a3,a3,160 # 80411f84 <commands+0x1300>
80403eec:	0000d617          	auipc	a2,0xd
80403ef0:	dd460613          	addi	a2,a2,-556 # 80410cc0 <commands+0x3c>
80403ef4:	0be00593          	li	a1,190
80403ef8:	0000e517          	auipc	a0,0xe
80403efc:	ffc50513          	addi	a0,a0,-4 # 80411ef4 <commands+0x1270>
80403f00:	bccfc0ef          	jal	ra,804002cc <__panic>
80403f04:	0000e697          	auipc	a3,0xe
80403f08:	0bc68693          	addi	a3,a3,188 # 80411fc0 <commands+0x133c>
80403f0c:	0000d617          	auipc	a2,0xd
80403f10:	db460613          	addi	a2,a2,-588 # 80410cc0 <commands+0x3c>
80403f14:	0c000593          	li	a1,192
80403f18:	0000e517          	auipc	a0,0xe
80403f1c:	fdc50513          	addi	a0,a0,-36 # 80411ef4 <commands+0x1270>
80403f20:	bacfc0ef          	jal	ra,804002cc <__panic>
80403f24:	0000e697          	auipc	a3,0xe
80403f28:	12468693          	addi	a3,a3,292 # 80412048 <commands+0x13c4>
80403f2c:	0000d617          	auipc	a2,0xd
80403f30:	d9460613          	addi	a2,a2,-620 # 80410cc0 <commands+0x3c>
80403f34:	0d900593          	li	a1,217
80403f38:	0000e517          	auipc	a0,0xe
80403f3c:	fbc50513          	addi	a0,a0,-68 # 80411ef4 <commands+0x1270>
80403f40:	b8cfc0ef          	jal	ra,804002cc <__panic>
80403f44:	0000e697          	auipc	a3,0xe
80403f48:	fc868693          	addi	a3,a3,-56 # 80411f0c <commands+0x1288>
80403f4c:	0000d617          	auipc	a2,0xd
80403f50:	d7460613          	addi	a2,a2,-652 # 80410cc0 <commands+0x3c>
80403f54:	0d200593          	li	a1,210
80403f58:	0000e517          	auipc	a0,0xe
80403f5c:	f9c50513          	addi	a0,a0,-100 # 80411ef4 <commands+0x1270>
80403f60:	b6cfc0ef          	jal	ra,804002cc <__panic>
80403f64:	0000e697          	auipc	a3,0xe
80403f68:	0d468693          	addi	a3,a3,212 # 80412038 <commands+0x13b4>
80403f6c:	0000d617          	auipc	a2,0xd
80403f70:	d5460613          	addi	a2,a2,-684 # 80410cc0 <commands+0x3c>
80403f74:	0d000593          	li	a1,208
80403f78:	0000e517          	auipc	a0,0xe
80403f7c:	f7c50513          	addi	a0,a0,-132 # 80411ef4 <commands+0x1270>
80403f80:	b4cfc0ef          	jal	ra,804002cc <__panic>
80403f84:	0000e697          	auipc	a3,0xe
80403f88:	09c68693          	addi	a3,a3,156 # 80412020 <commands+0x139c>
80403f8c:	0000d617          	auipc	a2,0xd
80403f90:	d3460613          	addi	a2,a2,-716 # 80410cc0 <commands+0x3c>
80403f94:	0cb00593          	li	a1,203
80403f98:	0000e517          	auipc	a0,0xe
80403f9c:	f5c50513          	addi	a0,a0,-164 # 80411ef4 <commands+0x1270>
80403fa0:	b2cfc0ef          	jal	ra,804002cc <__panic>
80403fa4:	0000e697          	auipc	a3,0xe
80403fa8:	05c68693          	addi	a3,a3,92 # 80412000 <commands+0x137c>
80403fac:	0000d617          	auipc	a2,0xd
80403fb0:	d1460613          	addi	a2,a2,-748 # 80410cc0 <commands+0x3c>
80403fb4:	0c200593          	li	a1,194
80403fb8:	0000e517          	auipc	a0,0xe
80403fbc:	f3c50513          	addi	a0,a0,-196 # 80411ef4 <commands+0x1270>
80403fc0:	b0cfc0ef          	jal	ra,804002cc <__panic>
80403fc4:	0000e697          	auipc	a3,0xe
80403fc8:	0b868693          	addi	a3,a3,184 # 8041207c <commands+0x13f8>
80403fcc:	0000d617          	auipc	a2,0xd
80403fd0:	cf460613          	addi	a2,a2,-780 # 80410cc0 <commands+0x3c>
80403fd4:	0f800593          	li	a1,248
80403fd8:	0000e517          	auipc	a0,0xe
80403fdc:	f1c50513          	addi	a0,a0,-228 # 80411ef4 <commands+0x1270>
80403fe0:	aecfc0ef          	jal	ra,804002cc <__panic>
80403fe4:	0000e697          	auipc	a3,0xe
80403fe8:	d4068693          	addi	a3,a3,-704 # 80411d24 <commands+0x10a0>
80403fec:	0000d617          	auipc	a2,0xd
80403ff0:	cd460613          	addi	a2,a2,-812 # 80410cc0 <commands+0x3c>
80403ff4:	0df00593          	li	a1,223
80403ff8:	0000e517          	auipc	a0,0xe
80403ffc:	efc50513          	addi	a0,a0,-260 # 80411ef4 <commands+0x1270>
80404000:	accfc0ef          	jal	ra,804002cc <__panic>
80404004:	0000e697          	auipc	a3,0xe
80404008:	01c68693          	addi	a3,a3,28 # 80412020 <commands+0x139c>
8040400c:	0000d617          	auipc	a2,0xd
80404010:	cb460613          	addi	a2,a2,-844 # 80410cc0 <commands+0x3c>
80404014:	0dd00593          	li	a1,221
80404018:	0000e517          	auipc	a0,0xe
8040401c:	edc50513          	addi	a0,a0,-292 # 80411ef4 <commands+0x1270>
80404020:	aacfc0ef          	jal	ra,804002cc <__panic>
80404024:	0000e697          	auipc	a3,0xe
80404028:	03c68693          	addi	a3,a3,60 # 80412060 <commands+0x13dc>
8040402c:	0000d617          	auipc	a2,0xd
80404030:	c9460613          	addi	a2,a2,-876 # 80410cc0 <commands+0x3c>
80404034:	0dc00593          	li	a1,220
80404038:	0000e517          	auipc	a0,0xe
8040403c:	ebc50513          	addi	a0,a0,-324 # 80411ef4 <commands+0x1270>
80404040:	a8cfc0ef          	jal	ra,804002cc <__panic>
80404044:	0000e697          	auipc	a3,0xe
80404048:	ec868693          	addi	a3,a3,-312 # 80411f0c <commands+0x1288>
8040404c:	0000d617          	auipc	a2,0xd
80404050:	c7460613          	addi	a2,a2,-908 # 80410cc0 <commands+0x3c>
80404054:	0b900593          	li	a1,185
80404058:	0000e517          	auipc	a0,0xe
8040405c:	e9c50513          	addi	a0,a0,-356 # 80411ef4 <commands+0x1270>
80404060:	a6cfc0ef          	jal	ra,804002cc <__panic>
80404064:	0000e697          	auipc	a3,0xe
80404068:	fbc68693          	addi	a3,a3,-68 # 80412020 <commands+0x139c>
8040406c:	0000d617          	auipc	a2,0xd
80404070:	c5460613          	addi	a2,a2,-940 # 80410cc0 <commands+0x3c>
80404074:	0d600593          	li	a1,214
80404078:	0000e517          	auipc	a0,0xe
8040407c:	e7c50513          	addi	a0,a0,-388 # 80411ef4 <commands+0x1270>
80404080:	a4cfc0ef          	jal	ra,804002cc <__panic>
80404084:	0000e697          	auipc	a3,0xe
80404088:	ec068693          	addi	a3,a3,-320 # 80411f44 <commands+0x12c0>
8040408c:	0000d617          	auipc	a2,0xd
80404090:	c3460613          	addi	a2,a2,-972 # 80410cc0 <commands+0x3c>
80404094:	0d400593          	li	a1,212
80404098:	0000e517          	auipc	a0,0xe
8040409c:	e5c50513          	addi	a0,a0,-420 # 80411ef4 <commands+0x1270>
804040a0:	a2cfc0ef          	jal	ra,804002cc <__panic>
804040a4:	0000e697          	auipc	a3,0xe
804040a8:	e8468693          	addi	a3,a3,-380 # 80411f28 <commands+0x12a4>
804040ac:	0000d617          	auipc	a2,0xd
804040b0:	c1460613          	addi	a2,a2,-1004 # 80410cc0 <commands+0x3c>
804040b4:	0d300593          	li	a1,211
804040b8:	0000e517          	auipc	a0,0xe
804040bc:	e3c50513          	addi	a0,a0,-452 # 80411ef4 <commands+0x1270>
804040c0:	a0cfc0ef          	jal	ra,804002cc <__panic>
804040c4:	0000e697          	auipc	a3,0xe
804040c8:	e8068693          	addi	a3,a3,-384 # 80411f44 <commands+0x12c0>
804040cc:	0000d617          	auipc	a2,0xd
804040d0:	bf460613          	addi	a2,a2,-1036 # 80410cc0 <commands+0x3c>
804040d4:	0bb00593          	li	a1,187
804040d8:	0000e517          	auipc	a0,0xe
804040dc:	e1c50513          	addi	a0,a0,-484 # 80411ef4 <commands+0x1270>
804040e0:	9ecfc0ef          	jal	ra,804002cc <__panic>
804040e4:	0000e697          	auipc	a3,0xe
804040e8:	0dc68693          	addi	a3,a3,220 # 804121c0 <commands+0x153c>
804040ec:	0000d617          	auipc	a2,0xd
804040f0:	bd460613          	addi	a2,a2,-1068 # 80410cc0 <commands+0x3c>
804040f4:	12500593          	li	a1,293
804040f8:	0000e517          	auipc	a0,0xe
804040fc:	dfc50513          	addi	a0,a0,-516 # 80411ef4 <commands+0x1270>
80404100:	9ccfc0ef          	jal	ra,804002cc <__panic>
80404104:	0000e697          	auipc	a3,0xe
80404108:	c2068693          	addi	a3,a3,-992 # 80411d24 <commands+0x10a0>
8040410c:	0000d617          	auipc	a2,0xd
80404110:	bb460613          	addi	a2,a2,-1100 # 80410cc0 <commands+0x3c>
80404114:	11a00593          	li	a1,282
80404118:	0000e517          	auipc	a0,0xe
8040411c:	ddc50513          	addi	a0,a0,-548 # 80411ef4 <commands+0x1270>
80404120:	9acfc0ef          	jal	ra,804002cc <__panic>
80404124:	0000e697          	auipc	a3,0xe
80404128:	efc68693          	addi	a3,a3,-260 # 80412020 <commands+0x139c>
8040412c:	0000d617          	auipc	a2,0xd
80404130:	b9460613          	addi	a2,a2,-1132 # 80410cc0 <commands+0x3c>
80404134:	11800593          	li	a1,280
80404138:	0000e517          	auipc	a0,0xe
8040413c:	dbc50513          	addi	a0,a0,-580 # 80411ef4 <commands+0x1270>
80404140:	98cfc0ef          	jal	ra,804002cc <__panic>
80404144:	0000e697          	auipc	a3,0xe
80404148:	e9c68693          	addi	a3,a3,-356 # 80411fe0 <commands+0x135c>
8040414c:	0000d617          	auipc	a2,0xd
80404150:	b7460613          	addi	a2,a2,-1164 # 80410cc0 <commands+0x3c>
80404154:	0c100593          	li	a1,193
80404158:	0000e517          	auipc	a0,0xe
8040415c:	d9c50513          	addi	a0,a0,-612 # 80411ef4 <commands+0x1270>
80404160:	96cfc0ef          	jal	ra,804002cc <__panic>
80404164:	0000e697          	auipc	a3,0xe
80404168:	01c68693          	addi	a3,a3,28 # 80412180 <commands+0x14fc>
8040416c:	0000d617          	auipc	a2,0xd
80404170:	b5460613          	addi	a2,a2,-1196 # 80410cc0 <commands+0x3c>
80404174:	11200593          	li	a1,274
80404178:	0000e517          	auipc	a0,0xe
8040417c:	d7c50513          	addi	a0,a0,-644 # 80411ef4 <commands+0x1270>
80404180:	94cfc0ef          	jal	ra,804002cc <__panic>
80404184:	0000e697          	auipc	a3,0xe
80404188:	fdc68693          	addi	a3,a3,-36 # 80412160 <commands+0x14dc>
8040418c:	0000d617          	auipc	a2,0xd
80404190:	b3460613          	addi	a2,a2,-1228 # 80410cc0 <commands+0x3c>
80404194:	11000593          	li	a1,272
80404198:	0000e517          	auipc	a0,0xe
8040419c:	d5c50513          	addi	a0,a0,-676 # 80411ef4 <commands+0x1270>
804041a0:	92cfc0ef          	jal	ra,804002cc <__panic>
804041a4:	0000e697          	auipc	a3,0xe
804041a8:	f9468693          	addi	a3,a3,-108 # 80412138 <commands+0x14b4>
804041ac:	0000d617          	auipc	a2,0xd
804041b0:	b1460613          	addi	a2,a2,-1260 # 80410cc0 <commands+0x3c>
804041b4:	10e00593          	li	a1,270
804041b8:	0000e517          	auipc	a0,0xe
804041bc:	d3c50513          	addi	a0,a0,-708 # 80411ef4 <commands+0x1270>
804041c0:	90cfc0ef          	jal	ra,804002cc <__panic>
804041c4:	0000e697          	auipc	a3,0xe
804041c8:	f4c68693          	addi	a3,a3,-180 # 80412110 <commands+0x148c>
804041cc:	0000d617          	auipc	a2,0xd
804041d0:	af460613          	addi	a2,a2,-1292 # 80410cc0 <commands+0x3c>
804041d4:	10d00593          	li	a1,269
804041d8:	0000e517          	auipc	a0,0xe
804041dc:	d1c50513          	addi	a0,a0,-740 # 80411ef4 <commands+0x1270>
804041e0:	8ecfc0ef          	jal	ra,804002cc <__panic>
804041e4:	0000e697          	auipc	a3,0xe
804041e8:	f1c68693          	addi	a3,a3,-228 # 80412100 <commands+0x147c>
804041ec:	0000d617          	auipc	a2,0xd
804041f0:	ad460613          	addi	a2,a2,-1324 # 80410cc0 <commands+0x3c>
804041f4:	10800593          	li	a1,264
804041f8:	0000e517          	auipc	a0,0xe
804041fc:	cfc50513          	addi	a0,a0,-772 # 80411ef4 <commands+0x1270>
80404200:	8ccfc0ef          	jal	ra,804002cc <__panic>
80404204:	0000e697          	auipc	a3,0xe
80404208:	e1c68693          	addi	a3,a3,-484 # 80412020 <commands+0x139c>
8040420c:	0000d617          	auipc	a2,0xd
80404210:	ab460613          	addi	a2,a2,-1356 # 80410cc0 <commands+0x3c>
80404214:	10700593          	li	a1,263
80404218:	0000e517          	auipc	a0,0xe
8040421c:	cdc50513          	addi	a0,a0,-804 # 80411ef4 <commands+0x1270>
80404220:	8acfc0ef          	jal	ra,804002cc <__panic>
80404224:	0000e697          	auipc	a3,0xe
80404228:	ebc68693          	addi	a3,a3,-324 # 804120e0 <commands+0x145c>
8040422c:	0000d617          	auipc	a2,0xd
80404230:	a9460613          	addi	a2,a2,-1388 # 80410cc0 <commands+0x3c>
80404234:	10600593          	li	a1,262
80404238:	0000e517          	auipc	a0,0xe
8040423c:	cbc50513          	addi	a0,a0,-836 # 80411ef4 <commands+0x1270>
80404240:	88cfc0ef          	jal	ra,804002cc <__panic>
80404244:	0000e697          	auipc	a3,0xe
80404248:	e7068693          	addi	a3,a3,-400 # 804120b4 <commands+0x1430>
8040424c:	0000d617          	auipc	a2,0xd
80404250:	a7460613          	addi	a2,a2,-1420 # 80410cc0 <commands+0x3c>
80404254:	10500593          	li	a1,261
80404258:	0000e517          	auipc	a0,0xe
8040425c:	c9c50513          	addi	a0,a0,-868 # 80411ef4 <commands+0x1270>
80404260:	86cfc0ef          	jal	ra,804002cc <__panic>
80404264:	0000e697          	auipc	a3,0xe
80404268:	e3868693          	addi	a3,a3,-456 # 8041209c <commands+0x1418>
8040426c:	0000d617          	auipc	a2,0xd
80404270:	a5460613          	addi	a2,a2,-1452 # 80410cc0 <commands+0x3c>
80404274:	10400593          	li	a1,260
80404278:	0000e517          	auipc	a0,0xe
8040427c:	c7c50513          	addi	a0,a0,-900 # 80411ef4 <commands+0x1270>
80404280:	84cfc0ef          	jal	ra,804002cc <__panic>
80404284:	0000e697          	auipc	a3,0xe
80404288:	d9c68693          	addi	a3,a3,-612 # 80412020 <commands+0x139c>
8040428c:	0000d617          	auipc	a2,0xd
80404290:	a3460613          	addi	a2,a2,-1484 # 80410cc0 <commands+0x3c>
80404294:	0fe00593          	li	a1,254
80404298:	0000e517          	auipc	a0,0xe
8040429c:	c5c50513          	addi	a0,a0,-932 # 80411ef4 <commands+0x1270>
804042a0:	82cfc0ef          	jal	ra,804002cc <__panic>
804042a4:	0000e697          	auipc	a3,0xe
804042a8:	de468693          	addi	a3,a3,-540 # 80412088 <commands+0x1404>
804042ac:	0000d617          	auipc	a2,0xd
804042b0:	a1460613          	addi	a2,a2,-1516 # 80410cc0 <commands+0x3c>
804042b4:	0f900593          	li	a1,249
804042b8:	0000e517          	auipc	a0,0xe
804042bc:	c3c50513          	addi	a0,a0,-964 # 80411ef4 <commands+0x1270>
804042c0:	80cfc0ef          	jal	ra,804002cc <__panic>
804042c4:	0000e697          	auipc	a3,0xe
804042c8:	edc68693          	addi	a3,a3,-292 # 804121a0 <commands+0x151c>
804042cc:	0000d617          	auipc	a2,0xd
804042d0:	9f460613          	addi	a2,a2,-1548 # 80410cc0 <commands+0x3c>
804042d4:	11700593          	li	a1,279
804042d8:	0000e517          	auipc	a0,0xe
804042dc:	c1c50513          	addi	a0,a0,-996 # 80411ef4 <commands+0x1270>
804042e0:	fedfb0ef          	jal	ra,804002cc <__panic>
804042e4:	0000e697          	auipc	a3,0xe
804042e8:	ee868693          	addi	a3,a3,-280 # 804121cc <commands+0x1548>
804042ec:	0000d617          	auipc	a2,0xd
804042f0:	9d460613          	addi	a2,a2,-1580 # 80410cc0 <commands+0x3c>
804042f4:	12600593          	li	a1,294
804042f8:	0000e517          	auipc	a0,0xe
804042fc:	bfc50513          	addi	a0,a0,-1028 # 80411ef4 <commands+0x1270>
80404300:	fcdfb0ef          	jal	ra,804002cc <__panic>
80404304:	0000e697          	auipc	a3,0xe
80404308:	8a068693          	addi	a3,a3,-1888 # 80411ba4 <commands+0xf20>
8040430c:	0000d617          	auipc	a2,0xd
80404310:	9b460613          	addi	a2,a2,-1612 # 80410cc0 <commands+0x3c>
80404314:	0f300593          	li	a1,243
80404318:	0000e517          	auipc	a0,0xe
8040431c:	bdc50513          	addi	a0,a0,-1060 # 80411ef4 <commands+0x1270>
80404320:	fadfb0ef          	jal	ra,804002cc <__panic>
80404324:	0000e697          	auipc	a3,0xe
80404328:	c0468693          	addi	a3,a3,-1020 # 80411f28 <commands+0x12a4>
8040432c:	0000d617          	auipc	a2,0xd
80404330:	99460613          	addi	a2,a2,-1644 # 80410cc0 <commands+0x3c>
80404334:	0ba00593          	li	a1,186
80404338:	0000e517          	auipc	a0,0xe
8040433c:	bbc50513          	addi	a0,a0,-1092 # 80411ef4 <commands+0x1270>
80404340:	f8dfb0ef          	jal	ra,804002cc <__panic>

80404344 <default_free_pages>:
80404344:	ff010113          	addi	sp,sp,-16
80404348:	00112623          	sw	ra,12(sp)
8040434c:	1a058863          	beqz	a1,804044fc <default_free_pages+0x1b8>
80404350:	00559693          	slli	a3,a1,0x5
80404354:	00d506b3          	add	a3,a0,a3
80404358:	00050793          	mv	a5,a0
8040435c:	02d50663          	beq	a0,a3,80404388 <default_free_pages+0x44>
80404360:	0047a703          	lw	a4,4(a5)
80404364:	00177713          	andi	a4,a4,1
80404368:	16071a63          	bnez	a4,804044dc <default_free_pages+0x198>
8040436c:	0047a703          	lw	a4,4(a5)
80404370:	00277713          	andi	a4,a4,2
80404374:	16071463          	bnez	a4,804044dc <default_free_pages+0x198>
80404378:	0007a223          	sw	zero,4(a5)
8040437c:	0007a023          	sw	zero,0(a5)
80404380:	02078793          	addi	a5,a5,32
80404384:	fcd79ee3          	bne	a5,a3,80404360 <default_free_pages+0x1c>
80404388:	00452703          	lw	a4,4(a0)
8040438c:	00093697          	auipc	a3,0x93
80404390:	42c68693          	addi	a3,a3,1068 # 804977b8 <free_area>
80404394:	0046a783          	lw	a5,4(a3)
80404398:	00276713          	ori	a4,a4,2
8040439c:	00e52223          	sw	a4,4(a0)
804043a0:	0086a703          	lw	a4,8(a3)
804043a4:	00b52423          	sw	a1,8(a0)
804043a8:	00c50613          	addi	a2,a0,12
804043ac:	00b70733          	add	a4,a4,a1
804043b0:	00e6a423          	sw	a4,8(a3)
804043b4:	0cd78c63          	beq	a5,a3,8040448c <default_free_pages+0x148>
804043b8:	ff478713          	addi	a4,a5,-12
804043bc:	0006a883          	lw	a7,0(a3)
804043c0:	00000813          	li	a6,0
804043c4:	00e56c63          	bltu	a0,a4,804043dc <default_free_pages+0x98>
804043c8:	0047a703          	lw	a4,4(a5)
804043cc:	06d70463          	beq	a4,a3,80404434 <default_free_pages+0xf0>
804043d0:	00070793          	mv	a5,a4
804043d4:	ff478713          	addi	a4,a5,-12
804043d8:	fee578e3          	bgeu	a0,a4,804043c8 <default_free_pages+0x84>
804043dc:	00080463          	beqz	a6,804043e4 <default_free_pages+0xa0>
804043e0:	0116a023          	sw	a7,0(a3)
804043e4:	0007a803          	lw	a6,0(a5)
804043e8:	00c7a023          	sw	a2,0(a5)
804043ec:	00c82223          	sw	a2,4(a6)
804043f0:	00f52823          	sw	a5,16(a0)
804043f4:	01052623          	sw	a6,12(a0)
804043f8:	02d80063          	beq	a6,a3,80404418 <default_free_pages+0xd4>
804043fc:	ffc82883          	lw	a7,-4(a6)
80404400:	ff480613          	addi	a2,a6,-12
80404404:	00589713          	slli	a4,a7,0x5
80404408:	00e60733          	add	a4,a2,a4
8040440c:	04e50663          	beq	a0,a4,80404458 <default_free_pages+0x114>
80404410:	00d78c63          	beq	a5,a3,80404428 <default_free_pages+0xe4>
80404414:	ff478713          	addi	a4,a5,-12
80404418:	00852603          	lw	a2,8(a0)
8040441c:	00561693          	slli	a3,a2,0x5
80404420:	00d506b3          	add	a3,a0,a3
80404424:	08d70263          	beq	a4,a3,804044a8 <default_free_pages+0x164>
80404428:	00c12083          	lw	ra,12(sp)
8040442c:	01010113          	addi	sp,sp,16
80404430:	00008067          	ret
80404434:	00c7a223          	sw	a2,4(a5)
80404438:	00d52823          	sw	a3,16(a0)
8040443c:	0047a703          	lw	a4,4(a5)
80404440:	00f52623          	sw	a5,12(a0)
80404444:	02d70c63          	beq	a4,a3,8040447c <default_free_pages+0x138>
80404448:	00060893          	mv	a7,a2
8040444c:	00100813          	li	a6,1
80404450:	00070793          	mv	a5,a4
80404454:	f81ff06f          	j	804043d4 <default_free_pages+0x90>
80404458:	011585b3          	add	a1,a1,a7
8040445c:	feb82e23          	sw	a1,-4(a6)
80404460:	00452703          	lw	a4,4(a0)
80404464:	ffd77713          	andi	a4,a4,-3
80404468:	00e52223          	sw	a4,4(a0)
8040446c:	00f82223          	sw	a5,4(a6)
80404470:	0107a023          	sw	a6,0(a5)
80404474:	00060513          	mv	a0,a2
80404478:	f99ff06f          	j	80404410 <default_free_pages+0xcc>
8040447c:	00078813          	mv	a6,a5
80404480:	00c6a023          	sw	a2,0(a3)
80404484:	00068793          	mv	a5,a3
80404488:	f75ff06f          	j	804043fc <default_free_pages+0xb8>
8040448c:	00c12083          	lw	ra,12(sp)
80404490:	00c7a023          	sw	a2,0(a5)
80404494:	00c7a223          	sw	a2,4(a5)
80404498:	00f52823          	sw	a5,16(a0)
8040449c:	00f52623          	sw	a5,12(a0)
804044a0:	01010113          	addi	sp,sp,16
804044a4:	00008067          	ret
804044a8:	ffc7a703          	lw	a4,-4(a5)
804044ac:	0007a583          	lw	a1,0(a5)
804044b0:	0047a683          	lw	a3,4(a5)
804044b4:	00c70633          	add	a2,a4,a2
804044b8:	00c52423          	sw	a2,8(a0)
804044bc:	ff87a703          	lw	a4,-8(a5)
804044c0:	00c12083          	lw	ra,12(sp)
804044c4:	ffd77713          	andi	a4,a4,-3
804044c8:	fee7ac23          	sw	a4,-8(a5)
804044cc:	00d5a223          	sw	a3,4(a1)
804044d0:	00b6a023          	sw	a1,0(a3)
804044d4:	01010113          	addi	sp,sp,16
804044d8:	00008067          	ret
804044dc:	0000e697          	auipc	a3,0xe
804044e0:	d0468693          	addi	a3,a3,-764 # 804121e0 <commands+0x155c>
804044e4:	0000c617          	auipc	a2,0xc
804044e8:	7dc60613          	addi	a2,a2,2012 # 80410cc0 <commands+0x3c>
804044ec:	08300593          	li	a1,131
804044f0:	0000e517          	auipc	a0,0xe
804044f4:	a0450513          	addi	a0,a0,-1532 # 80411ef4 <commands+0x1270>
804044f8:	dd5fb0ef          	jal	ra,804002cc <__panic>
804044fc:	0000e697          	auipc	a3,0xe
80404500:	cdc68693          	addi	a3,a3,-804 # 804121d8 <commands+0x1554>
80404504:	0000c617          	auipc	a2,0xc
80404508:	7bc60613          	addi	a2,a2,1980 # 80410cc0 <commands+0x3c>
8040450c:	08000593          	li	a1,128
80404510:	0000e517          	auipc	a0,0xe
80404514:	9e450513          	addi	a0,a0,-1564 # 80411ef4 <commands+0x1270>
80404518:	db5fb0ef          	jal	ra,804002cc <__panic>

8040451c <default_alloc_pages>:
8040451c:	08050e63          	beqz	a0,804045b8 <default_alloc_pages+0x9c>
80404520:	00093617          	auipc	a2,0x93
80404524:	29860613          	addi	a2,a2,664 # 804977b8 <free_area>
80404528:	00862583          	lw	a1,8(a2)
8040452c:	00050693          	mv	a3,a0
80404530:	00a5ee63          	bltu	a1,a0,8040454c <default_alloc_pages+0x30>
80404534:	00060793          	mv	a5,a2
80404538:	00c0006f          	j	80404544 <default_alloc_pages+0x28>
8040453c:	ffc7a703          	lw	a4,-4(a5)
80404540:	00d77a63          	bgeu	a4,a3,80404554 <default_alloc_pages+0x38>
80404544:	0047a783          	lw	a5,4(a5)
80404548:	fec79ae3          	bne	a5,a2,8040453c <default_alloc_pages+0x20>
8040454c:	00000513          	li	a0,0
80404550:	00008067          	ret
80404554:	0007a303          	lw	t1,0(a5)
80404558:	0047a883          	lw	a7,4(a5)
8040455c:	ff478513          	addi	a0,a5,-12
80404560:	01132223          	sw	a7,4(t1)
80404564:	0068a023          	sw	t1,0(a7)
80404568:	02e6fc63          	bgeu	a3,a4,804045a0 <default_alloc_pages+0x84>
8040456c:	00569813          	slli	a6,a3,0x5
80404570:	01050833          	add	a6,a0,a6
80404574:	00482583          	lw	a1,4(a6)
80404578:	40d70733          	sub	a4,a4,a3
8040457c:	00e82423          	sw	a4,8(a6)
80404580:	0025e713          	ori	a4,a1,2
80404584:	00e82223          	sw	a4,4(a6)
80404588:	00c80713          	addi	a4,a6,12
8040458c:	00e8a023          	sw	a4,0(a7)
80404590:	00862583          	lw	a1,8(a2)
80404594:	00e32223          	sw	a4,4(t1)
80404598:	01182823          	sw	a7,16(a6)
8040459c:	00682623          	sw	t1,12(a6)
804045a0:	40d586b3          	sub	a3,a1,a3
804045a4:	00d62423          	sw	a3,8(a2)
804045a8:	ff87a703          	lw	a4,-8(a5)
804045ac:	ffd77713          	andi	a4,a4,-3
804045b0:	fee7ac23          	sw	a4,-8(a5)
804045b4:	00008067          	ret
804045b8:	ff010113          	addi	sp,sp,-16
804045bc:	0000e697          	auipc	a3,0xe
804045c0:	c1c68693          	addi	a3,a3,-996 # 804121d8 <commands+0x1554>
804045c4:	0000c617          	auipc	a2,0xc
804045c8:	6fc60613          	addi	a2,a2,1788 # 80410cc0 <commands+0x3c>
804045cc:	06200593          	li	a1,98
804045d0:	0000e517          	auipc	a0,0xe
804045d4:	92450513          	addi	a0,a0,-1756 # 80411ef4 <commands+0x1270>
804045d8:	00112623          	sw	ra,12(sp)
804045dc:	cf1fb0ef          	jal	ra,804002cc <__panic>

804045e0 <default_init_memmap>:
804045e0:	ff010113          	addi	sp,sp,-16
804045e4:	00112623          	sw	ra,12(sp)
804045e8:	12058063          	beqz	a1,80404708 <default_init_memmap+0x128>
804045ec:	00559693          	slli	a3,a1,0x5
804045f0:	00d506b3          	add	a3,a0,a3
804045f4:	00050793          	mv	a5,a0
804045f8:	02d50263          	beq	a0,a3,8040461c <default_init_memmap+0x3c>
804045fc:	0047a703          	lw	a4,4(a5)
80404600:	00177713          	andi	a4,a4,1
80404604:	0e070263          	beqz	a4,804046e8 <default_init_memmap+0x108>
80404608:	0007a423          	sw	zero,8(a5)
8040460c:	0007a223          	sw	zero,4(a5)
80404610:	0007a023          	sw	zero,0(a5)
80404614:	02078793          	addi	a5,a5,32
80404618:	fed792e3          	bne	a5,a3,804045fc <default_init_memmap+0x1c>
8040461c:	00452703          	lw	a4,4(a0)
80404620:	00093697          	auipc	a3,0x93
80404624:	19868693          	addi	a3,a3,408 # 804977b8 <free_area>
80404628:	0046a783          	lw	a5,4(a3)
8040462c:	00276713          	ori	a4,a4,2
80404630:	00e52223          	sw	a4,4(a0)
80404634:	0086a703          	lw	a4,8(a3)
80404638:	00b52423          	sw	a1,8(a0)
8040463c:	00c50613          	addi	a2,a0,12
80404640:	00b705b3          	add	a1,a4,a1
80404644:	00b6a423          	sw	a1,8(a3)
80404648:	08d78263          	beq	a5,a3,804046cc <default_init_memmap+0xec>
8040464c:	ff478713          	addi	a4,a5,-12
80404650:	0006a803          	lw	a6,0(a3)
80404654:	00000593          	li	a1,0
80404658:	00e56c63          	bltu	a0,a4,80404670 <default_init_memmap+0x90>
8040465c:	0047a703          	lw	a4,4(a5)
80404660:	02d70c63          	beq	a4,a3,80404698 <default_init_memmap+0xb8>
80404664:	00070793          	mv	a5,a4
80404668:	ff478713          	addi	a4,a5,-12
8040466c:	fee578e3          	bgeu	a0,a4,8040465c <default_init_memmap+0x7c>
80404670:	00058463          	beqz	a1,80404678 <default_init_memmap+0x98>
80404674:	0106a023          	sw	a6,0(a3)
80404678:	0007a703          	lw	a4,0(a5)
8040467c:	00c12083          	lw	ra,12(sp)
80404680:	00c7a023          	sw	a2,0(a5)
80404684:	00c72223          	sw	a2,4(a4)
80404688:	00f52823          	sw	a5,16(a0)
8040468c:	00e52623          	sw	a4,12(a0)
80404690:	01010113          	addi	sp,sp,16
80404694:	00008067          	ret
80404698:	00c7a223          	sw	a2,4(a5)
8040469c:	00d52823          	sw	a3,16(a0)
804046a0:	0047a703          	lw	a4,4(a5)
804046a4:	00f52623          	sw	a5,12(a0)
804046a8:	00d70a63          	beq	a4,a3,804046bc <default_init_memmap+0xdc>
804046ac:	00060813          	mv	a6,a2
804046b0:	00100593          	li	a1,1
804046b4:	00070793          	mv	a5,a4
804046b8:	fb1ff06f          	j	80404668 <default_init_memmap+0x88>
804046bc:	00c12083          	lw	ra,12(sp)
804046c0:	00c6a023          	sw	a2,0(a3)
804046c4:	01010113          	addi	sp,sp,16
804046c8:	00008067          	ret
804046cc:	00c12083          	lw	ra,12(sp)
804046d0:	00c7a023          	sw	a2,0(a5)
804046d4:	00c7a223          	sw	a2,4(a5)
804046d8:	00f52823          	sw	a5,16(a0)
804046dc:	00f52623          	sw	a5,12(a0)
804046e0:	01010113          	addi	sp,sp,16
804046e4:	00008067          	ret
804046e8:	0000e697          	auipc	a3,0xe
804046ec:	b2068693          	addi	a3,a3,-1248 # 80412208 <commands+0x1584>
804046f0:	0000c617          	auipc	a2,0xc
804046f4:	5d060613          	addi	a2,a2,1488 # 80410cc0 <commands+0x3c>
804046f8:	04900593          	li	a1,73
804046fc:	0000d517          	auipc	a0,0xd
80404700:	7f850513          	addi	a0,a0,2040 # 80411ef4 <commands+0x1270>
80404704:	bc9fb0ef          	jal	ra,804002cc <__panic>
80404708:	0000e697          	auipc	a3,0xe
8040470c:	ad068693          	addi	a3,a3,-1328 # 804121d8 <commands+0x1554>
80404710:	0000c617          	auipc	a2,0xc
80404714:	5b060613          	addi	a2,a2,1456 # 80410cc0 <commands+0x3c>
80404718:	04600593          	li	a1,70
8040471c:	0000d517          	auipc	a0,0xd
80404720:	7d850513          	addi	a0,a0,2008 # 80411ef4 <commands+0x1270>
80404724:	ba9fb0ef          	jal	ra,804002cc <__panic>

80404728 <get_pgtable_items.part.0>:
80404728:	00050893          	mv	a7,a0
8040472c:	06a5f463          	bgeu	a1,a0,80404794 <get_pgtable_items.part.0+0x6c>
80404730:	00259813          	slli	a6,a1,0x2
80404734:	01060833          	add	a6,a2,a6
80404738:	00c0006f          	j	80404744 <get_pgtable_items.part.0+0x1c>
8040473c:	00480813          	addi	a6,a6,4
80404740:	0515fa63          	bgeu	a1,a7,80404794 <get_pgtable_items.part.0+0x6c>
80404744:	00082783          	lw	a5,0(a6)
80404748:	00058513          	mv	a0,a1
8040474c:	00158593          	addi	a1,a1,1
80404750:	0017f793          	andi	a5,a5,1
80404754:	fe0784e3          	beqz	a5,8040473c <get_pgtable_items.part.0+0x14>
80404758:	00a6a023          	sw	a0,0(a3)
8040475c:	00082503          	lw	a0,0(a6)
80404760:	01f57513          	andi	a0,a0,31
80404764:	0315f463          	bgeu	a1,a7,8040478c <get_pgtable_items.part.0+0x64>
80404768:	00259793          	slli	a5,a1,0x2
8040476c:	00f607b3          	add	a5,a2,a5
80404770:	00c0006f          	j	8040477c <get_pgtable_items.part.0+0x54>
80404774:	00158593          	addi	a1,a1,1
80404778:	0115fa63          	bgeu	a1,a7,8040478c <get_pgtable_items.part.0+0x64>
8040477c:	0007a683          	lw	a3,0(a5)
80404780:	00478793          	addi	a5,a5,4
80404784:	01f6f693          	andi	a3,a3,31
80404788:	fea686e3          	beq	a3,a0,80404774 <get_pgtable_items.part.0+0x4c>
8040478c:	00b72023          	sw	a1,0(a4)
80404790:	00008067          	ret
80404794:	00000513          	li	a0,0
80404798:	00008067          	ret

8040479c <pa2page.part.0>:
8040479c:	ff010113          	addi	sp,sp,-16
804047a0:	0000d617          	auipc	a2,0xd
804047a4:	fbc60613          	addi	a2,a2,-68 # 8041175c <commands+0xad8>
804047a8:	06900593          	li	a1,105
804047ac:	0000d517          	auipc	a0,0xd
804047b0:	fd050513          	addi	a0,a0,-48 # 8041177c <commands+0xaf8>
804047b4:	00112623          	sw	ra,12(sp)
804047b8:	b15fb0ef          	jal	ra,804002cc <__panic>

804047bc <pte2page.part.0>:
804047bc:	ff010113          	addi	sp,sp,-16
804047c0:	0000d617          	auipc	a2,0xd
804047c4:	58c60613          	addi	a2,a2,1420 # 80411d4c <commands+0x10c8>
804047c8:	07400593          	li	a1,116
804047cc:	0000d517          	auipc	a0,0xd
804047d0:	fb050513          	addi	a0,a0,-80 # 8041177c <commands+0xaf8>
804047d4:	00112623          	sw	ra,12(sp)
804047d8:	af5fb0ef          	jal	ra,804002cc <__panic>

804047dc <alloc_pages>:
804047dc:	fe010113          	addi	sp,sp,-32
804047e0:	00912a23          	sw	s1,20(sp)
804047e4:	01212823          	sw	s2,16(sp)
804047e8:	01312623          	sw	s3,12(sp)
804047ec:	01412423          	sw	s4,8(sp)
804047f0:	01512223          	sw	s5,4(sp)
804047f4:	00112e23          	sw	ra,28(sp)
804047f8:	00812c23          	sw	s0,24(sp)
804047fc:	00050493          	mv	s1,a0
80404800:	00096917          	auipc	s2,0x96
80404804:	04090913          	addi	s2,s2,64 # 8049a840 <pmm_manager>
80404808:	00100993          	li	s3,1
8040480c:	00096a17          	auipc	s4,0x96
80404810:	020a0a13          	addi	s4,s4,32 # 8049a82c <swap_init_ok>
80404814:	00096a97          	auipc	s5,0x96
80404818:	ffca8a93          	addi	s5,s5,-4 # 8049a810 <check_mm_struct>
8040481c:	0340006f          	j	80404850 <alloc_pages+0x74>
80404820:	00092783          	lw	a5,0(s2)
80404824:	00c7a783          	lw	a5,12(a5)
80404828:	000780e7          	jalr	a5
8040482c:	00050413          	mv	s0,a0
80404830:	00000613          	li	a2,0
80404834:	00048593          	mv	a1,s1
80404838:	04041863          	bnez	s0,80404888 <alloc_pages+0xac>
8040483c:	0499e663          	bltu	s3,s1,80404888 <alloc_pages+0xac>
80404840:	000a2783          	lw	a5,0(s4)
80404844:	04078263          	beqz	a5,80404888 <alloc_pages+0xac>
80404848:	000aa503          	lw	a0,0(s5)
8040484c:	ffdfe0ef          	jal	ra,80403848 <swap_out>
80404850:	100027f3          	csrr	a5,sstatus
80404854:	0027f793          	andi	a5,a5,2
80404858:	00048513          	mv	a0,s1
8040485c:	fc0782e3          	beqz	a5,80404820 <alloc_pages+0x44>
80404860:	d18fc0ef          	jal	ra,80400d78 <intr_disable>
80404864:	00092783          	lw	a5,0(s2)
80404868:	00048513          	mv	a0,s1
8040486c:	00c7a783          	lw	a5,12(a5)
80404870:	000780e7          	jalr	a5
80404874:	00050413          	mv	s0,a0
80404878:	cf8fc0ef          	jal	ra,80400d70 <intr_enable>
8040487c:	00000613          	li	a2,0
80404880:	00048593          	mv	a1,s1
80404884:	fa040ce3          	beqz	s0,8040483c <alloc_pages+0x60>
80404888:	01c12083          	lw	ra,28(sp)
8040488c:	00040513          	mv	a0,s0
80404890:	01812403          	lw	s0,24(sp)
80404894:	01412483          	lw	s1,20(sp)
80404898:	01012903          	lw	s2,16(sp)
8040489c:	00c12983          	lw	s3,12(sp)
804048a0:	00812a03          	lw	s4,8(sp)
804048a4:	00412a83          	lw	s5,4(sp)
804048a8:	02010113          	addi	sp,sp,32
804048ac:	00008067          	ret

804048b0 <free_pages>:
804048b0:	100027f3          	csrr	a5,sstatus
804048b4:	0027f793          	andi	a5,a5,2
804048b8:	00079a63          	bnez	a5,804048cc <free_pages+0x1c>
804048bc:	00096797          	auipc	a5,0x96
804048c0:	f847a783          	lw	a5,-124(a5) # 8049a840 <pmm_manager>
804048c4:	0107a783          	lw	a5,16(a5)
804048c8:	00078067          	jr	a5
804048cc:	ff010113          	addi	sp,sp,-16
804048d0:	00112623          	sw	ra,12(sp)
804048d4:	00812423          	sw	s0,8(sp)
804048d8:	00912223          	sw	s1,4(sp)
804048dc:	00050413          	mv	s0,a0
804048e0:	00058493          	mv	s1,a1
804048e4:	c94fc0ef          	jal	ra,80400d78 <intr_disable>
804048e8:	00096797          	auipc	a5,0x96
804048ec:	f587a783          	lw	a5,-168(a5) # 8049a840 <pmm_manager>
804048f0:	0107a783          	lw	a5,16(a5)
804048f4:	00048593          	mv	a1,s1
804048f8:	00040513          	mv	a0,s0
804048fc:	000780e7          	jalr	a5
80404900:	00812403          	lw	s0,8(sp)
80404904:	00c12083          	lw	ra,12(sp)
80404908:	00412483          	lw	s1,4(sp)
8040490c:	01010113          	addi	sp,sp,16
80404910:	c60fc06f          	j	80400d70 <intr_enable>

80404914 <nr_free_pages>:
80404914:	100027f3          	csrr	a5,sstatus
80404918:	0027f793          	andi	a5,a5,2
8040491c:	00079a63          	bnez	a5,80404930 <nr_free_pages+0x1c>
80404920:	00096797          	auipc	a5,0x96
80404924:	f207a783          	lw	a5,-224(a5) # 8049a840 <pmm_manager>
80404928:	0147a783          	lw	a5,20(a5)
8040492c:	00078067          	jr	a5
80404930:	ff010113          	addi	sp,sp,-16
80404934:	00112623          	sw	ra,12(sp)
80404938:	00812423          	sw	s0,8(sp)
8040493c:	c3cfc0ef          	jal	ra,80400d78 <intr_disable>
80404940:	00096797          	auipc	a5,0x96
80404944:	f007a783          	lw	a5,-256(a5) # 8049a840 <pmm_manager>
80404948:	0147a783          	lw	a5,20(a5)
8040494c:	000780e7          	jalr	a5
80404950:	00050413          	mv	s0,a0
80404954:	c1cfc0ef          	jal	ra,80400d70 <intr_enable>
80404958:	00c12083          	lw	ra,12(sp)
8040495c:	00040513          	mv	a0,s0
80404960:	00812403          	lw	s0,8(sp)
80404964:	01010113          	addi	sp,sp,16
80404968:	00008067          	ret

8040496c <get_pte>:
8040496c:	0165d793          	srli	a5,a1,0x16
80404970:	fe010113          	addi	sp,sp,-32
80404974:	00279793          	slli	a5,a5,0x2
80404978:	01212823          	sw	s2,16(sp)
8040497c:	00f50933          	add	s2,a0,a5
80404980:	00092683          	lw	a3,0(s2)
80404984:	00912a23          	sw	s1,20(sp)
80404988:	01312623          	sw	s3,12(sp)
8040498c:	00112e23          	sw	ra,28(sp)
80404990:	00812c23          	sw	s0,24(sp)
80404994:	01412423          	sw	s4,8(sp)
80404998:	01512223          	sw	s5,4(sp)
8040499c:	0016f793          	andi	a5,a3,1
804049a0:	00058493          	mv	s1,a1
804049a4:	00096997          	auipc	s3,0x96
804049a8:	e9498993          	addi	s3,s3,-364 # 8049a838 <npage>
804049ac:	08079663          	bnez	a5,80404a38 <get_pte+0xcc>
804049b0:	0e060063          	beqz	a2,80404a90 <get_pte+0x124>
804049b4:	00100513          	li	a0,1
804049b8:	e25ff0ef          	jal	ra,804047dc <alloc_pages>
804049bc:	00050413          	mv	s0,a0
804049c0:	0c050863          	beqz	a0,80404a90 <get_pte+0x124>
804049c4:	00096a97          	auipc	s5,0x96
804049c8:	e78a8a93          	addi	s5,s5,-392 # 8049a83c <pages>
804049cc:	000aa503          	lw	a0,0(s5)
804049d0:	00080a37          	lui	s4,0x80
804049d4:	00096997          	auipc	s3,0x96
804049d8:	e6498993          	addi	s3,s3,-412 # 8049a838 <npage>
804049dc:	40a40533          	sub	a0,s0,a0
804049e0:	40555513          	srai	a0,a0,0x5
804049e4:	01450533          	add	a0,a0,s4
804049e8:	0009a703          	lw	a4,0(s3)
804049ec:	00c51793          	slli	a5,a0,0xc
804049f0:	00100693          	li	a3,1
804049f4:	00d42023          	sw	a3,0(s0)
804049f8:	00c7d793          	srli	a5,a5,0xc
804049fc:	00c51513          	slli	a0,a0,0xc
80404a00:	0ae7f863          	bgeu	a5,a4,80404ab0 <get_pte+0x144>
80404a04:	00096797          	auipc	a5,0x96
80404a08:	e447a783          	lw	a5,-444(a5) # 8049a848 <va_pa_offset>
80404a0c:	00001637          	lui	a2,0x1
80404a10:	00000593          	li	a1,0
80404a14:	00f50533          	add	a0,a0,a5
80404a18:	75c0b0ef          	jal	ra,80410174 <memset>
80404a1c:	000aa683          	lw	a3,0(s5)
80404a20:	40d406b3          	sub	a3,s0,a3
80404a24:	4056d693          	srai	a3,a3,0x5
80404a28:	014686b3          	add	a3,a3,s4
80404a2c:	00a69693          	slli	a3,a3,0xa
80404a30:	0116e693          	ori	a3,a3,17
80404a34:	00d92023          	sw	a3,0(s2)
80404a38:	00269693          	slli	a3,a3,0x2
80404a3c:	fffff537          	lui	a0,0xfffff
80404a40:	0009a703          	lw	a4,0(s3)
80404a44:	00a6f6b3          	and	a3,a3,a0
80404a48:	00c6d793          	srli	a5,a3,0xc
80404a4c:	04e7f663          	bgeu	a5,a4,80404a98 <get_pte+0x12c>
80404a50:	00c4d493          	srli	s1,s1,0xc
80404a54:	00096517          	auipc	a0,0x96
80404a58:	df452503          	lw	a0,-524(a0) # 8049a848 <va_pa_offset>
80404a5c:	3ff4f493          	andi	s1,s1,1023
80404a60:	00a686b3          	add	a3,a3,a0
80404a64:	00249513          	slli	a0,s1,0x2
80404a68:	00a68533          	add	a0,a3,a0
80404a6c:	01c12083          	lw	ra,28(sp)
80404a70:	01812403          	lw	s0,24(sp)
80404a74:	01412483          	lw	s1,20(sp)
80404a78:	01012903          	lw	s2,16(sp)
80404a7c:	00c12983          	lw	s3,12(sp)
80404a80:	00812a03          	lw	s4,8(sp)
80404a84:	00412a83          	lw	s5,4(sp)
80404a88:	02010113          	addi	sp,sp,32
80404a8c:	00008067          	ret
80404a90:	00000513          	li	a0,0
80404a94:	fd9ff06f          	j	80404a6c <get_pte+0x100>
80404a98:	0000d617          	auipc	a2,0xd
80404a9c:	01060613          	addi	a2,a2,16 # 80411aa8 <commands+0xe24>
80404aa0:	11f00593          	li	a1,287
80404aa4:	0000d517          	auipc	a0,0xd
80404aa8:	7a450513          	addi	a0,a0,1956 # 80412248 <default_pmm_manager+0x1c>
80404aac:	821fb0ef          	jal	ra,804002cc <__panic>
80404ab0:	00050693          	mv	a3,a0
80404ab4:	0000d617          	auipc	a2,0xd
80404ab8:	ff460613          	addi	a2,a2,-12 # 80411aa8 <commands+0xe24>
80404abc:	11c00593          	li	a1,284
80404ac0:	0000d517          	auipc	a0,0xd
80404ac4:	78850513          	addi	a0,a0,1928 # 80412248 <default_pmm_manager+0x1c>
80404ac8:	805fb0ef          	jal	ra,804002cc <__panic>

80404acc <get_page>:
80404acc:	0165d793          	srli	a5,a1,0x16
80404ad0:	00279793          	slli	a5,a5,0x2
80404ad4:	00f50533          	add	a0,a0,a5
80404ad8:	00052683          	lw	a3,0(a0)
80404adc:	0016f793          	andi	a5,a3,1
80404ae0:	06078663          	beqz	a5,80404b4c <get_page+0x80>
80404ae4:	fffff7b7          	lui	a5,0xfffff
80404ae8:	00269693          	slli	a3,a3,0x2
80404aec:	ff010113          	addi	sp,sp,-16
80404af0:	00f6f6b3          	and	a3,a3,a5
80404af4:	00112623          	sw	ra,12(sp)
80404af8:	00096517          	auipc	a0,0x96
80404afc:	d4052503          	lw	a0,-704(a0) # 8049a838 <npage>
80404b00:	00c6d793          	srli	a5,a3,0xc
80404b04:	08a7f863          	bgeu	a5,a0,80404b94 <get_page+0xc8>
80404b08:	00c5d593          	srli	a1,a1,0xc
80404b0c:	3ff5f593          	andi	a1,a1,1023
80404b10:	00096797          	auipc	a5,0x96
80404b14:	d387a783          	lw	a5,-712(a5) # 8049a848 <va_pa_offset>
80404b18:	00f686b3          	add	a3,a3,a5
80404b1c:	00259593          	slli	a1,a1,0x2
80404b20:	00b686b3          	add	a3,a3,a1
80404b24:	00060463          	beqz	a2,80404b2c <get_page+0x60>
80404b28:	00d62023          	sw	a3,0(a2)
80404b2c:	00068863          	beqz	a3,80404b3c <get_page+0x70>
80404b30:	0006a783          	lw	a5,0(a3)
80404b34:	0017f713          	andi	a4,a5,1
80404b38:	02071263          	bnez	a4,80404b5c <get_page+0x90>
80404b3c:	00c12083          	lw	ra,12(sp)
80404b40:	00000513          	li	a0,0
80404b44:	01010113          	addi	sp,sp,16
80404b48:	00008067          	ret
80404b4c:	04060063          	beqz	a2,80404b8c <get_page+0xc0>
80404b50:	00062023          	sw	zero,0(a2)
80404b54:	00000513          	li	a0,0
80404b58:	00008067          	ret
80404b5c:	00279793          	slli	a5,a5,0x2
80404b60:	00c7d793          	srli	a5,a5,0xc
80404b64:	04a7f463          	bgeu	a5,a0,80404bac <get_page+0xe0>
80404b68:	00c12083          	lw	ra,12(sp)
80404b6c:	fff80537          	lui	a0,0xfff80
80404b70:	00a787b3          	add	a5,a5,a0
80404b74:	00579793          	slli	a5,a5,0x5
80404b78:	00096517          	auipc	a0,0x96
80404b7c:	cc452503          	lw	a0,-828(a0) # 8049a83c <pages>
80404b80:	00f50533          	add	a0,a0,a5
80404b84:	01010113          	addi	sp,sp,16
80404b88:	00008067          	ret
80404b8c:	00000513          	li	a0,0
80404b90:	00008067          	ret
80404b94:	0000d617          	auipc	a2,0xd
80404b98:	f1460613          	addi	a2,a2,-236 # 80411aa8 <commands+0xe24>
80404b9c:	11f00593          	li	a1,287
80404ba0:	0000d517          	auipc	a0,0xd
80404ba4:	6a850513          	addi	a0,a0,1704 # 80412248 <default_pmm_manager+0x1c>
80404ba8:	f24fb0ef          	jal	ra,804002cc <__panic>
80404bac:	bf1ff0ef          	jal	ra,8040479c <pa2page.part.0>

80404bb0 <unmap_range>:
80404bb0:	fb010113          	addi	sp,sp,-80
80404bb4:	00c5e7b3          	or	a5,a1,a2
80404bb8:	04112623          	sw	ra,76(sp)
80404bbc:	04812423          	sw	s0,72(sp)
80404bc0:	04912223          	sw	s1,68(sp)
80404bc4:	05212023          	sw	s2,64(sp)
80404bc8:	03312e23          	sw	s3,60(sp)
80404bcc:	03412c23          	sw	s4,56(sp)
80404bd0:	03512a23          	sw	s5,52(sp)
80404bd4:	03612823          	sw	s6,48(sp)
80404bd8:	03712623          	sw	s7,44(sp)
80404bdc:	03812423          	sw	s8,40(sp)
80404be0:	03912223          	sw	s9,36(sp)
80404be4:	03a12023          	sw	s10,32(sp)
80404be8:	01b12e23          	sw	s11,28(sp)
80404bec:	01479793          	slli	a5,a5,0x14
80404bf0:	1a079063          	bnez	a5,80404d90 <unmap_range+0x1e0>
80404bf4:	002007b7          	lui	a5,0x200
80404bf8:	00058493          	mv	s1,a1
80404bfc:	1af5ea63          	bltu	a1,a5,80404db0 <unmap_range+0x200>
80404c00:	00060913          	mv	s2,a2
80404c04:	1ac5f663          	bgeu	a1,a2,80404db0 <unmap_range+0x200>
80404c08:	800007b7          	lui	a5,0x80000
80404c0c:	1ac7e263          	bltu	a5,a2,80404db0 <unmap_range+0x200>
80404c10:	00050993          	mv	s3,a0
80404c14:	00400cb7          	lui	s9,0x400
80404c18:	ffc00c37          	lui	s8,0xffc00
80404c1c:	fffffb37          	lui	s6,0xfffff
80404c20:	00096a97          	auipc	s5,0x96
80404c24:	c18a8a93          	addi	s5,s5,-1000 # 8049a838 <npage>
80404c28:	00096b97          	auipc	s7,0x96
80404c2c:	c20b8b93          	addi	s7,s7,-992 # 8049a848 <va_pa_offset>
80404c30:	00001a37          	lui	s4,0x1
80404c34:	00096d17          	auipc	s10,0x96
80404c38:	c08d0d13          	addi	s10,s10,-1016 # 8049a83c <pages>
80404c3c:	00096d97          	auipc	s11,0x96
80404c40:	c04d8d93          	addi	s11,s11,-1020 # 8049a840 <pmm_manager>
80404c44:	0164d793          	srli	a5,s1,0x16
80404c48:	00279793          	slli	a5,a5,0x2
80404c4c:	00f987b3          	add	a5,s3,a5
80404c50:	0007a683          	lw	a3,0(a5) # 80000000 <end+0xffb6576c>
80404c54:	0016f793          	andi	a5,a3,1
80404c58:	04079863          	bnez	a5,80404ca8 <unmap_range+0xf8>
80404c5c:	019484b3          	add	s1,s1,s9
80404c60:	0184f4b3          	and	s1,s1,s8
80404c64:	00048463          	beqz	s1,80404c6c <unmap_range+0xbc>
80404c68:	fd24eee3          	bltu	s1,s2,80404c44 <unmap_range+0x94>
80404c6c:	04c12083          	lw	ra,76(sp)
80404c70:	04812403          	lw	s0,72(sp)
80404c74:	04412483          	lw	s1,68(sp)
80404c78:	04012903          	lw	s2,64(sp)
80404c7c:	03c12983          	lw	s3,60(sp)
80404c80:	03812a03          	lw	s4,56(sp)
80404c84:	03412a83          	lw	s5,52(sp)
80404c88:	03012b03          	lw	s6,48(sp)
80404c8c:	02c12b83          	lw	s7,44(sp)
80404c90:	02812c03          	lw	s8,40(sp)
80404c94:	02412c83          	lw	s9,36(sp)
80404c98:	02012d03          	lw	s10,32(sp)
80404c9c:	01c12d83          	lw	s11,28(sp)
80404ca0:	05010113          	addi	sp,sp,80
80404ca4:	00008067          	ret
80404ca8:	00269693          	slli	a3,a3,0x2
80404cac:	000aa703          	lw	a4,0(s5)
80404cb0:	0166f6b3          	and	a3,a3,s6
80404cb4:	00c6d793          	srli	a5,a3,0xc
80404cb8:	0ce7f063          	bgeu	a5,a4,80404d78 <unmap_range+0x1c8>
80404cbc:	000ba403          	lw	s0,0(s7)
80404cc0:	00c4d793          	srli	a5,s1,0xc
80404cc4:	3ff7f793          	andi	a5,a5,1023
80404cc8:	008686b3          	add	a3,a3,s0
80404ccc:	00279413          	slli	s0,a5,0x2
80404cd0:	00868433          	add	s0,a3,s0
80404cd4:	f80404e3          	beqz	s0,80404c5c <unmap_range+0xac>
80404cd8:	00042783          	lw	a5,0(s0)
80404cdc:	00079863          	bnez	a5,80404cec <unmap_range+0x13c>
80404ce0:	014484b3          	add	s1,s1,s4
80404ce4:	f724e0e3          	bltu	s1,s2,80404c44 <unmap_range+0x94>
80404ce8:	f85ff06f          	j	80404c6c <unmap_range+0xbc>
80404cec:	0017f693          	andi	a3,a5,1
80404cf0:	fe0688e3          	beqz	a3,80404ce0 <unmap_range+0x130>
80404cf4:	00279793          	slli	a5,a5,0x2
80404cf8:	00c7d793          	srli	a5,a5,0xc
80404cfc:	0ce7fa63          	bgeu	a5,a4,80404dd0 <unmap_range+0x220>
80404d00:	000d2503          	lw	a0,0(s10)
80404d04:	fff80737          	lui	a4,0xfff80
80404d08:	00e787b3          	add	a5,a5,a4
80404d0c:	00579793          	slli	a5,a5,0x5
80404d10:	00f50533          	add	a0,a0,a5
80404d14:	00052783          	lw	a5,0(a0)
80404d18:	fff78793          	addi	a5,a5,-1
80404d1c:	00f52023          	sw	a5,0(a0)
80404d20:	00078a63          	beqz	a5,80404d34 <unmap_range+0x184>
80404d24:	00042023          	sw	zero,0(s0)
80404d28:	12048073          	sfence.vma	s1
80404d2c:	014484b3          	add	s1,s1,s4
80404d30:	fb5ff06f          	j	80404ce4 <unmap_range+0x134>
80404d34:	100027f3          	csrr	a5,sstatus
80404d38:	0027f793          	andi	a5,a5,2
80404d3c:	00079c63          	bnez	a5,80404d54 <unmap_range+0x1a4>
80404d40:	000da783          	lw	a5,0(s11)
80404d44:	00100593          	li	a1,1
80404d48:	0107a783          	lw	a5,16(a5)
80404d4c:	000780e7          	jalr	a5
80404d50:	fd5ff06f          	j	80404d24 <unmap_range+0x174>
80404d54:	00a12623          	sw	a0,12(sp)
80404d58:	820fc0ef          	jal	ra,80400d78 <intr_disable>
80404d5c:	000da783          	lw	a5,0(s11)
80404d60:	00c12503          	lw	a0,12(sp)
80404d64:	00100593          	li	a1,1
80404d68:	0107a783          	lw	a5,16(a5)
80404d6c:	000780e7          	jalr	a5
80404d70:	800fc0ef          	jal	ra,80400d70 <intr_enable>
80404d74:	fb1ff06f          	j	80404d24 <unmap_range+0x174>
80404d78:	0000d617          	auipc	a2,0xd
80404d7c:	d3060613          	addi	a2,a2,-720 # 80411aa8 <commands+0xe24>
80404d80:	11f00593          	li	a1,287
80404d84:	0000d517          	auipc	a0,0xd
80404d88:	4c450513          	addi	a0,a0,1220 # 80412248 <default_pmm_manager+0x1c>
80404d8c:	d40fb0ef          	jal	ra,804002cc <__panic>
80404d90:	0000d697          	auipc	a3,0xd
80404d94:	4c868693          	addi	a3,a3,1224 # 80412258 <default_pmm_manager+0x2c>
80404d98:	0000c617          	auipc	a2,0xc
80404d9c:	f2860613          	addi	a2,a2,-216 # 80410cc0 <commands+0x3c>
80404da0:	15600593          	li	a1,342
80404da4:	0000d517          	auipc	a0,0xd
80404da8:	4a450513          	addi	a0,a0,1188 # 80412248 <default_pmm_manager+0x1c>
80404dac:	d20fb0ef          	jal	ra,804002cc <__panic>
80404db0:	0000d697          	auipc	a3,0xd
80404db4:	4d468693          	addi	a3,a3,1236 # 80412284 <default_pmm_manager+0x58>
80404db8:	0000c617          	auipc	a2,0xc
80404dbc:	f0860613          	addi	a2,a2,-248 # 80410cc0 <commands+0x3c>
80404dc0:	15700593          	li	a1,343
80404dc4:	0000d517          	auipc	a0,0xd
80404dc8:	48450513          	addi	a0,a0,1156 # 80412248 <default_pmm_manager+0x1c>
80404dcc:	d00fb0ef          	jal	ra,804002cc <__panic>
80404dd0:	9cdff0ef          	jal	ra,8040479c <pa2page.part.0>

80404dd4 <exit_range>:
80404dd4:	fc010113          	addi	sp,sp,-64
80404dd8:	00c5e7b3          	or	a5,a1,a2
80404ddc:	02112e23          	sw	ra,60(sp)
80404de0:	02812c23          	sw	s0,56(sp)
80404de4:	02912a23          	sw	s1,52(sp)
80404de8:	03212823          	sw	s2,48(sp)
80404dec:	03312623          	sw	s3,44(sp)
80404df0:	03412423          	sw	s4,40(sp)
80404df4:	03512223          	sw	s5,36(sp)
80404df8:	03612023          	sw	s6,32(sp)
80404dfc:	01712e23          	sw	s7,28(sp)
80404e00:	01812c23          	sw	s8,24(sp)
80404e04:	01479793          	slli	a5,a5,0x14
80404e08:	10079863          	bnez	a5,80404f18 <exit_range+0x144>
80404e0c:	002007b7          	lui	a5,0x200
80404e10:	14f5e063          	bltu	a1,a5,80404f50 <exit_range+0x17c>
80404e14:	00060a93          	mv	s5,a2
80404e18:	12c5fc63          	bgeu	a1,a2,80404f50 <exit_range+0x17c>
80404e1c:	ffc004b7          	lui	s1,0xffc00
80404e20:	800007b7          	lui	a5,0x80000
80404e24:	0095f4b3          	and	s1,a1,s1
80404e28:	12c7e463          	bltu	a5,a2,80404f50 <exit_range+0x17c>
80404e2c:	00050b13          	mv	s6,a0
80404e30:	00096b97          	auipc	s7,0x96
80404e34:	a08b8b93          	addi	s7,s7,-1528 # 8049a838 <npage>
80404e38:	00096c17          	auipc	s8,0x96
80404e3c:	a04c0c13          	addi	s8,s8,-1532 # 8049a83c <pages>
80404e40:	fff809b7          	lui	s3,0xfff80
80404e44:	00096917          	auipc	s2,0x96
80404e48:	9fc90913          	addi	s2,s2,-1540 # 8049a840 <pmm_manager>
80404e4c:	00400a37          	lui	s4,0x400
80404e50:	0100006f          	j	80404e60 <exit_range+0x8c>
80404e54:	014484b3          	add	s1,s1,s4
80404e58:	06048463          	beqz	s1,80404ec0 <exit_range+0xec>
80404e5c:	0754f263          	bgeu	s1,s5,80404ec0 <exit_range+0xec>
80404e60:	0164d413          	srli	s0,s1,0x16
80404e64:	00241413          	slli	s0,s0,0x2
80404e68:	008b0433          	add	s0,s6,s0
80404e6c:	00042783          	lw	a5,0(s0)
80404e70:	0017f713          	andi	a4,a5,1
80404e74:	fe0700e3          	beqz	a4,80404e54 <exit_range+0x80>
80404e78:	000ba703          	lw	a4,0(s7)
80404e7c:	00279793          	slli	a5,a5,0x2
80404e80:	00c7d793          	srli	a5,a5,0xc
80404e84:	0ae7fa63          	bgeu	a5,a4,80404f38 <exit_range+0x164>
80404e88:	000c2503          	lw	a0,0(s8)
80404e8c:	013787b3          	add	a5,a5,s3
80404e90:	00579793          	slli	a5,a5,0x5
80404e94:	00f50533          	add	a0,a0,a5
80404e98:	100027f3          	csrr	a5,sstatus
80404e9c:	0027f793          	andi	a5,a5,2
80404ea0:	04079863          	bnez	a5,80404ef0 <exit_range+0x11c>
80404ea4:	00092783          	lw	a5,0(s2)
80404ea8:	00100593          	li	a1,1
80404eac:	0107a783          	lw	a5,16(a5) # 80000010 <end+0xffb6577c>
80404eb0:	000780e7          	jalr	a5
80404eb4:	00042023          	sw	zero,0(s0)
80404eb8:	014484b3          	add	s1,s1,s4
80404ebc:	fa0490e3          	bnez	s1,80404e5c <exit_range+0x88>
80404ec0:	03c12083          	lw	ra,60(sp)
80404ec4:	03812403          	lw	s0,56(sp)
80404ec8:	03412483          	lw	s1,52(sp)
80404ecc:	03012903          	lw	s2,48(sp)
80404ed0:	02c12983          	lw	s3,44(sp)
80404ed4:	02812a03          	lw	s4,40(sp)
80404ed8:	02412a83          	lw	s5,36(sp)
80404edc:	02012b03          	lw	s6,32(sp)
80404ee0:	01c12b83          	lw	s7,28(sp)
80404ee4:	01812c03          	lw	s8,24(sp)
80404ee8:	04010113          	addi	sp,sp,64
80404eec:	00008067          	ret
80404ef0:	00a12623          	sw	a0,12(sp)
80404ef4:	e85fb0ef          	jal	ra,80400d78 <intr_disable>
80404ef8:	00092783          	lw	a5,0(s2)
80404efc:	00c12503          	lw	a0,12(sp)
80404f00:	00100593          	li	a1,1
80404f04:	0107a783          	lw	a5,16(a5)
80404f08:	000780e7          	jalr	a5
80404f0c:	e65fb0ef          	jal	ra,80400d70 <intr_enable>
80404f10:	00042023          	sw	zero,0(s0)
80404f14:	fa5ff06f          	j	80404eb8 <exit_range+0xe4>
80404f18:	0000d697          	auipc	a3,0xd
80404f1c:	34068693          	addi	a3,a3,832 # 80412258 <default_pmm_manager+0x2c>
80404f20:	0000c617          	auipc	a2,0xc
80404f24:	da060613          	addi	a2,a2,-608 # 80410cc0 <commands+0x3c>
80404f28:	16700593          	li	a1,359
80404f2c:	0000d517          	auipc	a0,0xd
80404f30:	31c50513          	addi	a0,a0,796 # 80412248 <default_pmm_manager+0x1c>
80404f34:	b98fb0ef          	jal	ra,804002cc <__panic>
80404f38:	0000d617          	auipc	a2,0xd
80404f3c:	82460613          	addi	a2,a2,-2012 # 8041175c <commands+0xad8>
80404f40:	06900593          	li	a1,105
80404f44:	0000d517          	auipc	a0,0xd
80404f48:	83850513          	addi	a0,a0,-1992 # 8041177c <commands+0xaf8>
80404f4c:	b80fb0ef          	jal	ra,804002cc <__panic>
80404f50:	0000d697          	auipc	a3,0xd
80404f54:	33468693          	addi	a3,a3,820 # 80412284 <default_pmm_manager+0x58>
80404f58:	0000c617          	auipc	a2,0xc
80404f5c:	d6860613          	addi	a2,a2,-664 # 80410cc0 <commands+0x3c>
80404f60:	16800593          	li	a1,360
80404f64:	0000d517          	auipc	a0,0xd
80404f68:	2e450513          	addi	a0,a0,740 # 80412248 <default_pmm_manager+0x1c>
80404f6c:	b60fb0ef          	jal	ra,804002cc <__panic>

80404f70 <page_remove>:
80404f70:	0165d793          	srli	a5,a1,0x16
80404f74:	00279793          	slli	a5,a5,0x2
80404f78:	00f50533          	add	a0,a0,a5
80404f7c:	00052683          	lw	a3,0(a0)
80404f80:	0016f793          	andi	a5,a3,1
80404f84:	06078a63          	beqz	a5,80404ff8 <page_remove+0x88>
80404f88:	fe010113          	addi	sp,sp,-32
80404f8c:	00812c23          	sw	s0,24(sp)
80404f90:	00269693          	slli	a3,a3,0x2
80404f94:	fffff437          	lui	s0,0xfffff
80404f98:	0086f6b3          	and	a3,a3,s0
80404f9c:	00112e23          	sw	ra,28(sp)
80404fa0:	00912a23          	sw	s1,20(sp)
80404fa4:	00096717          	auipc	a4,0x96
80404fa8:	89472703          	lw	a4,-1900(a4) # 8049a838 <npage>
80404fac:	00c6d793          	srli	a5,a3,0xc
80404fb0:	0ee7f463          	bgeu	a5,a4,80405098 <page_remove+0x128>
80404fb4:	00c5d793          	srli	a5,a1,0xc
80404fb8:	00096417          	auipc	s0,0x96
80404fbc:	89042403          	lw	s0,-1904(s0) # 8049a848 <va_pa_offset>
80404fc0:	3ff7f793          	andi	a5,a5,1023
80404fc4:	008686b3          	add	a3,a3,s0
80404fc8:	00279413          	slli	s0,a5,0x2
80404fcc:	00868433          	add	s0,a3,s0
80404fd0:	00058493          	mv	s1,a1
80404fd4:	00040863          	beqz	s0,80404fe4 <page_remove+0x74>
80404fd8:	00042783          	lw	a5,0(s0)
80404fdc:	0017f693          	andi	a3,a5,1
80404fe0:	00069e63          	bnez	a3,80404ffc <page_remove+0x8c>
80404fe4:	01c12083          	lw	ra,28(sp)
80404fe8:	01812403          	lw	s0,24(sp)
80404fec:	01412483          	lw	s1,20(sp)
80404ff0:	02010113          	addi	sp,sp,32
80404ff4:	00008067          	ret
80404ff8:	00008067          	ret
80404ffc:	00279793          	slli	a5,a5,0x2
80405000:	00c7d793          	srli	a5,a5,0xc
80405004:	0ae7f663          	bgeu	a5,a4,804050b0 <page_remove+0x140>
80405008:	fff80537          	lui	a0,0xfff80
8040500c:	00a787b3          	add	a5,a5,a0
80405010:	00579793          	slli	a5,a5,0x5
80405014:	00096517          	auipc	a0,0x96
80405018:	82852503          	lw	a0,-2008(a0) # 8049a83c <pages>
8040501c:	00f50533          	add	a0,a0,a5
80405020:	00052783          	lw	a5,0(a0)
80405024:	fff78793          	addi	a5,a5,-1
80405028:	00f52023          	sw	a5,0(a0)
8040502c:	02078063          	beqz	a5,8040504c <page_remove+0xdc>
80405030:	00042023          	sw	zero,0(s0)
80405034:	12048073          	sfence.vma	s1
80405038:	01c12083          	lw	ra,28(sp)
8040503c:	01812403          	lw	s0,24(sp)
80405040:	01412483          	lw	s1,20(sp)
80405044:	02010113          	addi	sp,sp,32
80405048:	00008067          	ret
8040504c:	100027f3          	csrr	a5,sstatus
80405050:	0027f793          	andi	a5,a5,2
80405054:	00079e63          	bnez	a5,80405070 <page_remove+0x100>
80405058:	00095797          	auipc	a5,0x95
8040505c:	7e87a783          	lw	a5,2024(a5) # 8049a840 <pmm_manager>
80405060:	0107a783          	lw	a5,16(a5)
80405064:	00100593          	li	a1,1
80405068:	000780e7          	jalr	a5
8040506c:	fc5ff06f          	j	80405030 <page_remove+0xc0>
80405070:	00a12623          	sw	a0,12(sp)
80405074:	d05fb0ef          	jal	ra,80400d78 <intr_disable>
80405078:	00095797          	auipc	a5,0x95
8040507c:	7c87a783          	lw	a5,1992(a5) # 8049a840 <pmm_manager>
80405080:	0107a783          	lw	a5,16(a5)
80405084:	00c12503          	lw	a0,12(sp)
80405088:	00100593          	li	a1,1
8040508c:	000780e7          	jalr	a5
80405090:	ce1fb0ef          	jal	ra,80400d70 <intr_enable>
80405094:	f9dff06f          	j	80405030 <page_remove+0xc0>
80405098:	0000d617          	auipc	a2,0xd
8040509c:	a1060613          	addi	a2,a2,-1520 # 80411aa8 <commands+0xe24>
804050a0:	11f00593          	li	a1,287
804050a4:	0000d517          	auipc	a0,0xd
804050a8:	1a450513          	addi	a0,a0,420 # 80412248 <default_pmm_manager+0x1c>
804050ac:	a20fb0ef          	jal	ra,804002cc <__panic>
804050b0:	eecff0ef          	jal	ra,8040479c <pa2page.part.0>

804050b4 <page_insert>:
804050b4:	fe010113          	addi	sp,sp,-32
804050b8:	01412423          	sw	s4,8(sp)
804050bc:	00060a13          	mv	s4,a2
804050c0:	00812c23          	sw	s0,24(sp)
804050c4:	00100613          	li	a2,1
804050c8:	00058413          	mv	s0,a1
804050cc:	000a0593          	mv	a1,s4
804050d0:	01212823          	sw	s2,16(sp)
804050d4:	00112e23          	sw	ra,28(sp)
804050d8:	00912a23          	sw	s1,20(sp)
804050dc:	01312623          	sw	s3,12(sp)
804050e0:	01512223          	sw	s5,4(sp)
804050e4:	00068913          	mv	s2,a3
804050e8:	885ff0ef          	jal	ra,8040496c <get_pte>
804050ec:	12050263          	beqz	a0,80405210 <page_insert+0x15c>
804050f0:	00042703          	lw	a4,0(s0)
804050f4:	00050993          	mv	s3,a0
804050f8:	00170793          	addi	a5,a4,1
804050fc:	00f42023          	sw	a5,0(s0)
80405100:	00052783          	lw	a5,0(a0)
80405104:	0017f693          	andi	a3,a5,1
80405108:	04069c63          	bnez	a3,80405160 <page_insert+0xac>
8040510c:	00095697          	auipc	a3,0x95
80405110:	7306a683          	lw	a3,1840(a3) # 8049a83c <pages>
80405114:	40d40433          	sub	s0,s0,a3
80405118:	40545413          	srai	s0,s0,0x5
8040511c:	000806b7          	lui	a3,0x80
80405120:	00d40433          	add	s0,s0,a3
80405124:	00a41413          	slli	s0,s0,0xa
80405128:	012466b3          	or	a3,s0,s2
8040512c:	0016e693          	ori	a3,a3,1
80405130:	00d9a023          	sw	a3,0(s3) # fff80000 <end+0x7fae576c>
80405134:	120a0073          	sfence.vma	s4
80405138:	00000513          	li	a0,0
8040513c:	01c12083          	lw	ra,28(sp)
80405140:	01812403          	lw	s0,24(sp)
80405144:	01412483          	lw	s1,20(sp)
80405148:	01012903          	lw	s2,16(sp)
8040514c:	00c12983          	lw	s3,12(sp)
80405150:	00812a03          	lw	s4,8(sp)
80405154:	00412a83          	lw	s5,4(sp)
80405158:	02010113          	addi	sp,sp,32
8040515c:	00008067          	ret
80405160:	00279793          	slli	a5,a5,0x2
80405164:	00c7d793          	srli	a5,a5,0xc
80405168:	00095697          	auipc	a3,0x95
8040516c:	6d06a683          	lw	a3,1744(a3) # 8049a838 <npage>
80405170:	0ad7f463          	bgeu	a5,a3,80405218 <page_insert+0x164>
80405174:	00095a97          	auipc	s5,0x95
80405178:	6c8a8a93          	addi	s5,s5,1736 # 8049a83c <pages>
8040517c:	000aa683          	lw	a3,0(s5)
80405180:	fff804b7          	lui	s1,0xfff80
80405184:	009784b3          	add	s1,a5,s1
80405188:	00549493          	slli	s1,s1,0x5
8040518c:	009684b3          	add	s1,a3,s1
80405190:	00940e63          	beq	s0,s1,804051ac <page_insert+0xf8>
80405194:	0004a783          	lw	a5,0(s1) # fff80000 <end+0x7fae576c>
80405198:	fff78793          	addi	a5,a5,-1
8040519c:	00f4a023          	sw	a5,0(s1)
804051a0:	00078a63          	beqz	a5,804051b4 <page_insert+0x100>
804051a4:	120a0073          	sfence.vma	s4
804051a8:	f6dff06f          	j	80405114 <page_insert+0x60>
804051ac:	00e42023          	sw	a4,0(s0)
804051b0:	f65ff06f          	j	80405114 <page_insert+0x60>
804051b4:	100027f3          	csrr	a5,sstatus
804051b8:	0027f793          	andi	a5,a5,2
804051bc:	02079463          	bnez	a5,804051e4 <page_insert+0x130>
804051c0:	00095797          	auipc	a5,0x95
804051c4:	6807a783          	lw	a5,1664(a5) # 8049a840 <pmm_manager>
804051c8:	0107a783          	lw	a5,16(a5)
804051cc:	00100593          	li	a1,1
804051d0:	00048513          	mv	a0,s1
804051d4:	000780e7          	jalr	a5
804051d8:	000aa683          	lw	a3,0(s5)
804051dc:	120a0073          	sfence.vma	s4
804051e0:	f35ff06f          	j	80405114 <page_insert+0x60>
804051e4:	b95fb0ef          	jal	ra,80400d78 <intr_disable>
804051e8:	00095797          	auipc	a5,0x95
804051ec:	6587a783          	lw	a5,1624(a5) # 8049a840 <pmm_manager>
804051f0:	0107a783          	lw	a5,16(a5)
804051f4:	00100593          	li	a1,1
804051f8:	00048513          	mv	a0,s1
804051fc:	000780e7          	jalr	a5
80405200:	b71fb0ef          	jal	ra,80400d70 <intr_enable>
80405204:	000aa683          	lw	a3,0(s5)
80405208:	120a0073          	sfence.vma	s4
8040520c:	f09ff06f          	j	80405114 <page_insert+0x60>
80405210:	ffc00513          	li	a0,-4
80405214:	f29ff06f          	j	8040513c <page_insert+0x88>
80405218:	d84ff0ef          	jal	ra,8040479c <pa2page.part.0>

8040521c <copy_range>:
8040521c:	fc010113          	addi	sp,sp,-64
80405220:	00d667b3          	or	a5,a2,a3
80405224:	02112e23          	sw	ra,60(sp)
80405228:	02812c23          	sw	s0,56(sp)
8040522c:	02912a23          	sw	s1,52(sp)
80405230:	03212823          	sw	s2,48(sp)
80405234:	03312623          	sw	s3,44(sp)
80405238:	03412423          	sw	s4,40(sp)
8040523c:	03512223          	sw	s5,36(sp)
80405240:	03612023          	sw	s6,32(sp)
80405244:	01712e23          	sw	s7,28(sp)
80405248:	01812c23          	sw	s8,24(sp)
8040524c:	01912a23          	sw	s9,20(sp)
80405250:	01a12823          	sw	s10,16(sp)
80405254:	01b12623          	sw	s11,12(sp)
80405258:	01479793          	slli	a5,a5,0x14
8040525c:	26079663          	bnez	a5,804054c8 <copy_range+0x2ac>
80405260:	002007b7          	lui	a5,0x200
80405264:	00060413          	mv	s0,a2
80405268:	1ef66863          	bltu	a2,a5,80405458 <copy_range+0x23c>
8040526c:	00068913          	mv	s2,a3
80405270:	1ed67463          	bgeu	a2,a3,80405458 <copy_range+0x23c>
80405274:	800007b7          	lui	a5,0x80000
80405278:	1ed7e063          	bltu	a5,a3,80405458 <copy_range+0x23c>
8040527c:	00100b37          	lui	s6,0x100
80405280:	00050a93          	mv	s5,a0
80405284:	00058993          	mv	s3,a1
80405288:	00001a37          	lui	s4,0x1
8040528c:	00095c97          	auipc	s9,0x95
80405290:	5acc8c93          	addi	s9,s9,1452 # 8049a838 <npage>
80405294:	00095c17          	auipc	s8,0x95
80405298:	5a8c0c13          	addi	s8,s8,1448 # 8049a83c <pages>
8040529c:	00080bb7          	lui	s7,0x80
804052a0:	fffb0b13          	addi	s6,s6,-1 # fffff <_binary_bin_sfs_img_size+0x87fff>
804052a4:	00000613          	li	a2,0
804052a8:	00040593          	mv	a1,s0
804052ac:	00098513          	mv	a0,s3
804052b0:	ebcff0ef          	jal	ra,8040496c <get_pte>
804052b4:	00050493          	mv	s1,a0
804052b8:	14050063          	beqz	a0,804053f8 <copy_range+0x1dc>
804052bc:	00052783          	lw	a5,0(a0)
804052c0:	0017f793          	andi	a5,a5,1
804052c4:	04079663          	bnez	a5,80405310 <copy_range+0xf4>
804052c8:	01440433          	add	s0,s0,s4
804052cc:	fd246ce3          	bltu	s0,s2,804052a4 <copy_range+0x88>
804052d0:	00000513          	li	a0,0
804052d4:	03c12083          	lw	ra,60(sp)
804052d8:	03812403          	lw	s0,56(sp)
804052dc:	03412483          	lw	s1,52(sp)
804052e0:	03012903          	lw	s2,48(sp)
804052e4:	02c12983          	lw	s3,44(sp)
804052e8:	02812a03          	lw	s4,40(sp)
804052ec:	02412a83          	lw	s5,36(sp)
804052f0:	02012b03          	lw	s6,32(sp)
804052f4:	01c12b83          	lw	s7,28(sp)
804052f8:	01812c03          	lw	s8,24(sp)
804052fc:	01412c83          	lw	s9,20(sp)
80405300:	01012d03          	lw	s10,16(sp)
80405304:	00c12d83          	lw	s11,12(sp)
80405308:	04010113          	addi	sp,sp,64
8040530c:	00008067          	ret
80405310:	00100613          	li	a2,1
80405314:	00040593          	mv	a1,s0
80405318:	000a8513          	mv	a0,s5
8040531c:	e50ff0ef          	jal	ra,8040496c <get_pte>
80405320:	0e050a63          	beqz	a0,80405414 <copy_range+0x1f8>
80405324:	0004a783          	lw	a5,0(s1)
80405328:	0017f713          	andi	a4,a5,1
8040532c:	01f7f493          	andi	s1,a5,31
80405330:	18070063          	beqz	a4,804054b0 <copy_range+0x294>
80405334:	000ca683          	lw	a3,0(s9)
80405338:	00279793          	slli	a5,a5,0x2
8040533c:	00c7d713          	srli	a4,a5,0xc
80405340:	14d77c63          	bgeu	a4,a3,80405498 <copy_range+0x27c>
80405344:	000c2783          	lw	a5,0(s8)
80405348:	fff806b7          	lui	a3,0xfff80
8040534c:	00d70733          	add	a4,a4,a3
80405350:	00571713          	slli	a4,a4,0x5
80405354:	00100513          	li	a0,1
80405358:	00e78db3          	add	s11,a5,a4
8040535c:	c80ff0ef          	jal	ra,804047dc <alloc_pages>
80405360:	00050d13          	mv	s10,a0
80405364:	0c0d8a63          	beqz	s11,80405438 <copy_range+0x21c>
80405368:	10050863          	beqz	a0,80405478 <copy_range+0x25c>
8040536c:	000c2703          	lw	a4,0(s8)
80405370:	000ca603          	lw	a2,0(s9)
80405374:	40ed86b3          	sub	a3,s11,a4
80405378:	4056d693          	srai	a3,a3,0x5
8040537c:	017686b3          	add	a3,a3,s7
80405380:	0166f7b3          	and	a5,a3,s6
80405384:	00c69693          	slli	a3,a3,0xc
80405388:	08c7fc63          	bgeu	a5,a2,80405420 <copy_range+0x204>
8040538c:	40e507b3          	sub	a5,a0,a4
80405390:	00095717          	auipc	a4,0x95
80405394:	4b870713          	addi	a4,a4,1208 # 8049a848 <va_pa_offset>
80405398:	00072503          	lw	a0,0(a4)
8040539c:	4057d793          	srai	a5,a5,0x5
804053a0:	017787b3          	add	a5,a5,s7
804053a4:	0167f733          	and	a4,a5,s6
804053a8:	00a685b3          	add	a1,a3,a0
804053ac:	00c79793          	slli	a5,a5,0xc
804053b0:	06c77663          	bgeu	a4,a2,8040541c <copy_range+0x200>
804053b4:	00001637          	lui	a2,0x1
804053b8:	00a78533          	add	a0,a5,a0
804053bc:	6290a0ef          	jal	ra,804101e4 <memcpy>
804053c0:	00048693          	mv	a3,s1
804053c4:	00040613          	mv	a2,s0
804053c8:	000d0593          	mv	a1,s10
804053cc:	000a8513          	mv	a0,s5
804053d0:	ce5ff0ef          	jal	ra,804050b4 <page_insert>
804053d4:	ee050ae3          	beqz	a0,804052c8 <copy_range+0xac>
804053d8:	0000d697          	auipc	a3,0xd
804053dc:	9e868693          	addi	a3,a3,-1560 # 80411dc0 <commands+0x113c>
804053e0:	0000c617          	auipc	a2,0xc
804053e4:	8e060613          	addi	a2,a2,-1824 # 80410cc0 <commands+0x3c>
804053e8:	1af00593          	li	a1,431
804053ec:	0000d517          	auipc	a0,0xd
804053f0:	e5c50513          	addi	a0,a0,-420 # 80412248 <default_pmm_manager+0x1c>
804053f4:	ed9fa0ef          	jal	ra,804002cc <__panic>
804053f8:	00400637          	lui	a2,0x400
804053fc:	00c40433          	add	s0,s0,a2
80405400:	ffc00637          	lui	a2,0xffc00
80405404:	00c47433          	and	s0,s0,a2
80405408:	ec0404e3          	beqz	s0,804052d0 <copy_range+0xb4>
8040540c:	e9246ce3          	bltu	s0,s2,804052a4 <copy_range+0x88>
80405410:	ec1ff06f          	j	804052d0 <copy_range+0xb4>
80405414:	ffc00513          	li	a0,-4
80405418:	ebdff06f          	j	804052d4 <copy_range+0xb8>
8040541c:	00078693          	mv	a3,a5
80405420:	0000c617          	auipc	a2,0xc
80405424:	68860613          	addi	a2,a2,1672 # 80411aa8 <commands+0xe24>
80405428:	06e00593          	li	a1,110
8040542c:	0000c517          	auipc	a0,0xc
80405430:	35050513          	addi	a0,a0,848 # 8041177c <commands+0xaf8>
80405434:	e99fa0ef          	jal	ra,804002cc <__panic>
80405438:	0000d697          	auipc	a3,0xd
8040543c:	e6468693          	addi	a3,a3,-412 # 8041229c <default_pmm_manager+0x70>
80405440:	0000c617          	auipc	a2,0xc
80405444:	88060613          	addi	a2,a2,-1920 # 80410cc0 <commands+0x3c>
80405448:	19400593          	li	a1,404
8040544c:	0000d517          	auipc	a0,0xd
80405450:	dfc50513          	addi	a0,a0,-516 # 80412248 <default_pmm_manager+0x1c>
80405454:	e79fa0ef          	jal	ra,804002cc <__panic>
80405458:	0000d697          	auipc	a3,0xd
8040545c:	e2c68693          	addi	a3,a3,-468 # 80412284 <default_pmm_manager+0x58>
80405460:	0000c617          	auipc	a2,0xc
80405464:	86060613          	addi	a2,a2,-1952 # 80410cc0 <commands+0x3c>
80405468:	18000593          	li	a1,384
8040546c:	0000d517          	auipc	a0,0xd
80405470:	ddc50513          	addi	a0,a0,-548 # 80412248 <default_pmm_manager+0x1c>
80405474:	e59fa0ef          	jal	ra,804002cc <__panic>
80405478:	0000d697          	auipc	a3,0xd
8040547c:	e3468693          	addi	a3,a3,-460 # 804122ac <default_pmm_manager+0x80>
80405480:	0000c617          	auipc	a2,0xc
80405484:	84060613          	addi	a2,a2,-1984 # 80410cc0 <commands+0x3c>
80405488:	19500593          	li	a1,405
8040548c:	0000d517          	auipc	a0,0xd
80405490:	dbc50513          	addi	a0,a0,-580 # 80412248 <default_pmm_manager+0x1c>
80405494:	e39fa0ef          	jal	ra,804002cc <__panic>
80405498:	0000c617          	auipc	a2,0xc
8040549c:	2c460613          	addi	a2,a2,708 # 8041175c <commands+0xad8>
804054a0:	06900593          	li	a1,105
804054a4:	0000c517          	auipc	a0,0xc
804054a8:	2d850513          	addi	a0,a0,728 # 8041177c <commands+0xaf8>
804054ac:	e21fa0ef          	jal	ra,804002cc <__panic>
804054b0:	0000d617          	auipc	a2,0xd
804054b4:	89c60613          	addi	a2,a2,-1892 # 80411d4c <commands+0x10c8>
804054b8:	07400593          	li	a1,116
804054bc:	0000c517          	auipc	a0,0xc
804054c0:	2c050513          	addi	a0,a0,704 # 8041177c <commands+0xaf8>
804054c4:	e09fa0ef          	jal	ra,804002cc <__panic>
804054c8:	0000d697          	auipc	a3,0xd
804054cc:	d9068693          	addi	a3,a3,-624 # 80412258 <default_pmm_manager+0x2c>
804054d0:	0000b617          	auipc	a2,0xb
804054d4:	7f060613          	addi	a2,a2,2032 # 80410cc0 <commands+0x3c>
804054d8:	17f00593          	li	a1,383
804054dc:	0000d517          	auipc	a0,0xd
804054e0:	d6c50513          	addi	a0,a0,-660 # 80412248 <default_pmm_manager+0x1c>
804054e4:	de9fa0ef          	jal	ra,804002cc <__panic>

804054e8 <tlb_invalidate>:
804054e8:	12058073          	sfence.vma	a1
804054ec:	00008067          	ret

804054f0 <pgdir_alloc_page>:
804054f0:	fe010113          	addi	sp,sp,-32
804054f4:	01212823          	sw	s2,16(sp)
804054f8:	00050913          	mv	s2,a0
804054fc:	00100513          	li	a0,1
80405500:	00812c23          	sw	s0,24(sp)
80405504:	00912a23          	sw	s1,20(sp)
80405508:	01312623          	sw	s3,12(sp)
8040550c:	00112e23          	sw	ra,28(sp)
80405510:	00058493          	mv	s1,a1
80405514:	00060993          	mv	s3,a2
80405518:	ac4ff0ef          	jal	ra,804047dc <alloc_pages>
8040551c:	00050413          	mv	s0,a0
80405520:	04050a63          	beqz	a0,80405574 <pgdir_alloc_page+0x84>
80405524:	00050593          	mv	a1,a0
80405528:	00098693          	mv	a3,s3
8040552c:	00048613          	mv	a2,s1
80405530:	00090513          	mv	a0,s2
80405534:	b81ff0ef          	jal	ra,804050b4 <page_insert>
80405538:	04051e63          	bnez	a0,80405594 <pgdir_alloc_page+0xa4>
8040553c:	00095797          	auipc	a5,0x95
80405540:	2f07a783          	lw	a5,752(a5) # 8049a82c <swap_init_ok>
80405544:	02078863          	beqz	a5,80405574 <pgdir_alloc_page+0x84>
80405548:	00095517          	auipc	a0,0x95
8040554c:	2c852503          	lw	a0,712(a0) # 8049a810 <check_mm_struct>
80405550:	02050263          	beqz	a0,80405574 <pgdir_alloc_page+0x84>
80405554:	00000693          	li	a3,0
80405558:	00040613          	mv	a2,s0
8040555c:	00048593          	mv	a1,s1
80405560:	ad8fe0ef          	jal	ra,80403838 <swap_map_swappable>
80405564:	00042703          	lw	a4,0(s0)
80405568:	00942e23          	sw	s1,28(s0)
8040556c:	00100793          	li	a5,1
80405570:	06f71c63          	bne	a4,a5,804055e8 <pgdir_alloc_page+0xf8>
80405574:	01c12083          	lw	ra,28(sp)
80405578:	00040513          	mv	a0,s0
8040557c:	01812403          	lw	s0,24(sp)
80405580:	01412483          	lw	s1,20(sp)
80405584:	01012903          	lw	s2,16(sp)
80405588:	00c12983          	lw	s3,12(sp)
8040558c:	02010113          	addi	sp,sp,32
80405590:	00008067          	ret
80405594:	100027f3          	csrr	a5,sstatus
80405598:	0027f793          	andi	a5,a5,2
8040559c:	02079263          	bnez	a5,804055c0 <pgdir_alloc_page+0xd0>
804055a0:	00095797          	auipc	a5,0x95
804055a4:	2a07a783          	lw	a5,672(a5) # 8049a840 <pmm_manager>
804055a8:	0107a783          	lw	a5,16(a5)
804055ac:	00040513          	mv	a0,s0
804055b0:	00100593          	li	a1,1
804055b4:	000780e7          	jalr	a5
804055b8:	00000413          	li	s0,0
804055bc:	fb9ff06f          	j	80405574 <pgdir_alloc_page+0x84>
804055c0:	fb8fb0ef          	jal	ra,80400d78 <intr_disable>
804055c4:	00095797          	auipc	a5,0x95
804055c8:	27c7a783          	lw	a5,636(a5) # 8049a840 <pmm_manager>
804055cc:	0107a783          	lw	a5,16(a5)
804055d0:	00040513          	mv	a0,s0
804055d4:	00100593          	li	a1,1
804055d8:	000780e7          	jalr	a5
804055dc:	00000413          	li	s0,0
804055e0:	f90fb0ef          	jal	ra,80400d70 <intr_enable>
804055e4:	f91ff06f          	j	80405574 <pgdir_alloc_page+0x84>
804055e8:	0000d697          	auipc	a3,0xd
804055ec:	cd468693          	addi	a3,a3,-812 # 804122bc <default_pmm_manager+0x90>
804055f0:	0000b617          	auipc	a2,0xb
804055f4:	6d060613          	addi	a2,a2,1744 # 80410cc0 <commands+0x3c>
804055f8:	1ee00593          	li	a1,494
804055fc:	0000d517          	auipc	a0,0xd
80405600:	c4c50513          	addi	a0,a0,-948 # 80412248 <default_pmm_manager+0x1c>
80405604:	cc9fa0ef          	jal	ra,804002cc <__panic>

80405608 <print_pgdir>:
80405608:	fa010113          	addi	sp,sp,-96
8040560c:	0000d517          	auipc	a0,0xd
80405610:	cc450513          	addi	a0,a0,-828 # 804122d0 <default_pmm_manager+0xa4>
80405614:	05512223          	sw	s5,68(sp)
80405618:	04112e23          	sw	ra,92(sp)
8040561c:	04812c23          	sw	s0,88(sp)
80405620:	04912a23          	sw	s1,84(sp)
80405624:	05212823          	sw	s2,80(sp)
80405628:	05312623          	sw	s3,76(sp)
8040562c:	05412423          	sw	s4,72(sp)
80405630:	05612023          	sw	s6,64(sp)
80405634:	03712e23          	sw	s7,60(sp)
80405638:	03812c23          	sw	s8,56(sp)
8040563c:	03912a23          	sw	s9,52(sp)
80405640:	03a12823          	sw	s10,48(sp)
80405644:	03b12623          	sw	s11,44(sp)
80405648:	b01fa0ef          	jal	ra,80400148 <cprintf>
8040564c:	00000513          	li	a0,0
80405650:	00012a23          	sw	zero,20(sp)
80405654:	00095a97          	auipc	s5,0x95
80405658:	1f4a8a93          	addi	s5,s5,500 # 8049a848 <va_pa_offset>
8040565c:	00050593          	mv	a1,a0
80405660:	01410713          	addi	a4,sp,20
80405664:	01010693          	addi	a3,sp,16
80405668:	fafec637          	lui	a2,0xfafec
8040566c:	40000513          	li	a0,1024
80405670:	8b8ff0ef          	jal	ra,80404728 <get_pgtable_items.part.0>
80405674:	00050493          	mv	s1,a0
80405678:	08050263          	beqz	a0,804056fc <print_pgdir+0xf4>
8040567c:	01412683          	lw	a3,20(sp)
80405680:	01012603          	lw	a2,16(sp)
80405684:	01b49893          	slli	a7,s1,0x1b
80405688:	01d49813          	slli	a6,s1,0x1d
8040568c:	41f8d893          	srai	a7,a7,0x1f
80405690:	41f85813          	srai	a6,a6,0x1f
80405694:	0488f893          	andi	a7,a7,72
80405698:	00095b97          	auipc	s7,0x95
8040569c:	1acb8b93          	addi	s7,s7,428 # 8049a844 <str.0>
804056a0:	40c685b3          	sub	a1,a3,a2
804056a4:	02d88893          	addi	a7,a7,45
804056a8:	04a87813          	andi	a6,a6,74
804056ac:	02d80813          	addi	a6,a6,45
804056b0:	000b8793          	mv	a5,s7
804056b4:	011b8023          	sb	a7,0(s7)
804056b8:	01659713          	slli	a4,a1,0x16
804056bc:	07200893          	li	a7,114
804056c0:	01669693          	slli	a3,a3,0x16
804056c4:	01661613          	slli	a2,a2,0x16
804056c8:	0000d517          	auipc	a0,0xd
804056cc:	c3c50513          	addi	a0,a0,-964 # 80412304 <default_pmm_manager+0xd8>
804056d0:	010b8123          	sb	a6,2(s7)
804056d4:	011b80a3          	sb	a7,1(s7)
804056d8:	00095817          	auipc	a6,0x95
804056dc:	160807a3          	sb	zero,367(a6) # 8049a847 <str.0+0x3>
804056e0:	a69fa0ef          	jal	ra,80400148 <cprintf>
804056e4:	00f4f493          	andi	s1,s1,15
804056e8:	00100793          	li	a5,1
804056ec:	04f48c63          	beq	s1,a5,80405744 <print_pgdir+0x13c>
804056f0:	01412503          	lw	a0,20(sp)
804056f4:	3ff00793          	li	a5,1023
804056f8:	f6a7f2e3          	bgeu	a5,a0,8040565c <print_pgdir+0x54>
804056fc:	0000d517          	auipc	a0,0xd
80405700:	c4c50513          	addi	a0,a0,-948 # 80412348 <default_pmm_manager+0x11c>
80405704:	a45fa0ef          	jal	ra,80400148 <cprintf>
80405708:	05c12083          	lw	ra,92(sp)
8040570c:	05812403          	lw	s0,88(sp)
80405710:	05412483          	lw	s1,84(sp)
80405714:	05012903          	lw	s2,80(sp)
80405718:	04c12983          	lw	s3,76(sp)
8040571c:	04812a03          	lw	s4,72(sp)
80405720:	04412a83          	lw	s5,68(sp)
80405724:	04012b03          	lw	s6,64(sp)
80405728:	03c12b83          	lw	s7,60(sp)
8040572c:	03812c03          	lw	s8,56(sp)
80405730:	03412c83          	lw	s9,52(sp)
80405734:	03012d03          	lw	s10,48(sp)
80405738:	02c12d83          	lw	s11,44(sp)
8040573c:	06010113          	addi	sp,sp,96
80405740:	00008067          	ret
80405744:	01012c03          	lw	s8,16(sp)
80405748:	01412503          	lw	a0,20(sp)
8040574c:	00ac1593          	slli	a1,s8,0xa
80405750:	00b12e23          	sw	a1,28(sp)
80405754:	faac70e3          	bgeu	s8,a0,804056f4 <print_pgdir+0xec>
80405758:	fafec7b7          	lui	a5,0xfafec
8040575c:	ffc78793          	addi	a5,a5,-4 # fafebffc <end+0x7ab51768>
80405760:	40058c93          	addi	s9,a1,1024
80405764:	00000d93          	li	s11,0
80405768:	00095a17          	auipc	s4,0x95
8040576c:	0d0a0a13          	addi	s4,s4,208 # 8049a838 <npage>
80405770:	00f12623          	sw	a5,12(sp)
80405774:	00c12783          	lw	a5,12(sp)
80405778:	001c0c13          	addi	s8,s8,1
8040577c:	002c1493          	slli	s1,s8,0x2
80405780:	00f484b3          	add	s1,s1,a5
80405784:	0004a603          	lw	a2,0(s1)
80405788:	fffff6b7          	lui	a3,0xfffff
8040578c:	000a2703          	lw	a4,0(s4)
80405790:	00261613          	slli	a2,a2,0x2
80405794:	00d67633          	and	a2,a2,a3
80405798:	00c65693          	srli	a3,a2,0xc
8040579c:	0ae6f063          	bgeu	a3,a4,8040583c <print_pgdir+0x234>
804057a0:	00cc1913          	slli	s2,s8,0xc
804057a4:	00001737          	lui	a4,0x1
804057a8:	41270933          	sub	s2,a4,s2
804057ac:	fffffb37          	lui	s6,0xfffff
804057b0:	04c0006f          	j	804057fc <print_pgdir+0x1f4>
804057b4:	01c10713          	addi	a4,sp,28
804057b8:	01810693          	addi	a3,sp,24
804057bc:	000c8513          	mv	a0,s9
804057c0:	f69fe0ef          	jal	ra,80404728 <get_pgtable_items.part.0>
804057c4:	00050d13          	mv	s10,a0
804057c8:	04050263          	beqz	a0,8040580c <print_pgdir+0x204>
804057cc:	05b50a63          	beq	a0,s11,80405820 <print_pgdir+0x218>
804057d0:	080d9463          	bnez	s11,80405858 <print_pgdir+0x250>
804057d4:	0004a603          	lw	a2,0(s1)
804057d8:	000a2683          	lw	a3,0(s4)
804057dc:	01812983          	lw	s3,24(sp)
804057e0:	00261613          	slli	a2,a2,0x2
804057e4:	01667633          	and	a2,a2,s6
804057e8:	00c65713          	srli	a4,a2,0xc
804057ec:	01c12583          	lw	a1,28(sp)
804057f0:	000d0d93          	mv	s11,s10
804057f4:	04d77463          	bgeu	a4,a3,8040583c <print_pgdir+0x234>
804057f8:	00058413          	mv	s0,a1
804057fc:	000aa683          	lw	a3,0(s5)
80405800:	00d60633          	add	a2,a2,a3
80405804:	01260633          	add	a2,a2,s2
80405808:	fb95e6e3          	bltu	a1,s9,804057b4 <print_pgdir+0x1ac>
8040580c:	01412503          	lw	a0,20(sp)
80405810:	400c8c93          	addi	s9,s9,1024
80405814:	0aac7063          	bgeu	s8,a0,804058b4 <print_pgdir+0x2ac>
80405818:	01c12583          	lw	a1,28(sp)
8040581c:	f59ff06f          	j	80405774 <print_pgdir+0x16c>
80405820:	0004a603          	lw	a2,0(s1)
80405824:	000a2683          	lw	a3,0(s4)
80405828:	01c12583          	lw	a1,28(sp)
8040582c:	00261613          	slli	a2,a2,0x2
80405830:	01667633          	and	a2,a2,s6
80405834:	00c65713          	srli	a4,a2,0xc
80405838:	fcd760e3          	bltu	a4,a3,804057f8 <print_pgdir+0x1f0>
8040583c:	00060693          	mv	a3,a2
80405840:	29c00593          	li	a1,668
80405844:	0000c617          	auipc	a2,0xc
80405848:	26460613          	addi	a2,a2,612 # 80411aa8 <commands+0xe24>
8040584c:	0000d517          	auipc	a0,0xd
80405850:	9fc50513          	addi	a0,a0,-1540 # 80412248 <default_pmm_manager+0x1c>
80405854:	a79fa0ef          	jal	ra,804002cc <__panic>
80405858:	01bd9e13          	slli	t3,s11,0x1b
8040585c:	01dd9313          	slli	t1,s11,0x1d
80405860:	41fe5e13          	srai	t3,t3,0x1f
80405864:	41f35313          	srai	t1,t1,0x1f
80405868:	413405b3          	sub	a1,s0,s3
8040586c:	048e7e13          	andi	t3,t3,72
80405870:	04a37313          	andi	t1,t1,74
80405874:	07200813          	li	a6,114
80405878:	02de0e13          	addi	t3,t3,45
8040587c:	02d30313          	addi	t1,t1,45
80405880:	000b8793          	mv	a5,s7
80405884:	00c59713          	slli	a4,a1,0xc
80405888:	00c41693          	slli	a3,s0,0xc
8040588c:	00c99613          	slli	a2,s3,0xc
80405890:	0000d517          	auipc	a0,0xd
80405894:	a9450513          	addi	a0,a0,-1388 # 80412324 <default_pmm_manager+0xf8>
80405898:	010b80a3          	sb	a6,1(s7)
8040589c:	01cb8023          	sb	t3,0(s7)
804058a0:	006b8123          	sb	t1,2(s7)
804058a4:	00095817          	auipc	a6,0x95
804058a8:	fa0801a3          	sb	zero,-93(a6) # 8049a847 <str.0+0x3>
804058ac:	89dfa0ef          	jal	ra,80400148 <cprintf>
804058b0:	f25ff06f          	j	804057d4 <print_pgdir+0x1cc>
804058b4:	e40d80e3          	beqz	s11,804056f4 <print_pgdir+0xec>
804058b8:	01bd9893          	slli	a7,s11,0x1b
804058bc:	01dd9813          	slli	a6,s11,0x1d
804058c0:	41f8d893          	srai	a7,a7,0x1f
804058c4:	41f85813          	srai	a6,a6,0x1f
804058c8:	0488f893          	andi	a7,a7,72
804058cc:	413405b3          	sub	a1,s0,s3
804058d0:	02d88893          	addi	a7,a7,45
804058d4:	04a87813          	andi	a6,a6,74
804058d8:	02d80813          	addi	a6,a6,45
804058dc:	011b8023          	sb	a7,0(s7)
804058e0:	00095797          	auipc	a5,0x95
804058e4:	f6478793          	addi	a5,a5,-156 # 8049a844 <str.0>
804058e8:	07200893          	li	a7,114
804058ec:	00c59713          	slli	a4,a1,0xc
804058f0:	00c41693          	slli	a3,s0,0xc
804058f4:	00c99613          	slli	a2,s3,0xc
804058f8:	0000d517          	auipc	a0,0xd
804058fc:	a2c50513          	addi	a0,a0,-1492 # 80412324 <default_pmm_manager+0xf8>
80405900:	010b8123          	sb	a6,2(s7)
80405904:	011b80a3          	sb	a7,1(s7)
80405908:	00095817          	auipc	a6,0x95
8040590c:	f2080fa3          	sb	zero,-193(a6) # 8049a847 <str.0+0x3>
80405910:	839fa0ef          	jal	ra,80400148 <cprintf>
80405914:	dddff06f          	j	804056f0 <print_pgdir+0xe8>

80405918 <pmm_init>:
80405918:	0000d797          	auipc	a5,0xd
8040591c:	91478793          	addi	a5,a5,-1772 # 8041222c <default_pmm_manager>
80405920:	0007a583          	lw	a1,0(a5)
80405924:	fc010113          	addi	sp,sp,-64
80405928:	03412423          	sw	s4,40(sp)
8040592c:	0000d517          	auipc	a0,0xd
80405930:	a5050513          	addi	a0,a0,-1456 # 8041237c <default_pmm_manager+0x150>
80405934:	00095a17          	auipc	s4,0x95
80405938:	f0ca0a13          	addi	s4,s4,-244 # 8049a840 <pmm_manager>
8040593c:	02112e23          	sw	ra,60(sp)
80405940:	02812c23          	sw	s0,56(sp)
80405944:	02912a23          	sw	s1,52(sp)
80405948:	03212823          	sw	s2,48(sp)
8040594c:	03312623          	sw	s3,44(sp)
80405950:	00fa2023          	sw	a5,0(s4)
80405954:	03512223          	sw	s5,36(sp)
80405958:	03612023          	sw	s6,32(sp)
8040595c:	01712e23          	sw	s7,28(sp)
80405960:	01812c23          	sw	s8,24(sp)
80405964:	01912a23          	sw	s9,20(sp)
80405968:	01a12823          	sw	s10,16(sp)
8040596c:	fdcfa0ef          	jal	ra,80400148 <cprintf>
80405970:	000a2783          	lw	a5,0(s4)
80405974:	ffffa417          	auipc	s0,0xffffa
80405978:	68c40413          	addi	s0,s0,1676 # 80400000 <kern_entry>
8040597c:	00095917          	auipc	s2,0x95
80405980:	ecc90913          	addi	s2,s2,-308 # 8049a848 <va_pa_offset>
80405984:	0047a783          	lw	a5,4(a5)
80405988:	00095497          	auipc	s1,0x95
8040598c:	eb048493          	addi	s1,s1,-336 # 8049a838 <npage>
80405990:	00095997          	auipc	s3,0x95
80405994:	eac98993          	addi	s3,s3,-340 # 8049a83c <pages>
80405998:	000780e7          	jalr	a5
8040599c:	804007b7          	lui	a5,0x80400
804059a0:	408787b3          	sub	a5,a5,s0
804059a4:	0000d517          	auipc	a0,0xd
804059a8:	9f050513          	addi	a0,a0,-1552 # 80412394 <default_pmm_manager+0x168>
804059ac:	00f92023          	sw	a5,0(s2)
804059b0:	f98fa0ef          	jal	ra,80400148 <cprintf>
804059b4:	808005b7          	lui	a1,0x80800
804059b8:	fff58693          	addi	a3,a1,-1 # 807fffff <end+0x36576b>
804059bc:	00040613          	mv	a2,s0
804059c0:	408585b3          	sub	a1,a1,s0
804059c4:	0000d517          	auipc	a0,0xd
804059c8:	9e850513          	addi	a0,a0,-1560 # 804123ac <default_pmm_manager+0x180>
804059cc:	f7cfa0ef          	jal	ra,80400148 <cprintf>
804059d0:	fffff737          	lui	a4,0xfffff
804059d4:	00096797          	auipc	a5,0x96
804059d8:	ebf78793          	addi	a5,a5,-321 # 8049b893 <end+0xfff>
804059dc:	00e7f7b3          	and	a5,a5,a4
804059e0:	00081737          	lui	a4,0x81
804059e4:	80070713          	addi	a4,a4,-2048 # 80800 <_binary_bin_sfs_img_size+0x8800>
804059e8:	000106b7          	lui	a3,0x10
804059ec:	00e4a023          	sw	a4,0(s1)
804059f0:	00078513          	mv	a0,a5
804059f4:	00f9a023          	sw	a5,0(s3)
804059f8:	00d786b3          	add	a3,a5,a3
804059fc:	0047a703          	lw	a4,4(a5)
80405a00:	02078793          	addi	a5,a5,32
80405a04:	00176713          	ori	a4,a4,1
80405a08:	fee7a223          	sw	a4,-28(a5)
80405a0c:	fef698e3          	bne	a3,a5,804059fc <pmm_init+0xe4>
80405a10:	804007b7          	lui	a5,0x80400
80405a14:	2af6ece3          	bltu	a3,a5,804064cc <pmm_init+0xbb4>
80405a18:	00092783          	lw	a5,0(s2)
80405a1c:	80800737          	lui	a4,0x80800
80405a20:	40f686b3          	sub	a3,a3,a5
80405a24:	58e6ea63          	bltu	a3,a4,80405fb8 <pmm_init+0x6a0>
80405a28:	000a2783          	lw	a5,0(s4)
80405a2c:	0187a783          	lw	a5,24(a5) # 80400018 <end+0xfff65784>
80405a30:	000780e7          	jalr	a5
80405a34:	0000d517          	auipc	a0,0xd
80405a38:	9a050513          	addi	a0,a0,-1632 # 804123d4 <default_pmm_manager+0x1a8>
80405a3c:	f0cfa0ef          	jal	ra,80400148 <cprintf>
80405a40:	00100513          	li	a0,1
80405a44:	d99fe0ef          	jal	ra,804047dc <alloc_pages>
80405a48:	6c050063          	beqz	a0,80406108 <pmm_init+0x7f0>
80405a4c:	0009a783          	lw	a5,0(s3)
80405a50:	00080737          	lui	a4,0x80
80405a54:	0004a603          	lw	a2,0(s1)
80405a58:	40f507b3          	sub	a5,a0,a5
80405a5c:	4057d793          	srai	a5,a5,0x5
80405a60:	00e787b3          	add	a5,a5,a4
80405a64:	00c79713          	slli	a4,a5,0xc
80405a68:	00c75713          	srli	a4,a4,0xc
80405a6c:	00c79693          	slli	a3,a5,0xc
80405a70:	0ec772e3          	bgeu	a4,a2,80406354 <pmm_init+0xa3c>
80405a74:	00092503          	lw	a0,0(s2)
80405a78:	00095a97          	auipc	s5,0x95
80405a7c:	dbca8a93          	addi	s5,s5,-580 # 8049a834 <boot_pgdir>
80405a80:	00001637          	lui	a2,0x1
80405a84:	00a68533          	add	a0,a3,a0
80405a88:	00000593          	li	a1,0
80405a8c:	00aaa023          	sw	a0,0(s5)
80405a90:	6e40a0ef          	jal	ra,80410174 <memset>
80405a94:	000aa503          	lw	a0,0(s5)
80405a98:	804007b7          	lui	a5,0x80400
80405a9c:	08f56ee3          	bltu	a0,a5,80406338 <pmm_init+0xa20>
80405aa0:	00092783          	lw	a5,0(s2)
80405aa4:	00095c97          	auipc	s9,0x95
80405aa8:	d8cc8c93          	addi	s9,s9,-628 # 8049a830 <boot_cr3>
80405aac:	0004a703          	lw	a4,0(s1)
80405ab0:	40f507b3          	sub	a5,a0,a5
80405ab4:	00fca023          	sw	a5,0(s9)
80405ab8:	000b87b7          	lui	a5,0xb8
80405abc:	40078793          	addi	a5,a5,1024 # b8400 <_binary_bin_sfs_img_size+0x40400>
80405ac0:	04e7ece3          	bltu	a5,a4,80406318 <pmm_init+0xa00>
80405ac4:	2e0500e3          	beqz	a0,804065a4 <pmm_init+0xc8c>
80405ac8:	01451793          	slli	a5,a0,0x14
80405acc:	2c079ce3          	bnez	a5,804065a4 <pmm_init+0xc8c>
80405ad0:	00000613          	li	a2,0
80405ad4:	00000593          	li	a1,0
80405ad8:	ff5fe0ef          	jal	ra,80404acc <get_page>
80405adc:	000512e3          	bnez	a0,804062e0 <pmm_init+0x9c8>
80405ae0:	00100513          	li	a0,1
80405ae4:	cf9fe0ef          	jal	ra,804047dc <alloc_pages>
80405ae8:	00050413          	mv	s0,a0
80405aec:	000aa503          	lw	a0,0(s5)
80405af0:	00000693          	li	a3,0
80405af4:	00000613          	li	a2,0
80405af8:	00040593          	mv	a1,s0
80405afc:	db8ff0ef          	jal	ra,804050b4 <page_insert>
80405b00:	7c051063          	bnez	a0,804062c0 <pmm_init+0x9a8>
80405b04:	000aa503          	lw	a0,0(s5)
80405b08:	00000613          	li	a2,0
80405b0c:	00000593          	li	a1,0
80405b10:	e5dfe0ef          	jal	ra,8040496c <get_pte>
80405b14:	78050663          	beqz	a0,804062a0 <pmm_init+0x988>
80405b18:	00052783          	lw	a5,0(a0)
80405b1c:	0017f713          	andi	a4,a5,1
80405b20:	0a0704e3          	beqz	a4,804063c8 <pmm_init+0xab0>
80405b24:	0004a603          	lw	a2,0(s1)
80405b28:	00279793          	slli	a5,a5,0x2
80405b2c:	00c7d793          	srli	a5,a5,0xc
80405b30:	08c7fae3          	bgeu	a5,a2,804063c4 <pmm_init+0xaac>
80405b34:	0009a703          	lw	a4,0(s3)
80405b38:	fff806b7          	lui	a3,0xfff80
80405b3c:	00d787b3          	add	a5,a5,a3
80405b40:	00579793          	slli	a5,a5,0x5
80405b44:	00f707b3          	add	a5,a4,a5
80405b48:	04f41ee3          	bne	s0,a5,804063a4 <pmm_init+0xa8c>
80405b4c:	00042703          	lw	a4,0(s0)
80405b50:	00100793          	li	a5,1
80405b54:	02f718e3          	bne	a4,a5,80406384 <pmm_init+0xa6c>
80405b58:	000aa503          	lw	a0,0(s5)
80405b5c:	fffff7b7          	lui	a5,0xfffff
80405b60:	00052683          	lw	a3,0(a0)
80405b64:	00269693          	slli	a3,a3,0x2
80405b68:	00f6f6b3          	and	a3,a3,a5
80405b6c:	00c6d793          	srli	a5,a3,0xc
80405b70:	7ec7fe63          	bgeu	a5,a2,8040636c <pmm_init+0xa54>
80405b74:	00092b03          	lw	s6,0(s2)
80405b78:	00000613          	li	a2,0
80405b7c:	000015b7          	lui	a1,0x1
80405b80:	016686b3          	add	a3,a3,s6
80405b84:	00468b13          	addi	s6,a3,4 # fff80004 <end+0x7fae5770>
80405b88:	de5fe0ef          	jal	ra,8040496c <get_pte>
80405b8c:	08ab10e3          	bne	s6,a0,8040640c <pmm_init+0xaf4>
80405b90:	00100513          	li	a0,1
80405b94:	c49fe0ef          	jal	ra,804047dc <alloc_pages>
80405b98:	00050b13          	mv	s6,a0
80405b9c:	000aa503          	lw	a0,0(s5)
80405ba0:	01400693          	li	a3,20
80405ba4:	00001637          	lui	a2,0x1
80405ba8:	000b0593          	mv	a1,s6
80405bac:	d08ff0ef          	jal	ra,804050b4 <page_insert>
80405bb0:	02051ee3          	bnez	a0,804063ec <pmm_init+0xad4>
80405bb4:	000aa503          	lw	a0,0(s5)
80405bb8:	00000613          	li	a2,0
80405bbc:	000015b7          	lui	a1,0x1
80405bc0:	dadfe0ef          	jal	ra,8040496c <get_pte>
80405bc4:	000504e3          	beqz	a0,804063cc <pmm_init+0xab4>
80405bc8:	00052783          	lw	a5,0(a0)
80405bcc:	0107f713          	andi	a4,a5,16
80405bd0:	62070863          	beqz	a4,80406200 <pmm_init+0x8e8>
80405bd4:	0047f793          	andi	a5,a5,4
80405bd8:	60078463          	beqz	a5,804061e0 <pmm_init+0x8c8>
80405bdc:	000aa503          	lw	a0,0(s5)
80405be0:	00052783          	lw	a5,0(a0)
80405be4:	0107f793          	andi	a5,a5,16
80405be8:	5c078c63          	beqz	a5,804061c0 <pmm_init+0x8a8>
80405bec:	000b2b83          	lw	s7,0(s6) # fffff000 <end+0x7fb6476c>
80405bf0:	00100793          	li	a5,1
80405bf4:	5afb9663          	bne	s7,a5,804061a0 <pmm_init+0x888>
80405bf8:	00000693          	li	a3,0
80405bfc:	00001637          	lui	a2,0x1
80405c00:	00040593          	mv	a1,s0
80405c04:	cb0ff0ef          	jal	ra,804050b4 <page_insert>
80405c08:	56051c63          	bnez	a0,80406180 <pmm_init+0x868>
80405c0c:	00042703          	lw	a4,0(s0)
80405c10:	00200793          	li	a5,2
80405c14:	54f71663          	bne	a4,a5,80406160 <pmm_init+0x848>
80405c18:	000b2783          	lw	a5,0(s6)
80405c1c:	52079263          	bnez	a5,80406140 <pmm_init+0x828>
80405c20:	000aa503          	lw	a0,0(s5)
80405c24:	00000613          	li	a2,0
80405c28:	000015b7          	lui	a1,0x1
80405c2c:	d41fe0ef          	jal	ra,8040496c <get_pte>
80405c30:	4e050863          	beqz	a0,80406120 <pmm_init+0x808>
80405c34:	00052703          	lw	a4,0(a0)
80405c38:	00177793          	andi	a5,a4,1
80405c3c:	78078663          	beqz	a5,804063c8 <pmm_init+0xab0>
80405c40:	0004a683          	lw	a3,0(s1)
80405c44:	00271793          	slli	a5,a4,0x2
80405c48:	00c7d793          	srli	a5,a5,0xc
80405c4c:	76d7fc63          	bgeu	a5,a3,804063c4 <pmm_init+0xaac>
80405c50:	0009a683          	lw	a3,0(s3)
80405c54:	fff80637          	lui	a2,0xfff80
80405c58:	00c787b3          	add	a5,a5,a2
80405c5c:	00579793          	slli	a5,a5,0x5
80405c60:	00f687b3          	add	a5,a3,a5
80405c64:	60f41e63          	bne	s0,a5,80406280 <pmm_init+0x968>
80405c68:	01077713          	andi	a4,a4,16
80405c6c:	5e071a63          	bnez	a4,80406260 <pmm_init+0x948>
80405c70:	000aa503          	lw	a0,0(s5)
80405c74:	00000593          	li	a1,0
80405c78:	af8ff0ef          	jal	ra,80404f70 <page_remove>
80405c7c:	00042783          	lw	a5,0(s0)
80405c80:	5d779063          	bne	a5,s7,80406240 <pmm_init+0x928>
80405c84:	000b2783          	lw	a5,0(s6)
80405c88:	58079c63          	bnez	a5,80406220 <pmm_init+0x908>
80405c8c:	000aa503          	lw	a0,0(s5)
80405c90:	000015b7          	lui	a1,0x1
80405c94:	adcff0ef          	jal	ra,80404f70 <page_remove>
80405c98:	00042783          	lw	a5,0(s0)
80405c9c:	44079663          	bnez	a5,804060e8 <pmm_init+0x7d0>
80405ca0:	000b2783          	lw	a5,0(s6)
80405ca4:	060790e3          	bnez	a5,80406504 <pmm_init+0xbec>
80405ca8:	000aa783          	lw	a5,0(s5)
80405cac:	0004a703          	lw	a4,0(s1)
80405cb0:	0007a783          	lw	a5,0(a5) # fffff000 <end+0x7fb6476c>
80405cb4:	00279793          	slli	a5,a5,0x2
80405cb8:	00c7d793          	srli	a5,a5,0xc
80405cbc:	70e7f463          	bgeu	a5,a4,804063c4 <pmm_init+0xaac>
80405cc0:	fff80737          	lui	a4,0xfff80
80405cc4:	0009a503          	lw	a0,0(s3)
80405cc8:	00e787b3          	add	a5,a5,a4
80405ccc:	00579793          	slli	a5,a5,0x5
80405cd0:	00f50533          	add	a0,a0,a5
80405cd4:	00052703          	lw	a4,0(a0)
80405cd8:	00100793          	li	a5,1
80405cdc:	00f714e3          	bne	a4,a5,804064e4 <pmm_init+0xbcc>
80405ce0:	100027f3          	csrr	a5,sstatus
80405ce4:	0027f793          	andi	a5,a5,2
80405ce8:	30079e63          	bnez	a5,80406004 <pmm_init+0x6ec>
80405cec:	000a2783          	lw	a5,0(s4)
80405cf0:	00100593          	li	a1,1
80405cf4:	0107a783          	lw	a5,16(a5)
80405cf8:	000780e7          	jalr	a5
80405cfc:	000aa783          	lw	a5,0(s5)
80405d00:	0000d517          	auipc	a0,0xd
80405d04:	99850513          	addi	a0,a0,-1640 # 80412698 <default_pmm_manager+0x46c>
80405d08:	0007a023          	sw	zero,0(a5)
80405d0c:	c3cfa0ef          	jal	ra,80400148 <cprintf>
80405d10:	000ca783          	lw	a5,0(s9)
80405d14:	00092703          	lw	a4,0(s2)
80405d18:	000aab03          	lw	s6,0(s5)
80405d1c:	804006b7          	lui	a3,0x80400
80405d20:	00c7d793          	srli	a5,a5,0xc
80405d24:	00a79793          	slli	a5,a5,0xa
80405d28:	00001637          	lui	a2,0x1
80405d2c:	40e68733          	sub	a4,a3,a4
80405d30:	00cb05b3          	add	a1,s6,a2
80405d34:	0017e513          	ori	a0,a5,1
80405d38:	00d746b3          	xor	a3,a4,a3
80405d3c:	0077e793          	ori	a5,a5,7
80405d40:	fff60613          	addi	a2,a2,-1 # fff <_binary_bin_swap_img_size-0x7001>
80405d44:	faf5a823          	sw	a5,-80(a1) # fb0 <_binary_bin_swap_img_size-0x7050>
80405d48:	faa5a623          	sw	a0,-84(a1)
80405d4c:	00c6f7b3          	and	a5,a3,a2
80405d50:	7c079a63          	bnez	a5,80406524 <pmm_init+0xc0c>
80405d54:	fffff437          	lui	s0,0xfffff
80405d58:	00877733          	and	a4,a4,s0
80405d5c:	7fc00437          	lui	s0,0x7fc00
80405d60:	80400d37          	lui	s10,0x80400
80405d64:	00870433          	add	s0,a4,s0
80405d68:	00001c37          	lui	s8,0x1
80405d6c:	b8400bb7          	lui	s7,0xb8400
80405d70:	00100613          	li	a2,1
80405d74:	000d0593          	mv	a1,s10
80405d78:	000b0513          	mv	a0,s6
80405d7c:	bf1fe0ef          	jal	ra,8040496c <get_pte>
80405d80:	01a407b3          	add	a5,s0,s10
80405d84:	34050263          	beqz	a0,804060c8 <pmm_init+0x7b0>
80405d88:	00c7d793          	srli	a5,a5,0xc
80405d8c:	00a79793          	slli	a5,a5,0xa
80405d90:	00f7e793          	ori	a5,a5,15
80405d94:	00f52023          	sw	a5,0(a0)
80405d98:	018d0d33          	add	s10,s10,s8
80405d9c:	fd7d1ae3          	bne	s10,s7,80405d70 <pmm_init+0x458>
80405da0:	000ca783          	lw	a5,0(s9)
80405da4:	80000737          	lui	a4,0x80000
80405da8:	00c7d793          	srli	a5,a5,0xc
80405dac:	00e7e7b3          	or	a5,a5,a4
80405db0:	18079073          	csrw	satp,a5
80405db4:	12000073          	sfence.vma
80405db8:	0004a703          	lw	a4,0(s1)
80405dbc:	804007b7          	lui	a5,0x80400
80405dc0:	00c71693          	slli	a3,a4,0xc
80405dc4:	04d7f863          	bgeu	a5,a3,80405e14 <pmm_init+0x4fc>
80405dc8:	80400437          	lui	s0,0x80400
80405dcc:	fffffbb7          	lui	s7,0xfffff
80405dd0:	00001b37          	lui	s6,0x1
80405dd4:	00c45793          	srli	a5,s0,0xc
80405dd8:	000aa503          	lw	a0,0(s5)
80405ddc:	2ce7f863          	bgeu	a5,a4,804060ac <pmm_init+0x794>
80405de0:	00092583          	lw	a1,0(s2)
80405de4:	00000613          	li	a2,0
80405de8:	00b405b3          	add	a1,s0,a1
80405dec:	b81fe0ef          	jal	ra,8040496c <get_pte>
80405df0:	28050e63          	beqz	a0,8040608c <pmm_init+0x774>
80405df4:	00052783          	lw	a5,0(a0)
80405df8:	00279793          	slli	a5,a5,0x2
80405dfc:	0177f7b3          	and	a5,a5,s7
80405e00:	26879663          	bne	a5,s0,8040606c <pmm_init+0x754>
80405e04:	0004a703          	lw	a4,0(s1)
80405e08:	01640433          	add	s0,s0,s6
80405e0c:	00c71793          	slli	a5,a4,0xc
80405e10:	fcf462e3          	bltu	s0,a5,80405dd4 <pmm_init+0x4bc>
80405e14:	000aa683          	lw	a3,0(s5)
80405e18:	00001b37          	lui	s6,0x1
80405e1c:	fffff637          	lui	a2,0xfffff
80405e20:	016687b3          	add	a5,a3,s6
80405e24:	fac7a783          	lw	a5,-84(a5) # 803fffac <end+0xfff65718>
80405e28:	80400737          	lui	a4,0x80400
80405e2c:	00279793          	slli	a5,a5,0x2
80405e30:	00c7f7b3          	and	a5,a5,a2
80405e34:	4ce6e663          	bltu	a3,a4,80406300 <pmm_init+0x9e8>
80405e38:	00092703          	lw	a4,0(s2)
80405e3c:	40e68733          	sub	a4,a3,a4
80405e40:	66e79663          	bne	a5,a4,804064ac <pmm_init+0xb94>
80405e44:	0006a783          	lw	a5,0(a3) # 80400000 <end+0xfff6576c>
80405e48:	64079263          	bnez	a5,8040648c <pmm_init+0xb74>
80405e4c:	00100513          	li	a0,1
80405e50:	98dfe0ef          	jal	ra,804047dc <alloc_pages>
80405e54:	00050413          	mv	s0,a0
80405e58:	000aa503          	lw	a0,0(s5)
80405e5c:	00600693          	li	a3,6
80405e60:	10000613          	li	a2,256
80405e64:	00040593          	mv	a1,s0
80405e68:	a4cff0ef          	jal	ra,804050b4 <page_insert>
80405e6c:	5c051063          	bnez	a0,8040642c <pmm_init+0xb14>
80405e70:	00042703          	lw	a4,0(s0) # 80400000 <end+0xfff6576c>
80405e74:	00100793          	li	a5,1
80405e78:	70f71663          	bne	a4,a5,80406584 <pmm_init+0xc6c>
80405e7c:	000aa503          	lw	a0,0(s5)
80405e80:	00600693          	li	a3,6
80405e84:	100b0613          	addi	a2,s6,256 # 1100 <_binary_bin_swap_img_size-0x6f00>
80405e88:	00040593          	mv	a1,s0
80405e8c:	a28ff0ef          	jal	ra,804050b4 <page_insert>
80405e90:	6c051a63          	bnez	a0,80406564 <pmm_init+0xc4c>
80405e94:	00042703          	lw	a4,0(s0)
80405e98:	00200793          	li	a5,2
80405e9c:	6af71463          	bne	a4,a5,80406544 <pmm_init+0xc2c>
80405ea0:	0000d597          	auipc	a1,0xd
80405ea4:	97c58593          	addi	a1,a1,-1668 # 8041281c <default_pmm_manager+0x5f0>
80405ea8:	10000513          	li	a0,256
80405eac:	2500a0ef          	jal	ra,804100fc <strcpy>
80405eb0:	100b0593          	addi	a1,s6,256
80405eb4:	10000513          	li	a0,256
80405eb8:	2600a0ef          	jal	ra,80410118 <strcmp>
80405ebc:	5a051863          	bnez	a0,8040646c <pmm_init+0xb54>
80405ec0:	0009a783          	lw	a5,0(s3)
80405ec4:	00080737          	lui	a4,0x80
80405ec8:	0004a603          	lw	a2,0(s1)
80405ecc:	40f407b3          	sub	a5,s0,a5
80405ed0:	4057d793          	srai	a5,a5,0x5
80405ed4:	00e787b3          	add	a5,a5,a4
80405ed8:	00c79713          	slli	a4,a5,0xc
80405edc:	00c75713          	srli	a4,a4,0xc
80405ee0:	00c79693          	slli	a3,a5,0xc
80405ee4:	46c77863          	bgeu	a4,a2,80406354 <pmm_init+0xa3c>
80405ee8:	00092783          	lw	a5,0(s2)
80405eec:	10000513          	li	a0,256
80405ef0:	00d787b3          	add	a5,a5,a3
80405ef4:	10078023          	sb	zero,256(a5)
80405ef8:	1b00a0ef          	jal	ra,804100a8 <strlen>
80405efc:	54051863          	bnez	a0,8040644c <pmm_init+0xb34>
80405f00:	100027f3          	csrr	a5,sstatus
80405f04:	0027f793          	andi	a5,a5,2
80405f08:	14079263          	bnez	a5,8040604c <pmm_init+0x734>
80405f0c:	000a2783          	lw	a5,0(s4)
80405f10:	00100593          	li	a1,1
80405f14:	00040513          	mv	a0,s0
80405f18:	0107a783          	lw	a5,16(a5)
80405f1c:	000780e7          	jalr	a5
80405f20:	000aa783          	lw	a5,0(s5)
80405f24:	0004a703          	lw	a4,0(s1)
80405f28:	0007a783          	lw	a5,0(a5)
80405f2c:	00279793          	slli	a5,a5,0x2
80405f30:	00c7d793          	srli	a5,a5,0xc
80405f34:	48e7f863          	bgeu	a5,a4,804063c4 <pmm_init+0xaac>
80405f38:	0009a503          	lw	a0,0(s3)
80405f3c:	fff80737          	lui	a4,0xfff80
80405f40:	00e787b3          	add	a5,a5,a4
80405f44:	00579793          	slli	a5,a5,0x5
80405f48:	00f50533          	add	a0,a0,a5
80405f4c:	100027f3          	csrr	a5,sstatus
80405f50:	0027f793          	andi	a5,a5,2
80405f54:	0c079a63          	bnez	a5,80406028 <pmm_init+0x710>
80405f58:	000a2783          	lw	a5,0(s4)
80405f5c:	00100593          	li	a1,1
80405f60:	0107a783          	lw	a5,16(a5)
80405f64:	000780e7          	jalr	a5
80405f68:	000aa783          	lw	a5,0(s5)
80405f6c:	0000d517          	auipc	a0,0xd
80405f70:	92450513          	addi	a0,a0,-1756 # 80412890 <default_pmm_manager+0x664>
80405f74:	0007a023          	sw	zero,0(a5)
80405f78:	9d0fa0ef          	jal	ra,80400148 <cprintf>
80405f7c:	e8cff0ef          	jal	ra,80405608 <print_pgdir>
80405f80:	03812403          	lw	s0,56(sp)
80405f84:	03c12083          	lw	ra,60(sp)
80405f88:	03412483          	lw	s1,52(sp)
80405f8c:	03012903          	lw	s2,48(sp)
80405f90:	02c12983          	lw	s3,44(sp)
80405f94:	02812a03          	lw	s4,40(sp)
80405f98:	02412a83          	lw	s5,36(sp)
80405f9c:	02012b03          	lw	s6,32(sp)
80405fa0:	01c12b83          	lw	s7,28(sp)
80405fa4:	01812c03          	lw	s8,24(sp)
80405fa8:	01412c83          	lw	s9,20(sp)
80405fac:	01012d03          	lw	s10,16(sp)
80405fb0:	04010113          	addi	sp,sp,64
80405fb4:	e35fc06f          	j	80402de8 <kmalloc_init>
80405fb8:	000017b7          	lui	a5,0x1
80405fbc:	fff78793          	addi	a5,a5,-1 # fff <_binary_bin_swap_img_size-0x7001>
80405fc0:	00f686b3          	add	a3,a3,a5
80405fc4:	fffff7b7          	lui	a5,0xfffff
80405fc8:	00f6f7b3          	and	a5,a3,a5
80405fcc:	00081637          	lui	a2,0x81
80405fd0:	00c7d693          	srli	a3,a5,0xc
80405fd4:	80060613          	addi	a2,a2,-2048 # 80800 <_binary_bin_sfs_img_size+0x8800>
80405fd8:	3ec68663          	beq	a3,a2,804063c4 <pmm_init+0xaac>
80405fdc:	000a2603          	lw	a2,0(s4)
80405fe0:	fff805b7          	lui	a1,0xfff80
80405fe4:	00b686b3          	add	a3,a3,a1
80405fe8:	00862603          	lw	a2,8(a2)
80405fec:	40f707b3          	sub	a5,a4,a5
80405ff0:	00569693          	slli	a3,a3,0x5
80405ff4:	00c7d593          	srli	a1,a5,0xc
80405ff8:	00d50533          	add	a0,a0,a3
80405ffc:	000600e7          	jalr	a2
80406000:	a29ff06f          	j	80405a28 <pmm_init+0x110>
80406004:	00a12623          	sw	a0,12(sp)
80406008:	d71fa0ef          	jal	ra,80400d78 <intr_disable>
8040600c:	000a2783          	lw	a5,0(s4)
80406010:	00c12503          	lw	a0,12(sp)
80406014:	00100593          	li	a1,1
80406018:	0107a783          	lw	a5,16(a5) # fffff010 <end+0x7fb6477c>
8040601c:	000780e7          	jalr	a5
80406020:	d51fa0ef          	jal	ra,80400d70 <intr_enable>
80406024:	cd9ff06f          	j	80405cfc <pmm_init+0x3e4>
80406028:	00a12623          	sw	a0,12(sp)
8040602c:	d4dfa0ef          	jal	ra,80400d78 <intr_disable>
80406030:	000a2783          	lw	a5,0(s4)
80406034:	00c12503          	lw	a0,12(sp)
80406038:	00100593          	li	a1,1
8040603c:	0107a783          	lw	a5,16(a5)
80406040:	000780e7          	jalr	a5
80406044:	d2dfa0ef          	jal	ra,80400d70 <intr_enable>
80406048:	f21ff06f          	j	80405f68 <pmm_init+0x650>
8040604c:	d2dfa0ef          	jal	ra,80400d78 <intr_disable>
80406050:	000a2783          	lw	a5,0(s4)
80406054:	00100593          	li	a1,1
80406058:	00040513          	mv	a0,s0
8040605c:	0107a783          	lw	a5,16(a5)
80406060:	000780e7          	jalr	a5
80406064:	d0dfa0ef          	jal	ra,80400d70 <intr_enable>
80406068:	eb9ff06f          	j	80405f20 <pmm_init+0x608>
8040606c:	0000c697          	auipc	a3,0xc
80406070:	6b068693          	addi	a3,a3,1712 # 8041271c <default_pmm_manager+0x4f0>
80406074:	0000b617          	auipc	a2,0xb
80406078:	c4c60613          	addi	a2,a2,-948 # 80410cc0 <commands+0x3c>
8040607c:	23c00593          	li	a1,572
80406080:	0000c517          	auipc	a0,0xc
80406084:	1c850513          	addi	a0,a0,456 # 80412248 <default_pmm_manager+0x1c>
80406088:	a44fa0ef          	jal	ra,804002cc <__panic>
8040608c:	0000c697          	auipc	a3,0xc
80406090:	65068693          	addi	a3,a3,1616 # 804126dc <default_pmm_manager+0x4b0>
80406094:	0000b617          	auipc	a2,0xb
80406098:	c2c60613          	addi	a2,a2,-980 # 80410cc0 <commands+0x3c>
8040609c:	23b00593          	li	a1,571
804060a0:	0000c517          	auipc	a0,0xc
804060a4:	1a850513          	addi	a0,a0,424 # 80412248 <default_pmm_manager+0x1c>
804060a8:	a24fa0ef          	jal	ra,804002cc <__panic>
804060ac:	00040693          	mv	a3,s0
804060b0:	0000c617          	auipc	a2,0xc
804060b4:	9f860613          	addi	a2,a2,-1544 # 80411aa8 <commands+0xe24>
804060b8:	23b00593          	li	a1,571
804060bc:	0000c517          	auipc	a0,0xc
804060c0:	18c50513          	addi	a0,a0,396 # 80412248 <default_pmm_manager+0x1c>
804060c4:	a08fa0ef          	jal	ra,804002cc <__panic>
804060c8:	0000c697          	auipc	a3,0xc
804060cc:	60468693          	addi	a3,a3,1540 # 804126cc <default_pmm_manager+0x4a0>
804060d0:	0000b617          	auipc	a2,0xb
804060d4:	bf060613          	addi	a2,a2,-1040 # 80410cc0 <commands+0x3c>
804060d8:	0aa00593          	li	a1,170
804060dc:	0000c517          	auipc	a0,0xc
804060e0:	16c50513          	addi	a0,a0,364 # 80412248 <default_pmm_manager+0x1c>
804060e4:	9e8fa0ef          	jal	ra,804002cc <__panic>
804060e8:	0000c697          	auipc	a3,0xc
804060ec:	57468693          	addi	a3,a3,1396 # 8041265c <default_pmm_manager+0x430>
804060f0:	0000b617          	auipc	a2,0xb
804060f4:	bd060613          	addi	a2,a2,-1072 # 80410cc0 <commands+0x3c>
804060f8:	22d00593          	li	a1,557
804060fc:	0000c517          	auipc	a0,0xc
80406100:	14c50513          	addi	a0,a0,332 # 80412248 <default_pmm_manager+0x1c>
80406104:	9c8fa0ef          	jal	ra,804002cc <__panic>
80406108:	0000c617          	auipc	a2,0xc
8040610c:	2ec60613          	addi	a2,a2,748 # 804123f4 <default_pmm_manager+0x1c8>
80406110:	0b600593          	li	a1,182
80406114:	0000c517          	auipc	a0,0xc
80406118:	13450513          	addi	a0,a0,308 # 80412248 <default_pmm_manager+0x1c>
8040611c:	9b0fa0ef          	jal	ra,804002cc <__panic>
80406120:	0000c697          	auipc	a3,0xc
80406124:	45468693          	addi	a3,a3,1108 # 80412574 <default_pmm_manager+0x348>
80406128:	0000b617          	auipc	a2,0xb
8040612c:	b9860613          	addi	a2,a2,-1128 # 80410cc0 <commands+0x3c>
80406130:	22400593          	li	a1,548
80406134:	0000c517          	auipc	a0,0xc
80406138:	11450513          	addi	a0,a0,276 # 80412248 <default_pmm_manager+0x1c>
8040613c:	990fa0ef          	jal	ra,804002cc <__panic>
80406140:	0000c697          	auipc	a3,0xc
80406144:	4f068693          	addi	a3,a3,1264 # 80412630 <default_pmm_manager+0x404>
80406148:	0000b617          	auipc	a2,0xb
8040614c:	b7860613          	addi	a2,a2,-1160 # 80410cc0 <commands+0x3c>
80406150:	22300593          	li	a1,547
80406154:	0000c517          	auipc	a0,0xc
80406158:	0f450513          	addi	a0,a0,244 # 80412248 <default_pmm_manager+0x1c>
8040615c:	970fa0ef          	jal	ra,804002cc <__panic>
80406160:	0000c697          	auipc	a3,0xc
80406164:	4bc68693          	addi	a3,a3,1212 # 8041261c <default_pmm_manager+0x3f0>
80406168:	0000b617          	auipc	a2,0xb
8040616c:	b5860613          	addi	a2,a2,-1192 # 80410cc0 <commands+0x3c>
80406170:	22200593          	li	a1,546
80406174:	0000c517          	auipc	a0,0xc
80406178:	0d450513          	addi	a0,a0,212 # 80412248 <default_pmm_manager+0x1c>
8040617c:	950fa0ef          	jal	ra,804002cc <__panic>
80406180:	0000c697          	auipc	a3,0xc
80406184:	47068693          	addi	a3,a3,1136 # 804125f0 <default_pmm_manager+0x3c4>
80406188:	0000b617          	auipc	a2,0xb
8040618c:	b3860613          	addi	a2,a2,-1224 # 80410cc0 <commands+0x3c>
80406190:	22100593          	li	a1,545
80406194:	0000c517          	auipc	a0,0xc
80406198:	0b450513          	addi	a0,a0,180 # 80412248 <default_pmm_manager+0x1c>
8040619c:	930fa0ef          	jal	ra,804002cc <__panic>
804061a0:	0000c697          	auipc	a3,0xc
804061a4:	43c68693          	addi	a3,a3,1084 # 804125dc <default_pmm_manager+0x3b0>
804061a8:	0000b617          	auipc	a2,0xb
804061ac:	b1860613          	addi	a2,a2,-1256 # 80410cc0 <commands+0x3c>
804061b0:	21f00593          	li	a1,543
804061b4:	0000c517          	auipc	a0,0xc
804061b8:	09450513          	addi	a0,a0,148 # 80412248 <default_pmm_manager+0x1c>
804061bc:	910fa0ef          	jal	ra,804002cc <__panic>
804061c0:	0000c697          	auipc	a3,0xc
804061c4:	40468693          	addi	a3,a3,1028 # 804125c4 <default_pmm_manager+0x398>
804061c8:	0000b617          	auipc	a2,0xb
804061cc:	af860613          	addi	a2,a2,-1288 # 80410cc0 <commands+0x3c>
804061d0:	21e00593          	li	a1,542
804061d4:	0000c517          	auipc	a0,0xc
804061d8:	07450513          	addi	a0,a0,116 # 80412248 <default_pmm_manager+0x1c>
804061dc:	8f0fa0ef          	jal	ra,804002cc <__panic>
804061e0:	0000c697          	auipc	a3,0xc
804061e4:	3d468693          	addi	a3,a3,980 # 804125b4 <default_pmm_manager+0x388>
804061e8:	0000b617          	auipc	a2,0xb
804061ec:	ad860613          	addi	a2,a2,-1320 # 80410cc0 <commands+0x3c>
804061f0:	21d00593          	li	a1,541
804061f4:	0000c517          	auipc	a0,0xc
804061f8:	05450513          	addi	a0,a0,84 # 80412248 <default_pmm_manager+0x1c>
804061fc:	8d0fa0ef          	jal	ra,804002cc <__panic>
80406200:	0000c697          	auipc	a3,0xc
80406204:	3a468693          	addi	a3,a3,932 # 804125a4 <default_pmm_manager+0x378>
80406208:	0000b617          	auipc	a2,0xb
8040620c:	ab860613          	addi	a2,a2,-1352 # 80410cc0 <commands+0x3c>
80406210:	21c00593          	li	a1,540
80406214:	0000c517          	auipc	a0,0xc
80406218:	03450513          	addi	a0,a0,52 # 80412248 <default_pmm_manager+0x1c>
8040621c:	8b0fa0ef          	jal	ra,804002cc <__panic>
80406220:	0000c697          	auipc	a3,0xc
80406224:	41068693          	addi	a3,a3,1040 # 80412630 <default_pmm_manager+0x404>
80406228:	0000b617          	auipc	a2,0xb
8040622c:	a9860613          	addi	a2,a2,-1384 # 80410cc0 <commands+0x3c>
80406230:	22a00593          	li	a1,554
80406234:	0000c517          	auipc	a0,0xc
80406238:	01450513          	addi	a0,a0,20 # 80412248 <default_pmm_manager+0x1c>
8040623c:	890fa0ef          	jal	ra,804002cc <__panic>
80406240:	0000c697          	auipc	a3,0xc
80406244:	2c068693          	addi	a3,a3,704 # 80412500 <default_pmm_manager+0x2d4>
80406248:	0000b617          	auipc	a2,0xb
8040624c:	a7860613          	addi	a2,a2,-1416 # 80410cc0 <commands+0x3c>
80406250:	22900593          	li	a1,553
80406254:	0000c517          	auipc	a0,0xc
80406258:	ff450513          	addi	a0,a0,-12 # 80412248 <default_pmm_manager+0x1c>
8040625c:	870fa0ef          	jal	ra,804002cc <__panic>
80406260:	0000c697          	auipc	a3,0xc
80406264:	3e468693          	addi	a3,a3,996 # 80412644 <default_pmm_manager+0x418>
80406268:	0000b617          	auipc	a2,0xb
8040626c:	a5860613          	addi	a2,a2,-1448 # 80410cc0 <commands+0x3c>
80406270:	22600593          	li	a1,550
80406274:	0000c517          	auipc	a0,0xc
80406278:	fd450513          	addi	a0,a0,-44 # 80412248 <default_pmm_manager+0x1c>
8040627c:	850fa0ef          	jal	ra,804002cc <__panic>
80406280:	0000c697          	auipc	a3,0xc
80406284:	26868693          	addi	a3,a3,616 # 804124e8 <default_pmm_manager+0x2bc>
80406288:	0000b617          	auipc	a2,0xb
8040628c:	a3860613          	addi	a2,a2,-1480 # 80410cc0 <commands+0x3c>
80406290:	22500593          	li	a1,549
80406294:	0000c517          	auipc	a0,0xc
80406298:	fb450513          	addi	a0,a0,-76 # 80412248 <default_pmm_manager+0x1c>
8040629c:	830fa0ef          	jal	ra,804002cc <__panic>
804062a0:	0000c697          	auipc	a3,0xc
804062a4:	21868693          	addi	a3,a3,536 # 804124b8 <default_pmm_manager+0x28c>
804062a8:	0000b617          	auipc	a2,0xb
804062ac:	a1860613          	addi	a2,a2,-1512 # 80410cc0 <commands+0x3c>
804062b0:	21200593          	li	a1,530
804062b4:	0000c517          	auipc	a0,0xc
804062b8:	f9450513          	addi	a0,a0,-108 # 80412248 <default_pmm_manager+0x1c>
804062bc:	810fa0ef          	jal	ra,804002cc <__panic>
804062c0:	0000c697          	auipc	a3,0xc
804062c4:	1cc68693          	addi	a3,a3,460 # 8041248c <default_pmm_manager+0x260>
804062c8:	0000b617          	auipc	a2,0xb
804062cc:	9f860613          	addi	a2,a2,-1544 # 80410cc0 <commands+0x3c>
804062d0:	20f00593          	li	a1,527
804062d4:	0000c517          	auipc	a0,0xc
804062d8:	f7450513          	addi	a0,a0,-140 # 80412248 <default_pmm_manager+0x1c>
804062dc:	ff1f90ef          	jal	ra,804002cc <__panic>
804062e0:	0000c697          	auipc	a3,0xc
804062e4:	18468693          	addi	a3,a3,388 # 80412464 <default_pmm_manager+0x238>
804062e8:	0000b617          	auipc	a2,0xb
804062ec:	9d860613          	addi	a2,a2,-1576 # 80410cc0 <commands+0x3c>
804062f0:	20b00593          	li	a1,523
804062f4:	0000c517          	auipc	a0,0xc
804062f8:	f5450513          	addi	a0,a0,-172 # 80412248 <default_pmm_manager+0x1c>
804062fc:	fd1f90ef          	jal	ra,804002cc <__panic>
80406300:	0000c617          	auipc	a2,0xc
80406304:	83060613          	addi	a2,a2,-2000 # 80411b30 <commands+0xeac>
80406308:	23f00593          	li	a1,575
8040630c:	0000c517          	auipc	a0,0xc
80406310:	f3c50513          	addi	a0,a0,-196 # 80412248 <default_pmm_manager+0x1c>
80406314:	fb9f90ef          	jal	ra,804002cc <__panic>
80406318:	0000c697          	auipc	a3,0xc
8040631c:	0f868693          	addi	a3,a3,248 # 80412410 <default_pmm_manager+0x1e4>
80406320:	0000b617          	auipc	a2,0xb
80406324:	9a060613          	addi	a2,a2,-1632 # 80410cc0 <commands+0x3c>
80406328:	20900593          	li	a1,521
8040632c:	0000c517          	auipc	a0,0xc
80406330:	f1c50513          	addi	a0,a0,-228 # 80412248 <default_pmm_manager+0x1c>
80406334:	f99f90ef          	jal	ra,804002cc <__panic>
80406338:	00050693          	mv	a3,a0
8040633c:	0000b617          	auipc	a2,0xb
80406340:	7f460613          	addi	a2,a2,2036 # 80411b30 <commands+0xeac>
80406344:	0d400593          	li	a1,212
80406348:	0000c517          	auipc	a0,0xc
8040634c:	f0050513          	addi	a0,a0,-256 # 80412248 <default_pmm_manager+0x1c>
80406350:	f7df90ef          	jal	ra,804002cc <__panic>
80406354:	0000b617          	auipc	a2,0xb
80406358:	75460613          	addi	a2,a2,1876 # 80411aa8 <commands+0xe24>
8040635c:	06e00593          	li	a1,110
80406360:	0000b517          	auipc	a0,0xb
80406364:	41c50513          	addi	a0,a0,1052 # 8041177c <commands+0xaf8>
80406368:	f65f90ef          	jal	ra,804002cc <__panic>
8040636c:	0000b617          	auipc	a2,0xb
80406370:	73c60613          	addi	a2,a2,1852 # 80411aa8 <commands+0xe24>
80406374:	21600593          	li	a1,534
80406378:	0000c517          	auipc	a0,0xc
8040637c:	ed050513          	addi	a0,a0,-304 # 80412248 <default_pmm_manager+0x1c>
80406380:	f4df90ef          	jal	ra,804002cc <__panic>
80406384:	0000c697          	auipc	a3,0xc
80406388:	17c68693          	addi	a3,a3,380 # 80412500 <default_pmm_manager+0x2d4>
8040638c:	0000b617          	auipc	a2,0xb
80406390:	93460613          	addi	a2,a2,-1740 # 80410cc0 <commands+0x3c>
80406394:	21400593          	li	a1,532
80406398:	0000c517          	auipc	a0,0xc
8040639c:	eb050513          	addi	a0,a0,-336 # 80412248 <default_pmm_manager+0x1c>
804063a0:	f2df90ef          	jal	ra,804002cc <__panic>
804063a4:	0000c697          	auipc	a3,0xc
804063a8:	14468693          	addi	a3,a3,324 # 804124e8 <default_pmm_manager+0x2bc>
804063ac:	0000b617          	auipc	a2,0xb
804063b0:	91460613          	addi	a2,a2,-1772 # 80410cc0 <commands+0x3c>
804063b4:	21300593          	li	a1,531
804063b8:	0000c517          	auipc	a0,0xc
804063bc:	e9050513          	addi	a0,a0,-368 # 80412248 <default_pmm_manager+0x1c>
804063c0:	f0df90ef          	jal	ra,804002cc <__panic>
804063c4:	bd8fe0ef          	jal	ra,8040479c <pa2page.part.0>
804063c8:	bf4fe0ef          	jal	ra,804047bc <pte2page.part.0>
804063cc:	0000c697          	auipc	a3,0xc
804063d0:	1a868693          	addi	a3,a3,424 # 80412574 <default_pmm_manager+0x348>
804063d4:	0000b617          	auipc	a2,0xb
804063d8:	8ec60613          	addi	a2,a2,-1812 # 80410cc0 <commands+0x3c>
804063dc:	21b00593          	li	a1,539
804063e0:	0000c517          	auipc	a0,0xc
804063e4:	e6850513          	addi	a0,a0,-408 # 80412248 <default_pmm_manager+0x1c>
804063e8:	ee5f90ef          	jal	ra,804002cc <__panic>
804063ec:	0000c697          	auipc	a3,0xc
804063f0:	15068693          	addi	a3,a3,336 # 8041253c <default_pmm_manager+0x310>
804063f4:	0000b617          	auipc	a2,0xb
804063f8:	8cc60613          	addi	a2,a2,-1844 # 80410cc0 <commands+0x3c>
804063fc:	21a00593          	li	a1,538
80406400:	0000c517          	auipc	a0,0xc
80406404:	e4850513          	addi	a0,a0,-440 # 80412248 <default_pmm_manager+0x1c>
80406408:	ec5f90ef          	jal	ra,804002cc <__panic>
8040640c:	0000c697          	auipc	a3,0xc
80406410:	10868693          	addi	a3,a3,264 # 80412514 <default_pmm_manager+0x2e8>
80406414:	0000b617          	auipc	a2,0xb
80406418:	8ac60613          	addi	a2,a2,-1876 # 80410cc0 <commands+0x3c>
8040641c:	21700593          	li	a1,535
80406420:	0000c517          	auipc	a0,0xc
80406424:	e2850513          	addi	a0,a0,-472 # 80412248 <default_pmm_manager+0x1c>
80406428:	ea5f90ef          	jal	ra,804002cc <__panic>
8040642c:	0000c697          	auipc	a3,0xc
80406430:	35068693          	addi	a3,a3,848 # 8041277c <default_pmm_manager+0x550>
80406434:	0000b617          	auipc	a2,0xb
80406438:	88c60613          	addi	a2,a2,-1908 # 80410cc0 <commands+0x3c>
8040643c:	24500593          	li	a1,581
80406440:	0000c517          	auipc	a0,0xc
80406444:	e0850513          	addi	a0,a0,-504 # 80412248 <default_pmm_manager+0x1c>
80406448:	e85f90ef          	jal	ra,804002cc <__panic>
8040644c:	0000c697          	auipc	a3,0xc
80406450:	42068693          	addi	a3,a3,1056 # 8041286c <default_pmm_manager+0x640>
80406454:	0000b617          	auipc	a2,0xb
80406458:	86c60613          	addi	a2,a2,-1940 # 80410cc0 <commands+0x3c>
8040645c:	24f00593          	li	a1,591
80406460:	0000c517          	auipc	a0,0xc
80406464:	de850513          	addi	a0,a0,-536 # 80412248 <default_pmm_manager+0x1c>
80406468:	e65f90ef          	jal	ra,804002cc <__panic>
8040646c:	0000c697          	auipc	a3,0xc
80406470:	3c868693          	addi	a3,a3,968 # 80412834 <default_pmm_manager+0x608>
80406474:	0000b617          	auipc	a2,0xb
80406478:	84c60613          	addi	a2,a2,-1972 # 80410cc0 <commands+0x3c>
8040647c:	24c00593          	li	a1,588
80406480:	0000c517          	auipc	a0,0xc
80406484:	dc850513          	addi	a0,a0,-568 # 80412248 <default_pmm_manager+0x1c>
80406488:	e45f90ef          	jal	ra,804002cc <__panic>
8040648c:	0000c697          	auipc	a3,0xc
80406490:	2dc68693          	addi	a3,a3,732 # 80412768 <default_pmm_manager+0x53c>
80406494:	0000b617          	auipc	a2,0xb
80406498:	82c60613          	addi	a2,a2,-2004 # 80410cc0 <commands+0x3c>
8040649c:	24100593          	li	a1,577
804064a0:	0000c517          	auipc	a0,0xc
804064a4:	da850513          	addi	a0,a0,-600 # 80412248 <default_pmm_manager+0x1c>
804064a8:	e25f90ef          	jal	ra,804002cc <__panic>
804064ac:	0000c697          	auipc	a3,0xc
804064b0:	28868693          	addi	a3,a3,648 # 80412734 <default_pmm_manager+0x508>
804064b4:	0000b617          	auipc	a2,0xb
804064b8:	80c60613          	addi	a2,a2,-2036 # 80410cc0 <commands+0x3c>
804064bc:	23f00593          	li	a1,575
804064c0:	0000c517          	auipc	a0,0xc
804064c4:	d8850513          	addi	a0,a0,-632 # 80412248 <default_pmm_manager+0x1c>
804064c8:	e05f90ef          	jal	ra,804002cc <__panic>
804064cc:	0000b617          	auipc	a2,0xb
804064d0:	66460613          	addi	a2,a2,1636 # 80411b30 <commands+0xeac>
804064d4:	08e00593          	li	a1,142
804064d8:	0000c517          	auipc	a0,0xc
804064dc:	d7050513          	addi	a0,a0,-656 # 80412248 <default_pmm_manager+0x1c>
804064e0:	dedf90ef          	jal	ra,804002cc <__panic>
804064e4:	0000c697          	auipc	a3,0xc
804064e8:	18c68693          	addi	a3,a3,396 # 80412670 <default_pmm_manager+0x444>
804064ec:	0000a617          	auipc	a2,0xa
804064f0:	7d460613          	addi	a2,a2,2004 # 80410cc0 <commands+0x3c>
804064f4:	23000593          	li	a1,560
804064f8:	0000c517          	auipc	a0,0xc
804064fc:	d5050513          	addi	a0,a0,-688 # 80412248 <default_pmm_manager+0x1c>
80406500:	dcdf90ef          	jal	ra,804002cc <__panic>
80406504:	0000c697          	auipc	a3,0xc
80406508:	12c68693          	addi	a3,a3,300 # 80412630 <default_pmm_manager+0x404>
8040650c:	0000a617          	auipc	a2,0xa
80406510:	7b460613          	addi	a2,a2,1972 # 80410cc0 <commands+0x3c>
80406514:	22e00593          	li	a1,558
80406518:	0000c517          	auipc	a0,0xc
8040651c:	d3050513          	addi	a0,a0,-720 # 80412248 <default_pmm_manager+0x1c>
80406520:	dadf90ef          	jal	ra,804002cc <__panic>
80406524:	0000c697          	auipc	a3,0xc
80406528:	19068693          	addi	a3,a3,400 # 804126b4 <default_pmm_manager+0x488>
8040652c:	0000a617          	auipc	a2,0xa
80406530:	79460613          	addi	a2,a2,1940 # 80410cc0 <commands+0x3c>
80406534:	0a400593          	li	a1,164
80406538:	0000c517          	auipc	a0,0xc
8040653c:	d1050513          	addi	a0,a0,-752 # 80412248 <default_pmm_manager+0x1c>
80406540:	d8df90ef          	jal	ra,804002cc <__panic>
80406544:	0000c697          	auipc	a3,0xc
80406548:	2c468693          	addi	a3,a3,708 # 80412808 <default_pmm_manager+0x5dc>
8040654c:	0000a617          	auipc	a2,0xa
80406550:	77460613          	addi	a2,a2,1908 # 80410cc0 <commands+0x3c>
80406554:	24800593          	li	a1,584
80406558:	0000c517          	auipc	a0,0xc
8040655c:	cf050513          	addi	a0,a0,-784 # 80412248 <default_pmm_manager+0x1c>
80406560:	d6df90ef          	jal	ra,804002cc <__panic>
80406564:	0000c697          	auipc	a3,0xc
80406568:	26468693          	addi	a3,a3,612 # 804127c8 <default_pmm_manager+0x59c>
8040656c:	0000a617          	auipc	a2,0xa
80406570:	75460613          	addi	a2,a2,1876 # 80410cc0 <commands+0x3c>
80406574:	24700593          	li	a1,583
80406578:	0000c517          	auipc	a0,0xc
8040657c:	cd050513          	addi	a0,a0,-816 # 80412248 <default_pmm_manager+0x1c>
80406580:	d4df90ef          	jal	ra,804002cc <__panic>
80406584:	0000c697          	auipc	a3,0xc
80406588:	23068693          	addi	a3,a3,560 # 804127b4 <default_pmm_manager+0x588>
8040658c:	0000a617          	auipc	a2,0xa
80406590:	73460613          	addi	a2,a2,1844 # 80410cc0 <commands+0x3c>
80406594:	24600593          	li	a1,582
80406598:	0000c517          	auipc	a0,0xc
8040659c:	cb050513          	addi	a0,a0,-848 # 80412248 <default_pmm_manager+0x1c>
804065a0:	d2df90ef          	jal	ra,804002cc <__panic>
804065a4:	0000c697          	auipc	a3,0xc
804065a8:	e8868693          	addi	a3,a3,-376 # 8041242c <default_pmm_manager+0x200>
804065ac:	0000a617          	auipc	a2,0xa
804065b0:	71460613          	addi	a2,a2,1812 # 80410cc0 <commands+0x3c>
804065b4:	20a00593          	li	a1,522
804065b8:	0000c517          	auipc	a0,0xc
804065bc:	c9050513          	addi	a0,a0,-880 # 80412248 <default_pmm_manager+0x1c>
804065c0:	d0df90ef          	jal	ra,804002cc <__panic>

804065c4 <wait_queue_init>:
804065c4:	00a52223          	sw	a0,4(a0)
804065c8:	00a52023          	sw	a0,0(a0)
804065cc:	00008067          	ret

804065d0 <wait_queue_del>:
804065d0:	0105a703          	lw	a4,16(a1) # fff80010 <end+0x7fae577c>
804065d4:	00c58793          	addi	a5,a1,12
804065d8:	02e78263          	beq	a5,a4,804065fc <wait_queue_del+0x2c>
804065dc:	0085a683          	lw	a3,8(a1)
804065e0:	00a69e63          	bne	a3,a0,804065fc <wait_queue_del+0x2c>
804065e4:	00c5a683          	lw	a3,12(a1)
804065e8:	00e6a223          	sw	a4,4(a3)
804065ec:	00d72023          	sw	a3,0(a4) # fff80000 <end+0x7fae576c>
804065f0:	00f5a823          	sw	a5,16(a1)
804065f4:	00f5a623          	sw	a5,12(a1)
804065f8:	00008067          	ret
804065fc:	ff010113          	addi	sp,sp,-16
80406600:	0000c697          	auipc	a3,0xc
80406604:	2fc68693          	addi	a3,a3,764 # 804128fc <default_pmm_manager+0x6d0>
80406608:	0000a617          	auipc	a2,0xa
8040660c:	6b860613          	addi	a2,a2,1720 # 80410cc0 <commands+0x3c>
80406610:	01e00593          	li	a1,30
80406614:	0000c517          	auipc	a0,0xc
80406618:	2d450513          	addi	a0,a0,724 # 804128e8 <default_pmm_manager+0x6bc>
8040661c:	00112623          	sw	ra,12(sp)
80406620:	cadf90ef          	jal	ra,804002cc <__panic>

80406624 <wait_queue_first>:
80406624:	00452783          	lw	a5,4(a0)
80406628:	00f50663          	beq	a0,a5,80406634 <wait_queue_first+0x10>
8040662c:	ff478513          	addi	a0,a5,-12
80406630:	00008067          	ret
80406634:	00000513          	li	a0,0
80406638:	00008067          	ret

8040663c <wait_queue_empty>:
8040663c:	00452783          	lw	a5,4(a0)
80406640:	40a78533          	sub	a0,a5,a0
80406644:	00153513          	seqz	a0,a0
80406648:	00008067          	ret

8040664c <wait_in_queue>:
8040664c:	01052783          	lw	a5,16(a0)
80406650:	00c50513          	addi	a0,a0,12
80406654:	40a78533          	sub	a0,a5,a0
80406658:	00a03533          	snez	a0,a0
8040665c:	00008067          	ret

80406660 <wakeup_wait>:
80406660:	00069863          	bnez	a3,80406670 <wakeup_wait+0x10>
80406664:	0005a503          	lw	a0,0(a1)
80406668:	00c5a223          	sw	a2,4(a1)
8040666c:	5a50306f          	j	8040a410 <wakeup_proc>
80406670:	0105a703          	lw	a4,16(a1)
80406674:	00c58793          	addi	a5,a1,12
80406678:	02e78663          	beq	a5,a4,804066a4 <wakeup_wait+0x44>
8040667c:	0085a683          	lw	a3,8(a1)
80406680:	02d51263          	bne	a0,a3,804066a4 <wakeup_wait+0x44>
80406684:	00c5a683          	lw	a3,12(a1)
80406688:	0005a503          	lw	a0,0(a1)
8040668c:	00e6a223          	sw	a4,4(a3)
80406690:	00d72023          	sw	a3,0(a4)
80406694:	00f5a823          	sw	a5,16(a1)
80406698:	00f5a623          	sw	a5,12(a1)
8040669c:	00c5a223          	sw	a2,4(a1)
804066a0:	5710306f          	j	8040a410 <wakeup_proc>
804066a4:	ff010113          	addi	sp,sp,-16
804066a8:	0000c697          	auipc	a3,0xc
804066ac:	25468693          	addi	a3,a3,596 # 804128fc <default_pmm_manager+0x6d0>
804066b0:	0000a617          	auipc	a2,0xa
804066b4:	61060613          	addi	a2,a2,1552 # 80410cc0 <commands+0x3c>
804066b8:	01e00593          	li	a1,30
804066bc:	0000c517          	auipc	a0,0xc
804066c0:	22c50513          	addi	a0,a0,556 # 804128e8 <default_pmm_manager+0x6bc>
804066c4:	00112623          	sw	ra,12(sp)
804066c8:	c05f90ef          	jal	ra,804002cc <__panic>

804066cc <wakeup_queue>:
804066cc:	00452783          	lw	a5,4(a0)
804066d0:	10a78463          	beq	a5,a0,804067d8 <wakeup_queue+0x10c>
804066d4:	ff010113          	addi	sp,sp,-16
804066d8:	00812423          	sw	s0,8(sp)
804066dc:	00912223          	sw	s1,4(sp)
804066e0:	01212023          	sw	s2,0(sp)
804066e4:	00112623          	sw	ra,12(sp)
804066e8:	00050493          	mv	s1,a0
804066ec:	00058913          	mv	s2,a1
804066f0:	ff478413          	addi	s0,a5,-12
804066f4:	06061e63          	bnez	a2,80406770 <wakeup_queue+0xa4>
804066f8:	00042503          	lw	a0,0(s0)
804066fc:	01242223          	sw	s2,4(s0)
80406700:	511030ef          	jal	ra,8040a410 <wakeup_proc>
80406704:	01042783          	lw	a5,16(s0)
80406708:	00c40713          	addi	a4,s0,12
8040670c:	02e78663          	beq	a5,a4,80406738 <wakeup_queue+0x6c>
80406710:	00842703          	lw	a4,8(s0)
80406714:	02e49263          	bne	s1,a4,80406738 <wakeup_queue+0x6c>
80406718:	04f48063          	beq	s1,a5,80406758 <wakeup_queue+0x8c>
8040671c:	ff47a503          	lw	a0,-12(a5)
80406720:	ff27ac23          	sw	s2,-8(a5)
80406724:	ff478413          	addi	s0,a5,-12
80406728:	4e9030ef          	jal	ra,8040a410 <wakeup_proc>
8040672c:	01042783          	lw	a5,16(s0)
80406730:	00c40713          	addi	a4,s0,12
80406734:	fce79ee3          	bne	a5,a4,80406710 <wakeup_queue+0x44>
80406738:	0000c697          	auipc	a3,0xc
8040673c:	1c468693          	addi	a3,a3,452 # 804128fc <default_pmm_manager+0x6d0>
80406740:	0000a617          	auipc	a2,0xa
80406744:	58060613          	addi	a2,a2,1408 # 80410cc0 <commands+0x3c>
80406748:	02400593          	li	a1,36
8040674c:	0000c517          	auipc	a0,0xc
80406750:	19c50513          	addi	a0,a0,412 # 804128e8 <default_pmm_manager+0x6bc>
80406754:	b79f90ef          	jal	ra,804002cc <__panic>
80406758:	00c12083          	lw	ra,12(sp)
8040675c:	00812403          	lw	s0,8(sp)
80406760:	00412483          	lw	s1,4(sp)
80406764:	00012903          	lw	s2,0(sp)
80406768:	01010113          	addi	sp,sp,16
8040676c:	00008067          	ret
80406770:	0047a703          	lw	a4,4(a5)
80406774:	04f70263          	beq	a4,a5,804067b8 <wakeup_queue+0xec>
80406778:	00842683          	lw	a3,8(s0)
8040677c:	02d49e63          	bne	s1,a3,804067b8 <wakeup_queue+0xec>
80406780:	00c42683          	lw	a3,12(s0)
80406784:	00042503          	lw	a0,0(s0)
80406788:	00e6a223          	sw	a4,4(a3)
8040678c:	00d72023          	sw	a3,0(a4)
80406790:	00f42823          	sw	a5,16(s0)
80406794:	00f42623          	sw	a5,12(s0)
80406798:	01242223          	sw	s2,4(s0)
8040679c:	475030ef          	jal	ra,8040a410 <wakeup_proc>
804067a0:	0044a403          	lw	s0,4(s1)
804067a4:	fa848ae3          	beq	s1,s0,80406758 <wakeup_queue+0x8c>
804067a8:	00442703          	lw	a4,4(s0)
804067ac:	00040793          	mv	a5,s0
804067b0:	ff440413          	addi	s0,s0,-12
804067b4:	fce792e3          	bne	a5,a4,80406778 <wakeup_queue+0xac>
804067b8:	0000c697          	auipc	a3,0xc
804067bc:	14468693          	addi	a3,a3,324 # 804128fc <default_pmm_manager+0x6d0>
804067c0:	0000a617          	auipc	a2,0xa
804067c4:	50060613          	addi	a2,a2,1280 # 80410cc0 <commands+0x3c>
804067c8:	01e00593          	li	a1,30
804067cc:	0000c517          	auipc	a0,0xc
804067d0:	11c50513          	addi	a0,a0,284 # 804128e8 <default_pmm_manager+0x6bc>
804067d4:	af9f90ef          	jal	ra,804002cc <__panic>
804067d8:	00008067          	ret

804067dc <wait_current_set>:
804067dc:	00094797          	auipc	a5,0x94
804067e0:	0707a783          	lw	a5,112(a5) # 8049a84c <current>
804067e4:	04078063          	beqz	a5,80406824 <wait_current_set+0x48>
804067e8:	00c58713          	addi	a4,a1,12
804067ec:	800006b7          	lui	a3,0x80000
804067f0:	00e5a623          	sw	a4,12(a1)
804067f4:	00f5a023          	sw	a5,0(a1)
804067f8:	00d5a223          	sw	a3,4(a1)
804067fc:	00100693          	li	a3,1
80406800:	00d7a023          	sw	a3,0(a5)
80406804:	0ac7a423          	sw	a2,168(a5)
80406808:	00052783          	lw	a5,0(a0)
8040680c:	00a5a423          	sw	a0,8(a1)
80406810:	00e52023          	sw	a4,0(a0)
80406814:	00e7a223          	sw	a4,4(a5)
80406818:	00a5a823          	sw	a0,16(a1)
8040681c:	00f5a623          	sw	a5,12(a1)
80406820:	00008067          	ret
80406824:	ff010113          	addi	sp,sp,-16
80406828:	0000c697          	auipc	a3,0xc
8040682c:	11468693          	addi	a3,a3,276 # 8041293c <default_pmm_manager+0x710>
80406830:	0000a617          	auipc	a2,0xa
80406834:	49060613          	addi	a2,a2,1168 # 80410cc0 <commands+0x3c>
80406838:	07600593          	li	a1,118
8040683c:	0000c517          	auipc	a0,0xc
80406840:	0ac50513          	addi	a0,a0,172 # 804128e8 <default_pmm_manager+0x6bc>
80406844:	00112623          	sw	ra,12(sp)
80406848:	a85f90ef          	jal	ra,804002cc <__panic>

8040684c <__down.constprop.0>:
8040684c:	fd010113          	addi	sp,sp,-48
80406850:	02812423          	sw	s0,40(sp)
80406854:	02112623          	sw	ra,44(sp)
80406858:	02912223          	sw	s1,36(sp)
8040685c:	00050413          	mv	s0,a0
80406860:	100027f3          	csrr	a5,sstatus
80406864:	0027f513          	andi	a0,a5,2
80406868:	08051263          	bnez	a0,804068ec <__down.constprop.0+0xa0>
8040686c:	00042783          	lw	a5,0(s0)
80406870:	02f05063          	blez	a5,80406890 <__down.constprop.0+0x44>
80406874:	fff78793          	addi	a5,a5,-1
80406878:	02c12083          	lw	ra,44(sp)
8040687c:	00f42023          	sw	a5,0(s0)
80406880:	02812403          	lw	s0,40(sp)
80406884:	02412483          	lw	s1,36(sp)
80406888:	03010113          	addi	sp,sp,48
8040688c:	00008067          	ret
80406890:	00440413          	addi	s0,s0,4
80406894:	00c10493          	addi	s1,sp,12
80406898:	10000613          	li	a2,256
8040689c:	00048593          	mv	a1,s1
804068a0:	00040513          	mv	a0,s0
804068a4:	f39ff0ef          	jal	ra,804067dc <wait_current_set>
804068a8:	455030ef          	jal	ra,8040a4fc <schedule>
804068ac:	100027f3          	csrr	a5,sstatus
804068b0:	0027f793          	andi	a5,a5,2
804068b4:	08079c63          	bnez	a5,8040694c <__down.constprop.0+0x100>
804068b8:	00048513          	mv	a0,s1
804068bc:	d91ff0ef          	jal	ra,8040664c <wait_in_queue>
804068c0:	06051e63          	bnez	a0,8040693c <__down.constprop.0+0xf0>
804068c4:	01012503          	lw	a0,16(sp)
804068c8:	02c12083          	lw	ra,44(sp)
804068cc:	02812403          	lw	s0,40(sp)
804068d0:	f0050793          	addi	a5,a0,-256
804068d4:	00f037b3          	snez	a5,a5
804068d8:	40f007b3          	neg	a5,a5
804068dc:	02412483          	lw	s1,36(sp)
804068e0:	00f57533          	and	a0,a0,a5
804068e4:	03010113          	addi	sp,sp,48
804068e8:	00008067          	ret
804068ec:	c8cfa0ef          	jal	ra,80400d78 <intr_disable>
804068f0:	00042783          	lw	a5,0(s0)
804068f4:	02f05463          	blez	a5,8040691c <__down.constprop.0+0xd0>
804068f8:	fff78793          	addi	a5,a5,-1
804068fc:	00f42023          	sw	a5,0(s0)
80406900:	c70fa0ef          	jal	ra,80400d70 <intr_enable>
80406904:	02c12083          	lw	ra,44(sp)
80406908:	02812403          	lw	s0,40(sp)
8040690c:	02412483          	lw	s1,36(sp)
80406910:	00000513          	li	a0,0
80406914:	03010113          	addi	sp,sp,48
80406918:	00008067          	ret
8040691c:	00440413          	addi	s0,s0,4
80406920:	00c10493          	addi	s1,sp,12
80406924:	10000613          	li	a2,256
80406928:	00048593          	mv	a1,s1
8040692c:	00040513          	mv	a0,s0
80406930:	eadff0ef          	jal	ra,804067dc <wait_current_set>
80406934:	c3cfa0ef          	jal	ra,80400d70 <intr_enable>
80406938:	f71ff06f          	j	804068a8 <__down.constprop.0+0x5c>
8040693c:	00048593          	mv	a1,s1
80406940:	00040513          	mv	a0,s0
80406944:	c8dff0ef          	jal	ra,804065d0 <wait_queue_del>
80406948:	f7dff06f          	j	804068c4 <__down.constprop.0+0x78>
8040694c:	c2cfa0ef          	jal	ra,80400d78 <intr_disable>
80406950:	00048513          	mv	a0,s1
80406954:	cf9ff0ef          	jal	ra,8040664c <wait_in_queue>
80406958:	00051663          	bnez	a0,80406964 <__down.constprop.0+0x118>
8040695c:	c14fa0ef          	jal	ra,80400d70 <intr_enable>
80406960:	f65ff06f          	j	804068c4 <__down.constprop.0+0x78>
80406964:	00048593          	mv	a1,s1
80406968:	00040513          	mv	a0,s0
8040696c:	c65ff0ef          	jal	ra,804065d0 <wait_queue_del>
80406970:	fedff06f          	j	8040695c <__down.constprop.0+0x110>

80406974 <__up.constprop.0>:
80406974:	ff010113          	addi	sp,sp,-16
80406978:	00812423          	sw	s0,8(sp)
8040697c:	00112623          	sw	ra,12(sp)
80406980:	00912223          	sw	s1,4(sp)
80406984:	01212023          	sw	s2,0(sp)
80406988:	00050413          	mv	s0,a0
8040698c:	100027f3          	csrr	a5,sstatus
80406990:	0027f793          	andi	a5,a5,2
80406994:	00000913          	li	s2,0
80406998:	06079e63          	bnez	a5,80406a14 <__up.constprop.0+0xa0>
8040699c:	00440493          	addi	s1,s0,4
804069a0:	00048513          	mv	a0,s1
804069a4:	c81ff0ef          	jal	ra,80406624 <wait_queue_first>
804069a8:	00050593          	mv	a1,a0
804069ac:	04050c63          	beqz	a0,80406a04 <__up.constprop.0+0x90>
804069b0:	00052703          	lw	a4,0(a0)
804069b4:	10000793          	li	a5,256
804069b8:	0a872703          	lw	a4,168(a4)
804069bc:	06f71263          	bne	a4,a5,80406a20 <__up.constprop.0+0xac>
804069c0:	00100693          	li	a3,1
804069c4:	10000613          	li	a2,256
804069c8:	00048513          	mv	a0,s1
804069cc:	c95ff0ef          	jal	ra,80406660 <wakeup_wait>
804069d0:	00091e63          	bnez	s2,804069ec <__up.constprop.0+0x78>
804069d4:	00c12083          	lw	ra,12(sp)
804069d8:	00812403          	lw	s0,8(sp)
804069dc:	00412483          	lw	s1,4(sp)
804069e0:	00012903          	lw	s2,0(sp)
804069e4:	01010113          	addi	sp,sp,16
804069e8:	00008067          	ret
804069ec:	00812403          	lw	s0,8(sp)
804069f0:	00c12083          	lw	ra,12(sp)
804069f4:	00412483          	lw	s1,4(sp)
804069f8:	00012903          	lw	s2,0(sp)
804069fc:	01010113          	addi	sp,sp,16
80406a00:	b70fa06f          	j	80400d70 <intr_enable>
80406a04:	00042783          	lw	a5,0(s0)
80406a08:	00178793          	addi	a5,a5,1
80406a0c:	00f42023          	sw	a5,0(s0)
80406a10:	fc1ff06f          	j	804069d0 <__up.constprop.0+0x5c>
80406a14:	b64fa0ef          	jal	ra,80400d78 <intr_disable>
80406a18:	00100913          	li	s2,1
80406a1c:	f81ff06f          	j	8040699c <__up.constprop.0+0x28>
80406a20:	0000c697          	auipc	a3,0xc
80406a24:	f2c68693          	addi	a3,a3,-212 # 8041294c <default_pmm_manager+0x720>
80406a28:	0000a617          	auipc	a2,0xa
80406a2c:	29860613          	addi	a2,a2,664 # 80410cc0 <commands+0x3c>
80406a30:	01a00593          	li	a1,26
80406a34:	0000c517          	auipc	a0,0xc
80406a38:	f4050513          	addi	a0,a0,-192 # 80412974 <default_pmm_manager+0x748>
80406a3c:	891f90ef          	jal	ra,804002cc <__panic>

80406a40 <sem_init>:
80406a40:	00b52023          	sw	a1,0(a0)
80406a44:	00450513          	addi	a0,a0,4
80406a48:	b7dff06f          	j	804065c4 <wait_queue_init>

80406a4c <up>:
80406a4c:	f29ff06f          	j	80406974 <__up.constprop.0>

80406a50 <down>:
80406a50:	ff010113          	addi	sp,sp,-16
80406a54:	00112623          	sw	ra,12(sp)
80406a58:	df5ff0ef          	jal	ra,8040684c <__down.constprop.0>
80406a5c:	00051863          	bnez	a0,80406a6c <down+0x1c>
80406a60:	00c12083          	lw	ra,12(sp)
80406a64:	01010113          	addi	sp,sp,16
80406a68:	00008067          	ret
80406a6c:	0000c697          	auipc	a3,0xc
80406a70:	f1868693          	addi	a3,a3,-232 # 80412984 <default_pmm_manager+0x758>
80406a74:	0000a617          	auipc	a2,0xa
80406a78:	24c60613          	addi	a2,a2,588 # 80410cc0 <commands+0x3c>
80406a7c:	04100593          	li	a1,65
80406a80:	0000c517          	auipc	a0,0xc
80406a84:	ef450513          	addi	a0,a0,-268 # 80412974 <default_pmm_manager+0x748>
80406a88:	845f90ef          	jal	ra,804002cc <__panic>

80406a8c <copy_path>:
80406a8c:	fe010113          	addi	sp,sp,-32
80406a90:	01212823          	sw	s2,16(sp)
80406a94:	00094917          	auipc	s2,0x94
80406a98:	db890913          	addi	s2,s2,-584 # 8049a84c <current>
80406a9c:	00092703          	lw	a4,0(s2)
80406aa0:	01312623          	sw	s3,12(sp)
80406aa4:	00050993          	mv	s3,a0
80406aa8:	00001537          	lui	a0,0x1
80406aac:	00912a23          	sw	s1,20(sp)
80406ab0:	01412423          	sw	s4,8(sp)
80406ab4:	00112e23          	sw	ra,28(sp)
80406ab8:	00812c23          	sw	s0,24(sp)
80406abc:	01512223          	sw	s5,4(sp)
80406ac0:	01872a03          	lw	s4,24(a4)
80406ac4:	00058493          	mv	s1,a1
80406ac8:	b50fc0ef          	jal	ra,80402e18 <kmalloc>
80406acc:	0c050463          	beqz	a0,80406b94 <copy_path+0x108>
80406ad0:	00050413          	mv	s0,a0
80406ad4:	060a0863          	beqz	s4,80406b44 <copy_path+0xb8>
80406ad8:	01ca0a93          	addi	s5,s4,28
80406adc:	000a8513          	mv	a0,s5
80406ae0:	f71ff0ef          	jal	ra,80406a50 <down>
80406ae4:	00092783          	lw	a5,0(s2)
80406ae8:	08078263          	beqz	a5,80406b6c <copy_path+0xe0>
80406aec:	0047a783          	lw	a5,4(a5)
80406af0:	000016b7          	lui	a3,0x1
80406af4:	00048613          	mv	a2,s1
80406af8:	02fa2423          	sw	a5,40(s4)
80406afc:	00040593          	mv	a1,s0
80406b00:	000a0513          	mv	a0,s4
80406b04:	a59fb0ef          	jal	ra,8040255c <copy_string>
80406b08:	06050e63          	beqz	a0,80406b84 <copy_path+0xf8>
80406b0c:	000a8513          	mv	a0,s5
80406b10:	f3dff0ef          	jal	ra,80406a4c <up>
80406b14:	020a2423          	sw	zero,40(s4)
80406b18:	0089a023          	sw	s0,0(s3)
80406b1c:	00000513          	li	a0,0
80406b20:	01c12083          	lw	ra,28(sp)
80406b24:	01812403          	lw	s0,24(sp)
80406b28:	01412483          	lw	s1,20(sp)
80406b2c:	01012903          	lw	s2,16(sp)
80406b30:	00c12983          	lw	s3,12(sp)
80406b34:	00812a03          	lw	s4,8(sp)
80406b38:	00412a83          	lw	s5,4(sp)
80406b3c:	02010113          	addi	sp,sp,32
80406b40:	00008067          	ret
80406b44:	00050593          	mv	a1,a0
80406b48:	000016b7          	lui	a3,0x1
80406b4c:	00048613          	mv	a2,s1
80406b50:	00000513          	li	a0,0
80406b54:	a09fb0ef          	jal	ra,8040255c <copy_string>
80406b58:	fc0510e3          	bnez	a0,80406b18 <copy_path+0x8c>
80406b5c:	00040513          	mv	a0,s0
80406b60:	bd4fc0ef          	jal	ra,80402f34 <kfree>
80406b64:	ffd00513          	li	a0,-3
80406b68:	fb9ff06f          	j	80406b20 <copy_path+0x94>
80406b6c:	000016b7          	lui	a3,0x1
80406b70:	00048613          	mv	a2,s1
80406b74:	00040593          	mv	a1,s0
80406b78:	000a0513          	mv	a0,s4
80406b7c:	9e1fb0ef          	jal	ra,8040255c <copy_string>
80406b80:	f80516e3          	bnez	a0,80406b0c <copy_path+0x80>
80406b84:	000a8513          	mv	a0,s5
80406b88:	ec5ff0ef          	jal	ra,80406a4c <up>
80406b8c:	020a2423          	sw	zero,40(s4)
80406b90:	fcdff06f          	j	80406b5c <copy_path+0xd0>
80406b94:	ffc00513          	li	a0,-4
80406b98:	f89ff06f          	j	80406b20 <copy_path+0x94>

80406b9c <sysfile_open>:
80406b9c:	fe010113          	addi	sp,sp,-32
80406ba0:	00050713          	mv	a4,a0
80406ba4:	00912a23          	sw	s1,20(sp)
80406ba8:	00c10513          	addi	a0,sp,12
80406bac:	00058493          	mv	s1,a1
80406bb0:	00070593          	mv	a1,a4
80406bb4:	00812c23          	sw	s0,24(sp)
80406bb8:	00112e23          	sw	ra,28(sp)
80406bbc:	ed1ff0ef          	jal	ra,80406a8c <copy_path>
80406bc0:	00050413          	mv	s0,a0
80406bc4:	00051e63          	bnez	a0,80406be0 <sysfile_open+0x44>
80406bc8:	00c12503          	lw	a0,12(sp)
80406bcc:	00048593          	mv	a1,s1
80406bd0:	365000ef          	jal	ra,80407734 <file_open>
80406bd4:	00050413          	mv	s0,a0
80406bd8:	00c12503          	lw	a0,12(sp)
80406bdc:	b58fc0ef          	jal	ra,80402f34 <kfree>
80406be0:	01c12083          	lw	ra,28(sp)
80406be4:	00040513          	mv	a0,s0
80406be8:	01812403          	lw	s0,24(sp)
80406bec:	01412483          	lw	s1,20(sp)
80406bf0:	02010113          	addi	sp,sp,32
80406bf4:	00008067          	ret

80406bf8 <sysfile_close>:
80406bf8:	4c10006f          	j	804078b8 <file_close>

80406bfc <sysfile_read>:
80406bfc:	fc010113          	addi	sp,sp,-64
80406c00:	02812c23          	sw	s0,56(sp)
80406c04:	02112e23          	sw	ra,60(sp)
80406c08:	02912a23          	sw	s1,52(sp)
80406c0c:	03212823          	sw	s2,48(sp)
80406c10:	03312623          	sw	s3,44(sp)
80406c14:	03412423          	sw	s4,40(sp)
80406c18:	03512223          	sw	s5,36(sp)
80406c1c:	03612023          	sw	s6,32(sp)
80406c20:	01712e23          	sw	s7,28(sp)
80406c24:	01812c23          	sw	s8,24(sp)
80406c28:	01912a23          	sw	s9,20(sp)
80406c2c:	00000413          	li	s0,0
80406c30:	02061e63          	bnez	a2,80406c6c <sysfile_read+0x70>
80406c34:	03c12083          	lw	ra,60(sp)
80406c38:	00040513          	mv	a0,s0
80406c3c:	03812403          	lw	s0,56(sp)
80406c40:	03412483          	lw	s1,52(sp)
80406c44:	03012903          	lw	s2,48(sp)
80406c48:	02c12983          	lw	s3,44(sp)
80406c4c:	02812a03          	lw	s4,40(sp)
80406c50:	02412a83          	lw	s5,36(sp)
80406c54:	02012b03          	lw	s6,32(sp)
80406c58:	01c12b83          	lw	s7,28(sp)
80406c5c:	01812c03          	lw	s8,24(sp)
80406c60:	01412c83          	lw	s9,20(sp)
80406c64:	04010113          	addi	sp,sp,64
80406c68:	00008067          	ret
80406c6c:	00094c97          	auipc	s9,0x94
80406c70:	be0c8c93          	addi	s9,s9,-1056 # 8049a84c <current>
80406c74:	000ca783          	lw	a5,0(s9)
80406c78:	00060493          	mv	s1,a2
80406c7c:	00058b13          	mv	s6,a1
80406c80:	00000613          	li	a2,0
80406c84:	00100593          	li	a1,1
80406c88:	0187a903          	lw	s2,24(a5)
80406c8c:	00050a93          	mv	s5,a0
80406c90:	229000ef          	jal	ra,804076b8 <file_testfd>
80406c94:	0e050463          	beqz	a0,80406d7c <sysfile_read+0x180>
80406c98:	00001537          	lui	a0,0x1
80406c9c:	97cfc0ef          	jal	ra,80402e18 <kmalloc>
80406ca0:	00050993          	mv	s3,a0
80406ca4:	0e050063          	beqz	a0,80406d84 <sysfile_read+0x188>
80406ca8:	00000b93          	li	s7,0
80406cac:	00001a37          	lui	s4,0x1
80406cb0:	01c90c13          	addi	s8,s2,28
80406cb4:	0b44ea63          	bltu	s1,s4,80406d68 <sysfile_read+0x16c>
80406cb8:	01412623          	sw	s4,12(sp)
80406cbc:	00001637          	lui	a2,0x1
80406cc0:	00c10693          	addi	a3,sp,12
80406cc4:	00098593          	mv	a1,s3
80406cc8:	000a8513          	mv	a0,s5
80406ccc:	471000ef          	jal	ra,8040793c <file_read>
80406cd0:	00c12683          	lw	a3,12(sp)
80406cd4:	00050413          	mv	s0,a0
80406cd8:	04068863          	beqz	a3,80406d28 <sysfile_read+0x12c>
80406cdc:	02090063          	beqz	s2,80406cfc <sysfile_read+0x100>
80406ce0:	000c0513          	mv	a0,s8
80406ce4:	d6dff0ef          	jal	ra,80406a50 <down>
80406ce8:	000ca783          	lw	a5,0(s9)
80406cec:	08078463          	beqz	a5,80406d74 <sysfile_read+0x178>
80406cf0:	0047a783          	lw	a5,4(a5)
80406cf4:	00c12683          	lw	a3,12(sp)
80406cf8:	02f92423          	sw	a5,40(s2)
80406cfc:	00098613          	mv	a2,s3
80406d00:	000b0593          	mv	a1,s6
80406d04:	00090513          	mv	a0,s2
80406d08:	ff8fb0ef          	jal	ra,80402500 <copy_to_user>
80406d0c:	04050063          	beqz	a0,80406d4c <sysfile_read+0x150>
80406d10:	00c12783          	lw	a5,12(sp)
80406d14:	06f4ec63          	bltu	s1,a5,80406d8c <sysfile_read+0x190>
80406d18:	00fb0b33          	add	s6,s6,a5
80406d1c:	40f484b3          	sub	s1,s1,a5
80406d20:	00fb8bb3          	add	s7,s7,a5
80406d24:	02091a63          	bnez	s2,80406d58 <sysfile_read+0x15c>
80406d28:	00041863          	bnez	s0,80406d38 <sysfile_read+0x13c>
80406d2c:	00c12783          	lw	a5,12(sp)
80406d30:	00078463          	beqz	a5,80406d38 <sysfile_read+0x13c>
80406d34:	f80490e3          	bnez	s1,80406cb4 <sysfile_read+0xb8>
80406d38:	00098513          	mv	a0,s3
80406d3c:	9f8fc0ef          	jal	ra,80402f34 <kfree>
80406d40:	ee0b8ae3          	beqz	s7,80406c34 <sysfile_read+0x38>
80406d44:	000b8413          	mv	s0,s7
80406d48:	eedff06f          	j	80406c34 <sysfile_read+0x38>
80406d4c:	00041463          	bnez	s0,80406d54 <sysfile_read+0x158>
80406d50:	ffd00413          	li	s0,-3
80406d54:	fe0902e3          	beqz	s2,80406d38 <sysfile_read+0x13c>
80406d58:	000c0513          	mv	a0,s8
80406d5c:	cf1ff0ef          	jal	ra,80406a4c <up>
80406d60:	02092423          	sw	zero,40(s2)
80406d64:	fc5ff06f          	j	80406d28 <sysfile_read+0x12c>
80406d68:	00912623          	sw	s1,12(sp)
80406d6c:	00048613          	mv	a2,s1
80406d70:	f51ff06f          	j	80406cc0 <sysfile_read+0xc4>
80406d74:	00c12683          	lw	a3,12(sp)
80406d78:	f85ff06f          	j	80406cfc <sysfile_read+0x100>
80406d7c:	ffd00413          	li	s0,-3
80406d80:	eb5ff06f          	j	80406c34 <sysfile_read+0x38>
80406d84:	ffc00413          	li	s0,-4
80406d88:	eadff06f          	j	80406c34 <sysfile_read+0x38>
80406d8c:	0000c697          	auipc	a3,0xc
80406d90:	c0468693          	addi	a3,a3,-1020 # 80412990 <default_pmm_manager+0x764>
80406d94:	0000a617          	auipc	a2,0xa
80406d98:	f2c60613          	addi	a2,a2,-212 # 80410cc0 <commands+0x3c>
80406d9c:	05500593          	li	a1,85
80406da0:	0000c517          	auipc	a0,0xc
80406da4:	bfc50513          	addi	a0,a0,-1028 # 8041299c <default_pmm_manager+0x770>
80406da8:	d24f90ef          	jal	ra,804002cc <__panic>

80406dac <sysfile_write>:
80406dac:	fc010113          	addi	sp,sp,-64
80406db0:	03212823          	sw	s2,48(sp)
80406db4:	02112e23          	sw	ra,60(sp)
80406db8:	02812c23          	sw	s0,56(sp)
80406dbc:	02912a23          	sw	s1,52(sp)
80406dc0:	03312623          	sw	s3,44(sp)
80406dc4:	03412423          	sw	s4,40(sp)
80406dc8:	03512223          	sw	s5,36(sp)
80406dcc:	03612023          	sw	s6,32(sp)
80406dd0:	01712e23          	sw	s7,28(sp)
80406dd4:	01812c23          	sw	s8,24(sp)
80406dd8:	01912a23          	sw	s9,20(sp)
80406ddc:	00000913          	li	s2,0
80406de0:	02061e63          	bnez	a2,80406e1c <sysfile_write+0x70>
80406de4:	03c12083          	lw	ra,60(sp)
80406de8:	03812403          	lw	s0,56(sp)
80406dec:	03412483          	lw	s1,52(sp)
80406df0:	02c12983          	lw	s3,44(sp)
80406df4:	02812a03          	lw	s4,40(sp)
80406df8:	02412a83          	lw	s5,36(sp)
80406dfc:	02012b03          	lw	s6,32(sp)
80406e00:	01c12b83          	lw	s7,28(sp)
80406e04:	01812c03          	lw	s8,24(sp)
80406e08:	01412c83          	lw	s9,20(sp)
80406e0c:	00090513          	mv	a0,s2
80406e10:	03012903          	lw	s2,48(sp)
80406e14:	04010113          	addi	sp,sp,64
80406e18:	00008067          	ret
80406e1c:	00094c17          	auipc	s8,0x94
80406e20:	a30c0c13          	addi	s8,s8,-1488 # 8049a84c <current>
80406e24:	000c2783          	lw	a5,0(s8)
80406e28:	00060413          	mv	s0,a2
80406e2c:	00058993          	mv	s3,a1
80406e30:	00100613          	li	a2,1
80406e34:	00000593          	li	a1,0
80406e38:	0187a483          	lw	s1,24(a5)
80406e3c:	00050b93          	mv	s7,a0
80406e40:	079000ef          	jal	ra,804076b8 <file_testfd>
80406e44:	0e050e63          	beqz	a0,80406f40 <sysfile_write+0x194>
80406e48:	00001537          	lui	a0,0x1
80406e4c:	fcdfb0ef          	jal	ra,80402e18 <kmalloc>
80406e50:	00050a13          	mv	s4,a0
80406e54:	0e050a63          	beqz	a0,80406f48 <sysfile_write+0x19c>
80406e58:	00000c93          	li	s9,0
80406e5c:	00001ab7          	lui	s5,0x1
80406e60:	01c48b13          	addi	s6,s1,28
80406e64:	09546063          	bltu	s0,s5,80406ee4 <sysfile_write+0x138>
80406e68:	01512623          	sw	s5,12(sp)
80406e6c:	08048063          	beqz	s1,80406eec <sysfile_write+0x140>
80406e70:	000b0513          	mv	a0,s6
80406e74:	bddff0ef          	jal	ra,80406a50 <down>
80406e78:	000c2783          	lw	a5,0(s8)
80406e7c:	00078663          	beqz	a5,80406e88 <sysfile_write+0xdc>
80406e80:	0047a783          	lw	a5,4(a5)
80406e84:	02f4a423          	sw	a5,40(s1)
80406e88:	00c12683          	lw	a3,12(sp)
80406e8c:	00000713          	li	a4,0
80406e90:	00098613          	mv	a2,s3
80406e94:	000a0593          	mv	a1,s4
80406e98:	00048513          	mv	a0,s1
80406e9c:	e04fb0ef          	jal	ra,804024a0 <copy_from_user>
80406ea0:	06050863          	beqz	a0,80406f10 <sysfile_write+0x164>
80406ea4:	000b0513          	mv	a0,s6
80406ea8:	ba5ff0ef          	jal	ra,80406a4c <up>
80406eac:	0204a423          	sw	zero,40(s1)
80406eb0:	00c12603          	lw	a2,12(sp)
80406eb4:	00c10693          	addi	a3,sp,12
80406eb8:	000a0593          	mv	a1,s4
80406ebc:	000b8513          	mv	a0,s7
80406ec0:	3cd000ef          	jal	ra,80407a8c <file_write>
80406ec4:	00c12783          	lw	a5,12(sp)
80406ec8:	00050913          	mv	s2,a0
80406ecc:	04079c63          	bnez	a5,80406f24 <sysfile_write+0x178>
80406ed0:	000a0513          	mv	a0,s4
80406ed4:	860fc0ef          	jal	ra,80402f34 <kfree>
80406ed8:	f00c86e3          	beqz	s9,80406de4 <sysfile_write+0x38>
80406edc:	000c8913          	mv	s2,s9
80406ee0:	f05ff06f          	j	80406de4 <sysfile_write+0x38>
80406ee4:	00812623          	sw	s0,12(sp)
80406ee8:	f80494e3          	bnez	s1,80406e70 <sysfile_write+0xc4>
80406eec:	00c12683          	lw	a3,12(sp)
80406ef0:	00000713          	li	a4,0
80406ef4:	00098613          	mv	a2,s3
80406ef8:	000a0593          	mv	a1,s4
80406efc:	00000513          	li	a0,0
80406f00:	da0fb0ef          	jal	ra,804024a0 <copy_from_user>
80406f04:	fa0516e3          	bnez	a0,80406eb0 <sysfile_write+0x104>
80406f08:	ffd00913          	li	s2,-3
80406f0c:	fc5ff06f          	j	80406ed0 <sysfile_write+0x124>
80406f10:	000b0513          	mv	a0,s6
80406f14:	b39ff0ef          	jal	ra,80406a4c <up>
80406f18:	ffd00913          	li	s2,-3
80406f1c:	0204a423          	sw	zero,40(s1)
80406f20:	fb1ff06f          	j	80406ed0 <sysfile_write+0x124>
80406f24:	02f46663          	bltu	s0,a5,80406f50 <sysfile_write+0x1a4>
80406f28:	00f989b3          	add	s3,s3,a5
80406f2c:	40f40433          	sub	s0,s0,a5
80406f30:	00fc8cb3          	add	s9,s9,a5
80406f34:	f8051ee3          	bnez	a0,80406ed0 <sysfile_write+0x124>
80406f38:	f20416e3          	bnez	s0,80406e64 <sysfile_write+0xb8>
80406f3c:	f95ff06f          	j	80406ed0 <sysfile_write+0x124>
80406f40:	ffd00913          	li	s2,-3
80406f44:	ea1ff06f          	j	80406de4 <sysfile_write+0x38>
80406f48:	ffc00913          	li	s2,-4
80406f4c:	e99ff06f          	j	80406de4 <sysfile_write+0x38>
80406f50:	0000c697          	auipc	a3,0xc
80406f54:	a4068693          	addi	a3,a3,-1472 # 80412990 <default_pmm_manager+0x764>
80406f58:	0000a617          	auipc	a2,0xa
80406f5c:	d6860613          	addi	a2,a2,-664 # 80410cc0 <commands+0x3c>
80406f60:	08a00593          	li	a1,138
80406f64:	0000c517          	auipc	a0,0xc
80406f68:	a3850513          	addi	a0,a0,-1480 # 8041299c <default_pmm_manager+0x770>
80406f6c:	b60f90ef          	jal	ra,804002cc <__panic>

80406f70 <sysfile_seek>:
80406f70:	46d0006f          	j	80407bdc <file_seek>

80406f74 <sysfile_fstat>:
80406f74:	fd010113          	addi	sp,sp,-48
80406f78:	01312e23          	sw	s3,28(sp)
80406f7c:	00094997          	auipc	s3,0x94
80406f80:	8d098993          	addi	s3,s3,-1840 # 8049a84c <current>
80406f84:	0009a703          	lw	a4,0(s3)
80406f88:	02912223          	sw	s1,36(sp)
80406f8c:	00058493          	mv	s1,a1
80406f90:	00010593          	mv	a1,sp
80406f94:	02812423          	sw	s0,40(sp)
80406f98:	03212023          	sw	s2,32(sp)
80406f9c:	02112623          	sw	ra,44(sp)
80406fa0:	01872903          	lw	s2,24(a4)
80406fa4:	01412c23          	sw	s4,24(sp)
80406fa8:	5e1000ef          	jal	ra,80407d88 <file_fstat>
80406fac:	00050413          	mv	s0,a0
80406fb0:	04051463          	bnez	a0,80406ff8 <sysfile_fstat+0x84>
80406fb4:	06090463          	beqz	s2,8040701c <sysfile_fstat+0xa8>
80406fb8:	01c90a13          	addi	s4,s2,28
80406fbc:	000a0513          	mv	a0,s4
80406fc0:	a91ff0ef          	jal	ra,80406a50 <down>
80406fc4:	0009a783          	lw	a5,0(s3)
80406fc8:	06078863          	beqz	a5,80407038 <sysfile_fstat+0xc4>
80406fcc:	0047a783          	lw	a5,4(a5)
80406fd0:	01000693          	li	a3,16
80406fd4:	00010613          	mv	a2,sp
80406fd8:	02f92423          	sw	a5,40(s2)
80406fdc:	00048593          	mv	a1,s1
80406fe0:	00090513          	mv	a0,s2
80406fe4:	d1cfb0ef          	jal	ra,80402500 <copy_to_user>
80406fe8:	06050463          	beqz	a0,80407050 <sysfile_fstat+0xdc>
80406fec:	000a0513          	mv	a0,s4
80406ff0:	a5dff0ef          	jal	ra,80406a4c <up>
80406ff4:	02092423          	sw	zero,40(s2)
80406ff8:	02c12083          	lw	ra,44(sp)
80406ffc:	00040513          	mv	a0,s0
80407000:	02812403          	lw	s0,40(sp)
80407004:	02412483          	lw	s1,36(sp)
80407008:	02012903          	lw	s2,32(sp)
8040700c:	01c12983          	lw	s3,28(sp)
80407010:	01812a03          	lw	s4,24(sp)
80407014:	03010113          	addi	sp,sp,48
80407018:	00008067          	ret
8040701c:	01000693          	li	a3,16
80407020:	00010613          	mv	a2,sp
80407024:	00048593          	mv	a1,s1
80407028:	cd8fb0ef          	jal	ra,80402500 <copy_to_user>
8040702c:	fc0516e3          	bnez	a0,80406ff8 <sysfile_fstat+0x84>
80407030:	ffd00413          	li	s0,-3
80407034:	fc5ff06f          	j	80406ff8 <sysfile_fstat+0x84>
80407038:	01000693          	li	a3,16
8040703c:	00010613          	mv	a2,sp
80407040:	00048593          	mv	a1,s1
80407044:	00090513          	mv	a0,s2
80407048:	cb8fb0ef          	jal	ra,80402500 <copy_to_user>
8040704c:	fa0510e3          	bnez	a0,80406fec <sysfile_fstat+0x78>
80407050:	000a0513          	mv	a0,s4
80407054:	9f9ff0ef          	jal	ra,80406a4c <up>
80407058:	ffd00413          	li	s0,-3
8040705c:	02092423          	sw	zero,40(s2)
80407060:	f99ff06f          	j	80406ff8 <sysfile_fstat+0x84>

80407064 <sysfile_fsync>:
80407064:	63d0006f          	j	80407ea0 <file_fsync>

80407068 <sysfile_getcwd>:
80407068:	fd010113          	addi	sp,sp,-48
8040706c:	01312e23          	sw	s3,28(sp)
80407070:	00093997          	auipc	s3,0x93
80407074:	7dc98993          	addi	s3,s3,2012 # 8049a84c <current>
80407078:	0009a783          	lw	a5,0(s3)
8040707c:	03212023          	sw	s2,32(sp)
80407080:	02112623          	sw	ra,44(sp)
80407084:	02812423          	sw	s0,40(sp)
80407088:	02912223          	sw	s1,36(sp)
8040708c:	01412c23          	sw	s4,24(sp)
80407090:	0187a903          	lw	s2,24(a5)
80407094:	08058863          	beqz	a1,80407124 <sysfile_getcwd+0xbc>
80407098:	00058413          	mv	s0,a1
8040709c:	00050493          	mv	s1,a0
804070a0:	06090663          	beqz	s2,8040710c <sysfile_getcwd+0xa4>
804070a4:	01c90a13          	addi	s4,s2,28
804070a8:	000a0513          	mv	a0,s4
804070ac:	9a5ff0ef          	jal	ra,80406a50 <down>
804070b0:	0009a783          	lw	a5,0(s3)
804070b4:	00078663          	beqz	a5,804070c0 <sysfile_getcwd+0x58>
804070b8:	0047a783          	lw	a5,4(a5)
804070bc:	02f92423          	sw	a5,40(s2)
804070c0:	00100693          	li	a3,1
804070c4:	00040613          	mv	a2,s0
804070c8:	00048593          	mv	a1,s1
804070cc:	00090513          	mv	a0,s2
804070d0:	af8fb0ef          	jal	ra,804023c8 <user_mem_check>
804070d4:	04051c63          	bnez	a0,8040712c <sysfile_getcwd+0xc4>
804070d8:	ffd00413          	li	s0,-3
804070dc:	000a0513          	mv	a0,s4
804070e0:	96dff0ef          	jal	ra,80406a4c <up>
804070e4:	02092423          	sw	zero,40(s2)
804070e8:	02c12083          	lw	ra,44(sp)
804070ec:	00040513          	mv	a0,s0
804070f0:	02812403          	lw	s0,40(sp)
804070f4:	02412483          	lw	s1,36(sp)
804070f8:	02012903          	lw	s2,32(sp)
804070fc:	01c12983          	lw	s3,28(sp)
80407100:	01812a03          	lw	s4,24(sp)
80407104:	03010113          	addi	sp,sp,48
80407108:	00008067          	ret
8040710c:	00058613          	mv	a2,a1
80407110:	00100693          	li	a3,1
80407114:	00050593          	mv	a1,a0
80407118:	00000513          	li	a0,0
8040711c:	aacfb0ef          	jal	ra,804023c8 <user_mem_check>
80407120:	02051663          	bnez	a0,8040714c <sysfile_getcwd+0xe4>
80407124:	ffd00413          	li	s0,-3
80407128:	fc1ff06f          	j	804070e8 <sysfile_getcwd+0x80>
8040712c:	00040613          	mv	a2,s0
80407130:	00000693          	li	a3,0
80407134:	00048593          	mv	a1,s1
80407138:	00010513          	mv	a0,sp
8040713c:	09c010ef          	jal	ra,804081d8 <iobuf_init>
80407140:	1a5040ef          	jal	ra,8040bae4 <vfs_getcwd>
80407144:	00050413          	mv	s0,a0
80407148:	f95ff06f          	j	804070dc <sysfile_getcwd+0x74>
8040714c:	00040613          	mv	a2,s0
80407150:	00000693          	li	a3,0
80407154:	00048593          	mv	a1,s1
80407158:	00010513          	mv	a0,sp
8040715c:	07c010ef          	jal	ra,804081d8 <iobuf_init>
80407160:	185040ef          	jal	ra,8040bae4 <vfs_getcwd>
80407164:	00050413          	mv	s0,a0
80407168:	f81ff06f          	j	804070e8 <sysfile_getcwd+0x80>

8040716c <sysfile_getdirentry>:
8040716c:	fe010113          	addi	sp,sp,-32
80407170:	01412423          	sw	s4,8(sp)
80407174:	00093a17          	auipc	s4,0x93
80407178:	6d8a0a13          	addi	s4,s4,1752 # 8049a84c <current>
8040717c:	000a2703          	lw	a4,0(s4)
80407180:	01312623          	sw	s3,12(sp)
80407184:	00050993          	mv	s3,a0
80407188:	10400513          	li	a0,260
8040718c:	00912a23          	sw	s1,20(sp)
80407190:	01212823          	sw	s2,16(sp)
80407194:	00112e23          	sw	ra,28(sp)
80407198:	00812c23          	sw	s0,24(sp)
8040719c:	01512223          	sw	s5,4(sp)
804071a0:	01872483          	lw	s1,24(a4)
804071a4:	00058913          	mv	s2,a1
804071a8:	c71fb0ef          	jal	ra,80402e18 <kmalloc>
804071ac:	12050a63          	beqz	a0,804072e0 <sysfile_getdirentry+0x174>
804071b0:	00050413          	mv	s0,a0
804071b4:	0e048063          	beqz	s1,80407294 <sysfile_getdirentry+0x128>
804071b8:	01c48a93          	addi	s5,s1,28
804071bc:	000a8513          	mv	a0,s5
804071c0:	891ff0ef          	jal	ra,80406a50 <down>
804071c4:	000a2783          	lw	a5,0(s4)
804071c8:	00078663          	beqz	a5,804071d4 <sysfile_getdirentry+0x68>
804071cc:	0047a783          	lw	a5,4(a5)
804071d0:	02f4a423          	sw	a5,40(s1)
804071d4:	00100713          	li	a4,1
804071d8:	00400693          	li	a3,4
804071dc:	00090613          	mv	a2,s2
804071e0:	00040593          	mv	a1,s0
804071e4:	00048513          	mv	a0,s1
804071e8:	ab8fb0ef          	jal	ra,804024a0 <copy_from_user>
804071ec:	04051263          	bnez	a0,80407230 <sysfile_getdirentry+0xc4>
804071f0:	000a8513          	mv	a0,s5
804071f4:	859ff0ef          	jal	ra,80406a4c <up>
804071f8:	ffd00993          	li	s3,-3
804071fc:	0204a423          	sw	zero,40(s1)
80407200:	00040513          	mv	a0,s0
80407204:	d31fb0ef          	jal	ra,80402f34 <kfree>
80407208:	01c12083          	lw	ra,28(sp)
8040720c:	01812403          	lw	s0,24(sp)
80407210:	01412483          	lw	s1,20(sp)
80407214:	01012903          	lw	s2,16(sp)
80407218:	00812a03          	lw	s4,8(sp)
8040721c:	00412a83          	lw	s5,4(sp)
80407220:	00098513          	mv	a0,s3
80407224:	00c12983          	lw	s3,12(sp)
80407228:	02010113          	addi	sp,sp,32
8040722c:	00008067          	ret
80407230:	000a8513          	mv	a0,s5
80407234:	819ff0ef          	jal	ra,80406a4c <up>
80407238:	00098513          	mv	a0,s3
8040723c:	00040593          	mv	a1,s0
80407240:	0204a423          	sw	zero,40(s1)
80407244:	561000ef          	jal	ra,80407fa4 <file_getdirentry>
80407248:	00050993          	mv	s3,a0
8040724c:	fa051ae3          	bnez	a0,80407200 <sysfile_getdirentry+0x94>
80407250:	000a8513          	mv	a0,s5
80407254:	ffcff0ef          	jal	ra,80406a50 <down>
80407258:	000a2783          	lw	a5,0(s4)
8040725c:	00078663          	beqz	a5,80407268 <sysfile_getdirentry+0xfc>
80407260:	0047a783          	lw	a5,4(a5)
80407264:	02f4a423          	sw	a5,40(s1)
80407268:	10400693          	li	a3,260
8040726c:	00040613          	mv	a2,s0
80407270:	00090593          	mv	a1,s2
80407274:	00048513          	mv	a0,s1
80407278:	a88fb0ef          	jal	ra,80402500 <copy_to_user>
8040727c:	00051463          	bnez	a0,80407284 <sysfile_getdirentry+0x118>
80407280:	ffd00993          	li	s3,-3
80407284:	000a8513          	mv	a0,s5
80407288:	fc4ff0ef          	jal	ra,80406a4c <up>
8040728c:	0204a423          	sw	zero,40(s1)
80407290:	f71ff06f          	j	80407200 <sysfile_getdirentry+0x94>
80407294:	00050593          	mv	a1,a0
80407298:	00100713          	li	a4,1
8040729c:	00400693          	li	a3,4
804072a0:	00090613          	mv	a2,s2
804072a4:	00000513          	li	a0,0
804072a8:	9f8fb0ef          	jal	ra,804024a0 <copy_from_user>
804072ac:	02050663          	beqz	a0,804072d8 <sysfile_getdirentry+0x16c>
804072b0:	00098513          	mv	a0,s3
804072b4:	00040593          	mv	a1,s0
804072b8:	4ed000ef          	jal	ra,80407fa4 <file_getdirentry>
804072bc:	00050993          	mv	s3,a0
804072c0:	f40510e3          	bnez	a0,80407200 <sysfile_getdirentry+0x94>
804072c4:	10400693          	li	a3,260
804072c8:	00040613          	mv	a2,s0
804072cc:	00090593          	mv	a1,s2
804072d0:	a30fb0ef          	jal	ra,80402500 <copy_to_user>
804072d4:	f20516e3          	bnez	a0,80407200 <sysfile_getdirentry+0x94>
804072d8:	ffd00993          	li	s3,-3
804072dc:	f25ff06f          	j	80407200 <sysfile_getdirentry+0x94>
804072e0:	ffc00993          	li	s3,-4
804072e4:	f25ff06f          	j	80407208 <sysfile_getdirentry+0x9c>

804072e8 <sysfile_dup>:
804072e8:	6110006f          	j	804080f8 <file_dup>

804072ec <get_fd_array.part.0>:
804072ec:	ff010113          	addi	sp,sp,-16
804072f0:	0000b697          	auipc	a3,0xb
804072f4:	6c068693          	addi	a3,a3,1728 # 804129b0 <default_pmm_manager+0x784>
804072f8:	0000a617          	auipc	a2,0xa
804072fc:	9c860613          	addi	a2,a2,-1592 # 80410cc0 <commands+0x3c>
80407300:	01400593          	li	a1,20
80407304:	0000b517          	auipc	a0,0xb
80407308:	6d850513          	addi	a0,a0,1752 # 804129dc <default_pmm_manager+0x7b0>
8040730c:	00112623          	sw	ra,12(sp)
80407310:	fbdf80ef          	jal	ra,804002cc <__panic>

80407314 <fd_array_alloc>:
80407314:	00093797          	auipc	a5,0x93
80407318:	5387a783          	lw	a5,1336(a5) # 8049a84c <current>
8040731c:	0dc7a783          	lw	a5,220(a5)
80407320:	ff010113          	addi	sp,sp,-16
80407324:	00112623          	sw	ra,12(sp)
80407328:	08078a63          	beqz	a5,804073bc <fd_array_alloc+0xa8>
8040732c:	0087a703          	lw	a4,8(a5)
80407330:	08e05663          	blez	a4,804073bc <fd_array_alloc+0xa8>
80407334:	ffff7737          	lui	a4,0xffff7
80407338:	ad970713          	addi	a4,a4,-1319 # ffff6ad9 <end+0x7fb5c245>
8040733c:	0047a783          	lw	a5,4(a5)
80407340:	04e50463          	beq	a0,a4,80407388 <fd_array_alloc+0x74>
80407344:	09000713          	li	a4,144
80407348:	06a76663          	bltu	a4,a0,804073b4 <fd_array_alloc+0xa0>
8040734c:	00351713          	slli	a4,a0,0x3
80407350:	40a70533          	sub	a0,a4,a0
80407354:	00251513          	slli	a0,a0,0x2
80407358:	00a787b3          	add	a5,a5,a0
8040735c:	0007a703          	lw	a4,0(a5)
80407360:	04071663          	bnez	a4,804073ac <fd_array_alloc+0x98>
80407364:	0187a503          	lw	a0,24(a5)
80407368:	04051c63          	bnez	a0,804073c0 <fd_array_alloc+0xac>
8040736c:	00100713          	li	a4,1
80407370:	00e7a023          	sw	a4,0(a5)
80407374:	0007aa23          	sw	zero,20(a5)
80407378:	00f5a023          	sw	a5,0(a1)
8040737c:	00c12083          	lw	ra,12(sp)
80407380:	01010113          	addi	sp,sp,16
80407384:	00008067          	ret
80407388:	000016b7          	lui	a3,0x1
8040738c:	fdc68693          	addi	a3,a3,-36 # fdc <_binary_bin_swap_img_size-0x7024>
80407390:	00d786b3          	add	a3,a5,a3
80407394:	0007a703          	lw	a4,0(a5)
80407398:	fc0706e3          	beqz	a4,80407364 <fd_array_alloc+0x50>
8040739c:	01c78793          	addi	a5,a5,28
804073a0:	fef69ae3          	bne	a3,a5,80407394 <fd_array_alloc+0x80>
804073a4:	fea00513          	li	a0,-22
804073a8:	fd5ff06f          	j	8040737c <fd_array_alloc+0x68>
804073ac:	ff100513          	li	a0,-15
804073b0:	fcdff06f          	j	8040737c <fd_array_alloc+0x68>
804073b4:	ffd00513          	li	a0,-3
804073b8:	fc5ff06f          	j	8040737c <fd_array_alloc+0x68>
804073bc:	f31ff0ef          	jal	ra,804072ec <get_fd_array.part.0>
804073c0:	0000b697          	auipc	a3,0xb
804073c4:	62c68693          	addi	a3,a3,1580 # 804129ec <default_pmm_manager+0x7c0>
804073c8:	0000a617          	auipc	a2,0xa
804073cc:	8f860613          	addi	a2,a2,-1800 # 80410cc0 <commands+0x3c>
804073d0:	03b00593          	li	a1,59
804073d4:	0000b517          	auipc	a0,0xb
804073d8:	60850513          	addi	a0,a0,1544 # 804129dc <default_pmm_manager+0x7b0>
804073dc:	ef1f80ef          	jal	ra,804002cc <__panic>

804073e0 <fd_array_free>:
804073e0:	00052783          	lw	a5,0(a0)
804073e4:	ff010113          	addi	sp,sp,-16
804073e8:	00812423          	sw	s0,8(sp)
804073ec:	00112623          	sw	ra,12(sp)
804073f0:	00100713          	li	a4,1
804073f4:	00050413          	mv	s0,a0
804073f8:	04e78863          	beq	a5,a4,80407448 <fd_array_free+0x68>
804073fc:	00300713          	li	a4,3
80407400:	06e79263          	bne	a5,a4,80407464 <fd_array_free+0x84>
80407404:	01852783          	lw	a5,24(a0)
80407408:	02078263          	beqz	a5,8040742c <fd_array_free+0x4c>
8040740c:	0000b697          	auipc	a3,0xb
80407410:	5e068693          	addi	a3,a3,1504 # 804129ec <default_pmm_manager+0x7c0>
80407414:	0000a617          	auipc	a2,0xa
80407418:	8ac60613          	addi	a2,a2,-1876 # 80410cc0 <commands+0x3c>
8040741c:	04500593          	li	a1,69
80407420:	0000b517          	auipc	a0,0xb
80407424:	5bc50513          	addi	a0,a0,1468 # 804129dc <default_pmm_manager+0x7b0>
80407428:	ea5f80ef          	jal	ra,804002cc <__panic>
8040742c:	01442503          	lw	a0,20(s0)
80407430:	054050ef          	jal	ra,8040c484 <vfs_close>
80407434:	00c12083          	lw	ra,12(sp)
80407438:	00042023          	sw	zero,0(s0)
8040743c:	00812403          	lw	s0,8(sp)
80407440:	01010113          	addi	sp,sp,16
80407444:	00008067          	ret
80407448:	01852783          	lw	a5,24(a0)
8040744c:	fc0790e3          	bnez	a5,8040740c <fd_array_free+0x2c>
80407450:	00c12083          	lw	ra,12(sp)
80407454:	00042023          	sw	zero,0(s0)
80407458:	00812403          	lw	s0,8(sp)
8040745c:	01010113          	addi	sp,sp,16
80407460:	00008067          	ret
80407464:	0000b697          	auipc	a3,0xb
80407468:	5bc68693          	addi	a3,a3,1468 # 80412a20 <default_pmm_manager+0x7f4>
8040746c:	0000a617          	auipc	a2,0xa
80407470:	85460613          	addi	a2,a2,-1964 # 80410cc0 <commands+0x3c>
80407474:	04400593          	li	a1,68
80407478:	0000b517          	auipc	a0,0xb
8040747c:	56450513          	addi	a0,a0,1380 # 804129dc <default_pmm_manager+0x7b0>
80407480:	e4df80ef          	jal	ra,804002cc <__panic>

80407484 <fd_array_release>:
80407484:	00052703          	lw	a4,0(a0)
80407488:	ff010113          	addi	sp,sp,-16
8040748c:	00112623          	sw	ra,12(sp)
80407490:	00100693          	li	a3,1
80407494:	ffe70713          	addi	a4,a4,-2
80407498:	04e6e863          	bltu	a3,a4,804074e8 <fd_array_release+0x64>
8040749c:	01852703          	lw	a4,24(a0)
804074a0:	02e05463          	blez	a4,804074c8 <fd_array_release+0x44>
804074a4:	fff70713          	addi	a4,a4,-1
804074a8:	00e52c23          	sw	a4,24(a0)
804074ac:	00070863          	beqz	a4,804074bc <fd_array_release+0x38>
804074b0:	00c12083          	lw	ra,12(sp)
804074b4:	01010113          	addi	sp,sp,16
804074b8:	00008067          	ret
804074bc:	00c12083          	lw	ra,12(sp)
804074c0:	01010113          	addi	sp,sp,16
804074c4:	f1dff06f          	j	804073e0 <fd_array_free>
804074c8:	0000b697          	auipc	a3,0xb
804074cc:	5c868693          	addi	a3,a3,1480 # 80412a90 <default_pmm_manager+0x864>
804074d0:	00009617          	auipc	a2,0x9
804074d4:	7f060613          	addi	a2,a2,2032 # 80410cc0 <commands+0x3c>
804074d8:	05600593          	li	a1,86
804074dc:	0000b517          	auipc	a0,0xb
804074e0:	50050513          	addi	a0,a0,1280 # 804129dc <default_pmm_manager+0x7b0>
804074e4:	de9f80ef          	jal	ra,804002cc <__panic>
804074e8:	0000b697          	auipc	a3,0xb
804074ec:	57068693          	addi	a3,a3,1392 # 80412a58 <default_pmm_manager+0x82c>
804074f0:	00009617          	auipc	a2,0x9
804074f4:	7d060613          	addi	a2,a2,2000 # 80410cc0 <commands+0x3c>
804074f8:	05500593          	li	a1,85
804074fc:	0000b517          	auipc	a0,0xb
80407500:	4e050513          	addi	a0,a0,1248 # 804129dc <default_pmm_manager+0x7b0>
80407504:	dc9f80ef          	jal	ra,804002cc <__panic>

80407508 <fd_array_open.part.0>:
80407508:	ff010113          	addi	sp,sp,-16
8040750c:	0000b697          	auipc	a3,0xb
80407510:	59c68693          	addi	a3,a3,1436 # 80412aa8 <default_pmm_manager+0x87c>
80407514:	00009617          	auipc	a2,0x9
80407518:	7ac60613          	addi	a2,a2,1964 # 80410cc0 <commands+0x3c>
8040751c:	05f00593          	li	a1,95
80407520:	0000b517          	auipc	a0,0xb
80407524:	4bc50513          	addi	a0,a0,1212 # 804129dc <default_pmm_manager+0x7b0>
80407528:	00112623          	sw	ra,12(sp)
8040752c:	da1f80ef          	jal	ra,804002cc <__panic>

80407530 <fd_array_init>:
80407530:	00000793          	li	a5,0
80407534:	09100713          	li	a4,145
80407538:	00f52623          	sw	a5,12(a0)
8040753c:	00052c23          	sw	zero,24(a0)
80407540:	00052023          	sw	zero,0(a0)
80407544:	00178793          	addi	a5,a5,1
80407548:	01c50513          	addi	a0,a0,28
8040754c:	fee796e3          	bne	a5,a4,80407538 <fd_array_init+0x8>
80407550:	00008067          	ret

80407554 <fd_array_close>:
80407554:	00052703          	lw	a4,0(a0)
80407558:	ff010113          	addi	sp,sp,-16
8040755c:	00112623          	sw	ra,12(sp)
80407560:	00812423          	sw	s0,8(sp)
80407564:	00200793          	li	a5,2
80407568:	06f71863          	bne	a4,a5,804075d8 <fd_array_close+0x84>
8040756c:	01852783          	lw	a5,24(a0)
80407570:	00050413          	mv	s0,a0
80407574:	04f05263          	blez	a5,804075b8 <fd_array_close+0x64>
80407578:	fff78793          	addi	a5,a5,-1
8040757c:	00300713          	li	a4,3
80407580:	00e52023          	sw	a4,0(a0)
80407584:	00f52c23          	sw	a5,24(a0)
80407588:	00078a63          	beqz	a5,8040759c <fd_array_close+0x48>
8040758c:	00c12083          	lw	ra,12(sp)
80407590:	00812403          	lw	s0,8(sp)
80407594:	01010113          	addi	sp,sp,16
80407598:	00008067          	ret
8040759c:	01452503          	lw	a0,20(a0)
804075a0:	6e5040ef          	jal	ra,8040c484 <vfs_close>
804075a4:	00c12083          	lw	ra,12(sp)
804075a8:	00042023          	sw	zero,0(s0)
804075ac:	00812403          	lw	s0,8(sp)
804075b0:	01010113          	addi	sp,sp,16
804075b4:	00008067          	ret
804075b8:	0000b697          	auipc	a3,0xb
804075bc:	4d868693          	addi	a3,a3,1240 # 80412a90 <default_pmm_manager+0x864>
804075c0:	00009617          	auipc	a2,0x9
804075c4:	70060613          	addi	a2,a2,1792 # 80410cc0 <commands+0x3c>
804075c8:	06800593          	li	a1,104
804075cc:	0000b517          	auipc	a0,0xb
804075d0:	41050513          	addi	a0,a0,1040 # 804129dc <default_pmm_manager+0x7b0>
804075d4:	cf9f80ef          	jal	ra,804002cc <__panic>
804075d8:	0000b697          	auipc	a3,0xb
804075dc:	42c68693          	addi	a3,a3,1068 # 80412a04 <default_pmm_manager+0x7d8>
804075e0:	00009617          	auipc	a2,0x9
804075e4:	6e060613          	addi	a2,a2,1760 # 80410cc0 <commands+0x3c>
804075e8:	06700593          	li	a1,103
804075ec:	0000b517          	auipc	a0,0xb
804075f0:	3f050513          	addi	a0,a0,1008 # 804129dc <default_pmm_manager+0x7b0>
804075f4:	cd9f80ef          	jal	ra,804002cc <__panic>

804075f8 <fd_array_dup>:
804075f8:	fe010113          	addi	sp,sp,-32
804075fc:	01212823          	sw	s2,16(sp)
80407600:	00052903          	lw	s2,0(a0)
80407604:	00112e23          	sw	ra,28(sp)
80407608:	00812c23          	sw	s0,24(sp)
8040760c:	00912a23          	sw	s1,20(sp)
80407610:	01312623          	sw	s3,12(sp)
80407614:	00100793          	li	a5,1
80407618:	06f91e63          	bne	s2,a5,80407694 <fd_array_dup+0x9c>
8040761c:	0005a983          	lw	s3,0(a1)
80407620:	00200793          	li	a5,2
80407624:	06f99863          	bne	s3,a5,80407694 <fd_array_dup+0x9c>
80407628:	0145a483          	lw	s1,20(a1)
8040762c:	0085a783          	lw	a5,8(a1)
80407630:	0105a683          	lw	a3,16(a1)
80407634:	0045a703          	lw	a4,4(a1)
80407638:	00050413          	mv	s0,a0
8040763c:	00f52423          	sw	a5,8(a0)
80407640:	00d52823          	sw	a3,16(a0)
80407644:	00e52223          	sw	a4,4(a0)
80407648:	00048513          	mv	a0,s1
8040764c:	131040ef          	jal	ra,8040bf7c <inode_ref_inc>
80407650:	00048513          	mv	a0,s1
80407654:	13d040ef          	jal	ra,8040bf90 <inode_open_inc>
80407658:	00042783          	lw	a5,0(s0)
8040765c:	00942a23          	sw	s1,20(s0)
80407660:	05279a63          	bne	a5,s2,804076b4 <fd_array_dup+0xbc>
80407664:	04048863          	beqz	s1,804076b4 <fd_array_dup+0xbc>
80407668:	01842783          	lw	a5,24(s0)
8040766c:	01342023          	sw	s3,0(s0)
80407670:	01c12083          	lw	ra,28(sp)
80407674:	00178793          	addi	a5,a5,1
80407678:	00f42c23          	sw	a5,24(s0)
8040767c:	01812403          	lw	s0,24(sp)
80407680:	01412483          	lw	s1,20(sp)
80407684:	01012903          	lw	s2,16(sp)
80407688:	00c12983          	lw	s3,12(sp)
8040768c:	02010113          	addi	sp,sp,32
80407690:	00008067          	ret
80407694:	0000b697          	auipc	a3,0xb
80407698:	44468693          	addi	a3,a3,1092 # 80412ad8 <default_pmm_manager+0x8ac>
8040769c:	00009617          	auipc	a2,0x9
804076a0:	62460613          	addi	a2,a2,1572 # 80410cc0 <commands+0x3c>
804076a4:	07300593          	li	a1,115
804076a8:	0000b517          	auipc	a0,0xb
804076ac:	33450513          	addi	a0,a0,820 # 804129dc <default_pmm_manager+0x7b0>
804076b0:	c1df80ef          	jal	ra,804002cc <__panic>
804076b4:	e55ff0ef          	jal	ra,80407508 <fd_array_open.part.0>

804076b8 <file_testfd>:
804076b8:	09000793          	li	a5,144
804076bc:	06a7e263          	bltu	a5,a0,80407720 <file_testfd+0x68>
804076c0:	00093797          	auipc	a5,0x93
804076c4:	18c7a783          	lw	a5,396(a5) # 8049a84c <current>
804076c8:	0dc7a783          	lw	a5,220(a5)
804076cc:	04078e63          	beqz	a5,80407728 <file_testfd+0x70>
804076d0:	0087a703          	lw	a4,8(a5)
804076d4:	04e05a63          	blez	a4,80407728 <file_testfd+0x70>
804076d8:	0047a703          	lw	a4,4(a5)
804076dc:	00351793          	slli	a5,a0,0x3
804076e0:	40a787b3          	sub	a5,a5,a0
804076e4:	00279793          	slli	a5,a5,0x2
804076e8:	00f707b3          	add	a5,a4,a5
804076ec:	0007a683          	lw	a3,0(a5)
804076f0:	00200713          	li	a4,2
804076f4:	02e69663          	bne	a3,a4,80407720 <file_testfd+0x68>
804076f8:	00c7a703          	lw	a4,12(a5)
804076fc:	02e51263          	bne	a0,a4,80407720 <file_testfd+0x68>
80407700:	00058663          	beqz	a1,8040770c <file_testfd+0x54>
80407704:	0047a503          	lw	a0,4(a5)
80407708:	00050e63          	beqz	a0,80407724 <file_testfd+0x6c>
8040770c:	00100513          	li	a0,1
80407710:	00060a63          	beqz	a2,80407724 <file_testfd+0x6c>
80407714:	0087a503          	lw	a0,8(a5)
80407718:	00a03533          	snez	a0,a0
8040771c:	00008067          	ret
80407720:	00000513          	li	a0,0
80407724:	00008067          	ret
80407728:	ff010113          	addi	sp,sp,-16
8040772c:	00112623          	sw	ra,12(sp)
80407730:	bbdff0ef          	jal	ra,804072ec <get_fd_array.part.0>

80407734 <file_open>:
80407734:	fc010113          	addi	sp,sp,-64
80407738:	02112e23          	sw	ra,60(sp)
8040773c:	02812c23          	sw	s0,56(sp)
80407740:	02912a23          	sw	s1,52(sp)
80407744:	03212823          	sw	s2,48(sp)
80407748:	03312623          	sw	s3,44(sp)
8040774c:	03412423          	sw	s4,40(sp)
80407750:	0035f793          	andi	a5,a1,3
80407754:	00300713          	li	a4,3
80407758:	12e78a63          	beq	a5,a4,8040788c <file_open+0x158>
8040775c:	00279793          	slli	a5,a5,0x2
80407760:	0000b717          	auipc	a4,0xb
80407764:	5d070713          	addi	a4,a4,1488 # 80412d30 <CSWTCH.81>
80407768:	00050913          	mv	s2,a0
8040776c:	0000b697          	auipc	a3,0xb
80407770:	5b868693          	addi	a3,a3,1464 # 80412d24 <CSWTCH.80>
80407774:	ffff7537          	lui	a0,0xffff7
80407778:	00f686b3          	add	a3,a3,a5
8040777c:	00058493          	mv	s1,a1
80407780:	00f707b3          	add	a5,a4,a5
80407784:	00810593          	addi	a1,sp,8
80407788:	ad950513          	addi	a0,a0,-1319 # ffff6ad9 <end+0x7fb5c245>
8040778c:	0006aa03          	lw	s4,0(a3)
80407790:	0007a983          	lw	s3,0(a5)
80407794:	b81ff0ef          	jal	ra,80407314 <fd_array_alloc>
80407798:	00050413          	mv	s0,a0
8040779c:	02050463          	beqz	a0,804077c4 <file_open+0x90>
804077a0:	03c12083          	lw	ra,60(sp)
804077a4:	00040513          	mv	a0,s0
804077a8:	03812403          	lw	s0,56(sp)
804077ac:	03412483          	lw	s1,52(sp)
804077b0:	03012903          	lw	s2,48(sp)
804077b4:	02c12983          	lw	s3,44(sp)
804077b8:	02812a03          	lw	s4,40(sp)
804077bc:	04010113          	addi	sp,sp,64
804077c0:	00008067          	ret
804077c4:	00c10613          	addi	a2,sp,12
804077c8:	00048593          	mv	a1,s1
804077cc:	00090513          	mv	a0,s2
804077d0:	261040ef          	jal	ra,8040c230 <vfs_open>
804077d4:	00050413          	mv	s0,a0
804077d8:	0a051463          	bnez	a0,80407880 <file_open+0x14c>
804077dc:	00812783          	lw	a5,8(sp)
804077e0:	0204f493          	andi	s1,s1,32
804077e4:	00c12403          	lw	s0,12(sp)
804077e8:	0007a823          	sw	zero,16(a5)
804077ec:	04048a63          	beqz	s1,80407840 <file_open+0x10c>
804077f0:	0a040463          	beqz	s0,80407898 <file_open+0x164>
804077f4:	03c42783          	lw	a5,60(s0)
804077f8:	0a078063          	beqz	a5,80407898 <file_open+0x164>
804077fc:	0147a783          	lw	a5,20(a5)
80407800:	08078c63          	beqz	a5,80407898 <file_open+0x164>
80407804:	00040513          	mv	a0,s0
80407808:	0000b597          	auipc	a1,0xb
8040780c:	35458593          	addi	a1,a1,852 # 80412b5c <default_pmm_manager+0x930>
80407810:	794040ef          	jal	ra,8040bfa4 <inode_check>
80407814:	03c42783          	lw	a5,60(s0)
80407818:	00c12503          	lw	a0,12(sp)
8040781c:	01010593          	addi	a1,sp,16
80407820:	0147a783          	lw	a5,20(a5)
80407824:	000780e7          	jalr	a5
80407828:	00050413          	mv	s0,a0
8040782c:	04051663          	bnez	a0,80407878 <file_open+0x144>
80407830:	00812783          	lw	a5,8(sp)
80407834:	01c12703          	lw	a4,28(sp)
80407838:	00c12403          	lw	s0,12(sp)
8040783c:	00e7a823          	sw	a4,16(a5)
80407840:	0007a683          	lw	a3,0(a5)
80407844:	0087aa23          	sw	s0,20(a5)
80407848:	0147a223          	sw	s4,4(a5)
8040784c:	0137a423          	sw	s3,8(a5)
80407850:	00100713          	li	a4,1
80407854:	04e69063          	bne	a3,a4,80407894 <file_open+0x160>
80407858:	02040e63          	beqz	s0,80407894 <file_open+0x160>
8040785c:	0187a703          	lw	a4,24(a5)
80407860:	00200693          	li	a3,2
80407864:	00c7a403          	lw	s0,12(a5)
80407868:	00170713          	addi	a4,a4,1
8040786c:	00d7a023          	sw	a3,0(a5)
80407870:	00e7ac23          	sw	a4,24(a5)
80407874:	f2dff06f          	j	804077a0 <file_open+0x6c>
80407878:	00c12503          	lw	a0,12(sp)
8040787c:	409040ef          	jal	ra,8040c484 <vfs_close>
80407880:	00812503          	lw	a0,8(sp)
80407884:	b5dff0ef          	jal	ra,804073e0 <fd_array_free>
80407888:	f19ff06f          	j	804077a0 <file_open+0x6c>
8040788c:	ffd00413          	li	s0,-3
80407890:	f11ff06f          	j	804077a0 <file_open+0x6c>
80407894:	c75ff0ef          	jal	ra,80407508 <fd_array_open.part.0>
80407898:	0000b697          	auipc	a3,0xb
8040789c:	27468693          	addi	a3,a3,628 # 80412b0c <default_pmm_manager+0x8e0>
804078a0:	00009617          	auipc	a2,0x9
804078a4:	42060613          	addi	a2,a2,1056 # 80410cc0 <commands+0x3c>
804078a8:	0b800593          	li	a1,184
804078ac:	0000b517          	auipc	a0,0xb
804078b0:	13050513          	addi	a0,a0,304 # 804129dc <default_pmm_manager+0x7b0>
804078b4:	a19f80ef          	jal	ra,804002cc <__panic>

804078b8 <file_close>:
804078b8:	09000713          	li	a4,144
804078bc:	06a76a63          	bltu	a4,a0,80407930 <file_close+0x78>
804078c0:	00093717          	auipc	a4,0x93
804078c4:	f8c72703          	lw	a4,-116(a4) # 8049a84c <current>
804078c8:	0dc72703          	lw	a4,220(a4)
804078cc:	ff010113          	addi	sp,sp,-16
804078d0:	00112623          	sw	ra,12(sp)
804078d4:	06070263          	beqz	a4,80407938 <file_close+0x80>
804078d8:	00872683          	lw	a3,8(a4)
804078dc:	04d05e63          	blez	a3,80407938 <file_close+0x80>
804078e0:	00472703          	lw	a4,4(a4)
804078e4:	00050793          	mv	a5,a0
804078e8:	00351513          	slli	a0,a0,0x3
804078ec:	40f50533          	sub	a0,a0,a5
804078f0:	00251513          	slli	a0,a0,0x2
804078f4:	00a70533          	add	a0,a4,a0
804078f8:	00052683          	lw	a3,0(a0)
804078fc:	00200713          	li	a4,2
80407900:	02e69063          	bne	a3,a4,80407920 <file_close+0x68>
80407904:	00c52703          	lw	a4,12(a0)
80407908:	00e79c63          	bne	a5,a4,80407920 <file_close+0x68>
8040790c:	c49ff0ef          	jal	ra,80407554 <fd_array_close>
80407910:	00c12083          	lw	ra,12(sp)
80407914:	00000513          	li	a0,0
80407918:	01010113          	addi	sp,sp,16
8040791c:	00008067          	ret
80407920:	00c12083          	lw	ra,12(sp)
80407924:	ffd00513          	li	a0,-3
80407928:	01010113          	addi	sp,sp,16
8040792c:	00008067          	ret
80407930:	ffd00513          	li	a0,-3
80407934:	00008067          	ret
80407938:	9b5ff0ef          	jal	ra,804072ec <get_fd_array.part.0>

8040793c <file_read>:
8040793c:	fd010113          	addi	sp,sp,-48
80407940:	02112623          	sw	ra,44(sp)
80407944:	02812423          	sw	s0,40(sp)
80407948:	02912223          	sw	s1,36(sp)
8040794c:	03212023          	sw	s2,32(sp)
80407950:	01312e23          	sw	s3,28(sp)
80407954:	01412c23          	sw	s4,24(sp)
80407958:	0006a023          	sw	zero,0(a3)
8040795c:	09000793          	li	a5,144
80407960:	10a7e063          	bltu	a5,a0,80407a60 <file_read+0x124>
80407964:	00093797          	auipc	a5,0x93
80407968:	ee87a783          	lw	a5,-280(a5) # 8049a84c <current>
8040796c:	0dc7a783          	lw	a5,220(a5)
80407970:	0e078c63          	beqz	a5,80407a68 <file_read+0x12c>
80407974:	0087a703          	lw	a4,8(a5)
80407978:	0ee05863          	blez	a4,80407a68 <file_read+0x12c>
8040797c:	0047a403          	lw	s0,4(a5)
80407980:	00351793          	slli	a5,a0,0x3
80407984:	40a787b3          	sub	a5,a5,a0
80407988:	00279793          	slli	a5,a5,0x2
8040798c:	00f40433          	add	s0,s0,a5
80407990:	00042983          	lw	s3,0(s0)
80407994:	00200793          	li	a5,2
80407998:	0cf99463          	bne	s3,a5,80407a60 <file_read+0x124>
8040799c:	00c42783          	lw	a5,12(s0)
804079a0:	0cf51063          	bne	a0,a5,80407a60 <file_read+0x124>
804079a4:	00442783          	lw	a5,4(s0)
804079a8:	0a078c63          	beqz	a5,80407a60 <file_read+0x124>
804079ac:	01842783          	lw	a5,24(s0)
804079b0:	00068a13          	mv	s4,a3
804079b4:	01042683          	lw	a3,16(s0)
804079b8:	00178793          	addi	a5,a5,1
804079bc:	00010513          	mv	a0,sp
804079c0:	00f42c23          	sw	a5,24(s0)
804079c4:	015000ef          	jal	ra,804081d8 <iobuf_init>
804079c8:	01442903          	lw	s2,20(s0)
804079cc:	00050493          	mv	s1,a0
804079d0:	08090e63          	beqz	s2,80407a6c <file_read+0x130>
804079d4:	03c92783          	lw	a5,60(s2)
804079d8:	08078a63          	beqz	a5,80407a6c <file_read+0x130>
804079dc:	00c7a783          	lw	a5,12(a5)
804079e0:	08078663          	beqz	a5,80407a6c <file_read+0x130>
804079e4:	0000b597          	auipc	a1,0xb
804079e8:	1d058593          	addi	a1,a1,464 # 80412bb4 <default_pmm_manager+0x988>
804079ec:	00090513          	mv	a0,s2
804079f0:	5b4040ef          	jal	ra,8040bfa4 <inode_check>
804079f4:	03c92783          	lw	a5,60(s2)
804079f8:	01442503          	lw	a0,20(s0)
804079fc:	00048593          	mv	a1,s1
80407a00:	00c7a783          	lw	a5,12(a5)
80407a04:	000780e7          	jalr	a5
80407a08:	0084a783          	lw	a5,8(s1)
80407a0c:	00c4a683          	lw	a3,12(s1)
80407a10:	00042703          	lw	a4,0(s0)
80407a14:	00050493          	mv	s1,a0
80407a18:	40d787b3          	sub	a5,a5,a3
80407a1c:	03370a63          	beq	a4,s3,80407a50 <file_read+0x114>
80407a20:	00fa2023          	sw	a5,0(s4)
80407a24:	00040513          	mv	a0,s0
80407a28:	a5dff0ef          	jal	ra,80407484 <fd_array_release>
80407a2c:	02c12083          	lw	ra,44(sp)
80407a30:	02812403          	lw	s0,40(sp)
80407a34:	02012903          	lw	s2,32(sp)
80407a38:	01c12983          	lw	s3,28(sp)
80407a3c:	01812a03          	lw	s4,24(sp)
80407a40:	00048513          	mv	a0,s1
80407a44:	02412483          	lw	s1,36(sp)
80407a48:	03010113          	addi	sp,sp,48
80407a4c:	00008067          	ret
80407a50:	01042703          	lw	a4,16(s0)
80407a54:	00f70733          	add	a4,a4,a5
80407a58:	00e42823          	sw	a4,16(s0)
80407a5c:	fc5ff06f          	j	80407a20 <file_read+0xe4>
80407a60:	ffd00493          	li	s1,-3
80407a64:	fc9ff06f          	j	80407a2c <file_read+0xf0>
80407a68:	885ff0ef          	jal	ra,804072ec <get_fd_array.part.0>
80407a6c:	0000b697          	auipc	a3,0xb
80407a70:	0f868693          	addi	a3,a3,248 # 80412b64 <default_pmm_manager+0x938>
80407a74:	00009617          	auipc	a2,0x9
80407a78:	24c60613          	addi	a2,a2,588 # 80410cc0 <commands+0x3c>
80407a7c:	0e200593          	li	a1,226
80407a80:	0000b517          	auipc	a0,0xb
80407a84:	f5c50513          	addi	a0,a0,-164 # 804129dc <default_pmm_manager+0x7b0>
80407a88:	845f80ef          	jal	ra,804002cc <__panic>

80407a8c <file_write>:
80407a8c:	fd010113          	addi	sp,sp,-48
80407a90:	02112623          	sw	ra,44(sp)
80407a94:	02812423          	sw	s0,40(sp)
80407a98:	02912223          	sw	s1,36(sp)
80407a9c:	03212023          	sw	s2,32(sp)
80407aa0:	01312e23          	sw	s3,28(sp)
80407aa4:	01412c23          	sw	s4,24(sp)
80407aa8:	0006a023          	sw	zero,0(a3)
80407aac:	09000793          	li	a5,144
80407ab0:	10a7e063          	bltu	a5,a0,80407bb0 <file_write+0x124>
80407ab4:	00093797          	auipc	a5,0x93
80407ab8:	d987a783          	lw	a5,-616(a5) # 8049a84c <current>
80407abc:	0dc7a783          	lw	a5,220(a5)
80407ac0:	0e078c63          	beqz	a5,80407bb8 <file_write+0x12c>
80407ac4:	0087a703          	lw	a4,8(a5)
80407ac8:	0ee05863          	blez	a4,80407bb8 <file_write+0x12c>
80407acc:	0047a403          	lw	s0,4(a5)
80407ad0:	00351793          	slli	a5,a0,0x3
80407ad4:	40a787b3          	sub	a5,a5,a0
80407ad8:	00279793          	slli	a5,a5,0x2
80407adc:	00f40433          	add	s0,s0,a5
80407ae0:	00042983          	lw	s3,0(s0)
80407ae4:	00200793          	li	a5,2
80407ae8:	0cf99463          	bne	s3,a5,80407bb0 <file_write+0x124>
80407aec:	00c42783          	lw	a5,12(s0)
80407af0:	0cf51063          	bne	a0,a5,80407bb0 <file_write+0x124>
80407af4:	00842783          	lw	a5,8(s0)
80407af8:	0a078c63          	beqz	a5,80407bb0 <file_write+0x124>
80407afc:	01842783          	lw	a5,24(s0)
80407b00:	00068a13          	mv	s4,a3
80407b04:	01042683          	lw	a3,16(s0)
80407b08:	00178793          	addi	a5,a5,1
80407b0c:	00010513          	mv	a0,sp
80407b10:	00f42c23          	sw	a5,24(s0)
80407b14:	6c4000ef          	jal	ra,804081d8 <iobuf_init>
80407b18:	01442903          	lw	s2,20(s0)
80407b1c:	00050493          	mv	s1,a0
80407b20:	08090e63          	beqz	s2,80407bbc <file_write+0x130>
80407b24:	03c92783          	lw	a5,60(s2)
80407b28:	08078a63          	beqz	a5,80407bbc <file_write+0x130>
80407b2c:	0107a783          	lw	a5,16(a5)
80407b30:	08078663          	beqz	a5,80407bbc <file_write+0x130>
80407b34:	0000b597          	auipc	a1,0xb
80407b38:	0d858593          	addi	a1,a1,216 # 80412c0c <default_pmm_manager+0x9e0>
80407b3c:	00090513          	mv	a0,s2
80407b40:	464040ef          	jal	ra,8040bfa4 <inode_check>
80407b44:	03c92783          	lw	a5,60(s2)
80407b48:	01442503          	lw	a0,20(s0)
80407b4c:	00048593          	mv	a1,s1
80407b50:	0107a783          	lw	a5,16(a5)
80407b54:	000780e7          	jalr	a5
80407b58:	0084a783          	lw	a5,8(s1)
80407b5c:	00c4a683          	lw	a3,12(s1)
80407b60:	00042703          	lw	a4,0(s0)
80407b64:	00050493          	mv	s1,a0
80407b68:	40d787b3          	sub	a5,a5,a3
80407b6c:	03370a63          	beq	a4,s3,80407ba0 <file_write+0x114>
80407b70:	00fa2023          	sw	a5,0(s4)
80407b74:	00040513          	mv	a0,s0
80407b78:	90dff0ef          	jal	ra,80407484 <fd_array_release>
80407b7c:	02c12083          	lw	ra,44(sp)
80407b80:	02812403          	lw	s0,40(sp)
80407b84:	02012903          	lw	s2,32(sp)
80407b88:	01c12983          	lw	s3,28(sp)
80407b8c:	01812a03          	lw	s4,24(sp)
80407b90:	00048513          	mv	a0,s1
80407b94:	02412483          	lw	s1,36(sp)
80407b98:	03010113          	addi	sp,sp,48
80407b9c:	00008067          	ret
80407ba0:	01042703          	lw	a4,16(s0)
80407ba4:	00f70733          	add	a4,a4,a5
80407ba8:	00e42823          	sw	a4,16(s0)
80407bac:	fc5ff06f          	j	80407b70 <file_write+0xe4>
80407bb0:	ffd00493          	li	s1,-3
80407bb4:	fc9ff06f          	j	80407b7c <file_write+0xf0>
80407bb8:	f34ff0ef          	jal	ra,804072ec <get_fd_array.part.0>
80407bbc:	0000b697          	auipc	a3,0xb
80407bc0:	00068693          	mv	a3,a3
80407bc4:	00009617          	auipc	a2,0x9
80407bc8:	0fc60613          	addi	a2,a2,252 # 80410cc0 <commands+0x3c>
80407bcc:	0fc00593          	li	a1,252
80407bd0:	0000b517          	auipc	a0,0xb
80407bd4:	e0c50513          	addi	a0,a0,-500 # 804129dc <default_pmm_manager+0x7b0>
80407bd8:	ef4f80ef          	jal	ra,804002cc <__panic>

80407bdc <file_seek>:
80407bdc:	fe010113          	addi	sp,sp,-32
80407be0:	00112e23          	sw	ra,28(sp)
80407be4:	00812c23          	sw	s0,24(sp)
80407be8:	00912a23          	sw	s1,20(sp)
80407bec:	01212823          	sw	s2,16(sp)
80407bf0:	09000793          	li	a5,144
80407bf4:	0ea7e063          	bltu	a5,a0,80407cd4 <file_seek+0xf8>
80407bf8:	00093797          	auipc	a5,0x93
80407bfc:	c547a783          	lw	a5,-940(a5) # 8049a84c <current>
80407c00:	0dc7a783          	lw	a5,220(a5)
80407c04:	14078063          	beqz	a5,80407d44 <file_seek+0x168>
80407c08:	0087a703          	lw	a4,8(a5)
80407c0c:	12e05c63          	blez	a4,80407d44 <file_seek+0x168>
80407c10:	0047a403          	lw	s0,4(a5)
80407c14:	00351793          	slli	a5,a0,0x3
80407c18:	40a787b3          	sub	a5,a5,a0
80407c1c:	00279793          	slli	a5,a5,0x2
80407c20:	00f40433          	add	s0,s0,a5
80407c24:	00042703          	lw	a4,0(s0)
80407c28:	00200793          	li	a5,2
80407c2c:	0af71463          	bne	a4,a5,80407cd4 <file_seek+0xf8>
80407c30:	00c42783          	lw	a5,12(s0)
80407c34:	0af51063          	bne	a0,a5,80407cd4 <file_seek+0xf8>
80407c38:	01842783          	lw	a5,24(s0)
80407c3c:	00100693          	li	a3,1
80407c40:	00058913          	mv	s2,a1
80407c44:	00178793          	addi	a5,a5,1
80407c48:	00f42c23          	sw	a5,24(s0)
80407c4c:	02d60a63          	beq	a2,a3,80407c80 <file_seek+0xa4>
80407c50:	0ae60263          	beq	a2,a4,80407cf4 <file_seek+0x118>
80407c54:	ffd00493          	li	s1,-3
80407c58:	02060863          	beqz	a2,80407c88 <file_seek+0xac>
80407c5c:	00040513          	mv	a0,s0
80407c60:	825ff0ef          	jal	ra,80407484 <fd_array_release>
80407c64:	01c12083          	lw	ra,28(sp)
80407c68:	01812403          	lw	s0,24(sp)
80407c6c:	01012903          	lw	s2,16(sp)
80407c70:	00048513          	mv	a0,s1
80407c74:	01412483          	lw	s1,20(sp)
80407c78:	02010113          	addi	sp,sp,32
80407c7c:	00008067          	ret
80407c80:	01042783          	lw	a5,16(s0)
80407c84:	00f58933          	add	s2,a1,a5
80407c88:	01442483          	lw	s1,20(s0)
80407c8c:	0a048e63          	beqz	s1,80407d48 <file_seek+0x16c>
80407c90:	03c4a783          	lw	a5,60(s1)
80407c94:	0a078a63          	beqz	a5,80407d48 <file_seek+0x16c>
80407c98:	02c7a783          	lw	a5,44(a5)
80407c9c:	0a078663          	beqz	a5,80407d48 <file_seek+0x16c>
80407ca0:	00048513          	mv	a0,s1
80407ca4:	0000b597          	auipc	a1,0xb
80407ca8:	fc058593          	addi	a1,a1,-64 # 80412c64 <default_pmm_manager+0xa38>
80407cac:	2f8040ef          	jal	ra,8040bfa4 <inode_check>
80407cb0:	03c4a783          	lw	a5,60(s1)
80407cb4:	01442503          	lw	a0,20(s0)
80407cb8:	00090593          	mv	a1,s2
80407cbc:	02c7a783          	lw	a5,44(a5)
80407cc0:	000780e7          	jalr	a5
80407cc4:	00050493          	mv	s1,a0
80407cc8:	f8051ae3          	bnez	a0,80407c5c <file_seek+0x80>
80407ccc:	01242823          	sw	s2,16(s0)
80407cd0:	f8dff06f          	j	80407c5c <file_seek+0x80>
80407cd4:	01c12083          	lw	ra,28(sp)
80407cd8:	01812403          	lw	s0,24(sp)
80407cdc:	ffd00493          	li	s1,-3
80407ce0:	01012903          	lw	s2,16(sp)
80407ce4:	00048513          	mv	a0,s1
80407ce8:	01412483          	lw	s1,20(sp)
80407cec:	02010113          	addi	sp,sp,32
80407cf0:	00008067          	ret
80407cf4:	01442483          	lw	s1,20(s0)
80407cf8:	06048863          	beqz	s1,80407d68 <file_seek+0x18c>
80407cfc:	03c4a783          	lw	a5,60(s1)
80407d00:	06078463          	beqz	a5,80407d68 <file_seek+0x18c>
80407d04:	0147a783          	lw	a5,20(a5)
80407d08:	06078063          	beqz	a5,80407d68 <file_seek+0x18c>
80407d0c:	00048513          	mv	a0,s1
80407d10:	0000b597          	auipc	a1,0xb
80407d14:	e4c58593          	addi	a1,a1,-436 # 80412b5c <default_pmm_manager+0x930>
80407d18:	28c040ef          	jal	ra,8040bfa4 <inode_check>
80407d1c:	03c4a783          	lw	a5,60(s1)
80407d20:	01442503          	lw	a0,20(s0)
80407d24:	00010593          	mv	a1,sp
80407d28:	0147a783          	lw	a5,20(a5)
80407d2c:	000780e7          	jalr	a5
80407d30:	00050493          	mv	s1,a0
80407d34:	f20514e3          	bnez	a0,80407c5c <file_seek+0x80>
80407d38:	00c12783          	lw	a5,12(sp)
80407d3c:	00f90933          	add	s2,s2,a5
80407d40:	f49ff06f          	j	80407c88 <file_seek+0xac>
80407d44:	da8ff0ef          	jal	ra,804072ec <get_fd_array.part.0>
80407d48:	0000b697          	auipc	a3,0xb
80407d4c:	ecc68693          	addi	a3,a3,-308 # 80412c14 <default_pmm_manager+0x9e8>
80407d50:	00009617          	auipc	a2,0x9
80407d54:	f7060613          	addi	a2,a2,-144 # 80410cc0 <commands+0x3c>
80407d58:	11e00593          	li	a1,286
80407d5c:	0000b517          	auipc	a0,0xb
80407d60:	c8050513          	addi	a0,a0,-896 # 804129dc <default_pmm_manager+0x7b0>
80407d64:	d68f80ef          	jal	ra,804002cc <__panic>
80407d68:	0000b697          	auipc	a3,0xb
80407d6c:	da468693          	addi	a3,a3,-604 # 80412b0c <default_pmm_manager+0x8e0>
80407d70:	00009617          	auipc	a2,0x9
80407d74:	f5060613          	addi	a2,a2,-176 # 80410cc0 <commands+0x3c>
80407d78:	11600593          	li	a1,278
80407d7c:	0000b517          	auipc	a0,0xb
80407d80:	c6050513          	addi	a0,a0,-928 # 804129dc <default_pmm_manager+0x7b0>
80407d84:	d48f80ef          	jal	ra,804002cc <__panic>

80407d88 <file_fstat>:
80407d88:	ff010113          	addi	sp,sp,-16
80407d8c:	00112623          	sw	ra,12(sp)
80407d90:	00812423          	sw	s0,8(sp)
80407d94:	00912223          	sw	s1,4(sp)
80407d98:	01212023          	sw	s2,0(sp)
80407d9c:	09000793          	li	a5,144
80407da0:	0aa7ee63          	bltu	a5,a0,80407e5c <file_fstat+0xd4>
80407da4:	00093797          	auipc	a5,0x93
80407da8:	aa87a783          	lw	a5,-1368(a5) # 8049a84c <current>
80407dac:	0dc7a783          	lw	a5,220(a5)
80407db0:	0e078663          	beqz	a5,80407e9c <file_fstat+0x114>
80407db4:	0087a703          	lw	a4,8(a5)
80407db8:	0ee05263          	blez	a4,80407e9c <file_fstat+0x114>
80407dbc:	0047a403          	lw	s0,4(a5)
80407dc0:	00351793          	slli	a5,a0,0x3
80407dc4:	40a787b3          	sub	a5,a5,a0
80407dc8:	00279793          	slli	a5,a5,0x2
80407dcc:	00f40433          	add	s0,s0,a5
80407dd0:	00042703          	lw	a4,0(s0)
80407dd4:	00200793          	li	a5,2
80407dd8:	08f71263          	bne	a4,a5,80407e5c <file_fstat+0xd4>
80407ddc:	00c42783          	lw	a5,12(s0)
80407de0:	06f51e63          	bne	a0,a5,80407e5c <file_fstat+0xd4>
80407de4:	01842783          	lw	a5,24(s0)
80407de8:	01442903          	lw	s2,20(s0)
80407dec:	00178793          	addi	a5,a5,1
80407df0:	00f42c23          	sw	a5,24(s0)
80407df4:	08090463          	beqz	s2,80407e7c <file_fstat+0xf4>
80407df8:	03c92783          	lw	a5,60(s2)
80407dfc:	08078063          	beqz	a5,80407e7c <file_fstat+0xf4>
80407e00:	0147a783          	lw	a5,20(a5)
80407e04:	06078c63          	beqz	a5,80407e7c <file_fstat+0xf4>
80407e08:	00058493          	mv	s1,a1
80407e0c:	00090513          	mv	a0,s2
80407e10:	0000b597          	auipc	a1,0xb
80407e14:	d4c58593          	addi	a1,a1,-692 # 80412b5c <default_pmm_manager+0x930>
80407e18:	18c040ef          	jal	ra,8040bfa4 <inode_check>
80407e1c:	03c92783          	lw	a5,60(s2)
80407e20:	01442503          	lw	a0,20(s0)
80407e24:	00048593          	mv	a1,s1
80407e28:	0147a783          	lw	a5,20(a5)
80407e2c:	000780e7          	jalr	a5
80407e30:	00050793          	mv	a5,a0
80407e34:	00040513          	mv	a0,s0
80407e38:	00078413          	mv	s0,a5
80407e3c:	e48ff0ef          	jal	ra,80407484 <fd_array_release>
80407e40:	00c12083          	lw	ra,12(sp)
80407e44:	00040513          	mv	a0,s0
80407e48:	00812403          	lw	s0,8(sp)
80407e4c:	00412483          	lw	s1,4(sp)
80407e50:	00012903          	lw	s2,0(sp)
80407e54:	01010113          	addi	sp,sp,16
80407e58:	00008067          	ret
80407e5c:	ffd00413          	li	s0,-3
80407e60:	00c12083          	lw	ra,12(sp)
80407e64:	00040513          	mv	a0,s0
80407e68:	00812403          	lw	s0,8(sp)
80407e6c:	00412483          	lw	s1,4(sp)
80407e70:	00012903          	lw	s2,0(sp)
80407e74:	01010113          	addi	sp,sp,16
80407e78:	00008067          	ret
80407e7c:	0000b697          	auipc	a3,0xb
80407e80:	c9068693          	addi	a3,a3,-880 # 80412b0c <default_pmm_manager+0x8e0>
80407e84:	00009617          	auipc	a2,0x9
80407e88:	e3c60613          	addi	a2,a2,-452 # 80410cc0 <commands+0x3c>
80407e8c:	13000593          	li	a1,304
80407e90:	0000b517          	auipc	a0,0xb
80407e94:	b4c50513          	addi	a0,a0,-1204 # 804129dc <default_pmm_manager+0x7b0>
80407e98:	c34f80ef          	jal	ra,804002cc <__panic>
80407e9c:	c50ff0ef          	jal	ra,804072ec <get_fd_array.part.0>

80407ea0 <file_fsync>:
80407ea0:	ff010113          	addi	sp,sp,-16
80407ea4:	00112623          	sw	ra,12(sp)
80407ea8:	00812423          	sw	s0,8(sp)
80407eac:	00912223          	sw	s1,4(sp)
80407eb0:	09000793          	li	a5,144
80407eb4:	0aa7e863          	bltu	a5,a0,80407f64 <file_fsync+0xc4>
80407eb8:	00093797          	auipc	a5,0x93
80407ebc:	9947a783          	lw	a5,-1644(a5) # 8049a84c <current>
80407ec0:	0dc7a783          	lw	a5,220(a5)
80407ec4:	0c078e63          	beqz	a5,80407fa0 <file_fsync+0x100>
80407ec8:	0087a703          	lw	a4,8(a5)
80407ecc:	0ce05a63          	blez	a4,80407fa0 <file_fsync+0x100>
80407ed0:	0047a403          	lw	s0,4(a5)
80407ed4:	00351793          	slli	a5,a0,0x3
80407ed8:	40a787b3          	sub	a5,a5,a0
80407edc:	00279793          	slli	a5,a5,0x2
80407ee0:	00f40433          	add	s0,s0,a5
80407ee4:	00042703          	lw	a4,0(s0)
80407ee8:	00200793          	li	a5,2
80407eec:	06f71c63          	bne	a4,a5,80407f64 <file_fsync+0xc4>
80407ef0:	00c42783          	lw	a5,12(s0)
80407ef4:	06f51863          	bne	a0,a5,80407f64 <file_fsync+0xc4>
80407ef8:	01842783          	lw	a5,24(s0)
80407efc:	01442483          	lw	s1,20(s0)
80407f00:	00178793          	addi	a5,a5,1
80407f04:	00f42c23          	sw	a5,24(s0)
80407f08:	06048c63          	beqz	s1,80407f80 <file_fsync+0xe0>
80407f0c:	03c4a783          	lw	a5,60(s1)
80407f10:	06078863          	beqz	a5,80407f80 <file_fsync+0xe0>
80407f14:	0187a783          	lw	a5,24(a5)
80407f18:	06078463          	beqz	a5,80407f80 <file_fsync+0xe0>
80407f1c:	0000b597          	auipc	a1,0xb
80407f20:	da058593          	addi	a1,a1,-608 # 80412cbc <default_pmm_manager+0xa90>
80407f24:	00048513          	mv	a0,s1
80407f28:	07c040ef          	jal	ra,8040bfa4 <inode_check>
80407f2c:	03c4a783          	lw	a5,60(s1)
80407f30:	01442503          	lw	a0,20(s0)
80407f34:	0187a783          	lw	a5,24(a5)
80407f38:	000780e7          	jalr	a5
80407f3c:	00050793          	mv	a5,a0
80407f40:	00040513          	mv	a0,s0
80407f44:	00078413          	mv	s0,a5
80407f48:	d3cff0ef          	jal	ra,80407484 <fd_array_release>
80407f4c:	00c12083          	lw	ra,12(sp)
80407f50:	00040513          	mv	a0,s0
80407f54:	00812403          	lw	s0,8(sp)
80407f58:	00412483          	lw	s1,4(sp)
80407f5c:	01010113          	addi	sp,sp,16
80407f60:	00008067          	ret
80407f64:	ffd00413          	li	s0,-3
80407f68:	00c12083          	lw	ra,12(sp)
80407f6c:	00040513          	mv	a0,s0
80407f70:	00812403          	lw	s0,8(sp)
80407f74:	00412483          	lw	s1,4(sp)
80407f78:	01010113          	addi	sp,sp,16
80407f7c:	00008067          	ret
80407f80:	0000b697          	auipc	a3,0xb
80407f84:	cec68693          	addi	a3,a3,-788 # 80412c6c <default_pmm_manager+0xa40>
80407f88:	00009617          	auipc	a2,0x9
80407f8c:	d3860613          	addi	a2,a2,-712 # 80410cc0 <commands+0x3c>
80407f90:	13e00593          	li	a1,318
80407f94:	0000b517          	auipc	a0,0xb
80407f98:	a4850513          	addi	a0,a0,-1464 # 804129dc <default_pmm_manager+0x7b0>
80407f9c:	b30f80ef          	jal	ra,804002cc <__panic>
80407fa0:	b4cff0ef          	jal	ra,804072ec <get_fd_array.part.0>

80407fa4 <file_getdirentry>:
80407fa4:	fd010113          	addi	sp,sp,-48
80407fa8:	02112623          	sw	ra,44(sp)
80407fac:	02812423          	sw	s0,40(sp)
80407fb0:	02912223          	sw	s1,36(sp)
80407fb4:	03212023          	sw	s2,32(sp)
80407fb8:	01312e23          	sw	s3,28(sp)
80407fbc:	09000793          	li	a5,144
80407fc0:	0ea7e863          	bltu	a5,a0,804080b0 <file_getdirentry+0x10c>
80407fc4:	00093797          	auipc	a5,0x93
80407fc8:	8887a783          	lw	a5,-1912(a5) # 8049a84c <current>
80407fcc:	0dc7a783          	lw	a5,220(a5)
80407fd0:	12078263          	beqz	a5,804080f4 <file_getdirentry+0x150>
80407fd4:	0087a703          	lw	a4,8(a5)
80407fd8:	10e05e63          	blez	a4,804080f4 <file_getdirentry+0x150>
80407fdc:	0047a403          	lw	s0,4(a5)
80407fe0:	00351793          	slli	a5,a0,0x3
80407fe4:	40a787b3          	sub	a5,a5,a0
80407fe8:	00279793          	slli	a5,a5,0x2
80407fec:	00f40433          	add	s0,s0,a5
80407ff0:	00042703          	lw	a4,0(s0)
80407ff4:	00200793          	li	a5,2
80407ff8:	0af71c63          	bne	a4,a5,804080b0 <file_getdirentry+0x10c>
80407ffc:	00c42783          	lw	a5,12(s0)
80408000:	0af51863          	bne	a0,a5,804080b0 <file_getdirentry+0x10c>
80408004:	01842783          	lw	a5,24(s0)
80408008:	0005a683          	lw	a3,0(a1)
8040800c:	00058493          	mv	s1,a1
80408010:	00178793          	addi	a5,a5,1
80408014:	10000613          	li	a2,256
80408018:	00f42c23          	sw	a5,24(s0)
8040801c:	00458593          	addi	a1,a1,4
80408020:	00010513          	mv	a0,sp
80408024:	1b4000ef          	jal	ra,804081d8 <iobuf_init>
80408028:	01442983          	lw	s3,20(s0)
8040802c:	00050913          	mv	s2,a0
80408030:	0a098263          	beqz	s3,804080d4 <file_getdirentry+0x130>
80408034:	03c9a783          	lw	a5,60(s3)
80408038:	08078e63          	beqz	a5,804080d4 <file_getdirentry+0x130>
8040803c:	0207a783          	lw	a5,32(a5)
80408040:	08078a63          	beqz	a5,804080d4 <file_getdirentry+0x130>
80408044:	00098513          	mv	a0,s3
80408048:	0000b597          	auipc	a1,0xb
8040804c:	cd058593          	addi	a1,a1,-816 # 80412d18 <default_pmm_manager+0xaec>
80408050:	755030ef          	jal	ra,8040bfa4 <inode_check>
80408054:	03c9a783          	lw	a5,60(s3)
80408058:	01442503          	lw	a0,20(s0)
8040805c:	00090593          	mv	a1,s2
80408060:	0207a783          	lw	a5,32(a5)
80408064:	000780e7          	jalr	a5
80408068:	00050993          	mv	s3,a0
8040806c:	00051e63          	bnez	a0,80408088 <file_getdirentry+0xe4>
80408070:	0004a783          	lw	a5,0(s1)
80408074:	00892683          	lw	a3,8(s2)
80408078:	00c92703          	lw	a4,12(s2)
8040807c:	00d787b3          	add	a5,a5,a3
80408080:	40e787b3          	sub	a5,a5,a4
80408084:	00f4a023          	sw	a5,0(s1)
80408088:	00040513          	mv	a0,s0
8040808c:	bf8ff0ef          	jal	ra,80407484 <fd_array_release>
80408090:	02c12083          	lw	ra,44(sp)
80408094:	02812403          	lw	s0,40(sp)
80408098:	02412483          	lw	s1,36(sp)
8040809c:	02012903          	lw	s2,32(sp)
804080a0:	00098513          	mv	a0,s3
804080a4:	01c12983          	lw	s3,28(sp)
804080a8:	03010113          	addi	sp,sp,48
804080ac:	00008067          	ret
804080b0:	02c12083          	lw	ra,44(sp)
804080b4:	02812403          	lw	s0,40(sp)
804080b8:	ffd00993          	li	s3,-3
804080bc:	02412483          	lw	s1,36(sp)
804080c0:	02012903          	lw	s2,32(sp)
804080c4:	00098513          	mv	a0,s3
804080c8:	01c12983          	lw	s3,28(sp)
804080cc:	03010113          	addi	sp,sp,48
804080d0:	00008067          	ret
804080d4:	0000b697          	auipc	a3,0xb
804080d8:	bf068693          	addi	a3,a3,-1040 # 80412cc4 <default_pmm_manager+0xa98>
804080dc:	00009617          	auipc	a2,0x9
804080e0:	be460613          	addi	a2,a2,-1052 # 80410cc0 <commands+0x3c>
804080e4:	14e00593          	li	a1,334
804080e8:	0000b517          	auipc	a0,0xb
804080ec:	8f450513          	addi	a0,a0,-1804 # 804129dc <default_pmm_manager+0x7b0>
804080f0:	9dcf80ef          	jal	ra,804002cc <__panic>
804080f4:	9f8ff0ef          	jal	ra,804072ec <get_fd_array.part.0>

804080f8 <file_dup>:
804080f8:	09000713          	li	a4,144
804080fc:	0aa76463          	bltu	a4,a0,804081a4 <file_dup+0xac>
80408100:	00092717          	auipc	a4,0x92
80408104:	74c72703          	lw	a4,1868(a4) # 8049a84c <current>
80408108:	0dc72703          	lw	a4,220(a4)
8040810c:	fe010113          	addi	sp,sp,-32
80408110:	00112e23          	sw	ra,28(sp)
80408114:	00812c23          	sw	s0,24(sp)
80408118:	08070a63          	beqz	a4,804081ac <file_dup+0xb4>
8040811c:	00872683          	lw	a3,8(a4)
80408120:	08d05663          	blez	a3,804081ac <file_dup+0xb4>
80408124:	00472403          	lw	s0,4(a4)
80408128:	00351713          	slli	a4,a0,0x3
8040812c:	40a70733          	sub	a4,a4,a0
80408130:	00271713          	slli	a4,a4,0x2
80408134:	00e40433          	add	s0,s0,a4
80408138:	00042683          	lw	a3,0(s0)
8040813c:	00200713          	li	a4,2
80408140:	04e69863          	bne	a3,a4,80408190 <file_dup+0x98>
80408144:	00c42703          	lw	a4,12(s0)
80408148:	04e51463          	bne	a0,a4,80408190 <file_dup+0x98>
8040814c:	00058513          	mv	a0,a1
80408150:	00c10593          	addi	a1,sp,12
80408154:	9c0ff0ef          	jal	ra,80407314 <fd_array_alloc>
80408158:	00050a63          	beqz	a0,8040816c <file_dup+0x74>
8040815c:	01c12083          	lw	ra,28(sp)
80408160:	01812403          	lw	s0,24(sp)
80408164:	02010113          	addi	sp,sp,32
80408168:	00008067          	ret
8040816c:	00c12503          	lw	a0,12(sp)
80408170:	00040593          	mv	a1,s0
80408174:	c84ff0ef          	jal	ra,804075f8 <fd_array_dup>
80408178:	00c12783          	lw	a5,12(sp)
8040817c:	01c12083          	lw	ra,28(sp)
80408180:	01812403          	lw	s0,24(sp)
80408184:	00c7a503          	lw	a0,12(a5)
80408188:	02010113          	addi	sp,sp,32
8040818c:	00008067          	ret
80408190:	01c12083          	lw	ra,28(sp)
80408194:	01812403          	lw	s0,24(sp)
80408198:	ffd00513          	li	a0,-3
8040819c:	02010113          	addi	sp,sp,32
804081a0:	00008067          	ret
804081a4:	ffd00513          	li	a0,-3
804081a8:	00008067          	ret
804081ac:	940ff0ef          	jal	ra,804072ec <get_fd_array.part.0>

804081b0 <iobuf_skip.part.0>:
804081b0:	ff010113          	addi	sp,sp,-16
804081b4:	0000b697          	auipc	a3,0xb
804081b8:	b8868693          	addi	a3,a3,-1144 # 80412d3c <CSWTCH.81+0xc>
804081bc:	00009617          	auipc	a2,0x9
804081c0:	b0460613          	addi	a2,a2,-1276 # 80410cc0 <commands+0x3c>
804081c4:	04a00593          	li	a1,74
804081c8:	0000b517          	auipc	a0,0xb
804081cc:	b8850513          	addi	a0,a0,-1144 # 80412d50 <CSWTCH.81+0x20>
804081d0:	00112623          	sw	ra,12(sp)
804081d4:	8f8f80ef          	jal	ra,804002cc <__panic>

804081d8 <iobuf_init>:
804081d8:	00b52023          	sw	a1,0(a0)
804081dc:	00d52223          	sw	a3,4(a0)
804081e0:	00c52623          	sw	a2,12(a0)
804081e4:	00c52423          	sw	a2,8(a0)
804081e8:	00008067          	ret

804081ec <iobuf_move>:
804081ec:	fe010113          	addi	sp,sp,-32
804081f0:	00912a23          	sw	s1,20(sp)
804081f4:	00c52483          	lw	s1,12(a0)
804081f8:	00812c23          	sw	s0,24(sp)
804081fc:	01212823          	sw	s2,16(sp)
80408200:	01312623          	sw	s3,12(sp)
80408204:	00112e23          	sw	ra,28(sp)
80408208:	00050413          	mv	s0,a0
8040820c:	00060913          	mv	s2,a2
80408210:	00058513          	mv	a0,a1
80408214:	00070993          	mv	s3,a4
80408218:	00967463          	bgeu	a2,s1,80408220 <iobuf_move+0x34>
8040821c:	00060493          	mv	s1,a2
80408220:	04048663          	beqz	s1,8040826c <iobuf_move+0x80>
80408224:	00042583          	lw	a1,0(s0)
80408228:	00068863          	beqz	a3,80408238 <iobuf_move+0x4c>
8040822c:	00058793          	mv	a5,a1
80408230:	00050593          	mv	a1,a0
80408234:	00078513          	mv	a0,a5
80408238:	00048613          	mv	a2,s1
8040823c:	755070ef          	jal	ra,80410190 <memmove>
80408240:	00c42783          	lw	a5,12(s0)
80408244:	0497ea63          	bltu	a5,s1,80408298 <iobuf_move+0xac>
80408248:	00042683          	lw	a3,0(s0)
8040824c:	00442703          	lw	a4,4(s0)
80408250:	409787b3          	sub	a5,a5,s1
80408254:	009686b3          	add	a3,a3,s1
80408258:	00970733          	add	a4,a4,s1
8040825c:	00d42023          	sw	a3,0(s0)
80408260:	00e42223          	sw	a4,4(s0)
80408264:	00f42623          	sw	a5,12(s0)
80408268:	40990933          	sub	s2,s2,s1
8040826c:	00098463          	beqz	s3,80408274 <iobuf_move+0x88>
80408270:	0099a023          	sw	s1,0(s3)
80408274:	00000513          	li	a0,0
80408278:	02091263          	bnez	s2,8040829c <iobuf_move+0xb0>
8040827c:	01c12083          	lw	ra,28(sp)
80408280:	01812403          	lw	s0,24(sp)
80408284:	01412483          	lw	s1,20(sp)
80408288:	01012903          	lw	s2,16(sp)
8040828c:	00c12983          	lw	s3,12(sp)
80408290:	02010113          	addi	sp,sp,32
80408294:	00008067          	ret
80408298:	f19ff0ef          	jal	ra,804081b0 <iobuf_skip.part.0>
8040829c:	ffc00513          	li	a0,-4
804082a0:	fddff06f          	j	8040827c <iobuf_move+0x90>

804082a4 <iobuf_skip>:
804082a4:	00c52783          	lw	a5,12(a0)
804082a8:	02b7e463          	bltu	a5,a1,804082d0 <iobuf_skip+0x2c>
804082ac:	00052683          	lw	a3,0(a0)
804082b0:	00452703          	lw	a4,4(a0)
804082b4:	40b787b3          	sub	a5,a5,a1
804082b8:	00b686b3          	add	a3,a3,a1
804082bc:	00b705b3          	add	a1,a4,a1
804082c0:	00d52023          	sw	a3,0(a0)
804082c4:	00b52223          	sw	a1,4(a0)
804082c8:	00f52623          	sw	a5,12(a0)
804082cc:	00008067          	ret
804082d0:	ff010113          	addi	sp,sp,-16
804082d4:	00112623          	sw	ra,12(sp)
804082d8:	ed9ff0ef          	jal	ra,804081b0 <iobuf_skip.part.0>

804082dc <fs_init>:
804082dc:	ff010113          	addi	sp,sp,-16
804082e0:	00112623          	sw	ra,12(sp)
804082e4:	200040ef          	jal	ra,8040c4e4 <vfs_init>
804082e8:	004050ef          	jal	ra,8040d2ec <dev_init>
804082ec:	00c12083          	lw	ra,12(sp)
804082f0:	01010113          	addi	sp,sp,16
804082f4:	0580506f          	j	8040d34c <sfs_init>

804082f8 <fs_cleanup>:
804082f8:	2e80306f          	j	8040b5e0 <vfs_cleanup>

804082fc <lock_files>:
804082fc:	00c50513          	addi	a0,a0,12
80408300:	f50fe06f          	j	80406a50 <down>

80408304 <unlock_files>:
80408304:	00c50513          	addi	a0,a0,12
80408308:	f44fe06f          	j	80406a4c <up>

8040830c <files_create>:
8040830c:	ff010113          	addi	sp,sp,-16
80408310:	00001537          	lui	a0,0x1
80408314:	00812423          	sw	s0,8(sp)
80408318:	00112623          	sw	ra,12(sp)
8040831c:	afdfa0ef          	jal	ra,80402e18 <kmalloc>
80408320:	00050413          	mv	s0,a0
80408324:	02050463          	beqz	a0,8040834c <files_create+0x40>
80408328:	01850793          	addi	a5,a0,24 # 1018 <_binary_bin_swap_img_size-0x6fe8>
8040832c:	00042023          	sw	zero,0(s0)
80408330:	00c50513          	addi	a0,a0,12
80408334:	00f42223          	sw	a5,4(s0)
80408338:	00042423          	sw	zero,8(s0)
8040833c:	00100593          	li	a1,1
80408340:	f00fe0ef          	jal	ra,80406a40 <sem_init>
80408344:	00442503          	lw	a0,4(s0)
80408348:	9e8ff0ef          	jal	ra,80407530 <fd_array_init>
8040834c:	00c12083          	lw	ra,12(sp)
80408350:	00040513          	mv	a0,s0
80408354:	00812403          	lw	s0,8(sp)
80408358:	01010113          	addi	sp,sp,16
8040835c:	00008067          	ret

80408360 <files_destroy>:
80408360:	fe010113          	addi	sp,sp,-32
80408364:	00112e23          	sw	ra,28(sp)
80408368:	00812c23          	sw	s0,24(sp)
8040836c:	00912a23          	sw	s1,20(sp)
80408370:	01212823          	sw	s2,16(sp)
80408374:	01312623          	sw	s3,12(sp)
80408378:	08050a63          	beqz	a0,8040840c <files_destroy+0xac>
8040837c:	00852783          	lw	a5,8(a0)
80408380:	00050993          	mv	s3,a0
80408384:	08079463          	bnez	a5,8040840c <files_destroy+0xac>
80408388:	00052503          	lw	a0,0(a0)
8040838c:	00050463          	beqz	a0,80408394 <files_destroy+0x34>
80408390:	4e1030ef          	jal	ra,8040c070 <inode_ref_dec>
80408394:	0049a403          	lw	s0,4(s3)
80408398:	000014b7          	lui	s1,0x1
8040839c:	fdc48493          	addi	s1,s1,-36 # fdc <_binary_bin_swap_img_size-0x7024>
804083a0:	009404b3          	add	s1,s0,s1
804083a4:	00200913          	li	s2,2
804083a8:	00042783          	lw	a5,0(s0)
804083ac:	03278863          	beq	a5,s2,804083dc <files_destroy+0x7c>
804083b0:	02079e63          	bnez	a5,804083ec <files_destroy+0x8c>
804083b4:	01c40413          	addi	s0,s0,28
804083b8:	fe8498e3          	bne	s1,s0,804083a8 <files_destroy+0x48>
804083bc:	01812403          	lw	s0,24(sp)
804083c0:	01c12083          	lw	ra,28(sp)
804083c4:	01412483          	lw	s1,20(sp)
804083c8:	01012903          	lw	s2,16(sp)
804083cc:	00098513          	mv	a0,s3
804083d0:	00c12983          	lw	s3,12(sp)
804083d4:	02010113          	addi	sp,sp,32
804083d8:	b5dfa06f          	j	80402f34 <kfree>
804083dc:	00040513          	mv	a0,s0
804083e0:	974ff0ef          	jal	ra,80407554 <fd_array_close>
804083e4:	00042783          	lw	a5,0(s0)
804083e8:	fc9ff06f          	j	804083b0 <files_destroy+0x50>
804083ec:	0000b697          	auipc	a3,0xb
804083f0:	9b068693          	addi	a3,a3,-1616 # 80412d9c <CSWTCH.81+0x6c>
804083f4:	00009617          	auipc	a2,0x9
804083f8:	8cc60613          	addi	a2,a2,-1844 # 80410cc0 <commands+0x3c>
804083fc:	03d00593          	li	a1,61
80408400:	0000b517          	auipc	a0,0xb
80408404:	98c50513          	addi	a0,a0,-1652 # 80412d8c <CSWTCH.81+0x5c>
80408408:	ec5f70ef          	jal	ra,804002cc <__panic>
8040840c:	0000b697          	auipc	a3,0xb
80408410:	95468693          	addi	a3,a3,-1708 # 80412d60 <CSWTCH.81+0x30>
80408414:	00009617          	auipc	a2,0x9
80408418:	8ac60613          	addi	a2,a2,-1876 # 80410cc0 <commands+0x3c>
8040841c:	03300593          	li	a1,51
80408420:	0000b517          	auipc	a0,0xb
80408424:	96c50513          	addi	a0,a0,-1684 # 80412d8c <CSWTCH.81+0x5c>
80408428:	ea5f70ef          	jal	ra,804002cc <__panic>

8040842c <files_closeall>:
8040842c:	ff010113          	addi	sp,sp,-16
80408430:	00112623          	sw	ra,12(sp)
80408434:	00812423          	sw	s0,8(sp)
80408438:	00912223          	sw	s1,4(sp)
8040843c:	01212023          	sw	s2,0(sp)
80408440:	06050063          	beqz	a0,804084a0 <files_closeall+0x74>
80408444:	00852783          	lw	a5,8(a0)
80408448:	04f05c63          	blez	a5,804084a0 <files_closeall+0x74>
8040844c:	00452483          	lw	s1,4(a0)
80408450:	000017b7          	lui	a5,0x1
80408454:	fdc78793          	addi	a5,a5,-36 # fdc <_binary_bin_swap_img_size-0x7024>
80408458:	03848413          	addi	s0,s1,56
8040845c:	00200913          	li	s2,2
80408460:	00f484b3          	add	s1,s1,a5
80408464:	00c0006f          	j	80408470 <files_closeall+0x44>
80408468:	01c40413          	addi	s0,s0,28
8040846c:	00848e63          	beq	s1,s0,80408488 <files_closeall+0x5c>
80408470:	00042783          	lw	a5,0(s0)
80408474:	ff279ae3          	bne	a5,s2,80408468 <files_closeall+0x3c>
80408478:	00040513          	mv	a0,s0
8040847c:	01c40413          	addi	s0,s0,28
80408480:	8d4ff0ef          	jal	ra,80407554 <fd_array_close>
80408484:	fe8496e3          	bne	s1,s0,80408470 <files_closeall+0x44>
80408488:	00c12083          	lw	ra,12(sp)
8040848c:	00812403          	lw	s0,8(sp)
80408490:	00412483          	lw	s1,4(sp)
80408494:	00012903          	lw	s2,0(sp)
80408498:	01010113          	addi	sp,sp,16
8040849c:	00008067          	ret
804084a0:	0000a697          	auipc	a3,0xa
804084a4:	51068693          	addi	a3,a3,1296 # 804129b0 <default_pmm_manager+0x784>
804084a8:	00009617          	auipc	a2,0x9
804084ac:	81860613          	addi	a2,a2,-2024 # 80410cc0 <commands+0x3c>
804084b0:	04500593          	li	a1,69
804084b4:	0000b517          	auipc	a0,0xb
804084b8:	8d850513          	addi	a0,a0,-1832 # 80412d8c <CSWTCH.81+0x5c>
804084bc:	e11f70ef          	jal	ra,804002cc <__panic>

804084c0 <dup_files>:
804084c0:	fe010113          	addi	sp,sp,-32
804084c4:	00112e23          	sw	ra,28(sp)
804084c8:	00812c23          	sw	s0,24(sp)
804084cc:	00912a23          	sw	s1,20(sp)
804084d0:	01212823          	sw	s2,16(sp)
804084d4:	01312623          	sw	s3,12(sp)
804084d8:	01412423          	sw	s4,8(sp)
804084dc:	0a050263          	beqz	a0,80408580 <dup_files+0xc0>
804084e0:	00058413          	mv	s0,a1
804084e4:	08058e63          	beqz	a1,80408580 <dup_files+0xc0>
804084e8:	00852783          	lw	a5,8(a0)
804084ec:	00050493          	mv	s1,a0
804084f0:	0a079863          	bnez	a5,804085a0 <dup_files+0xe0>
804084f4:	0085a783          	lw	a5,8(a1)
804084f8:	0af05463          	blez	a5,804085a0 <dup_files+0xe0>
804084fc:	0005a503          	lw	a0,0(a1)
80408500:	00a4a023          	sw	a0,0(s1)
80408504:	00050463          	beqz	a0,8040850c <dup_files+0x4c>
80408508:	275030ef          	jal	ra,8040bf7c <inode_ref_inc>
8040850c:	00442403          	lw	s0,4(s0)
80408510:	00001937          	lui	s2,0x1
80408514:	fdc90913          	addi	s2,s2,-36 # fdc <_binary_bin_swap_img_size-0x7024>
80408518:	0044a483          	lw	s1,4(s1)
8040851c:	01240933          	add	s2,s0,s2
80408520:	00200993          	li	s3,2
80408524:	00100a13          	li	s4,1
80408528:	0100006f          	j	80408538 <dup_files+0x78>
8040852c:	01c40413          	addi	s0,s0,28
80408530:	01c48493          	addi	s1,s1,28
80408534:	02890463          	beq	s2,s0,8040855c <dup_files+0x9c>
80408538:	00042783          	lw	a5,0(s0)
8040853c:	ff3798e3          	bne	a5,s3,8040852c <dup_files+0x6c>
80408540:	0144a023          	sw	s4,0(s1)
80408544:	00040593          	mv	a1,s0
80408548:	00048513          	mv	a0,s1
8040854c:	01c40413          	addi	s0,s0,28
80408550:	8a8ff0ef          	jal	ra,804075f8 <fd_array_dup>
80408554:	01c48493          	addi	s1,s1,28
80408558:	fe8910e3          	bne	s2,s0,80408538 <dup_files+0x78>
8040855c:	01c12083          	lw	ra,28(sp)
80408560:	01812403          	lw	s0,24(sp)
80408564:	01412483          	lw	s1,20(sp)
80408568:	01012903          	lw	s2,16(sp)
8040856c:	00c12983          	lw	s3,12(sp)
80408570:	00812a03          	lw	s4,8(sp)
80408574:	00000513          	li	a0,0
80408578:	02010113          	addi	sp,sp,32
8040857c:	00008067          	ret
80408580:	00009697          	auipc	a3,0x9
80408584:	fec68693          	addi	a3,a3,-20 # 8041156c <commands+0x8e8>
80408588:	00008617          	auipc	a2,0x8
8040858c:	73860613          	addi	a2,a2,1848 # 80410cc0 <commands+0x3c>
80408590:	05300593          	li	a1,83
80408594:	0000a517          	auipc	a0,0xa
80408598:	7f850513          	addi	a0,a0,2040 # 80412d8c <CSWTCH.81+0x5c>
8040859c:	d31f70ef          	jal	ra,804002cc <__panic>
804085a0:	0000b697          	auipc	a3,0xb
804085a4:	81468693          	addi	a3,a3,-2028 # 80412db4 <CSWTCH.81+0x84>
804085a8:	00008617          	auipc	a2,0x8
804085ac:	71860613          	addi	a2,a2,1816 # 80410cc0 <commands+0x3c>
804085b0:	05400593          	li	a1,84
804085b4:	0000a517          	auipc	a0,0xa
804085b8:	7d850513          	addi	a0,a0,2008 # 80412d8c <CSWTCH.81+0x5c>
804085bc:	d11f70ef          	jal	ra,804002cc <__panic>

804085c0 <switch_to>:
804085c0:	00152023          	sw	ra,0(a0)
804085c4:	00252223          	sw	sp,4(a0)
804085c8:	00852423          	sw	s0,8(a0)
804085cc:	00952623          	sw	s1,12(a0)
804085d0:	01252823          	sw	s2,16(a0)
804085d4:	01352a23          	sw	s3,20(a0)
804085d8:	01452c23          	sw	s4,24(a0)
804085dc:	01552e23          	sw	s5,28(a0)
804085e0:	03652023          	sw	s6,32(a0)
804085e4:	03752223          	sw	s7,36(a0)
804085e8:	03852423          	sw	s8,40(a0)
804085ec:	03952623          	sw	s9,44(a0)
804085f0:	03a52823          	sw	s10,48(a0)
804085f4:	03b52a23          	sw	s11,52(a0)
804085f8:	0005a083          	lw	ra,0(a1)
804085fc:	0045a103          	lw	sp,4(a1)
80408600:	0085a403          	lw	s0,8(a1)
80408604:	00c5a483          	lw	s1,12(a1)
80408608:	0105a903          	lw	s2,16(a1)
8040860c:	0145a983          	lw	s3,20(a1)
80408610:	0185aa03          	lw	s4,24(a1)
80408614:	01c5aa83          	lw	s5,28(a1)
80408618:	0205ab03          	lw	s6,32(a1)
8040861c:	0245ab83          	lw	s7,36(a1)
80408620:	0285ac03          	lw	s8,40(a1)
80408624:	02c5ac83          	lw	s9,44(a1)
80408628:	0305ad03          	lw	s10,48(a1)
8040862c:	0345ad83          	lw	s11,52(a1)
80408630:	00008067          	ret

80408634 <kernel_thread_entry>:
80408634:	00048513          	mv	a0,s1
80408638:	000400e7          	jalr	s0
8040863c:	105000ef          	jal	ra,80408f40 <do_exit>

80408640 <alloc_proc>:
80408640:	ff010113          	addi	sp,sp,-16
80408644:	0e000513          	li	a0,224
80408648:	00812423          	sw	s0,8(sp)
8040864c:	00112623          	sw	ra,12(sp)
80408650:	fc8fa0ef          	jal	ra,80402e18 <kmalloc>
80408654:	00050413          	mv	s0,a0
80408658:	08050a63          	beqz	a0,804086ec <alloc_proc+0xac>
8040865c:	fff00793          	li	a5,-1
80408660:	00f52223          	sw	a5,4(a0)
80408664:	03800613          	li	a2,56
80408668:	00000593          	li	a1,0
8040866c:	00052023          	sw	zero,0(a0)
80408670:	00052423          	sw	zero,8(a0)
80408674:	00052623          	sw	zero,12(a0)
80408678:	00052823          	sw	zero,16(a0)
8040867c:	00052a23          	sw	zero,20(a0)
80408680:	00052c23          	sw	zero,24(a0)
80408684:	01c50513          	addi	a0,a0,28
80408688:	2ed070ef          	jal	ra,80410174 <memset>
8040868c:	00092797          	auipc	a5,0x92
80408690:	1a47a783          	lw	a5,420(a5) # 8049a830 <boot_cr3>
80408694:	04f42c23          	sw	a5,88(s0)
80408698:	04042a23          	sw	zero,84(s0)
8040869c:	04042e23          	sw	zero,92(s0)
804086a0:	03200613          	li	a2,50
804086a4:	00000593          	li	a1,0
804086a8:	06040513          	addi	a0,s0,96
804086ac:	2c9070ef          	jal	ra,80410174 <memset>
804086b0:	0bc40793          	addi	a5,s0,188
804086b4:	0a042423          	sw	zero,168(s0)
804086b8:	0a042823          	sw	zero,176(s0)
804086bc:	0a042a23          	sw	zero,180(s0)
804086c0:	0a042623          	sw	zero,172(s0)
804086c4:	0a042c23          	sw	zero,184(s0)
804086c8:	0cf42023          	sw	a5,192(s0)
804086cc:	0af42e23          	sw	a5,188(s0)
804086d0:	0c042223          	sw	zero,196(s0)
804086d4:	0c042423          	sw	zero,200(s0)
804086d8:	0c042823          	sw	zero,208(s0)
804086dc:	0c042623          	sw	zero,204(s0)
804086e0:	0c042a23          	sw	zero,212(s0)
804086e4:	0c042c23          	sw	zero,216(s0)
804086e8:	0c042e23          	sw	zero,220(s0)
804086ec:	00c12083          	lw	ra,12(sp)
804086f0:	00040513          	mv	a0,s0
804086f4:	00812403          	lw	s0,8(sp)
804086f8:	01010113          	addi	sp,sp,16
804086fc:	00008067          	ret

80408700 <forkret>:
80408700:	00092797          	auipc	a5,0x92
80408704:	14c7a783          	lw	a5,332(a5) # 8049a84c <current>
80408708:	0547a503          	lw	a0,84(a5)
8040870c:	86cf906f          	j	80401778 <forkrets>

80408710 <user_main>:
80408710:	00092797          	auipc	a5,0x92
80408714:	13c7a783          	lw	a5,316(a5) # 8049a84c <current>
80408718:	fe010113          	addi	sp,sp,-32
8040871c:	0047a583          	lw	a1,4(a5)
80408720:	00812c23          	sw	s0,24(sp)
80408724:	0000a417          	auipc	s0,0xa
80408728:	6c040413          	addi	s0,s0,1728 # 80412de4 <CSWTCH.81+0xb4>
8040872c:	00040613          	mv	a2,s0
80408730:	0000a517          	auipc	a0,0xa
80408734:	6b850513          	addi	a0,a0,1720 # 80412de8 <CSWTCH.81+0xb8>
80408738:	00112e23          	sw	ra,28(sp)
8040873c:	00812423          	sw	s0,8(sp)
80408740:	00012623          	sw	zero,12(sp)
80408744:	a05f70ef          	jal	ra,80400148 <cprintf>
80408748:	00812783          	lw	a5,8(sp)
8040874c:	06078663          	beqz	a5,804087b8 <user_main+0xa8>
80408750:	00c10793          	addi	a5,sp,12
80408754:	00000713          	li	a4,0
80408758:	0007a683          	lw	a3,0(a5)
8040875c:	00170713          	addi	a4,a4,1
80408760:	00478793          	addi	a5,a5,4
80408764:	fe069ae3          	bnez	a3,80408758 <user_main+0x48>
80408768:	100027f3          	csrr	a5,sstatus
8040876c:	1007e793          	ori	a5,a5,256
80408770:	10079073          	csrw	sstatus,a5
80408774:	1424d073          	csrwi	scause,9
80408778:	00810793          	addi	a5,sp,8
8040877c:	00000517          	auipc	a0,0x0
80408780:	01c50513          	addi	a0,a0,28 # 80408798 <user_main+0x88>
80408784:	14151073          	csrw	sepc,a0
80408788:	00400513          	li	a0,4
8040878c:	00040593          	mv	a1,s0
80408790:	00070613          	mv	a2,a4
80408794:	00078693          	mv	a3,a5
80408798:	e85f806f          	j	8040161c <__alltraps>
8040879c:	00050713          	mv	a4,a0
804087a0:	0000a617          	auipc	a2,0xa
804087a4:	67060613          	addi	a2,a2,1648 # 80412e10 <CSWTCH.81+0xe0>
804087a8:	3ff00593          	li	a1,1023
804087ac:	0000a517          	auipc	a0,0xa
804087b0:	68050513          	addi	a0,a0,1664 # 80412e2c <CSWTCH.81+0xfc>
804087b4:	b19f70ef          	jal	ra,804002cc <__panic>
804087b8:	00000713          	li	a4,0
804087bc:	fadff06f          	j	80408768 <user_main+0x58>

804087c0 <put_pgdir.isra.0>:
804087c0:	ff010113          	addi	sp,sp,-16
804087c4:	00112623          	sw	ra,12(sp)
804087c8:	804007b7          	lui	a5,0x80400
804087cc:	04f56663          	bltu	a0,a5,80408818 <put_pgdir.isra.0+0x58>
804087d0:	00092697          	auipc	a3,0x92
804087d4:	0786a683          	lw	a3,120(a3) # 8049a848 <va_pa_offset>
804087d8:	40d50533          	sub	a0,a0,a3
804087dc:	00c55513          	srli	a0,a0,0xc
804087e0:	00092797          	auipc	a5,0x92
804087e4:	0587a783          	lw	a5,88(a5) # 8049a838 <npage>
804087e8:	04f57663          	bgeu	a0,a5,80408834 <put_pgdir.isra.0+0x74>
804087ec:	0000c697          	auipc	a3,0xc
804087f0:	2d06a683          	lw	a3,720(a3) # 80414abc <nbase>
804087f4:	00c12083          	lw	ra,12(sp)
804087f8:	40d50533          	sub	a0,a0,a3
804087fc:	00092797          	auipc	a5,0x92
80408800:	0407a783          	lw	a5,64(a5) # 8049a83c <pages>
80408804:	00551513          	slli	a0,a0,0x5
80408808:	00100593          	li	a1,1
8040880c:	00a78533          	add	a0,a5,a0
80408810:	01010113          	addi	sp,sp,16
80408814:	89cfc06f          	j	804048b0 <free_pages>
80408818:	00050693          	mv	a3,a0
8040881c:	00009617          	auipc	a2,0x9
80408820:	31460613          	addi	a2,a2,788 # 80411b30 <commands+0xeac>
80408824:	07000593          	li	a1,112
80408828:	00009517          	auipc	a0,0x9
8040882c:	f5450513          	addi	a0,a0,-172 # 8041177c <commands+0xaf8>
80408830:	a9df70ef          	jal	ra,804002cc <__panic>
80408834:	00009617          	auipc	a2,0x9
80408838:	f2860613          	addi	a2,a2,-216 # 8041175c <commands+0xad8>
8040883c:	06900593          	li	a1,105
80408840:	00009517          	auipc	a0,0x9
80408844:	f3c50513          	addi	a0,a0,-196 # 8041177c <commands+0xaf8>
80408848:	a85f70ef          	jal	ra,804002cc <__panic>

8040884c <setup_pgdir>:
8040884c:	fe010113          	addi	sp,sp,-32
80408850:	01212823          	sw	s2,16(sp)
80408854:	00050913          	mv	s2,a0
80408858:	00100513          	li	a0,1
8040885c:	00112e23          	sw	ra,28(sp)
80408860:	00812c23          	sw	s0,24(sp)
80408864:	00912a23          	sw	s1,20(sp)
80408868:	01312623          	sw	s3,12(sp)
8040886c:	01412423          	sw	s4,8(sp)
80408870:	f6dfb0ef          	jal	ra,804047dc <alloc_pages>
80408874:	0a050a63          	beqz	a0,80408928 <setup_pgdir+0xdc>
80408878:	00092a17          	auipc	s4,0x92
8040887c:	fc4a0a13          	addi	s4,s4,-60 # 8049a83c <pages>
80408880:	000a2683          	lw	a3,0(s4)
80408884:	0000c997          	auipc	s3,0xc
80408888:	2389a983          	lw	s3,568(s3) # 80414abc <nbase>
8040888c:	00092717          	auipc	a4,0x92
80408890:	fac72703          	lw	a4,-84(a4) # 8049a838 <npage>
80408894:	40d506b3          	sub	a3,a0,a3
80408898:	4056d693          	srai	a3,a3,0x5
8040889c:	013686b3          	add	a3,a3,s3
804088a0:	00c69793          	slli	a5,a3,0xc
804088a4:	00c7d793          	srli	a5,a5,0xc
804088a8:	00050413          	mv	s0,a0
804088ac:	00c69693          	slli	a3,a3,0xc
804088b0:	08e7f063          	bgeu	a5,a4,80408930 <setup_pgdir+0xe4>
804088b4:	00092497          	auipc	s1,0x92
804088b8:	f944a483          	lw	s1,-108(s1) # 8049a848 <va_pa_offset>
804088bc:	009684b3          	add	s1,a3,s1
804088c0:	00001637          	lui	a2,0x1
804088c4:	00092597          	auipc	a1,0x92
804088c8:	f705a583          	lw	a1,-144(a1) # 8049a834 <boot_pgdir>
804088cc:	00048513          	mv	a0,s1
804088d0:	115070ef          	jal	ra,804101e4 <memcpy>
804088d4:	000a2503          	lw	a0,0(s4)
804088d8:	000017b7          	lui	a5,0x1
804088dc:	00f487b3          	add	a5,s1,a5
804088e0:	40a40433          	sub	s0,s0,a0
804088e4:	40545413          	srai	s0,s0,0x5
804088e8:	01340433          	add	s0,s0,s3
804088ec:	00a41413          	slli	s0,s0,0xa
804088f0:	00146713          	ori	a4,s0,1
804088f4:	00746413          	ori	s0,s0,7
804088f8:	fae7a623          	sw	a4,-84(a5) # fac <_binary_bin_swap_img_size-0x7054>
804088fc:	fa87a823          	sw	s0,-80(a5)
80408900:	00992623          	sw	s1,12(s2)
80408904:	00000513          	li	a0,0
80408908:	01c12083          	lw	ra,28(sp)
8040890c:	01812403          	lw	s0,24(sp)
80408910:	01412483          	lw	s1,20(sp)
80408914:	01012903          	lw	s2,16(sp)
80408918:	00c12983          	lw	s3,12(sp)
8040891c:	00812a03          	lw	s4,8(sp)
80408920:	02010113          	addi	sp,sp,32
80408924:	00008067          	ret
80408928:	ffc00513          	li	a0,-4
8040892c:	fddff06f          	j	80408908 <setup_pgdir+0xbc>
80408930:	00009617          	auipc	a2,0x9
80408934:	17860613          	addi	a2,a2,376 # 80411aa8 <commands+0xe24>
80408938:	06e00593          	li	a1,110
8040893c:	00009517          	auipc	a0,0x9
80408940:	e4050513          	addi	a0,a0,-448 # 8041177c <commands+0xaf8>
80408944:	989f70ef          	jal	ra,804002cc <__panic>

80408948 <proc_run>:
80408948:	fe010113          	addi	sp,sp,-32
8040894c:	01212a23          	sw	s2,20(sp)
80408950:	00092917          	auipc	s2,0x92
80408954:	efc90913          	addi	s2,s2,-260 # 8049a84c <current>
80408958:	00912c23          	sw	s1,24(sp)
8040895c:	00092483          	lw	s1,0(s2)
80408960:	00112e23          	sw	ra,28(sp)
80408964:	01312823          	sw	s3,16(sp)
80408968:	04a48063          	beq	s1,a0,804089a8 <proc_run+0x60>
8040896c:	100027f3          	csrr	a5,sstatus
80408970:	0027f793          	andi	a5,a5,2
80408974:	00000993          	li	s3,0
80408978:	06079063          	bnez	a5,804089d8 <proc_run+0x90>
8040897c:	05852783          	lw	a5,88(a0)
80408980:	80000737          	lui	a4,0x80000
80408984:	00a92023          	sw	a0,0(s2)
80408988:	00c7d793          	srli	a5,a5,0xc
8040898c:	00e7e7b3          	or	a5,a5,a4
80408990:	18079073          	csrw	satp,a5
80408994:	12000073          	sfence.vma
80408998:	01c50593          	addi	a1,a0,28
8040899c:	01c48513          	addi	a0,s1,28
804089a0:	c21ff0ef          	jal	ra,804085c0 <switch_to>
804089a4:	00099e63          	bnez	s3,804089c0 <proc_run+0x78>
804089a8:	01c12083          	lw	ra,28(sp)
804089ac:	01812483          	lw	s1,24(sp)
804089b0:	01412903          	lw	s2,20(sp)
804089b4:	01012983          	lw	s3,16(sp)
804089b8:	02010113          	addi	sp,sp,32
804089bc:	00008067          	ret
804089c0:	01c12083          	lw	ra,28(sp)
804089c4:	01812483          	lw	s1,24(sp)
804089c8:	01412903          	lw	s2,20(sp)
804089cc:	01012983          	lw	s3,16(sp)
804089d0:	02010113          	addi	sp,sp,32
804089d4:	b9cf806f          	j	80400d70 <intr_enable>
804089d8:	00a12623          	sw	a0,12(sp)
804089dc:	b9cf80ef          	jal	ra,80400d78 <intr_disable>
804089e0:	00c12503          	lw	a0,12(sp)
804089e4:	00100993          	li	s3,1
804089e8:	f95ff06f          	j	8040897c <proc_run+0x34>

804089ec <do_fork>:
804089ec:	fc010113          	addi	sp,sp,-64
804089f0:	03212823          	sw	s2,48(sp)
804089f4:	00092917          	auipc	s2,0x92
804089f8:	e6490913          	addi	s2,s2,-412 # 8049a858 <nr_process>
804089fc:	00092783          	lw	a5,0(s2)
80408a00:	03312623          	sw	s3,44(sp)
80408a04:	02112e23          	sw	ra,60(sp)
80408a08:	02812c23          	sw	s0,56(sp)
80408a0c:	02912a23          	sw	s1,52(sp)
80408a10:	03412423          	sw	s4,40(sp)
80408a14:	03512223          	sw	s5,36(sp)
80408a18:	03612023          	sw	s6,32(sp)
80408a1c:	01712e23          	sw	s7,28(sp)
80408a20:	01812c23          	sw	s8,24(sp)
80408a24:	01912a23          	sw	s9,20(sp)
80408a28:	01a12823          	sw	s10,16(sp)
80408a2c:	01b12623          	sw	s11,12(sp)
80408a30:	000019b7          	lui	s3,0x1
80408a34:	4537d063          	bge	a5,s3,80408e74 <do_fork+0x488>
80408a38:	00050a13          	mv	s4,a0
80408a3c:	00058a93          	mv	s5,a1
80408a40:	00060493          	mv	s1,a2
80408a44:	bfdff0ef          	jal	ra,80408640 <alloc_proc>
80408a48:	00050413          	mv	s0,a0
80408a4c:	40050863          	beqz	a0,80408e5c <do_fork+0x470>
80408a50:	00092b17          	auipc	s6,0x92
80408a54:	dfcb0b13          	addi	s6,s6,-516 # 8049a84c <current>
80408a58:	000b2783          	lw	a5,0(s6)
80408a5c:	0a87a703          	lw	a4,168(a5)
80408a60:	00f52a23          	sw	a5,20(a0)
80408a64:	4a071263          	bnez	a4,80408f08 <do_fork+0x51c>
80408a68:	00200513          	li	a0,2
80408a6c:	d71fb0ef          	jal	ra,804047dc <alloc_pages>
80408a70:	3e050263          	beqz	a0,80408e54 <do_fork+0x468>
80408a74:	00092c17          	auipc	s8,0x92
80408a78:	dc8c0c13          	addi	s8,s8,-568 # 8049a83c <pages>
80408a7c:	000c2683          	lw	a3,0(s8)
80408a80:	0000cb97          	auipc	s7,0xc
80408a84:	03cbab83          	lw	s7,60(s7) # 80414abc <nbase>
80408a88:	00092c97          	auipc	s9,0x92
80408a8c:	db0c8c93          	addi	s9,s9,-592 # 8049a838 <npage>
80408a90:	40d506b3          	sub	a3,a0,a3
80408a94:	4056d693          	srai	a3,a3,0x5
80408a98:	017686b3          	add	a3,a3,s7
80408a9c:	000ca703          	lw	a4,0(s9)
80408aa0:	00c69793          	slli	a5,a3,0xc
80408aa4:	00c7d793          	srli	a5,a5,0xc
80408aa8:	00c69693          	slli	a3,a3,0xc
80408aac:	3ce7fc63          	bgeu	a5,a4,80408e84 <do_fork+0x498>
80408ab0:	000b2703          	lw	a4,0(s6)
80408ab4:	00092d17          	auipc	s10,0x92
80408ab8:	d94d0d13          	addi	s10,s10,-620 # 8049a848 <va_pa_offset>
80408abc:	000d2783          	lw	a5,0(s10)
80408ac0:	0dc72d83          	lw	s11,220(a4) # 800000dc <end+0xffb65848>
80408ac4:	00d786b3          	add	a3,a5,a3
80408ac8:	00d42623          	sw	a3,12(s0)
80408acc:	3e0d8463          	beqz	s11,80408eb4 <do_fork+0x4c8>
80408ad0:	80098993          	addi	s3,s3,-2048 # 800 <_binary_bin_swap_img_size-0x7800>
80408ad4:	013a79b3          	and	s3,s4,s3
80408ad8:	28098063          	beqz	s3,80408d58 <do_fork+0x36c>
80408adc:	008da783          	lw	a5,8(s11)
80408ae0:	01872983          	lw	s3,24(a4)
80408ae4:	00178793          	addi	a5,a5,1
80408ae8:	00fda423          	sw	a5,8(s11)
80408aec:	0db42e23          	sw	s11,220(s0)
80408af0:	02098a63          	beqz	s3,80408b24 <do_fork+0x138>
80408af4:	100a7a13          	andi	s4,s4,256
80408af8:	280a0263          	beqz	s4,80408d7c <do_fork+0x390>
80408afc:	0189a783          	lw	a5,24(s3)
80408b00:	00c9a683          	lw	a3,12(s3)
80408b04:	80400737          	lui	a4,0x80400
80408b08:	00178793          	addi	a5,a5,1
80408b0c:	00f9ac23          	sw	a5,24(s3)
80408b10:	01342c23          	sw	s3,24(s0)
80408b14:	40e6ea63          	bltu	a3,a4,80408f28 <do_fork+0x53c>
80408b18:	000d2783          	lw	a5,0(s10)
80408b1c:	40f686b3          	sub	a3,a3,a5
80408b20:	04d42c23          	sw	a3,88(s0)
80408b24:	00c42703          	lw	a4,12(s0)
80408b28:	000027b7          	lui	a5,0x2
80408b2c:	f7078793          	addi	a5,a5,-144 # 1f70 <_binary_bin_swap_img_size-0x6090>
80408b30:	00f70733          	add	a4,a4,a5
80408b34:	00048613          	mv	a2,s1
80408b38:	04e42a23          	sw	a4,84(s0)
80408b3c:	00070793          	mv	a5,a4
80408b40:	09048893          	addi	a7,s1,144
80408b44:	00062803          	lw	a6,0(a2)
80408b48:	00462503          	lw	a0,4(a2)
80408b4c:	00862583          	lw	a1,8(a2)
80408b50:	00c62683          	lw	a3,12(a2)
80408b54:	0107a023          	sw	a6,0(a5)
80408b58:	00a7a223          	sw	a0,4(a5)
80408b5c:	00b7a423          	sw	a1,8(a5)
80408b60:	00d7a623          	sw	a3,12(a5)
80408b64:	01060613          	addi	a2,a2,16
80408b68:	01078793          	addi	a5,a5,16
80408b6c:	fd161ce3          	bne	a2,a7,80408b44 <do_fork+0x158>
80408b70:	02072423          	sw	zero,40(a4) # 80400028 <end+0xfff65794>
80408b74:	1a0a8863          	beqz	s5,80408d24 <do_fork+0x338>
80408b78:	01572423          	sw	s5,8(a4)
80408b7c:	00000797          	auipc	a5,0x0
80408b80:	b8478793          	addi	a5,a5,-1148 # 80408700 <forkret>
80408b84:	00f42e23          	sw	a5,28(s0)
80408b88:	02e42023          	sw	a4,32(s0)
80408b8c:	100027f3          	csrr	a5,sstatus
80408b90:	0027f793          	andi	a5,a5,2
80408b94:	00000993          	li	s3,0
80408b98:	1a079a63          	bnez	a5,80408d4c <do_fork+0x360>
80408b9c:	0008e817          	auipc	a6,0x8e
80408ba0:	4a880813          	addi	a6,a6,1192 # 80497044 <last_pid.1>
80408ba4:	00082503          	lw	a0,0(a6)
80408ba8:	000027b7          	lui	a5,0x2
80408bac:	00150513          	addi	a0,a0,1
80408bb0:	00a82023          	sw	a0,0(a6)
80408bb4:	0cf55e63          	bge	a0,a5,80408c90 <do_fork+0x2a4>
80408bb8:	0008e317          	auipc	t1,0x8e
80408bbc:	49030313          	addi	t1,t1,1168 # 80497048 <next_safe.0>
80408bc0:	00032783          	lw	a5,0(t1)
80408bc4:	00092497          	auipc	s1,0x92
80408bc8:	c9848493          	addi	s1,s1,-872 # 8049a85c <proc_list>
80408bcc:	0cf55c63          	bge	a0,a5,80408ca4 <do_fork+0x2b8>
80408bd0:	00a00593          	li	a1,10
80408bd4:	00a42223          	sw	a0,4(s0)
80408bd8:	531070ef          	jal	ra,80410908 <hash32>
80408bdc:	0008f797          	auipc	a5,0x8f
80408be0:	be878793          	addi	a5,a5,-1048 # 804977c4 <hash_list>
80408be4:	00351513          	slli	a0,a0,0x3
80408be8:	00f50533          	add	a0,a0,a5
80408bec:	00452583          	lw	a1,4(a0)
80408bf0:	01442683          	lw	a3,20(s0)
80408bf4:	09c40793          	addi	a5,s0,156
80408bf8:	00f5a023          	sw	a5,0(a1)
80408bfc:	0044a603          	lw	a2,4(s1)
80408c00:	00f52223          	sw	a5,4(a0)
80408c04:	0ac6a703          	lw	a4,172(a3)
80408c08:	09440793          	addi	a5,s0,148
80408c0c:	0ab42023          	sw	a1,160(s0)
80408c10:	08a42e23          	sw	a0,156(s0)
80408c14:	00f62023          	sw	a5,0(a2)
80408c18:	00f4a223          	sw	a5,4(s1)
80408c1c:	08c42c23          	sw	a2,152(s0)
80408c20:	08942a23          	sw	s1,148(s0)
80408c24:	0a042823          	sw	zero,176(s0)
80408c28:	0ae42a23          	sw	a4,180(s0)
80408c2c:	00070463          	beqz	a4,80408c34 <do_fork+0x248>
80408c30:	0a872823          	sw	s0,176(a4)
80408c34:	00092783          	lw	a5,0(s2)
80408c38:	0a86a623          	sw	s0,172(a3)
80408c3c:	00178793          	addi	a5,a5,1
80408c40:	00f92023          	sw	a5,0(s2)
80408c44:	16099a63          	bnez	s3,80408db8 <do_fork+0x3cc>
80408c48:	00040513          	mv	a0,s0
80408c4c:	7c4010ef          	jal	ra,8040a410 <wakeup_proc>
80408c50:	00442503          	lw	a0,4(s0)
80408c54:	03c12083          	lw	ra,60(sp)
80408c58:	03812403          	lw	s0,56(sp)
80408c5c:	03412483          	lw	s1,52(sp)
80408c60:	03012903          	lw	s2,48(sp)
80408c64:	02c12983          	lw	s3,44(sp)
80408c68:	02812a03          	lw	s4,40(sp)
80408c6c:	02412a83          	lw	s5,36(sp)
80408c70:	02012b03          	lw	s6,32(sp)
80408c74:	01c12b83          	lw	s7,28(sp)
80408c78:	01812c03          	lw	s8,24(sp)
80408c7c:	01412c83          	lw	s9,20(sp)
80408c80:	01012d03          	lw	s10,16(sp)
80408c84:	00c12d83          	lw	s11,12(sp)
80408c88:	04010113          	addi	sp,sp,64
80408c8c:	00008067          	ret
80408c90:	00100793          	li	a5,1
80408c94:	00f82023          	sw	a5,0(a6)
80408c98:	00100513          	li	a0,1
80408c9c:	0008e317          	auipc	t1,0x8e
80408ca0:	3ac30313          	addi	t1,t1,940 # 80497048 <next_safe.0>
80408ca4:	00092497          	auipc	s1,0x92
80408ca8:	bb848493          	addi	s1,s1,-1096 # 8049a85c <proc_list>
80408cac:	0044ae03          	lw	t3,4(s1)
80408cb0:	000027b7          	lui	a5,0x2
80408cb4:	00f32023          	sw	a5,0(t1)
80408cb8:	00050693          	mv	a3,a0
80408cbc:	00000593          	li	a1,0
80408cc0:	00002eb7          	lui	t4,0x2
80408cc4:	1a9e0063          	beq	t3,s1,80408e64 <do_fork+0x478>
80408cc8:	00058893          	mv	a7,a1
80408ccc:	000e0793          	mv	a5,t3
80408cd0:	00002637          	lui	a2,0x2
80408cd4:	01c0006f          	j	80408cf0 <do_fork+0x304>
80408cd8:	00e6d863          	bge	a3,a4,80408ce8 <do_fork+0x2fc>
80408cdc:	00c75663          	bge	a4,a2,80408ce8 <do_fork+0x2fc>
80408ce0:	00070613          	mv	a2,a4
80408ce4:	00100893          	li	a7,1
80408ce8:	0047a783          	lw	a5,4(a5) # 2004 <_binary_bin_swap_img_size-0x5ffc>
80408cec:	02978063          	beq	a5,s1,80408d0c <do_fork+0x320>
80408cf0:	f707a703          	lw	a4,-144(a5)
80408cf4:	fed712e3          	bne	a4,a3,80408cd8 <do_fork+0x2ec>
80408cf8:	00168693          	addi	a3,a3,1
80408cfc:	10c6d463          	bge	a3,a2,80408e04 <do_fork+0x418>
80408d00:	0047a783          	lw	a5,4(a5)
80408d04:	00100593          	li	a1,1
80408d08:	fe9794e3          	bne	a5,s1,80408cf0 <do_fork+0x304>
80408d0c:	00058663          	beqz	a1,80408d18 <do_fork+0x32c>
80408d10:	00d82023          	sw	a3,0(a6)
80408d14:	00068513          	mv	a0,a3
80408d18:	ea088ce3          	beqz	a7,80408bd0 <do_fork+0x1e4>
80408d1c:	00c32023          	sw	a2,0(t1)
80408d20:	eb1ff06f          	j	80408bd0 <do_fork+0x1e4>
80408d24:	00070a93          	mv	s5,a4
80408d28:	01572423          	sw	s5,8(a4)
80408d2c:	00000797          	auipc	a5,0x0
80408d30:	9d478793          	addi	a5,a5,-1580 # 80408700 <forkret>
80408d34:	00f42e23          	sw	a5,28(s0)
80408d38:	02e42023          	sw	a4,32(s0)
80408d3c:	100027f3          	csrr	a5,sstatus
80408d40:	0027f793          	andi	a5,a5,2
80408d44:	00000993          	li	s3,0
80408d48:	e4078ae3          	beqz	a5,80408b9c <do_fork+0x1b0>
80408d4c:	82cf80ef          	jal	ra,80400d78 <intr_disable>
80408d50:	00100993          	li	s3,1
80408d54:	e49ff06f          	j	80408b9c <do_fork+0x1b0>
80408d58:	db4ff0ef          	jal	ra,8040830c <files_create>
80408d5c:	00050993          	mv	s3,a0
80408d60:	0a050e63          	beqz	a0,80408e1c <do_fork+0x430>
80408d64:	000d8593          	mv	a1,s11
80408d68:	f58ff0ef          	jal	ra,804084c0 <dup_files>
80408d6c:	0a051463          	bnez	a0,80408e14 <do_fork+0x428>
80408d70:	000b2703          	lw	a4,0(s6)
80408d74:	00098d93          	mv	s11,s3
80408d78:	d65ff06f          	j	80408adc <do_fork+0xf0>
80408d7c:	a2df80ef          	jal	ra,804017a8 <mm_create>
80408d80:	00050a13          	mv	s4,a0
80408d84:	00050a63          	beqz	a0,80408d98 <do_fork+0x3ac>
80408d88:	ac5ff0ef          	jal	ra,8040884c <setup_pgdir>
80408d8c:	02050a63          	beqz	a0,80408dc0 <do_fork+0x3d4>
80408d90:	000a0513          	mv	a0,s4
80408d94:	c21f80ef          	jal	ra,804019b4 <mm_destroy>
80408d98:	0dc42503          	lw	a0,220(s0)
80408d9c:	08050063          	beqz	a0,80408e1c <do_fork+0x430>
80408da0:	00852783          	lw	a5,8(a0)
80408da4:	fff78793          	addi	a5,a5,-1
80408da8:	00f52423          	sw	a5,8(a0)
80408dac:	06079863          	bnez	a5,80408e1c <do_fork+0x430>
80408db0:	db0ff0ef          	jal	ra,80408360 <files_destroy>
80408db4:	0680006f          	j	80408e1c <do_fork+0x430>
80408db8:	fb9f70ef          	jal	ra,80400d70 <intr_enable>
80408dbc:	e8dff06f          	j	80408c48 <do_fork+0x25c>
80408dc0:	01c98d93          	addi	s11,s3,28
80408dc4:	000d8513          	mv	a0,s11
80408dc8:	c89fd0ef          	jal	ra,80406a50 <down>
80408dcc:	000b2783          	lw	a5,0(s6)
80408dd0:	00078663          	beqz	a5,80408ddc <do_fork+0x3f0>
80408dd4:	0047a783          	lw	a5,4(a5)
80408dd8:	02f9a423          	sw	a5,40(s3)
80408ddc:	00098593          	mv	a1,s3
80408de0:	000a0513          	mv	a0,s4
80408de4:	d3df80ef          	jal	ra,80401b20 <dup_mmap>
80408de8:	00050b13          	mv	s6,a0
80408dec:	000d8513          	mv	a0,s11
80408df0:	c5dfd0ef          	jal	ra,80406a4c <up>
80408df4:	0209a423          	sw	zero,40(s3)
80408df8:	0c0b1e63          	bnez	s6,80408ed4 <do_fork+0x4e8>
80408dfc:	000a0993          	mv	s3,s4
80408e00:	cfdff06f          	j	80408afc <do_fork+0x110>
80408e04:	01d6c463          	blt	a3,t4,80408e0c <do_fork+0x420>
80408e08:	00100693          	li	a3,1
80408e0c:	00100593          	li	a1,1
80408e10:	eb5ff06f          	j	80408cc4 <do_fork+0x2d8>
80408e14:	00098513          	mv	a0,s3
80408e18:	d48ff0ef          	jal	ra,80408360 <files_destroy>
80408e1c:	00c42683          	lw	a3,12(s0)
80408e20:	804007b7          	lui	a5,0x80400
80408e24:	06f6ec63          	bltu	a3,a5,80408e9c <do_fork+0x4b0>
80408e28:	000d2783          	lw	a5,0(s10)
80408e2c:	000ca703          	lw	a4,0(s9)
80408e30:	40f687b3          	sub	a5,a3,a5
80408e34:	00c7d793          	srli	a5,a5,0xc
80408e38:	0ae7fc63          	bgeu	a5,a4,80408ef0 <do_fork+0x504>
80408e3c:	000c2503          	lw	a0,0(s8)
80408e40:	417787b3          	sub	a5,a5,s7
80408e44:	00579793          	slli	a5,a5,0x5
80408e48:	00200593          	li	a1,2
80408e4c:	00f50533          	add	a0,a0,a5
80408e50:	a61fb0ef          	jal	ra,804048b0 <free_pages>
80408e54:	00040513          	mv	a0,s0
80408e58:	8dcfa0ef          	jal	ra,80402f34 <kfree>
80408e5c:	ffc00513          	li	a0,-4
80408e60:	df5ff06f          	j	80408c54 <do_fork+0x268>
80408e64:	00058c63          	beqz	a1,80408e7c <do_fork+0x490>
80408e68:	00d82023          	sw	a3,0(a6)
80408e6c:	00068513          	mv	a0,a3
80408e70:	d61ff06f          	j	80408bd0 <do_fork+0x1e4>
80408e74:	ffb00513          	li	a0,-5
80408e78:	dddff06f          	j	80408c54 <do_fork+0x268>
80408e7c:	00082503          	lw	a0,0(a6)
80408e80:	d51ff06f          	j	80408bd0 <do_fork+0x1e4>
80408e84:	00009617          	auipc	a2,0x9
80408e88:	c2460613          	addi	a2,a2,-988 # 80411aa8 <commands+0xe24>
80408e8c:	06e00593          	li	a1,110
80408e90:	00009517          	auipc	a0,0x9
80408e94:	8ec50513          	addi	a0,a0,-1812 # 8041177c <commands+0xaf8>
80408e98:	c34f70ef          	jal	ra,804002cc <__panic>
80408e9c:	00009617          	auipc	a2,0x9
80408ea0:	c9460613          	addi	a2,a2,-876 # 80411b30 <commands+0xeac>
80408ea4:	07000593          	li	a1,112
80408ea8:	00009517          	auipc	a0,0x9
80408eac:	8d450513          	addi	a0,a0,-1836 # 8041177c <commands+0xaf8>
80408eb0:	c1cf70ef          	jal	ra,804002cc <__panic>
80408eb4:	0000a697          	auipc	a3,0xa
80408eb8:	fa868693          	addi	a3,a3,-88 # 80412e5c <CSWTCH.81+0x12c>
80408ebc:	00008617          	auipc	a2,0x8
80408ec0:	e0460613          	addi	a2,a2,-508 # 80410cc0 <commands+0x3c>
80408ec4:	19000593          	li	a1,400
80408ec8:	0000a517          	auipc	a0,0xa
80408ecc:	f6450513          	addi	a0,a0,-156 # 80412e2c <CSWTCH.81+0xfc>
80408ed0:	bfcf70ef          	jal	ra,804002cc <__panic>
80408ed4:	000a0513          	mv	a0,s4
80408ed8:	d25f80ef          	jal	ra,80401bfc <exit_mmap>
80408edc:	00ca2503          	lw	a0,12(s4)
80408ee0:	8e1ff0ef          	jal	ra,804087c0 <put_pgdir.isra.0>
80408ee4:	000a0513          	mv	a0,s4
80408ee8:	acdf80ef          	jal	ra,804019b4 <mm_destroy>
80408eec:	eadff06f          	j	80408d98 <do_fork+0x3ac>
80408ef0:	00009617          	auipc	a2,0x9
80408ef4:	86c60613          	addi	a2,a2,-1940 # 8041175c <commands+0xad8>
80408ef8:	06900593          	li	a1,105
80408efc:	00009517          	auipc	a0,0x9
80408f00:	88050513          	addi	a0,a0,-1920 # 8041177c <commands+0xaf8>
80408f04:	bc8f70ef          	jal	ra,804002cc <__panic>
80408f08:	0000a697          	auipc	a3,0xa
80408f0c:	f3868693          	addi	a3,a3,-200 # 80412e40 <CSWTCH.81+0x110>
80408f10:	00008617          	auipc	a2,0x8
80408f14:	db060613          	addi	a2,a2,-592 # 80410cc0 <commands+0x3c>
80408f18:	1ea00593          	li	a1,490
80408f1c:	0000a517          	auipc	a0,0xa
80408f20:	f1050513          	addi	a0,a0,-240 # 80412e2c <CSWTCH.81+0xfc>
80408f24:	ba8f70ef          	jal	ra,804002cc <__panic>
80408f28:	00009617          	auipc	a2,0x9
80408f2c:	c0860613          	addi	a2,a2,-1016 # 80411b30 <commands+0xeac>
80408f30:	17100593          	li	a1,369
80408f34:	0000a517          	auipc	a0,0xa
80408f38:	ef850513          	addi	a0,a0,-264 # 80412e2c <CSWTCH.81+0xfc>
80408f3c:	b90f70ef          	jal	ra,804002cc <__panic>

80408f40 <do_exit>:
80408f40:	fe010113          	addi	sp,sp,-32
80408f44:	00812c23          	sw	s0,24(sp)
80408f48:	00092417          	auipc	s0,0x92
80408f4c:	90440413          	addi	s0,s0,-1788 # 8049a84c <current>
80408f50:	00042783          	lw	a5,0(s0)
80408f54:	00112e23          	sw	ra,28(sp)
80408f58:	00912a23          	sw	s1,20(sp)
80408f5c:	01212823          	sw	s2,16(sp)
80408f60:	01312623          	sw	s3,12(sp)
80408f64:	01412423          	sw	s4,8(sp)
80408f68:	00092717          	auipc	a4,0x92
80408f6c:	8e872703          	lw	a4,-1816(a4) # 8049a850 <idleproc>
80408f70:	14e78463          	beq	a5,a4,804090b8 <do_exit+0x178>
80408f74:	00092497          	auipc	s1,0x92
80408f78:	8e048493          	addi	s1,s1,-1824 # 8049a854 <initproc>
80408f7c:	0004a703          	lw	a4,0(s1)
80408f80:	16e78663          	beq	a5,a4,804090ec <do_exit+0x1ac>
80408f84:	0187a983          	lw	s3,24(a5) # 80400018 <end+0xfff65784>
80408f88:	00050913          	mv	s2,a0
80408f8c:	02098c63          	beqz	s3,80408fc4 <do_exit+0x84>
80408f90:	00092797          	auipc	a5,0x92
80408f94:	8a07a783          	lw	a5,-1888(a5) # 8049a830 <boot_cr3>
80408f98:	80000737          	lui	a4,0x80000
80408f9c:	00c7d793          	srli	a5,a5,0xc
80408fa0:	00e7e7b3          	or	a5,a5,a4
80408fa4:	18079073          	csrw	satp,a5
80408fa8:	12000073          	sfence.vma
80408fac:	0189a783          	lw	a5,24(s3)
80408fb0:	fff78793          	addi	a5,a5,-1
80408fb4:	00f9ac23          	sw	a5,24(s3)
80408fb8:	10078c63          	beqz	a5,804090d0 <do_exit+0x190>
80408fbc:	00042783          	lw	a5,0(s0)
80408fc0:	0007ac23          	sw	zero,24(a5)
80408fc4:	00042783          	lw	a5,0(s0)
80408fc8:	0dc7a503          	lw	a0,220(a5)
80408fcc:	00050a63          	beqz	a0,80408fe0 <do_exit+0xa0>
80408fd0:	00852783          	lw	a5,8(a0)
80408fd4:	fff78793          	addi	a5,a5,-1
80408fd8:	00f52423          	sw	a5,8(a0)
80408fdc:	0c078a63          	beqz	a5,804090b0 <do_exit+0x170>
80408fe0:	00042783          	lw	a5,0(s0)
80408fe4:	00300713          	li	a4,3
80408fe8:	00e7a023          	sw	a4,0(a5)
80408fec:	0b27a223          	sw	s2,164(a5)
80408ff0:	100027f3          	csrr	a5,sstatus
80408ff4:	0027f793          	andi	a5,a5,2
80408ff8:	00000a13          	li	s4,0
80408ffc:	10079463          	bnez	a5,80409104 <do_exit+0x1c4>
80409000:	00042703          	lw	a4,0(s0)
80409004:	800007b7          	lui	a5,0x80000
80409008:	00178793          	addi	a5,a5,1 # 80000001 <end+0xffb6576d>
8040900c:	01472503          	lw	a0,20(a4) # 80000014 <end+0xffb65780>
80409010:	0a852703          	lw	a4,168(a0)
80409014:	0ef70e63          	beq	a4,a5,80409110 <do_exit+0x1d0>
80409018:	00042703          	lw	a4,0(s0)
8040901c:	0ac72783          	lw	a5,172(a4)
80409020:	06078063          	beqz	a5,80409080 <do_exit+0x140>
80409024:	800009b7          	lui	s3,0x80000
80409028:	00300913          	li	s2,3
8040902c:	00198993          	addi	s3,s3,1 # 80000001 <end+0xffb6576d>
80409030:	0100006f          	j	80409040 <do_exit+0x100>
80409034:	00042703          	lw	a4,0(s0)
80409038:	0ac72783          	lw	a5,172(a4)
8040903c:	04078263          	beqz	a5,80409080 <do_exit+0x140>
80409040:	0b47a683          	lw	a3,180(a5)
80409044:	0004a503          	lw	a0,0(s1)
80409048:	0ad72623          	sw	a3,172(a4)
8040904c:	0ac52703          	lw	a4,172(a0)
80409050:	0a07a823          	sw	zero,176(a5)
80409054:	0ae7aa23          	sw	a4,180(a5)
80409058:	00070463          	beqz	a4,80409060 <do_exit+0x120>
8040905c:	0af72823          	sw	a5,176(a4)
80409060:	0007a703          	lw	a4,0(a5)
80409064:	00a7aa23          	sw	a0,20(a5)
80409068:	0af52623          	sw	a5,172(a0)
8040906c:	fd2714e3          	bne	a4,s2,80409034 <do_exit+0xf4>
80409070:	0a852783          	lw	a5,168(a0)
80409074:	fd3790e3          	bne	a5,s3,80409034 <do_exit+0xf4>
80409078:	398010ef          	jal	ra,8040a410 <wakeup_proc>
8040907c:	fb9ff06f          	j	80409034 <do_exit+0xf4>
80409080:	020a1463          	bnez	s4,804090a8 <do_exit+0x168>
80409084:	478010ef          	jal	ra,8040a4fc <schedule>
80409088:	00042783          	lw	a5,0(s0)
8040908c:	0000a617          	auipc	a2,0xa
80409090:	e0460613          	addi	a2,a2,-508 # 80412e90 <CSWTCH.81+0x160>
80409094:	24600593          	li	a1,582
80409098:	0047a683          	lw	a3,4(a5)
8040909c:	0000a517          	auipc	a0,0xa
804090a0:	d9050513          	addi	a0,a0,-624 # 80412e2c <CSWTCH.81+0xfc>
804090a4:	a28f70ef          	jal	ra,804002cc <__panic>
804090a8:	cc9f70ef          	jal	ra,80400d70 <intr_enable>
804090ac:	fd9ff06f          	j	80409084 <do_exit+0x144>
804090b0:	ab0ff0ef          	jal	ra,80408360 <files_destroy>
804090b4:	f2dff06f          	j	80408fe0 <do_exit+0xa0>
804090b8:	0000a617          	auipc	a2,0xa
804090bc:	db860613          	addi	a2,a2,-584 # 80412e70 <CSWTCH.81+0x140>
804090c0:	21600593          	li	a1,534
804090c4:	0000a517          	auipc	a0,0xa
804090c8:	d6850513          	addi	a0,a0,-664 # 80412e2c <CSWTCH.81+0xfc>
804090cc:	a00f70ef          	jal	ra,804002cc <__panic>
804090d0:	00098513          	mv	a0,s3
804090d4:	b29f80ef          	jal	ra,80401bfc <exit_mmap>
804090d8:	00c9a503          	lw	a0,12(s3)
804090dc:	ee4ff0ef          	jal	ra,804087c0 <put_pgdir.isra.0>
804090e0:	00098513          	mv	a0,s3
804090e4:	8d1f80ef          	jal	ra,804019b4 <mm_destroy>
804090e8:	ed5ff06f          	j	80408fbc <do_exit+0x7c>
804090ec:	0000a617          	auipc	a2,0xa
804090f0:	d9460613          	addi	a2,a2,-620 # 80412e80 <CSWTCH.81+0x150>
804090f4:	21900593          	li	a1,537
804090f8:	0000a517          	auipc	a0,0xa
804090fc:	d3450513          	addi	a0,a0,-716 # 80412e2c <CSWTCH.81+0xfc>
80409100:	9ccf70ef          	jal	ra,804002cc <__panic>
80409104:	c75f70ef          	jal	ra,80400d78 <intr_disable>
80409108:	00100a13          	li	s4,1
8040910c:	ef5ff06f          	j	80409000 <do_exit+0xc0>
80409110:	300010ef          	jal	ra,8040a410 <wakeup_proc>
80409114:	f05ff06f          	j	80409018 <do_exit+0xd8>

80409118 <do_wait.part.0>:
80409118:	fd010113          	addi	sp,sp,-48
8040911c:	03212023          	sw	s2,32(sp)
80409120:	01312e23          	sw	s3,28(sp)
80409124:	80000937          	lui	s2,0x80000
80409128:	000029b7          	lui	s3,0x2
8040912c:	02912223          	sw	s1,36(sp)
80409130:	01412c23          	sw	s4,24(sp)
80409134:	01512a23          	sw	s5,20(sp)
80409138:	01612823          	sw	s6,16(sp)
8040913c:	01712623          	sw	s7,12(sp)
80409140:	01812423          	sw	s8,8(sp)
80409144:	02112623          	sw	ra,44(sp)
80409148:	02812423          	sw	s0,40(sp)
8040914c:	00050493          	mv	s1,a0
80409150:	00058a13          	mv	s4,a1
80409154:	00091c17          	auipc	s8,0x91
80409158:	6f8c0c13          	addi	s8,s8,1784 # 8049a84c <current>
8040915c:	00300b93          	li	s7,3
80409160:	fff50a93          	addi	s5,a0,-1
80409164:	ffe98993          	addi	s3,s3,-2 # 1ffe <_binary_bin_swap_img_size-0x6002>
80409168:	0008eb17          	auipc	s6,0x8e
8040916c:	65cb0b13          	addi	s6,s6,1628 # 804977c4 <hash_list>
80409170:	00190913          	addi	s2,s2,1 # 80000001 <end+0xffb6576d>
80409174:	0a048263          	beqz	s1,80409218 <do_wait.part.0+0x100>
80409178:	0359e863          	bltu	s3,s5,804091a8 <do_wait.part.0+0x90>
8040917c:	00a00593          	li	a1,10
80409180:	00048513          	mv	a0,s1
80409184:	784070ef          	jal	ra,80410908 <hash32>
80409188:	00351513          	slli	a0,a0,0x3
8040918c:	01650533          	add	a0,a0,s6
80409190:	00050413          	mv	s0,a0
80409194:	00c0006f          	j	804091a0 <do_wait.part.0+0x88>
80409198:	f6842783          	lw	a5,-152(s0)
8040919c:	04f48063          	beq	s1,a5,804091dc <do_wait.part.0+0xc4>
804091a0:	00442403          	lw	s0,4(s0)
804091a4:	fe851ae3          	bne	a0,s0,80409198 <do_wait.part.0+0x80>
804091a8:	ffe00513          	li	a0,-2
804091ac:	02c12083          	lw	ra,44(sp)
804091b0:	02812403          	lw	s0,40(sp)
804091b4:	02412483          	lw	s1,36(sp)
804091b8:	02012903          	lw	s2,32(sp)
804091bc:	01c12983          	lw	s3,28(sp)
804091c0:	01812a03          	lw	s4,24(sp)
804091c4:	01412a83          	lw	s5,20(sp)
804091c8:	01012b03          	lw	s6,16(sp)
804091cc:	00c12b83          	lw	s7,12(sp)
804091d0:	00812c03          	lw	s8,8(sp)
804091d4:	03010113          	addi	sp,sp,48
804091d8:	00008067          	ret
804091dc:	000c2703          	lw	a4,0(s8)
804091e0:	f7842783          	lw	a5,-136(s0)
804091e4:	fce792e3          	bne	a5,a4,804091a8 <do_wait.part.0+0x90>
804091e8:	f6442783          	lw	a5,-156(s0)
804091ec:	15778863          	beq	a5,s7,8040933c <do_wait.part.0+0x224>
804091f0:	00100793          	li	a5,1
804091f4:	00f72023          	sw	a5,0(a4)
804091f8:	0b272423          	sw	s2,168(a4)
804091fc:	300010ef          	jal	ra,8040a4fc <schedule>
80409200:	000c2783          	lw	a5,0(s8)
80409204:	05c7a783          	lw	a5,92(a5)
80409208:	0017f793          	andi	a5,a5,1
8040920c:	f60784e3          	beqz	a5,80409174 <do_wait.part.0+0x5c>
80409210:	ff700513          	li	a0,-9
80409214:	d2dff0ef          	jal	ra,80408f40 <do_exit>
80409218:	000c2703          	lw	a4,0(s8)
8040921c:	0ac72403          	lw	s0,172(a4)
80409220:	00041863          	bnez	s0,80409230 <do_wait.part.0+0x118>
80409224:	f85ff06f          	j	804091a8 <do_wait.part.0+0x90>
80409228:	0b442403          	lw	s0,180(s0)
8040922c:	fc0402e3          	beqz	s0,804091f0 <do_wait.part.0+0xd8>
80409230:	00042783          	lw	a5,0(s0)
80409234:	ff779ae3          	bne	a5,s7,80409228 <do_wait.part.0+0x110>
80409238:	00091797          	auipc	a5,0x91
8040923c:	6187a783          	lw	a5,1560(a5) # 8049a850 <idleproc>
80409240:	10878e63          	beq	a5,s0,8040935c <do_wait.part.0+0x244>
80409244:	00091797          	auipc	a5,0x91
80409248:	6107a783          	lw	a5,1552(a5) # 8049a854 <initproc>
8040924c:	10f40863          	beq	s0,a5,8040935c <do_wait.part.0+0x244>
80409250:	000a0663          	beqz	s4,8040925c <do_wait.part.0+0x144>
80409254:	0a442783          	lw	a5,164(s0)
80409258:	00fa2023          	sw	a5,0(s4)
8040925c:	100027f3          	csrr	a5,sstatus
80409260:	0027f793          	andi	a5,a5,2
80409264:	00000593          	li	a1,0
80409268:	0c079463          	bnez	a5,80409330 <do_wait.part.0+0x218>
8040926c:	09c42603          	lw	a2,156(s0)
80409270:	0a042683          	lw	a3,160(s0)
80409274:	0b442703          	lw	a4,180(s0)
80409278:	0b042783          	lw	a5,176(s0)
8040927c:	00d62223          	sw	a3,4(a2)
80409280:	00c6a023          	sw	a2,0(a3)
80409284:	09442603          	lw	a2,148(s0)
80409288:	09842683          	lw	a3,152(s0)
8040928c:	00d62223          	sw	a3,4(a2)
80409290:	00c6a023          	sw	a2,0(a3)
80409294:	00070663          	beqz	a4,804092a0 <do_wait.part.0+0x188>
80409298:	0af72823          	sw	a5,176(a4)
8040929c:	0b042783          	lw	a5,176(s0)
804092a0:	08078263          	beqz	a5,80409324 <do_wait.part.0+0x20c>
804092a4:	0ae7aa23          	sw	a4,180(a5)
804092a8:	00091717          	auipc	a4,0x91
804092ac:	5b070713          	addi	a4,a4,1456 # 8049a858 <nr_process>
804092b0:	00072783          	lw	a5,0(a4)
804092b4:	fff78793          	addi	a5,a5,-1
804092b8:	00f72023          	sw	a5,0(a4)
804092bc:	06059063          	bnez	a1,8040931c <do_wait.part.0+0x204>
804092c0:	00c42683          	lw	a3,12(s0)
804092c4:	804007b7          	lui	a5,0x80400
804092c8:	06f6ee63          	bltu	a3,a5,80409344 <do_wait.part.0+0x22c>
804092cc:	00091797          	auipc	a5,0x91
804092d0:	57c7a783          	lw	a5,1404(a5) # 8049a848 <va_pa_offset>
804092d4:	40f686b3          	sub	a3,a3,a5
804092d8:	00c6d693          	srli	a3,a3,0xc
804092dc:	00091797          	auipc	a5,0x91
804092e0:	55c7a783          	lw	a5,1372(a5) # 8049a838 <npage>
804092e4:	08f6f863          	bgeu	a3,a5,80409374 <do_wait.part.0+0x25c>
804092e8:	0000b517          	auipc	a0,0xb
804092ec:	7d452503          	lw	a0,2004(a0) # 80414abc <nbase>
804092f0:	40a686b3          	sub	a3,a3,a0
804092f4:	00569693          	slli	a3,a3,0x5
804092f8:	00091517          	auipc	a0,0x91
804092fc:	54452503          	lw	a0,1348(a0) # 8049a83c <pages>
80409300:	00d50533          	add	a0,a0,a3
80409304:	00200593          	li	a1,2
80409308:	da8fb0ef          	jal	ra,804048b0 <free_pages>
8040930c:	00040513          	mv	a0,s0
80409310:	c25f90ef          	jal	ra,80402f34 <kfree>
80409314:	00000513          	li	a0,0
80409318:	e95ff06f          	j	804091ac <do_wait.part.0+0x94>
8040931c:	a55f70ef          	jal	ra,80400d70 <intr_enable>
80409320:	fa1ff06f          	j	804092c0 <do_wait.part.0+0x1a8>
80409324:	01442783          	lw	a5,20(s0)
80409328:	0ae7a623          	sw	a4,172(a5)
8040932c:	f7dff06f          	j	804092a8 <do_wait.part.0+0x190>
80409330:	a49f70ef          	jal	ra,80400d78 <intr_disable>
80409334:	00100593          	li	a1,1
80409338:	f35ff06f          	j	8040926c <do_wait.part.0+0x154>
8040933c:	f6440413          	addi	s0,s0,-156
80409340:	ef9ff06f          	j	80409238 <do_wait.part.0+0x120>
80409344:	00008617          	auipc	a2,0x8
80409348:	7ec60613          	addi	a2,a2,2028 # 80411b30 <commands+0xeac>
8040934c:	07000593          	li	a1,112
80409350:	00008517          	auipc	a0,0x8
80409354:	42c50513          	addi	a0,a0,1068 # 8041177c <commands+0xaf8>
80409358:	f75f60ef          	jal	ra,804002cc <__panic>
8040935c:	0000a617          	auipc	a2,0xa
80409360:	b5460613          	addi	a2,a2,-1196 # 80412eb0 <CSWTCH.81+0x180>
80409364:	3a800593          	li	a1,936
80409368:	0000a517          	auipc	a0,0xa
8040936c:	ac450513          	addi	a0,a0,-1340 # 80412e2c <CSWTCH.81+0xfc>
80409370:	f5df60ef          	jal	ra,804002cc <__panic>
80409374:	00008617          	auipc	a2,0x8
80409378:	3e860613          	addi	a2,a2,1000 # 8041175c <commands+0xad8>
8040937c:	06900593          	li	a1,105
80409380:	00008517          	auipc	a0,0x8
80409384:	3fc50513          	addi	a0,a0,1020 # 8041177c <commands+0xaf8>
80409388:	f45f60ef          	jal	ra,804002cc <__panic>

8040938c <init_main>:
8040938c:	f6010113          	addi	sp,sp,-160
80409390:	0000a517          	auipc	a0,0xa
80409394:	b3c50513          	addi	a0,a0,-1220 # 80412ecc <CSWTCH.81+0x19c>
80409398:	08112e23          	sw	ra,156(sp)
8040939c:	16c030ef          	jal	ra,8040c508 <vfs_set_bootfs>
804093a0:	12051263          	bnez	a0,804094c4 <init_main+0x138>
804093a4:	d70fb0ef          	jal	ra,80404914 <nr_free_pages>
804093a8:	a69f90ef          	jal	ra,80402e10 <kallocated>
804093ac:	09000613          	li	a2,144
804093b0:	00000593          	li	a1,0
804093b4:	00010513          	mv	a0,sp
804093b8:	5bd060ef          	jal	ra,80410174 <memset>
804093bc:	fffff797          	auipc	a5,0xfffff
804093c0:	35478793          	addi	a5,a5,852 # 80408710 <user_main>
804093c4:	02f12023          	sw	a5,32(sp)
804093c8:	02012223          	sw	zero,36(sp)
804093cc:	100027f3          	csrr	a5,sstatus
804093d0:	edd7f793          	andi	a5,a5,-291
804093d4:	1207e793          	ori	a5,a5,288
804093d8:	08f12023          	sw	a5,128(sp)
804093dc:	00010613          	mv	a2,sp
804093e0:	fffff797          	auipc	a5,0xfffff
804093e4:	25478793          	addi	a5,a5,596 # 80408634 <kernel_thread_entry>
804093e8:	00000593          	li	a1,0
804093ec:	10000513          	li	a0,256
804093f0:	08f12223          	sw	a5,132(sp)
804093f4:	df8ff0ef          	jal	ra,804089ec <do_fork>
804093f8:	00a04663          	bgtz	a0,80409404 <init_main+0x78>
804093fc:	0b00006f          	j	804094ac <init_main+0x120>
80409400:	0fc010ef          	jal	ra,8040a4fc <schedule>
80409404:	00000593          	li	a1,0
80409408:	00000513          	li	a0,0
8040940c:	d0dff0ef          	jal	ra,80409118 <do_wait.part.0>
80409410:	fe0508e3          	beqz	a0,80409400 <init_main+0x74>
80409414:	ee5fe0ef          	jal	ra,804082f8 <fs_cleanup>
80409418:	0000a517          	auipc	a0,0xa
8040941c:	af450513          	addi	a0,a0,-1292 # 80412f0c <CSWTCH.81+0x1dc>
80409420:	d29f60ef          	jal	ra,80400148 <cprintf>
80409424:	00091797          	auipc	a5,0x91
80409428:	4307a783          	lw	a5,1072(a5) # 8049a854 <initproc>
8040942c:	0ac7a703          	lw	a4,172(a5)
80409430:	04071e63          	bnez	a4,8040948c <init_main+0x100>
80409434:	0b07a703          	lw	a4,176(a5)
80409438:	04071a63          	bnez	a4,8040948c <init_main+0x100>
8040943c:	0b47a703          	lw	a4,180(a5)
80409440:	04071663          	bnez	a4,8040948c <init_main+0x100>
80409444:	00091697          	auipc	a3,0x91
80409448:	4146a683          	lw	a3,1044(a3) # 8049a858 <nr_process>
8040944c:	00200713          	li	a4,2
80409450:	0ce69863          	bne	a3,a4,80409520 <init_main+0x194>
80409454:	00091717          	auipc	a4,0x91
80409458:	40870713          	addi	a4,a4,1032 # 8049a85c <proc_list>
8040945c:	00472683          	lw	a3,4(a4)
80409460:	09478793          	addi	a5,a5,148
80409464:	08d79e63          	bne	a5,a3,80409500 <init_main+0x174>
80409468:	00072703          	lw	a4,0(a4)
8040946c:	06e79a63          	bne	a5,a4,804094e0 <init_main+0x154>
80409470:	0000a517          	auipc	a0,0xa
80409474:	b7c50513          	addi	a0,a0,-1156 # 80412fec <CSWTCH.81+0x2bc>
80409478:	cd1f60ef          	jal	ra,80400148 <cprintf>
8040947c:	09c12083          	lw	ra,156(sp)
80409480:	00000513          	li	a0,0
80409484:	0a010113          	addi	sp,sp,160
80409488:	00008067          	ret
8040948c:	0000a697          	auipc	a3,0xa
80409490:	aa468693          	addi	a3,a3,-1372 # 80412f30 <CSWTCH.81+0x200>
80409494:	00008617          	auipc	a2,0x8
80409498:	82c60613          	addi	a2,a2,-2004 # 80410cc0 <commands+0x3c>
8040949c:	41b00593          	li	a1,1051
804094a0:	0000a517          	auipc	a0,0xa
804094a4:	98c50513          	addi	a0,a0,-1652 # 80412e2c <CSWTCH.81+0xfc>
804094a8:	e25f60ef          	jal	ra,804002cc <__panic>
804094ac:	0000a617          	auipc	a2,0xa
804094b0:	a4460613          	addi	a2,a2,-1468 # 80412ef0 <CSWTCH.81+0x1c0>
804094b4:	40f00593          	li	a1,1039
804094b8:	0000a517          	auipc	a0,0xa
804094bc:	97450513          	addi	a0,a0,-1676 # 80412e2c <CSWTCH.81+0xfc>
804094c0:	e0df60ef          	jal	ra,804002cc <__panic>
804094c4:	00050693          	mv	a3,a0
804094c8:	0000a617          	auipc	a2,0xa
804094cc:	a0c60613          	addi	a2,a2,-1524 # 80412ed4 <CSWTCH.81+0x1a4>
804094d0:	40700593          	li	a1,1031
804094d4:	0000a517          	auipc	a0,0xa
804094d8:	95850513          	addi	a0,a0,-1704 # 80412e2c <CSWTCH.81+0xfc>
804094dc:	df1f60ef          	jal	ra,804002cc <__panic>
804094e0:	0000a697          	auipc	a3,0xa
804094e4:	adc68693          	addi	a3,a3,-1316 # 80412fbc <CSWTCH.81+0x28c>
804094e8:	00007617          	auipc	a2,0x7
804094ec:	7d860613          	addi	a2,a2,2008 # 80410cc0 <commands+0x3c>
804094f0:	41e00593          	li	a1,1054
804094f4:	0000a517          	auipc	a0,0xa
804094f8:	93850513          	addi	a0,a0,-1736 # 80412e2c <CSWTCH.81+0xfc>
804094fc:	dd1f60ef          	jal	ra,804002cc <__panic>
80409500:	0000a697          	auipc	a3,0xa
80409504:	a8c68693          	addi	a3,a3,-1396 # 80412f8c <CSWTCH.81+0x25c>
80409508:	00007617          	auipc	a2,0x7
8040950c:	7b860613          	addi	a2,a2,1976 # 80410cc0 <commands+0x3c>
80409510:	41d00593          	li	a1,1053
80409514:	0000a517          	auipc	a0,0xa
80409518:	91850513          	addi	a0,a0,-1768 # 80412e2c <CSWTCH.81+0xfc>
8040951c:	db1f60ef          	jal	ra,804002cc <__panic>
80409520:	0000a697          	auipc	a3,0xa
80409524:	a5c68693          	addi	a3,a3,-1444 # 80412f7c <CSWTCH.81+0x24c>
80409528:	00007617          	auipc	a2,0x7
8040952c:	79860613          	addi	a2,a2,1944 # 80410cc0 <commands+0x3c>
80409530:	41c00593          	li	a1,1052
80409534:	0000a517          	auipc	a0,0xa
80409538:	8f850513          	addi	a0,a0,-1800 # 80412e2c <CSWTCH.81+0xfc>
8040953c:	d91f60ef          	jal	ra,804002cc <__panic>

80409540 <do_execve>:
80409540:	e9010113          	addi	sp,sp,-368
80409544:	15412c23          	sw	s4,344(sp)
80409548:	00091a17          	auipc	s4,0x91
8040954c:	304a0a13          	addi	s4,s4,772 # 8049a84c <current>
80409550:	000a2683          	lw	a3,0(s4)
80409554:	15912223          	sw	s9,324(sp)
80409558:	16112623          	sw	ra,364(sp)
8040955c:	16812423          	sw	s0,360(sp)
80409560:	16912223          	sw	s1,356(sp)
80409564:	17212023          	sw	s2,352(sp)
80409568:	15312e23          	sw	s3,348(sp)
8040956c:	15512a23          	sw	s5,340(sp)
80409570:	15612823          	sw	s6,336(sp)
80409574:	15712623          	sw	s7,332(sp)
80409578:	15812423          	sw	s8,328(sp)
8040957c:	15a12023          	sw	s10,320(sp)
80409580:	13b12e23          	sw	s11,316(sp)
80409584:	fff58713          	addi	a4,a1,-1
80409588:	01f00793          	li	a5,31
8040958c:	0186ac83          	lw	s9,24(a3)
80409590:	6ee7e863          	bltu	a5,a4,80409c80 <do_execve+0x740>
80409594:	00058913          	mv	s2,a1
80409598:	00050413          	mv	s0,a0
8040959c:	00060d13          	mv	s10,a2
804095a0:	00000593          	li	a1,0
804095a4:	03300613          	li	a2,51
804095a8:	04810513          	addi	a0,sp,72
804095ac:	3c9060ef          	jal	ra,80410174 <memset>
804095b0:	000c8e63          	beqz	s9,804095cc <do_execve+0x8c>
804095b4:	01cc8513          	addi	a0,s9,28
804095b8:	c98fd0ef          	jal	ra,80406a50 <down>
804095bc:	000a2783          	lw	a5,0(s4)
804095c0:	00078663          	beqz	a5,804095cc <do_execve+0x8c>
804095c4:	0047a783          	lw	a5,4(a5)
804095c8:	02fca423          	sw	a5,40(s9)
804095cc:	20040063          	beqz	s0,804097cc <do_execve+0x28c>
804095d0:	03300693          	li	a3,51
804095d4:	00040613          	mv	a2,s0
804095d8:	04810593          	addi	a1,sp,72
804095dc:	000c8513          	mv	a0,s9
804095e0:	f7df80ef          	jal	ra,8040255c <copy_string>
804095e4:	000504e3          	beqz	a0,80409dec <do_execve+0x8ac>
804095e8:	00291493          	slli	s1,s2,0x2
804095ec:	00000693          	li	a3,0
804095f0:	00048613          	mv	a2,s1
804095f4:	000d0593          	mv	a1,s10
804095f8:	000c8513          	mv	a0,s9
804095fc:	dcdf80ef          	jal	ra,804023c8 <user_mem_check>
80409600:	000d0b93          	mv	s7,s10
80409604:	7e050063          	beqz	a0,80409de4 <do_execve+0x8a4>
80409608:	0b010993          	addi	s3,sp,176
8040960c:	00098c13          	mv	s8,s3
80409610:	00000413          	li	s0,0
80409614:	00001537          	lui	a0,0x1
80409618:	801f90ef          	jal	ra,80402e18 <kmalloc>
8040961c:	00050a93          	mv	s5,a0
80409620:	12050063          	beqz	a0,80409740 <do_execve+0x200>
80409624:	000ba603          	lw	a2,0(s7)
80409628:	00050593          	mv	a1,a0
8040962c:	000016b7          	lui	a3,0x1
80409630:	000c8513          	mv	a0,s9
80409634:	f29f80ef          	jal	ra,8040255c <copy_string>
80409638:	18050263          	beqz	a0,804097bc <do_execve+0x27c>
8040963c:	015c2023          	sw	s5,0(s8)
80409640:	00140413          	addi	s0,s0,1
80409644:	004c0c13          	addi	s8,s8,4
80409648:	004b8b93          	addi	s7,s7,4
8040964c:	fc8914e3          	bne	s2,s0,80409614 <do_execve+0xd4>
80409650:	000d2a83          	lw	s5,0(s10)
80409654:	0a0c8463          	beqz	s9,804096fc <do_execve+0x1bc>
80409658:	01cc8513          	addi	a0,s9,28
8040965c:	bf0fd0ef          	jal	ra,80406a4c <up>
80409660:	000a2783          	lw	a5,0(s4)
80409664:	020ca423          	sw	zero,40(s9)
80409668:	0dc7a503          	lw	a0,220(a5)
8040966c:	dc1fe0ef          	jal	ra,8040842c <files_closeall>
80409670:	000a8513          	mv	a0,s5
80409674:	00000593          	li	a1,0
80409678:	d24fd0ef          	jal	ra,80406b9c <sysfile_open>
8040967c:	00050a93          	mv	s5,a0
80409680:	04054c63          	bltz	a0,804096d8 <do_execve+0x198>
80409684:	00091797          	auipc	a5,0x91
80409688:	1ac7a783          	lw	a5,428(a5) # 8049a830 <boot_cr3>
8040968c:	80000737          	lui	a4,0x80000
80409690:	00c7d793          	srli	a5,a5,0xc
80409694:	00e7e7b3          	or	a5,a5,a4
80409698:	18079073          	csrw	satp,a5
8040969c:	12000073          	sfence.vma
804096a0:	018ca783          	lw	a5,24(s9)
804096a4:	fff78793          	addi	a5,a5,-1
804096a8:	00fcac23          	sw	a5,24(s9)
804096ac:	18078063          	beqz	a5,8040982c <do_execve+0x2ec>
804096b0:	000a2783          	lw	a5,0(s4)
804096b4:	0007ac23          	sw	zero,24(a5)
804096b8:	8f0f80ef          	jal	ra,804017a8 <mm_create>
804096bc:	00050b93          	mv	s7,a0
804096c0:	00050a63          	beqz	a0,804096d4 <do_execve+0x194>
804096c4:	988ff0ef          	jal	ra,8040884c <setup_pgdir>
804096c8:	12050263          	beqz	a0,804097ec <do_execve+0x2ac>
804096cc:	000b8513          	mv	a0,s7
804096d0:	ae4f80ef          	jal	ra,804019b4 <mm_destroy>
804096d4:	ffc00a93          	li	s5,-4
804096d8:	ffc48493          	addi	s1,s1,-4
804096dc:	009989b3          	add	s3,s3,s1
804096e0:	0009a503          	lw	a0,0(s3)
804096e4:	fff40413          	addi	s0,s0,-1
804096e8:	ffc98993          	addi	s3,s3,-4
804096ec:	849f90ef          	jal	ra,80402f34 <kfree>
804096f0:	fe0418e3          	bnez	s0,804096e0 <do_execve+0x1a0>
804096f4:	000a8513          	mv	a0,s5
804096f8:	849ff0ef          	jal	ra,80408f40 <do_exit>
804096fc:	000a2783          	lw	a5,0(s4)
80409700:	0dc7a503          	lw	a0,220(a5)
80409704:	d29fe0ef          	jal	ra,8040842c <files_closeall>
80409708:	000a8513          	mv	a0,s5
8040970c:	00000593          	li	a1,0
80409710:	c8cfd0ef          	jal	ra,80406b9c <sysfile_open>
80409714:	00050a93          	mv	s5,a0
80409718:	fc0540e3          	bltz	a0,804096d8 <do_execve+0x198>
8040971c:	000a2783          	lw	a5,0(s4)
80409720:	0187a783          	lw	a5,24(a5)
80409724:	f8078ae3          	beqz	a5,804096b8 <do_execve+0x178>
80409728:	0000a617          	auipc	a2,0xa
8040972c:	8ec60613          	addi	a2,a2,-1812 # 80413014 <CSWTCH.81+0x2e4>
80409730:	27400593          	li	a1,628
80409734:	00009517          	auipc	a0,0x9
80409738:	6f850513          	addi	a0,a0,1784 # 80412e2c <CSWTCH.81+0xfc>
8040973c:	b91f60ef          	jal	ra,804002cc <__panic>
80409740:	ffc00493          	li	s1,-4
80409744:	02040263          	beqz	s0,80409768 <do_execve+0x228>
80409748:	fff40413          	addi	s0,s0,-1
8040974c:	00241413          	slli	s0,s0,0x2
80409750:	00898433          	add	s0,s3,s0
80409754:	00042503          	lw	a0,0(s0)
80409758:	fdcf90ef          	jal	ra,80402f34 <kfree>
8040975c:	00040793          	mv	a5,s0
80409760:	ffc40413          	addi	s0,s0,-4
80409764:	fef998e3          	bne	s3,a5,80409754 <do_execve+0x214>
80409768:	00048413          	mv	s0,s1
8040976c:	000c8863          	beqz	s9,8040977c <do_execve+0x23c>
80409770:	01cc8513          	addi	a0,s9,28
80409774:	ad8fd0ef          	jal	ra,80406a4c <up>
80409778:	020ca423          	sw	zero,40(s9)
8040977c:	16c12083          	lw	ra,364(sp)
80409780:	00040513          	mv	a0,s0
80409784:	16812403          	lw	s0,360(sp)
80409788:	16412483          	lw	s1,356(sp)
8040978c:	16012903          	lw	s2,352(sp)
80409790:	15c12983          	lw	s3,348(sp)
80409794:	15812a03          	lw	s4,344(sp)
80409798:	15412a83          	lw	s5,340(sp)
8040979c:	15012b03          	lw	s6,336(sp)
804097a0:	14c12b83          	lw	s7,332(sp)
804097a4:	14812c03          	lw	s8,328(sp)
804097a8:	14412c83          	lw	s9,324(sp)
804097ac:	14012d03          	lw	s10,320(sp)
804097b0:	13c12d83          	lw	s11,316(sp)
804097b4:	17010113          	addi	sp,sp,368
804097b8:	00008067          	ret
804097bc:	000a8513          	mv	a0,s5
804097c0:	f74f90ef          	jal	ra,80402f34 <kfree>
804097c4:	ffd00493          	li	s1,-3
804097c8:	f7dff06f          	j	80409744 <do_execve+0x204>
804097cc:	000a2783          	lw	a5,0(s4)
804097d0:	0000a617          	auipc	a2,0xa
804097d4:	83860613          	addi	a2,a2,-1992 # 80413008 <CSWTCH.81+0x2d8>
804097d8:	03300593          	li	a1,51
804097dc:	0047a683          	lw	a3,4(a5)
804097e0:	04810513          	addi	a0,sp,72
804097e4:	0a4070ef          	jal	ra,80410888 <snprintf>
804097e8:	e01ff06f          	j	804095e8 <do_execve+0xa8>
804097ec:	00000613          	li	a2,0
804097f0:	00000593          	li	a1,0
804097f4:	000a8513          	mv	a0,s5
804097f8:	f78fd0ef          	jal	ra,80406f70 <sysfile_seek>
804097fc:	00050793          	mv	a5,a0
80409800:	0a051263          	bnez	a0,804098a4 <do_execve+0x364>
80409804:	03400613          	li	a2,52
80409808:	07c10593          	addi	a1,sp,124
8040980c:	000a8513          	mv	a0,s5
80409810:	becfd0ef          	jal	ra,80406bfc <sysfile_read>
80409814:	03400793          	li	a5,52
80409818:	02f50863          	beq	a0,a5,80409848 <do_execve+0x308>
8040981c:	00050793          	mv	a5,a0
80409820:	08054263          	bltz	a0,804098a4 <do_execve+0x364>
80409824:	fff00793          	li	a5,-1
80409828:	07c0006f          	j	804098a4 <do_execve+0x364>
8040982c:	000c8513          	mv	a0,s9
80409830:	bccf80ef          	jal	ra,80401bfc <exit_mmap>
80409834:	00cca503          	lw	a0,12(s9)
80409838:	f89fe0ef          	jal	ra,804087c0 <put_pgdir.isra.0>
8040983c:	000c8513          	mv	a0,s9
80409840:	974f80ef          	jal	ra,804019b4 <mm_destroy>
80409844:	e6dff06f          	j	804096b0 <do_execve+0x170>
80409848:	07c12703          	lw	a4,124(sp)
8040984c:	464c47b7          	lui	a5,0x464c4
80409850:	57f78793          	addi	a5,a5,1407 # 464c457f <_binary_bin_sfs_img_size+0x4644c57f>
80409854:	40f71063          	bne	a4,a5,80409c54 <do_execve+0x714>
80409858:	0a815783          	lhu	a5,168(sp)
8040985c:	00012e23          	sw	zero,28(sp)
80409860:	0a078263          	beqz	a5,80409904 <do_execve+0x3c4>
80409864:	001007b7          	lui	a5,0x100
80409868:	fff78793          	addi	a5,a5,-1 # fffff <_binary_bin_sfs_img_size+0x87fff>
8040986c:	00f12c23          	sw	a5,24(sp)
80409870:	01c12783          	lw	a5,28(sp)
80409874:	09812583          	lw	a1,152(sp)
80409878:	00000613          	li	a2,0
8040987c:	00579793          	slli	a5,a5,0x5
80409880:	00b785b3          	add	a1,a5,a1
80409884:	000a8513          	mv	a0,s5
80409888:	ee8fd0ef          	jal	ra,80406f70 <sysfile_seek>
8040988c:	00050793          	mv	a5,a0
80409890:	02050663          	beqz	a0,804098bc <do_execve+0x37c>
80409894:	000b8513          	mv	a0,s7
80409898:	00f12223          	sw	a5,4(sp)
8040989c:	b60f80ef          	jal	ra,80401bfc <exit_mmap>
804098a0:	00412783          	lw	a5,4(sp)
804098a4:	00cba503          	lw	a0,12(s7)
804098a8:	00078a93          	mv	s5,a5
804098ac:	f15fe0ef          	jal	ra,804087c0 <put_pgdir.isra.0>
804098b0:	000b8513          	mv	a0,s7
804098b4:	900f80ef          	jal	ra,804019b4 <mm_destroy>
804098b8:	e21ff06f          	j	804096d8 <do_execve+0x198>
804098bc:	02000613          	li	a2,32
804098c0:	02810593          	addi	a1,sp,40
804098c4:	000a8513          	mv	a0,s5
804098c8:	b34fd0ef          	jal	ra,80406bfc <sysfile_read>
804098cc:	02000793          	li	a5,32
804098d0:	00f50a63          	beq	a0,a5,804098e4 <do_execve+0x3a4>
804098d4:	00050793          	mv	a5,a0
804098d8:	fa054ee3          	bltz	a0,80409894 <do_execve+0x354>
804098dc:	fff00793          	li	a5,-1
804098e0:	fb5ff06f          	j	80409894 <do_execve+0x354>
804098e4:	02812703          	lw	a4,40(sp)
804098e8:	00100793          	li	a5,1
804098ec:	1ef70263          	beq	a4,a5,80409ad0 <do_execve+0x590>
804098f0:	01c12703          	lw	a4,28(sp)
804098f4:	0a815783          	lhu	a5,168(sp)
804098f8:	00170713          	addi	a4,a4,1 # 80000001 <end+0xffb6576d>
804098fc:	00e12e23          	sw	a4,28(sp)
80409900:	f6f768e3          	bltu	a4,a5,80409870 <do_execve+0x330>
80409904:	000a8513          	mv	a0,s5
80409908:	af0fd0ef          	jal	ra,80406bf8 <sysfile_close>
8040990c:	00000713          	li	a4,0
80409910:	00b00693          	li	a3,11
80409914:	00100637          	lui	a2,0x100
80409918:	7ff005b7          	lui	a1,0x7ff00
8040991c:	000b8513          	mv	a0,s7
80409920:	908f80ef          	jal	ra,80401a28 <mm_map>
80409924:	00050793          	mv	a5,a0
80409928:	f60516e3          	bnez	a0,80409894 <do_execve+0x354>
8040992c:	00cba503          	lw	a0,12(s7)
80409930:	01f00613          	li	a2,31
80409934:	7ffff5b7          	lui	a1,0x7ffff
80409938:	bb9fb0ef          	jal	ra,804054f0 <pgdir_alloc_page>
8040993c:	58050463          	beqz	a0,80409ec4 <do_execve+0x984>
80409940:	00cba503          	lw	a0,12(s7)
80409944:	01f00613          	li	a2,31
80409948:	7fffe5b7          	lui	a1,0x7fffe
8040994c:	ba5fb0ef          	jal	ra,804054f0 <pgdir_alloc_page>
80409950:	54050a63          	beqz	a0,80409ea4 <do_execve+0x964>
80409954:	00cba503          	lw	a0,12(s7)
80409958:	01f00613          	li	a2,31
8040995c:	7fffd5b7          	lui	a1,0x7fffd
80409960:	b91fb0ef          	jal	ra,804054f0 <pgdir_alloc_page>
80409964:	52050063          	beqz	a0,80409e84 <do_execve+0x944>
80409968:	00cba503          	lw	a0,12(s7)
8040996c:	01f00613          	li	a2,31
80409970:	7fffc5b7          	lui	a1,0x7fffc
80409974:	b7dfb0ef          	jal	ra,804054f0 <pgdir_alloc_page>
80409978:	4e050663          	beqz	a0,80409e64 <do_execve+0x924>
8040997c:	018ba783          	lw	a5,24(s7)
80409980:	000a2703          	lw	a4,0(s4)
80409984:	00cba683          	lw	a3,12(s7)
80409988:	00178793          	addi	a5,a5,1
8040998c:	00fbac23          	sw	a5,24(s7)
80409990:	01772c23          	sw	s7,24(a4)
80409994:	804007b7          	lui	a5,0x80400
80409998:	48f6e063          	bltu	a3,a5,80409e18 <do_execve+0x8d8>
8040999c:	00091797          	auipc	a5,0x91
804099a0:	eac7a783          	lw	a5,-340(a5) # 8049a848 <va_pa_offset>
804099a4:	40f686b3          	sub	a3,a3,a5
804099a8:	00c6d793          	srli	a5,a3,0xc
804099ac:	04d72c23          	sw	a3,88(a4)
804099b0:	80000737          	lui	a4,0x80000
804099b4:	00e7e7b3          	or	a5,a5,a4
804099b8:	18079073          	csrw	satp,a5
804099bc:	12000073          	sfence.vma
804099c0:	00000a93          	li	s5,0
804099c4:	00098b93          	mv	s7,s3
804099c8:	00000b13          	li	s6,0
804099cc:	000ba503          	lw	a0,0(s7)
804099d0:	000015b7          	lui	a1,0x1
804099d4:	001b0b13          	addi	s6,s6,1
804099d8:	6f8060ef          	jal	ra,804100d0 <strnlen>
804099dc:	00150793          	addi	a5,a0,1
804099e0:	00fa8ab3          	add	s5,s5,a5
804099e4:	004b8b93          	addi	s7,s7,4
804099e8:	ff2b62e3          	bltu	s6,s2,804099cc <do_execve+0x48c>
804099ec:	20000bb7          	lui	s7,0x20000
804099f0:	002ada93          	srli	s5,s5,0x2
804099f4:	fffb8b93          	addi	s7,s7,-1 # 1fffffff <_binary_bin_sfs_img_size+0x1ff87fff>
804099f8:	415b8bb3          	sub	s7,s7,s5
804099fc:	002b9b93          	slli	s7,s7,0x2
80409a00:	409b8ab3          	sub	s5,s7,s1
80409a04:	00098c13          	mv	s8,s3
80409a08:	00000c93          	li	s9,0
80409a0c:	00000b13          	li	s6,0
80409a10:	413a8d33          	sub	s10,s5,s3
80409a14:	000c2d83          	lw	s11,0(s8)
80409a18:	016b8533          	add	a0,s7,s6
80409a1c:	001c8c93          	addi	s9,s9,1
80409a20:	000d8593          	mv	a1,s11
80409a24:	6d8060ef          	jal	ra,804100fc <strcpy>
80409a28:	00050713          	mv	a4,a0
80409a2c:	018d07b3          	add	a5,s10,s8
80409a30:	000015b7          	lui	a1,0x1
80409a34:	000d8513          	mv	a0,s11
80409a38:	00e7a023          	sw	a4,0(a5)
80409a3c:	694060ef          	jal	ra,804100d0 <strnlen>
80409a40:	01650b33          	add	s6,a0,s6
80409a44:	001b0b13          	addi	s6,s6,1
80409a48:	004c0c13          	addi	s8,s8,4
80409a4c:	fd2ce4e3          	bltu	s9,s2,80409a14 <do_execve+0x4d4>
80409a50:	000a2783          	lw	a5,0(s4)
80409a54:	09000613          	li	a2,144
80409a58:	fe8aae23          	sw	s0,-4(s5) # ffc <_binary_bin_swap_img_size-0x7004>
80409a5c:	0547a903          	lw	s2,84(a5)
80409a60:	00000593          	li	a1,0
80409a64:	ffca8a93          	addi	s5,s5,-4
80409a68:	00090513          	mv	a0,s2
80409a6c:	08092b03          	lw	s6,128(s2)
80409a70:	704060ef          	jal	ra,80410174 <memset>
80409a74:	09412783          	lw	a5,148(sp)
80409a78:	edfb7b13          	andi	s6,s6,-289
80409a7c:	ffc48493          	addi	s1,s1,-4
80409a80:	01592423          	sw	s5,8(s2)
80409a84:	08f92223          	sw	a5,132(s2)
80409a88:	09692023          	sw	s6,128(s2)
80409a8c:	009989b3          	add	s3,s3,s1
80409a90:	0009a503          	lw	a0,0(s3)
80409a94:	fff40413          	addi	s0,s0,-1
80409a98:	ffc98993          	addi	s3,s3,-4
80409a9c:	c98f90ef          	jal	ra,80402f34 <kfree>
80409aa0:	fe0418e3          	bnez	s0,80409a90 <do_execve+0x550>
80409aa4:	000a2483          	lw	s1,0(s4)
80409aa8:	03300613          	li	a2,51
80409aac:	00000593          	li	a1,0
80409ab0:	06048493          	addi	s1,s1,96
80409ab4:	00048513          	mv	a0,s1
80409ab8:	6bc060ef          	jal	ra,80410174 <memset>
80409abc:	03200613          	li	a2,50
80409ac0:	04810593          	addi	a1,sp,72
80409ac4:	00048513          	mv	a0,s1
80409ac8:	71c060ef          	jal	ra,804101e4 <memcpy>
80409acc:	cb1ff06f          	j	8040977c <do_execve+0x23c>
80409ad0:	03c12603          	lw	a2,60(sp)
80409ad4:	03812783          	lw	a5,56(sp)
80409ad8:	32f66c63          	bltu	a2,a5,80409e10 <do_execve+0x8d0>
80409adc:	04012783          	lw	a5,64(sp)
80409ae0:	0017f693          	andi	a3,a5,1
80409ae4:	00068463          	beqz	a3,80409aec <do_execve+0x5ac>
80409ae8:	00400693          	li	a3,4
80409aec:	0027f713          	andi	a4,a5,2
80409af0:	0047f793          	andi	a5,a5,4
80409af4:	16071c63          	bnez	a4,80409c6c <do_execve+0x72c>
80409af8:	01100713          	li	a4,17
80409afc:	00e12423          	sw	a4,8(sp)
80409b00:	00078863          	beqz	a5,80409b10 <do_execve+0x5d0>
80409b04:	01300793          	li	a5,19
80409b08:	0016e693          	ori	a3,a3,1
80409b0c:	00f12423          	sw	a5,8(sp)
80409b10:	0026f793          	andi	a5,a3,2
80409b14:	16079063          	bnez	a5,80409c74 <do_execve+0x734>
80409b18:	0046f793          	andi	a5,a3,4
80409b1c:	00078863          	beqz	a5,80409b2c <do_execve+0x5ec>
80409b20:	00812783          	lw	a5,8(sp)
80409b24:	0087e793          	ori	a5,a5,8
80409b28:	00f12423          	sw	a5,8(sp)
80409b2c:	03012583          	lw	a1,48(sp)
80409b30:	00000713          	li	a4,0
80409b34:	000b8513          	mv	a0,s7
80409b38:	ef1f70ef          	jal	ra,80401a28 <mm_map>
80409b3c:	00050793          	mv	a5,a0
80409b40:	d4051ae3          	bnez	a0,80409894 <do_execve+0x354>
80409b44:	03012d83          	lw	s11,48(sp)
80409b48:	03812c83          	lw	s9,56(sp)
80409b4c:	fffff6b7          	lui	a3,0xfffff
80409b50:	02c12c03          	lw	s8,44(sp)
80409b54:	019d87b3          	add	a5,s11,s9
80409b58:	00f12223          	sw	a5,4(sp)
80409b5c:	00ddfcb3          	and	s9,s11,a3
80409b60:	0cfdea63          	bltu	s11,a5,80409c34 <do_execve+0x6f4>
80409b64:	2a00006f          	j	80409e04 <do_execve+0x8c4>
80409b68:	000017b7          	lui	a5,0x1
80409b6c:	00fc8d33          	add	s10,s9,a5
80409b70:	00412783          	lw	a5,4(sp)
80409b74:	41bd08b3          	sub	a7,s10,s11
80409b78:	01a7f463          	bgeu	a5,s10,80409b80 <do_execve+0x640>
80409b7c:	41b788b3          	sub	a7,a5,s11
80409b80:	00091797          	auipc	a5,0x91
80409b84:	cbc78793          	addi	a5,a5,-836 # 8049a83c <pages>
80409b88:	0007a583          	lw	a1,0(a5)
80409b8c:	0000b797          	auipc	a5,0xb
80409b90:	f3078793          	addi	a5,a5,-208 # 80414abc <nbase>
80409b94:	0007a603          	lw	a2,0(a5)
80409b98:	01812703          	lw	a4,24(sp)
80409b9c:	40bb05b3          	sub	a1,s6,a1
80409ba0:	00091797          	auipc	a5,0x91
80409ba4:	c9878793          	addi	a5,a5,-872 # 8049a838 <npage>
80409ba8:	4055d593          	srai	a1,a1,0x5
80409bac:	00c585b3          	add	a1,a1,a2
80409bb0:	0007a783          	lw	a5,0(a5)
80409bb4:	00e5f633          	and	a2,a1,a4
80409bb8:	00c59713          	slli	a4,a1,0xc
80409bbc:	00e12623          	sw	a4,12(sp)
80409bc0:	26f67863          	bgeu	a2,a5,80409e30 <do_execve+0x8f0>
80409bc4:	00091797          	auipc	a5,0x91
80409bc8:	c8478793          	addi	a5,a5,-892 # 8049a848 <va_pa_offset>
80409bcc:	0007a783          	lw	a5,0(a5)
80409bd0:	00000613          	li	a2,0
80409bd4:	000c0593          	mv	a1,s8
80409bd8:	000a8513          	mv	a0,s5
80409bdc:	00f12823          	sw	a5,16(sp)
80409be0:	01112a23          	sw	a7,20(sp)
80409be4:	b8cfd0ef          	jal	ra,80406f70 <sysfile_seek>
80409be8:	00050793          	mv	a5,a0
80409bec:	ca0514e3          	bnez	a0,80409894 <do_execve+0x354>
80409bf0:	00c12703          	lw	a4,12(sp)
80409bf4:	01012783          	lw	a5,16(sp)
80409bf8:	01412883          	lw	a7,20(sp)
80409bfc:	419d8cb3          	sub	s9,s11,s9
80409c00:	00f705b3          	add	a1,a4,a5
80409c04:	00088613          	mv	a2,a7
80409c08:	019585b3          	add	a1,a1,s9
80409c0c:	000a8513          	mv	a0,s5
80409c10:	01112623          	sw	a7,12(sp)
80409c14:	fe9fc0ef          	jal	ra,80406bfc <sysfile_read>
80409c18:	00c12883          	lw	a7,12(sp)
80409c1c:	caa89ce3          	bne	a7,a0,804098d4 <do_execve+0x394>
80409c20:	00412783          	lw	a5,4(sp)
80409c24:	011d8db3          	add	s11,s11,a7
80409c28:	011c0c33          	add	s8,s8,a7
80409c2c:	04fdfe63          	bgeu	s11,a5,80409c88 <do_execve+0x748>
80409c30:	000d0c93          	mv	s9,s10
80409c34:	00cba503          	lw	a0,12(s7)
80409c38:	00812603          	lw	a2,8(sp)
80409c3c:	000c8593          	mv	a1,s9
80409c40:	8b1fb0ef          	jal	ra,804054f0 <pgdir_alloc_page>
80409c44:	00050b13          	mv	s6,a0
80409c48:	f20510e3          	bnez	a0,80409b68 <do_execve+0x628>
80409c4c:	ffc00793          	li	a5,-4
80409c50:	c45ff06f          	j	80409894 <do_execve+0x354>
80409c54:	00cba503          	lw	a0,12(s7)
80409c58:	ff800a93          	li	s5,-8
80409c5c:	b65fe0ef          	jal	ra,804087c0 <put_pgdir.isra.0>
80409c60:	000b8513          	mv	a0,s7
80409c64:	d51f70ef          	jal	ra,804019b4 <mm_destroy>
80409c68:	a71ff06f          	j	804096d8 <do_execve+0x198>
80409c6c:	0026e693          	ori	a3,a3,2
80409c70:	e8079ae3          	bnez	a5,80409b04 <do_execve+0x5c4>
80409c74:	01700793          	li	a5,23
80409c78:	00f12423          	sw	a5,8(sp)
80409c7c:	e9dff06f          	j	80409b18 <do_execve+0x5d8>
80409c80:	ffd00413          	li	s0,-3
80409c84:	af9ff06f          	j	8040977c <do_execve+0x23c>
80409c88:	03012c03          	lw	s8,48(sp)
80409c8c:	03c12783          	lw	a5,60(sp)
80409c90:	00fc0c33          	add	s8,s8,a5
80409c94:	0badf663          	bgeu	s11,s10,80409d40 <do_execve+0x800>
80409c98:	c5bc0ce3          	beq	s8,s11,804098f0 <do_execve+0x3b0>
80409c9c:	00001537          	lui	a0,0x1
80409ca0:	00ad8533          	add	a0,s11,a0
80409ca4:	41a50533          	sub	a0,a0,s10
80409ca8:	41bc0cb3          	sub	s9,s8,s11
80409cac:	01ac6463          	bltu	s8,s10,80409cb4 <do_execve+0x774>
80409cb0:	41bd0cb3          	sub	s9,s10,s11
80409cb4:	00091797          	auipc	a5,0x91
80409cb8:	b8878793          	addi	a5,a5,-1144 # 8049a83c <pages>
80409cbc:	0007a683          	lw	a3,0(a5)
80409cc0:	0000b797          	auipc	a5,0xb
80409cc4:	dfc78793          	addi	a5,a5,-516 # 80414abc <nbase>
80409cc8:	0007a603          	lw	a2,0(a5)
80409ccc:	01812703          	lw	a4,24(sp)
80409cd0:	40db06b3          	sub	a3,s6,a3
80409cd4:	4056d693          	srai	a3,a3,0x5
80409cd8:	00c686b3          	add	a3,a3,a2
80409cdc:	00e6f633          	and	a2,a3,a4
80409ce0:	00091797          	auipc	a5,0x91
80409ce4:	b587a783          	lw	a5,-1192(a5) # 8049a838 <npage>
80409ce8:	00c69693          	slli	a3,a3,0xc
80409cec:	16f67063          	bgeu	a2,a5,80409e4c <do_execve+0x90c>
80409cf0:	00091797          	auipc	a5,0x91
80409cf4:	b587a783          	lw	a5,-1192(a5) # 8049a848 <va_pa_offset>
80409cf8:	00f686b3          	add	a3,a3,a5
80409cfc:	000c8613          	mv	a2,s9
80409d00:	00000593          	li	a1,0
80409d04:	00a68533          	add	a0,a3,a0
80409d08:	46c060ef          	jal	ra,80410174 <memset>
80409d0c:	01bc8733          	add	a4,s9,s11
80409d10:	03ac7463          	bgeu	s8,s10,80409d38 <do_execve+0x7f8>
80409d14:	bcec0ee3          	beq	s8,a4,804098f0 <do_execve+0x3b0>
80409d18:	00009697          	auipc	a3,0x9
80409d1c:	32468693          	addi	a3,a3,804 # 8041303c <CSWTCH.81+0x30c>
80409d20:	00007617          	auipc	a2,0x7
80409d24:	fa060613          	addi	a2,a2,-96 # 80410cc0 <commands+0x3c>
80409d28:	2cb00593          	li	a1,715
80409d2c:	00009517          	auipc	a0,0x9
80409d30:	10050513          	addi	a0,a0,256 # 80412e2c <CSWTCH.81+0xfc>
80409d34:	d98f60ef          	jal	ra,804002cc <__panic>
80409d38:	ffa710e3          	bne	a4,s10,80409d18 <do_execve+0x7d8>
80409d3c:	000d0d93          	mv	s11,s10
80409d40:	bb8df8e3          	bgeu	s11,s8,804098f0 <do_execve+0x3b0>
80409d44:	00091c97          	auipc	s9,0x91
80409d48:	af4c8c93          	addi	s9,s9,-1292 # 8049a838 <npage>
80409d4c:	0780006f          	j	80409dc4 <do_execve+0x884>
80409d50:	000017b7          	lui	a5,0x1
80409d54:	41ad8533          	sub	a0,s11,s10
80409d58:	00fd0d33          	add	s10,s10,a5
80409d5c:	41bd0633          	sub	a2,s10,s11
80409d60:	01ac7463          	bgeu	s8,s10,80409d68 <do_execve+0x828>
80409d64:	41bc0633          	sub	a2,s8,s11
80409d68:	00091797          	auipc	a5,0x91
80409d6c:	ad478793          	addi	a5,a5,-1324 # 8049a83c <pages>
80409d70:	0007a683          	lw	a3,0(a5)
80409d74:	0000b797          	auipc	a5,0xb
80409d78:	d4878793          	addi	a5,a5,-696 # 80414abc <nbase>
80409d7c:	0007a583          	lw	a1,0(a5)
80409d80:	01812703          	lw	a4,24(sp)
80409d84:	40db06b3          	sub	a3,s6,a3
80409d88:	4056d693          	srai	a3,a3,0x5
80409d8c:	000ca783          	lw	a5,0(s9)
80409d90:	00b686b3          	add	a3,a3,a1
80409d94:	00e6f5b3          	and	a1,a3,a4
80409d98:	00c69693          	slli	a3,a3,0xc
80409d9c:	0af5f863          	bgeu	a1,a5,80409e4c <do_execve+0x90c>
80409da0:	00091797          	auipc	a5,0x91
80409da4:	aa878793          	addi	a5,a5,-1368 # 8049a848 <va_pa_offset>
80409da8:	0007a783          	lw	a5,0(a5)
80409dac:	00cd8db3          	add	s11,s11,a2
80409db0:	00000593          	li	a1,0
80409db4:	00f686b3          	add	a3,a3,a5
80409db8:	00a68533          	add	a0,a3,a0
80409dbc:	3b8060ef          	jal	ra,80410174 <memset>
80409dc0:	b38df8e3          	bgeu	s11,s8,804098f0 <do_execve+0x3b0>
80409dc4:	00cba503          	lw	a0,12(s7)
80409dc8:	00812603          	lw	a2,8(sp)
80409dcc:	000d0593          	mv	a1,s10
80409dd0:	f20fb0ef          	jal	ra,804054f0 <pgdir_alloc_page>
80409dd4:	00050b13          	mv	s6,a0
80409dd8:	f6051ce3          	bnez	a0,80409d50 <do_execve+0x810>
80409ddc:	ffc00793          	li	a5,-4
80409de0:	ab5ff06f          	j	80409894 <do_execve+0x354>
80409de4:	ffd00493          	li	s1,-3
80409de8:	981ff06f          	j	80409768 <do_execve+0x228>
80409dec:	e80c8ae3          	beqz	s9,80409c80 <do_execve+0x740>
80409df0:	01cc8513          	addi	a0,s9,28
80409df4:	c59fc0ef          	jal	ra,80406a4c <up>
80409df8:	ffd00413          	li	s0,-3
80409dfc:	020ca423          	sw	zero,40(s9)
80409e00:	97dff06f          	j	8040977c <do_execve+0x23c>
80409e04:	000d8c13          	mv	s8,s11
80409e08:	000c8d13          	mv	s10,s9
80409e0c:	e81ff06f          	j	80409c8c <do_execve+0x74c>
80409e10:	ff800793          	li	a5,-8
80409e14:	a81ff06f          	j	80409894 <do_execve+0x354>
80409e18:	00008617          	auipc	a2,0x8
80409e1c:	d1860613          	addi	a2,a2,-744 # 80411b30 <commands+0xeac>
80409e20:	2e700593          	li	a1,743
80409e24:	00009517          	auipc	a0,0x9
80409e28:	00850513          	addi	a0,a0,8 # 80412e2c <CSWTCH.81+0xfc>
80409e2c:	ca0f60ef          	jal	ra,804002cc <__panic>
80409e30:	00070693          	mv	a3,a4
80409e34:	00008617          	auipc	a2,0x8
80409e38:	c7460613          	addi	a2,a2,-908 # 80411aa8 <commands+0xe24>
80409e3c:	06e00593          	li	a1,110
80409e40:	00008517          	auipc	a0,0x8
80409e44:	93c50513          	addi	a0,a0,-1732 # 8041177c <commands+0xaf8>
80409e48:	c84f60ef          	jal	ra,804002cc <__panic>
80409e4c:	00008617          	auipc	a2,0x8
80409e50:	c5c60613          	addi	a2,a2,-932 # 80411aa8 <commands+0xe24>
80409e54:	06e00593          	li	a1,110
80409e58:	00008517          	auipc	a0,0x8
80409e5c:	92450513          	addi	a0,a0,-1756 # 8041177c <commands+0xaf8>
80409e60:	c6cf60ef          	jal	ra,804002cc <__panic>
80409e64:	00009697          	auipc	a3,0x9
80409e68:	2e068693          	addi	a3,a3,736 # 80413144 <CSWTCH.81+0x414>
80409e6c:	00007617          	auipc	a2,0x7
80409e70:	e5460613          	addi	a2,a2,-428 # 80410cc0 <commands+0x3c>
80409e74:	2e300593          	li	a1,739
80409e78:	00009517          	auipc	a0,0x9
80409e7c:	fb450513          	addi	a0,a0,-76 # 80412e2c <CSWTCH.81+0xfc>
80409e80:	c4cf60ef          	jal	ra,804002cc <__panic>
80409e84:	00009697          	auipc	a3,0x9
80409e88:	27c68693          	addi	a3,a3,636 # 80413100 <CSWTCH.81+0x3d0>
80409e8c:	00007617          	auipc	a2,0x7
80409e90:	e3460613          	addi	a2,a2,-460 # 80410cc0 <commands+0x3c>
80409e94:	2e200593          	li	a1,738
80409e98:	00009517          	auipc	a0,0x9
80409e9c:	f9450513          	addi	a0,a0,-108 # 80412e2c <CSWTCH.81+0xfc>
80409ea0:	c2cf60ef          	jal	ra,804002cc <__panic>
80409ea4:	00009697          	auipc	a3,0x9
80409ea8:	21868693          	addi	a3,a3,536 # 804130bc <CSWTCH.81+0x38c>
80409eac:	00007617          	auipc	a2,0x7
80409eb0:	e1460613          	addi	a2,a2,-492 # 80410cc0 <commands+0x3c>
80409eb4:	2e100593          	li	a1,737
80409eb8:	00009517          	auipc	a0,0x9
80409ebc:	f7450513          	addi	a0,a0,-140 # 80412e2c <CSWTCH.81+0xfc>
80409ec0:	c0cf60ef          	jal	ra,804002cc <__panic>
80409ec4:	00009697          	auipc	a3,0x9
80409ec8:	1b468693          	addi	a3,a3,436 # 80413078 <CSWTCH.81+0x348>
80409ecc:	00007617          	auipc	a2,0x7
80409ed0:	df460613          	addi	a2,a2,-524 # 80410cc0 <commands+0x3c>
80409ed4:	2e000593          	li	a1,736
80409ed8:	00009517          	auipc	a0,0x9
80409edc:	f5450513          	addi	a0,a0,-172 # 80412e2c <CSWTCH.81+0xfc>
80409ee0:	becf60ef          	jal	ra,804002cc <__panic>

80409ee4 <do_yield>:
80409ee4:	00091797          	auipc	a5,0x91
80409ee8:	9687a783          	lw	a5,-1688(a5) # 8049a84c <current>
80409eec:	00100713          	li	a4,1
80409ef0:	00e7a823          	sw	a4,16(a5)
80409ef4:	00000513          	li	a0,0
80409ef8:	00008067          	ret

80409efc <do_wait>:
80409efc:	ff010113          	addi	sp,sp,-16
80409f00:	00812423          	sw	s0,8(sp)
80409f04:	00912223          	sw	s1,4(sp)
80409f08:	00112623          	sw	ra,12(sp)
80409f0c:	00058413          	mv	s0,a1
80409f10:	00050493          	mv	s1,a0
80409f14:	02058063          	beqz	a1,80409f34 <do_wait+0x38>
80409f18:	00091797          	auipc	a5,0x91
80409f1c:	9347a783          	lw	a5,-1740(a5) # 8049a84c <current>
80409f20:	0187a503          	lw	a0,24(a5)
80409f24:	00100693          	li	a3,1
80409f28:	00400613          	li	a2,4
80409f2c:	c9cf80ef          	jal	ra,804023c8 <user_mem_check>
80409f30:	02050063          	beqz	a0,80409f50 <do_wait+0x54>
80409f34:	00040593          	mv	a1,s0
80409f38:	00812403          	lw	s0,8(sp)
80409f3c:	00c12083          	lw	ra,12(sp)
80409f40:	00048513          	mv	a0,s1
80409f44:	00412483          	lw	s1,4(sp)
80409f48:	01010113          	addi	sp,sp,16
80409f4c:	9ccff06f          	j	80409118 <do_wait.part.0>
80409f50:	00c12083          	lw	ra,12(sp)
80409f54:	00812403          	lw	s0,8(sp)
80409f58:	00412483          	lw	s1,4(sp)
80409f5c:	ffd00513          	li	a0,-3
80409f60:	01010113          	addi	sp,sp,16
80409f64:	00008067          	ret

80409f68 <do_kill>:
80409f68:	ff010113          	addi	sp,sp,-16
80409f6c:	000027b7          	lui	a5,0x2
80409f70:	00112623          	sw	ra,12(sp)
80409f74:	00812423          	sw	s0,8(sp)
80409f78:	fff50713          	addi	a4,a0,-1
80409f7c:	ffe78793          	addi	a5,a5,-2 # 1ffe <_binary_bin_swap_img_size-0x6002>
80409f80:	02e7ec63          	bltu	a5,a4,80409fb8 <do_kill+0x50>
80409f84:	00a00593          	li	a1,10
80409f88:	00050413          	mv	s0,a0
80409f8c:	17d060ef          	jal	ra,80410908 <hash32>
80409f90:	0008e797          	auipc	a5,0x8e
80409f94:	83478793          	addi	a5,a5,-1996 # 804977c4 <hash_list>
80409f98:	00351513          	slli	a0,a0,0x3
80409f9c:	00f50533          	add	a0,a0,a5
80409fa0:	00050793          	mv	a5,a0
80409fa4:	00c0006f          	j	80409fb0 <do_kill+0x48>
80409fa8:	f687a703          	lw	a4,-152(a5)
80409fac:	02e40263          	beq	s0,a4,80409fd0 <do_kill+0x68>
80409fb0:	0047a783          	lw	a5,4(a5)
80409fb4:	fef51ae3          	bne	a0,a5,80409fa8 <do_kill+0x40>
80409fb8:	ffd00413          	li	s0,-3
80409fbc:	00c12083          	lw	ra,12(sp)
80409fc0:	00040513          	mv	a0,s0
80409fc4:	00812403          	lw	s0,8(sp)
80409fc8:	01010113          	addi	sp,sp,16
80409fcc:	00008067          	ret
80409fd0:	fc07a703          	lw	a4,-64(a5)
80409fd4:	00177693          	andi	a3,a4,1
80409fd8:	02069a63          	bnez	a3,8040a00c <do_kill+0xa4>
80409fdc:	00c7a683          	lw	a3,12(a5)
80409fe0:	00176713          	ori	a4,a4,1
80409fe4:	fce7a023          	sw	a4,-64(a5)
80409fe8:	00000413          	li	s0,0
80409fec:	fc06d8e3          	bgez	a3,80409fbc <do_kill+0x54>
80409ff0:	f6478513          	addi	a0,a5,-156
80409ff4:	41c000ef          	jal	ra,8040a410 <wakeup_proc>
80409ff8:	00c12083          	lw	ra,12(sp)
80409ffc:	00040513          	mv	a0,s0
8040a000:	00812403          	lw	s0,8(sp)
8040a004:	01010113          	addi	sp,sp,16
8040a008:	00008067          	ret
8040a00c:	ff700413          	li	s0,-9
8040a010:	fadff06f          	j	80409fbc <do_kill+0x54>

8040a014 <proc_init>:
8040a014:	f6010113          	addi	sp,sp,-160
8040a018:	08912a23          	sw	s1,148(sp)
8040a01c:	00091797          	auipc	a5,0x91
8040a020:	84078793          	addi	a5,a5,-1984 # 8049a85c <proc_list>
8040a024:	08112e23          	sw	ra,156(sp)
8040a028:	08812c23          	sw	s0,152(sp)
8040a02c:	09212823          	sw	s2,144(sp)
8040a030:	0008d497          	auipc	s1,0x8d
8040a034:	79448493          	addi	s1,s1,1940 # 804977c4 <hash_list>
8040a038:	00f7a223          	sw	a5,4(a5)
8040a03c:	00f7a023          	sw	a5,0(a5)
8040a040:	0008f717          	auipc	a4,0x8f
8040a044:	78470713          	addi	a4,a4,1924 # 804997c4 <__rq>
8040a048:	00048793          	mv	a5,s1
8040a04c:	00f7a223          	sw	a5,4(a5)
8040a050:	00f7a023          	sw	a5,0(a5)
8040a054:	00878793          	addi	a5,a5,8
8040a058:	fef71ae3          	bne	a4,a5,8040a04c <proc_init+0x38>
8040a05c:	de4fe0ef          	jal	ra,80408640 <alloc_proc>
8040a060:	00090917          	auipc	s2,0x90
8040a064:	7f090913          	addi	s2,s2,2032 # 8049a850 <idleproc>
8040a068:	00a92023          	sw	a0,0(s2)
8040a06c:	00050413          	mv	s0,a0
8040a070:	1c050263          	beqz	a0,8040a234 <proc_init+0x220>
8040a074:	00200793          	li	a5,2
8040a078:	00f52023          	sw	a5,0(a0)
8040a07c:	0000b797          	auipc	a5,0xb
8040a080:	f8478793          	addi	a5,a5,-124 # 80415000 <bootstack>
8040a084:	00f52623          	sw	a5,12(a0)
8040a088:	00100793          	li	a5,1
8040a08c:	00052223          	sw	zero,4(a0)
8040a090:	00f52823          	sw	a5,16(a0)
8040a094:	a78fe0ef          	jal	ra,8040830c <files_create>
8040a098:	0ca42e23          	sw	a0,220(s0)
8040a09c:	18050063          	beqz	a0,8040a21c <proc_init+0x208>
8040a0a0:	00092403          	lw	s0,0(s2)
8040a0a4:	03300613          	li	a2,51
8040a0a8:	00000593          	li	a1,0
8040a0ac:	0dc42703          	lw	a4,220(s0)
8040a0b0:	06040413          	addi	s0,s0,96
8040a0b4:	00040513          	mv	a0,s0
8040a0b8:	00872783          	lw	a5,8(a4)
8040a0bc:	00178793          	addi	a5,a5,1
8040a0c0:	00f72423          	sw	a5,8(a4)
8040a0c4:	0b0060ef          	jal	ra,80410174 <memset>
8040a0c8:	03200613          	li	a2,50
8040a0cc:	00009597          	auipc	a1,0x9
8040a0d0:	0f858593          	addi	a1,a1,248 # 804131c4 <CSWTCH.81+0x494>
8040a0d4:	00040513          	mv	a0,s0
8040a0d8:	10c060ef          	jal	ra,804101e4 <memcpy>
8040a0dc:	00090717          	auipc	a4,0x90
8040a0e0:	77c70713          	addi	a4,a4,1916 # 8049a858 <nr_process>
8040a0e4:	00072783          	lw	a5,0(a4)
8040a0e8:	00092683          	lw	a3,0(s2)
8040a0ec:	09000613          	li	a2,144
8040a0f0:	00178793          	addi	a5,a5,1
8040a0f4:	00000593          	li	a1,0
8040a0f8:	00010513          	mv	a0,sp
8040a0fc:	00f72023          	sw	a5,0(a4)
8040a100:	00090797          	auipc	a5,0x90
8040a104:	74d7a623          	sw	a3,1868(a5) # 8049a84c <current>
8040a108:	06c060ef          	jal	ra,80410174 <memset>
8040a10c:	fffff797          	auipc	a5,0xfffff
8040a110:	28078793          	addi	a5,a5,640 # 8040938c <init_main>
8040a114:	02f12023          	sw	a5,32(sp)
8040a118:	02012223          	sw	zero,36(sp)
8040a11c:	100027f3          	csrr	a5,sstatus
8040a120:	edd7f793          	andi	a5,a5,-291
8040a124:	1207e793          	ori	a5,a5,288
8040a128:	08f12023          	sw	a5,128(sp)
8040a12c:	00010613          	mv	a2,sp
8040a130:	ffffe797          	auipc	a5,0xffffe
8040a134:	50478793          	addi	a5,a5,1284 # 80408634 <kernel_thread_entry>
8040a138:	00000593          	li	a1,0
8040a13c:	10000513          	li	a0,256
8040a140:	08f12223          	sw	a5,132(sp)
8040a144:	8a9fe0ef          	jal	ra,804089ec <do_fork>
8040a148:	00050413          	mv	s0,a0
8040a14c:	0aa05c63          	blez	a0,8040a204 <proc_init+0x1f0>
8040a150:	000027b7          	lui	a5,0x2
8040a154:	fff50713          	addi	a4,a0,-1
8040a158:	ffe78793          	addi	a5,a5,-2 # 1ffe <_binary_bin_swap_img_size-0x6002>
8040a15c:	02e7e663          	bltu	a5,a4,8040a188 <proc_init+0x174>
8040a160:	00a00593          	li	a1,10
8040a164:	7a4060ef          	jal	ra,80410908 <hash32>
8040a168:	00351693          	slli	a3,a0,0x3
8040a16c:	00d486b3          	add	a3,s1,a3
8040a170:	00068793          	mv	a5,a3
8040a174:	00c0006f          	j	8040a180 <proc_init+0x16c>
8040a178:	f687a703          	lw	a4,-152(a5)
8040a17c:	08e40063          	beq	s0,a4,8040a1fc <proc_init+0x1e8>
8040a180:	0047a783          	lw	a5,4(a5)
8040a184:	fef69ae3          	bne	a3,a5,8040a178 <proc_init+0x164>
8040a188:	00000793          	li	a5,0
8040a18c:	06078493          	addi	s1,a5,96
8040a190:	03300613          	li	a2,51
8040a194:	00000593          	li	a1,0
8040a198:	00090417          	auipc	s0,0x90
8040a19c:	6bc40413          	addi	s0,s0,1724 # 8049a854 <initproc>
8040a1a0:	00048513          	mv	a0,s1
8040a1a4:	00f42023          	sw	a5,0(s0)
8040a1a8:	7cd050ef          	jal	ra,80410174 <memset>
8040a1ac:	03200613          	li	a2,50
8040a1b0:	00009597          	auipc	a1,0x9
8040a1b4:	03858593          	addi	a1,a1,56 # 804131e8 <CSWTCH.81+0x4b8>
8040a1b8:	00048513          	mv	a0,s1
8040a1bc:	028060ef          	jal	ra,804101e4 <memcpy>
8040a1c0:	00092783          	lw	a5,0(s2)
8040a1c4:	0a078463          	beqz	a5,8040a26c <proc_init+0x258>
8040a1c8:	0047a783          	lw	a5,4(a5)
8040a1cc:	0a079063          	bnez	a5,8040a26c <proc_init+0x258>
8040a1d0:	00042783          	lw	a5,0(s0)
8040a1d4:	06078c63          	beqz	a5,8040a24c <proc_init+0x238>
8040a1d8:	0047a703          	lw	a4,4(a5)
8040a1dc:	00100793          	li	a5,1
8040a1e0:	06f71663          	bne	a4,a5,8040a24c <proc_init+0x238>
8040a1e4:	09c12083          	lw	ra,156(sp)
8040a1e8:	09812403          	lw	s0,152(sp)
8040a1ec:	09412483          	lw	s1,148(sp)
8040a1f0:	09012903          	lw	s2,144(sp)
8040a1f4:	0a010113          	addi	sp,sp,160
8040a1f8:	00008067          	ret
8040a1fc:	f6478793          	addi	a5,a5,-156
8040a200:	f8dff06f          	j	8040a18c <proc_init+0x178>
8040a204:	00009617          	auipc	a2,0x9
8040a208:	fc860613          	addi	a2,a2,-56 # 804131cc <CSWTCH.81+0x49c>
8040a20c:	44400593          	li	a1,1092
8040a210:	00009517          	auipc	a0,0x9
8040a214:	c1c50513          	addi	a0,a0,-996 # 80412e2c <CSWTCH.81+0xfc>
8040a218:	8b4f60ef          	jal	ra,804002cc <__panic>
8040a21c:	00009617          	auipc	a2,0x9
8040a220:	f8460613          	addi	a2,a2,-124 # 804131a0 <CSWTCH.81+0x470>
8040a224:	43900593          	li	a1,1081
8040a228:	00009517          	auipc	a0,0x9
8040a22c:	c0450513          	addi	a0,a0,-1020 # 80412e2c <CSWTCH.81+0xfc>
8040a230:	89cf60ef          	jal	ra,804002cc <__panic>
8040a234:	00009617          	auipc	a2,0x9
8040a238:	f5460613          	addi	a2,a2,-172 # 80413188 <CSWTCH.81+0x458>
8040a23c:	43000593          	li	a1,1072
8040a240:	00009517          	auipc	a0,0x9
8040a244:	bec50513          	addi	a0,a0,-1044 # 80412e2c <CSWTCH.81+0xfc>
8040a248:	884f60ef          	jal	ra,804002cc <__panic>
8040a24c:	00009697          	auipc	a3,0x9
8040a250:	fcc68693          	addi	a3,a3,-52 # 80413218 <CSWTCH.81+0x4e8>
8040a254:	00007617          	auipc	a2,0x7
8040a258:	a6c60613          	addi	a2,a2,-1428 # 80410cc0 <commands+0x3c>
8040a25c:	44b00593          	li	a1,1099
8040a260:	00009517          	auipc	a0,0x9
8040a264:	bcc50513          	addi	a0,a0,-1076 # 80412e2c <CSWTCH.81+0xfc>
8040a268:	864f60ef          	jal	ra,804002cc <__panic>
8040a26c:	00009697          	auipc	a3,0x9
8040a270:	f8468693          	addi	a3,a3,-124 # 804131f0 <CSWTCH.81+0x4c0>
8040a274:	00007617          	auipc	a2,0x7
8040a278:	a4c60613          	addi	a2,a2,-1460 # 80410cc0 <commands+0x3c>
8040a27c:	44a00593          	li	a1,1098
8040a280:	00009517          	auipc	a0,0x9
8040a284:	bac50513          	addi	a0,a0,-1108 # 80412e2c <CSWTCH.81+0xfc>
8040a288:	844f60ef          	jal	ra,804002cc <__panic>

8040a28c <cpu_idle>:
8040a28c:	ff010113          	addi	sp,sp,-16
8040a290:	00812423          	sw	s0,8(sp)
8040a294:	00112623          	sw	ra,12(sp)
8040a298:	00090417          	auipc	s0,0x90
8040a29c:	5b440413          	addi	s0,s0,1460 # 8049a84c <current>
8040a2a0:	00042703          	lw	a4,0(s0)
8040a2a4:	01072783          	lw	a5,16(a4)
8040a2a8:	fe078ee3          	beqz	a5,8040a2a4 <cpu_idle+0x18>
8040a2ac:	250000ef          	jal	ra,8040a4fc <schedule>
8040a2b0:	ff1ff06f          	j	8040a2a0 <cpu_idle+0x14>

8040a2b4 <lab6_set_priority>:
8040a2b4:	00090797          	auipc	a5,0x90
8040a2b8:	5987a783          	lw	a5,1432(a5) # 8049a84c <current>
8040a2bc:	00051863          	bnez	a0,8040a2cc <lab6_set_priority+0x18>
8040a2c0:	00100713          	li	a4,1
8040a2c4:	0ce7ac23          	sw	a4,216(a5)
8040a2c8:	00008067          	ret
8040a2cc:	0ca7ac23          	sw	a0,216(a5)
8040a2d0:	00008067          	ret

8040a2d4 <do_sleep>:
8040a2d4:	06050e63          	beqz	a0,8040a350 <do_sleep+0x7c>
8040a2d8:	fe010113          	addi	sp,sp,-32
8040a2dc:	00812c23          	sw	s0,24(sp)
8040a2e0:	00112e23          	sw	ra,28(sp)
8040a2e4:	00050413          	mv	s0,a0
8040a2e8:	100027f3          	csrr	a5,sstatus
8040a2ec:	0027f793          	andi	a5,a5,2
8040a2f0:	06079463          	bnez	a5,8040a358 <do_sleep+0x84>
8040a2f4:	00090797          	auipc	a5,0x90
8040a2f8:	5587a783          	lw	a5,1368(a5) # 8049a84c <current>
8040a2fc:	00810713          	addi	a4,sp,8
8040a300:	00a12023          	sw	a0,0(sp)
8040a304:	00e12623          	sw	a4,12(sp)
8040a308:	00e12423          	sw	a4,8(sp)
8040a30c:	00f12223          	sw	a5,4(sp)
8040a310:	00100713          	li	a4,1
8040a314:	00e7a023          	sw	a4,0(a5)
8040a318:	80000737          	lui	a4,0x80000
8040a31c:	00010413          	mv	s0,sp
8040a320:	00270713          	addi	a4,a4,2 # 80000002 <end+0xffb6576e>
8040a324:	0ae7a423          	sw	a4,168(a5)
8040a328:	00040513          	mv	a0,s0
8040a32c:	2ec000ef          	jal	ra,8040a618 <add_timer>
8040a330:	1cc000ef          	jal	ra,8040a4fc <schedule>
8040a334:	00040513          	mv	a0,s0
8040a338:	3f4000ef          	jal	ra,8040a72c <del_timer>
8040a33c:	01c12083          	lw	ra,28(sp)
8040a340:	01812403          	lw	s0,24(sp)
8040a344:	00000513          	li	a0,0
8040a348:	02010113          	addi	sp,sp,32
8040a34c:	00008067          	ret
8040a350:	00000513          	li	a0,0
8040a354:	00008067          	ret
8040a358:	a21f60ef          	jal	ra,80400d78 <intr_disable>
8040a35c:	00090797          	auipc	a5,0x90
8040a360:	4f07a783          	lw	a5,1264(a5) # 8049a84c <current>
8040a364:	00810713          	addi	a4,sp,8
8040a368:	00812023          	sw	s0,0(sp)
8040a36c:	00f12223          	sw	a5,4(sp)
8040a370:	00e12623          	sw	a4,12(sp)
8040a374:	00e12423          	sw	a4,8(sp)
8040a378:	00100713          	li	a4,1
8040a37c:	00e7a023          	sw	a4,0(a5)
8040a380:	80000737          	lui	a4,0x80000
8040a384:	00270713          	addi	a4,a4,2 # 80000002 <end+0xffb6576e>
8040a388:	00010413          	mv	s0,sp
8040a38c:	00040513          	mv	a0,s0
8040a390:	0ae7a423          	sw	a4,168(a5)
8040a394:	284000ef          	jal	ra,8040a618 <add_timer>
8040a398:	9d9f60ef          	jal	ra,80400d70 <intr_enable>
8040a39c:	f95ff06f          	j	8040a330 <do_sleep+0x5c>

8040a3a0 <sched_init>:
8040a3a0:	ff010113          	addi	sp,sp,-16
8040a3a4:	0008d717          	auipc	a4,0x8d
8040a3a8:	c7c70713          	addi	a4,a4,-900 # 80497020 <default_sched_class>
8040a3ac:	00812423          	sw	s0,8(sp)
8040a3b0:	00112623          	sw	ra,12(sp)
8040a3b4:	00090797          	auipc	a5,0x90
8040a3b8:	4b878793          	addi	a5,a5,1208 # 8049a86c <timer_list>
8040a3bc:	00472683          	lw	a3,4(a4)
8040a3c0:	0008f517          	auipc	a0,0x8f
8040a3c4:	40450513          	addi	a0,a0,1028 # 804997c4 <__rq>
8040a3c8:	00f7a223          	sw	a5,4(a5)
8040a3cc:	00f7a023          	sw	a5,0(a5)
8040a3d0:	00500793          	li	a5,5
8040a3d4:	00f52623          	sw	a5,12(a0)
8040a3d8:	00090417          	auipc	s0,0x90
8040a3dc:	49040413          	addi	s0,s0,1168 # 8049a868 <sched_class>
8040a3e0:	00090797          	auipc	a5,0x90
8040a3e4:	48a7a223          	sw	a0,1156(a5) # 8049a864 <rq>
8040a3e8:	00e42023          	sw	a4,0(s0)
8040a3ec:	000680e7          	jalr	a3
8040a3f0:	00042783          	lw	a5,0(s0)
8040a3f4:	00812403          	lw	s0,8(sp)
8040a3f8:	00c12083          	lw	ra,12(sp)
8040a3fc:	0007a583          	lw	a1,0(a5)
8040a400:	00009517          	auipc	a0,0x9
8040a404:	e4050513          	addi	a0,a0,-448 # 80413240 <CSWTCH.81+0x510>
8040a408:	01010113          	addi	sp,sp,16
8040a40c:	d3df506f          	j	80400148 <cprintf>

8040a410 <wakeup_proc>:
8040a410:	00052703          	lw	a4,0(a0)
8040a414:	ff010113          	addi	sp,sp,-16
8040a418:	00112623          	sw	ra,12(sp)
8040a41c:	00812423          	sw	s0,8(sp)
8040a420:	00912223          	sw	s1,4(sp)
8040a424:	00300793          	li	a5,3
8040a428:	0af70a63          	beq	a4,a5,8040a4dc <wakeup_proc+0xcc>
8040a42c:	00050413          	mv	s0,a0
8040a430:	100027f3          	csrr	a5,sstatus
8040a434:	0027f793          	andi	a5,a5,2
8040a438:	00000493          	li	s1,0
8040a43c:	08079863          	bnez	a5,8040a4cc <wakeup_proc+0xbc>
8040a440:	00200793          	li	a5,2
8040a444:	06f70663          	beq	a4,a5,8040a4b0 <wakeup_proc+0xa0>
8040a448:	00f42023          	sw	a5,0(s0)
8040a44c:	0a042423          	sw	zero,168(s0)
8040a450:	00090797          	auipc	a5,0x90
8040a454:	3fc7a783          	lw	a5,1020(a5) # 8049a84c <current>
8040a458:	02878663          	beq	a5,s0,8040a484 <wakeup_proc+0x74>
8040a45c:	00090797          	auipc	a5,0x90
8040a460:	3f47a783          	lw	a5,1012(a5) # 8049a850 <idleproc>
8040a464:	02f40063          	beq	s0,a5,8040a484 <wakeup_proc+0x74>
8040a468:	00090797          	auipc	a5,0x90
8040a46c:	4007a783          	lw	a5,1024(a5) # 8049a868 <sched_class>
8040a470:	0087a783          	lw	a5,8(a5)
8040a474:	00040593          	mv	a1,s0
8040a478:	00090517          	auipc	a0,0x90
8040a47c:	3ec52503          	lw	a0,1004(a0) # 8049a864 <rq>
8040a480:	000780e7          	jalr	a5
8040a484:	00049c63          	bnez	s1,8040a49c <wakeup_proc+0x8c>
8040a488:	00c12083          	lw	ra,12(sp)
8040a48c:	00812403          	lw	s0,8(sp)
8040a490:	00412483          	lw	s1,4(sp)
8040a494:	01010113          	addi	sp,sp,16
8040a498:	00008067          	ret
8040a49c:	00812403          	lw	s0,8(sp)
8040a4a0:	00c12083          	lw	ra,12(sp)
8040a4a4:	00412483          	lw	s1,4(sp)
8040a4a8:	01010113          	addi	sp,sp,16
8040a4ac:	8c5f606f          	j	80400d70 <intr_enable>
8040a4b0:	00009617          	auipc	a2,0x9
8040a4b4:	dd860613          	addi	a2,a2,-552 # 80413288 <CSWTCH.81+0x558>
8040a4b8:	04800593          	li	a1,72
8040a4bc:	00009517          	auipc	a0,0x9
8040a4c0:	db450513          	addi	a0,a0,-588 # 80413270 <CSWTCH.81+0x540>
8040a4c4:	e89f50ef          	jal	ra,8040034c <__warn>
8040a4c8:	fbdff06f          	j	8040a484 <wakeup_proc+0x74>
8040a4cc:	8adf60ef          	jal	ra,80400d78 <intr_disable>
8040a4d0:	00042703          	lw	a4,0(s0)
8040a4d4:	00100493          	li	s1,1
8040a4d8:	f69ff06f          	j	8040a440 <wakeup_proc+0x30>
8040a4dc:	00009697          	auipc	a3,0x9
8040a4e0:	d7868693          	addi	a3,a3,-648 # 80413254 <CSWTCH.81+0x524>
8040a4e4:	00006617          	auipc	a2,0x6
8040a4e8:	7dc60613          	addi	a2,a2,2012 # 80410cc0 <commands+0x3c>
8040a4ec:	03c00593          	li	a1,60
8040a4f0:	00009517          	auipc	a0,0x9
8040a4f4:	d8050513          	addi	a0,a0,-640 # 80413270 <CSWTCH.81+0x540>
8040a4f8:	dd5f50ef          	jal	ra,804002cc <__panic>

8040a4fc <schedule>:
8040a4fc:	fe010113          	addi	sp,sp,-32
8040a500:	00112e23          	sw	ra,28(sp)
8040a504:	00812c23          	sw	s0,24(sp)
8040a508:	00912a23          	sw	s1,20(sp)
8040a50c:	01212823          	sw	s2,16(sp)
8040a510:	01312623          	sw	s3,12(sp)
8040a514:	01412423          	sw	s4,8(sp)
8040a518:	100027f3          	csrr	a5,sstatus
8040a51c:	0027f793          	andi	a5,a5,2
8040a520:	00000a13          	li	s4,0
8040a524:	0e079463          	bnez	a5,8040a60c <schedule+0x110>
8040a528:	00090497          	auipc	s1,0x90
8040a52c:	32448493          	addi	s1,s1,804 # 8049a84c <current>
8040a530:	0004a583          	lw	a1,0(s1)
8040a534:	00090997          	auipc	s3,0x90
8040a538:	33498993          	addi	s3,s3,820 # 8049a868 <sched_class>
8040a53c:	00090917          	auipc	s2,0x90
8040a540:	32890913          	addi	s2,s2,808 # 8049a864 <rq>
8040a544:	0005a683          	lw	a3,0(a1)
8040a548:	0005a823          	sw	zero,16(a1)
8040a54c:	00200713          	li	a4,2
8040a550:	0009a783          	lw	a5,0(s3)
8040a554:	00092503          	lw	a0,0(s2)
8040a558:	08e68a63          	beq	a3,a4,8040a5ec <schedule+0xf0>
8040a55c:	0107a783          	lw	a5,16(a5)
8040a560:	000780e7          	jalr	a5
8040a564:	00050413          	mv	s0,a0
8040a568:	06050c63          	beqz	a0,8040a5e0 <schedule+0xe4>
8040a56c:	0009a783          	lw	a5,0(s3)
8040a570:	00092503          	lw	a0,0(s2)
8040a574:	00040593          	mv	a1,s0
8040a578:	00c7a783          	lw	a5,12(a5)
8040a57c:	000780e7          	jalr	a5
8040a580:	00842783          	lw	a5,8(s0)
8040a584:	0004a703          	lw	a4,0(s1)
8040a588:	00178793          	addi	a5,a5,1
8040a58c:	00f42423          	sw	a5,8(s0)
8040a590:	00870663          	beq	a4,s0,8040a59c <schedule+0xa0>
8040a594:	00040513          	mv	a0,s0
8040a598:	bb0fe0ef          	jal	ra,80408948 <proc_run>
8040a59c:	020a1263          	bnez	s4,8040a5c0 <schedule+0xc4>
8040a5a0:	01c12083          	lw	ra,28(sp)
8040a5a4:	01812403          	lw	s0,24(sp)
8040a5a8:	01412483          	lw	s1,20(sp)
8040a5ac:	01012903          	lw	s2,16(sp)
8040a5b0:	00c12983          	lw	s3,12(sp)
8040a5b4:	00812a03          	lw	s4,8(sp)
8040a5b8:	02010113          	addi	sp,sp,32
8040a5bc:	00008067          	ret
8040a5c0:	01812403          	lw	s0,24(sp)
8040a5c4:	01c12083          	lw	ra,28(sp)
8040a5c8:	01412483          	lw	s1,20(sp)
8040a5cc:	01012903          	lw	s2,16(sp)
8040a5d0:	00c12983          	lw	s3,12(sp)
8040a5d4:	00812a03          	lw	s4,8(sp)
8040a5d8:	02010113          	addi	sp,sp,32
8040a5dc:	f94f606f          	j	80400d70 <intr_enable>
8040a5e0:	00090417          	auipc	s0,0x90
8040a5e4:	27042403          	lw	s0,624(s0) # 8049a850 <idleproc>
8040a5e8:	f99ff06f          	j	8040a580 <schedule+0x84>
8040a5ec:	00090717          	auipc	a4,0x90
8040a5f0:	26472703          	lw	a4,612(a4) # 8049a850 <idleproc>
8040a5f4:	f6e584e3          	beq	a1,a4,8040a55c <schedule+0x60>
8040a5f8:	0087a783          	lw	a5,8(a5)
8040a5fc:	000780e7          	jalr	a5
8040a600:	0009a783          	lw	a5,0(s3)
8040a604:	00092503          	lw	a0,0(s2)
8040a608:	f55ff06f          	j	8040a55c <schedule+0x60>
8040a60c:	f6cf60ef          	jal	ra,80400d78 <intr_disable>
8040a610:	00100a13          	li	s4,1
8040a614:	f15ff06f          	j	8040a528 <schedule+0x2c>

8040a618 <add_timer>:
8040a618:	ff010113          	addi	sp,sp,-16
8040a61c:	00812423          	sw	s0,8(sp)
8040a620:	00112623          	sw	ra,12(sp)
8040a624:	00050413          	mv	s0,a0
8040a628:	100027f3          	csrr	a5,sstatus
8040a62c:	0027f793          	andi	a5,a5,2
8040a630:	00000513          	li	a0,0
8040a634:	0a079663          	bnez	a5,8040a6e0 <add_timer+0xc8>
8040a638:	00042703          	lw	a4,0(s0)
8040a63c:	0a070863          	beqz	a4,8040a6ec <add_timer+0xd4>
8040a640:	00442783          	lw	a5,4(s0)
8040a644:	0a078463          	beqz	a5,8040a6ec <add_timer+0xd4>
8040a648:	00c42783          	lw	a5,12(s0)
8040a64c:	00840593          	addi	a1,s0,8
8040a650:	0af59e63          	bne	a1,a5,8040a70c <add_timer+0xf4>
8040a654:	00090617          	auipc	a2,0x90
8040a658:	21860613          	addi	a2,a2,536 # 8049a86c <timer_list>
8040a65c:	00462783          	lw	a5,4(a2)
8040a660:	00c79c63          	bne	a5,a2,8040a678 <add_timer+0x60>
8040a664:	04c0006f          	j	8040a6b0 <add_timer+0x98>
8040a668:	0047a783          	lw	a5,4(a5)
8040a66c:	40d70733          	sub	a4,a4,a3
8040a670:	00e42023          	sw	a4,0(s0)
8040a674:	02c78e63          	beq	a5,a2,8040a6b0 <add_timer+0x98>
8040a678:	ff87a683          	lw	a3,-8(a5)
8040a67c:	fed776e3          	bgeu	a4,a3,8040a668 <add_timer+0x50>
8040a680:	40e68733          	sub	a4,a3,a4
8040a684:	fee7ac23          	sw	a4,-8(a5)
8040a688:	0007a703          	lw	a4,0(a5)
8040a68c:	00b7a023          	sw	a1,0(a5)
8040a690:	00b72223          	sw	a1,4(a4)
8040a694:	00f42623          	sw	a5,12(s0)
8040a698:	00e42423          	sw	a4,8(s0)
8040a69c:	02050a63          	beqz	a0,8040a6d0 <add_timer+0xb8>
8040a6a0:	00812403          	lw	s0,8(sp)
8040a6a4:	00c12083          	lw	ra,12(sp)
8040a6a8:	01010113          	addi	sp,sp,16
8040a6ac:	ec4f606f          	j	80400d70 <intr_enable>
8040a6b0:	00090797          	auipc	a5,0x90
8040a6b4:	1bc78793          	addi	a5,a5,444 # 8049a86c <timer_list>
8040a6b8:	0007a703          	lw	a4,0(a5)
8040a6bc:	00b7a023          	sw	a1,0(a5)
8040a6c0:	00b72223          	sw	a1,4(a4)
8040a6c4:	00f42623          	sw	a5,12(s0)
8040a6c8:	00e42423          	sw	a4,8(s0)
8040a6cc:	fc051ae3          	bnez	a0,8040a6a0 <add_timer+0x88>
8040a6d0:	00c12083          	lw	ra,12(sp)
8040a6d4:	00812403          	lw	s0,8(sp)
8040a6d8:	01010113          	addi	sp,sp,16
8040a6dc:	00008067          	ret
8040a6e0:	e98f60ef          	jal	ra,80400d78 <intr_disable>
8040a6e4:	00100513          	li	a0,1
8040a6e8:	f51ff06f          	j	8040a638 <add_timer+0x20>
8040a6ec:	00009697          	auipc	a3,0x9
8040a6f0:	bb868693          	addi	a3,a3,-1096 # 804132a4 <CSWTCH.81+0x574>
8040a6f4:	00006617          	auipc	a2,0x6
8040a6f8:	5cc60613          	addi	a2,a2,1484 # 80410cc0 <commands+0x3c>
8040a6fc:	06b00593          	li	a1,107
8040a700:	00009517          	auipc	a0,0x9
8040a704:	b7050513          	addi	a0,a0,-1168 # 80413270 <CSWTCH.81+0x540>
8040a708:	bc5f50ef          	jal	ra,804002cc <__panic>
8040a70c:	00009697          	auipc	a3,0x9
8040a710:	bc468693          	addi	a3,a3,-1084 # 804132d0 <CSWTCH.81+0x5a0>
8040a714:	00006617          	auipc	a2,0x6
8040a718:	5ac60613          	addi	a2,a2,1452 # 80410cc0 <commands+0x3c>
8040a71c:	06c00593          	li	a1,108
8040a720:	00009517          	auipc	a0,0x9
8040a724:	b5050513          	addi	a0,a0,-1200 # 80413270 <CSWTCH.81+0x540>
8040a728:	ba5f50ef          	jal	ra,804002cc <__panic>

8040a72c <del_timer>:
8040a72c:	ff010113          	addi	sp,sp,-16
8040a730:	00812423          	sw	s0,8(sp)
8040a734:	00112623          	sw	ra,12(sp)
8040a738:	00912223          	sw	s1,4(sp)
8040a73c:	00050413          	mv	s0,a0
8040a740:	100027f3          	csrr	a5,sstatus
8040a744:	0027f793          	andi	a5,a5,2
8040a748:	00850493          	addi	s1,a0,8
8040a74c:	04079a63          	bnez	a5,8040a7a0 <del_timer+0x74>
8040a750:	00c52783          	lw	a5,12(a0)
8040a754:	02978c63          	beq	a5,s1,8040a78c <del_timer+0x60>
8040a758:	00052683          	lw	a3,0(a0)
8040a75c:	00852703          	lw	a4,8(a0)
8040a760:	00068e63          	beqz	a3,8040a77c <del_timer+0x50>
8040a764:	00090617          	auipc	a2,0x90
8040a768:	10860613          	addi	a2,a2,264 # 8049a86c <timer_list>
8040a76c:	00c78863          	beq	a5,a2,8040a77c <del_timer+0x50>
8040a770:	ff87a603          	lw	a2,-8(a5)
8040a774:	00d606b3          	add	a3,a2,a3
8040a778:	fed7ac23          	sw	a3,-8(a5)
8040a77c:	00f72223          	sw	a5,4(a4)
8040a780:	00e7a023          	sw	a4,0(a5)
8040a784:	00942623          	sw	s1,12(s0)
8040a788:	00942423          	sw	s1,8(s0)
8040a78c:	00c12083          	lw	ra,12(sp)
8040a790:	00812403          	lw	s0,8(sp)
8040a794:	00412483          	lw	s1,4(sp)
8040a798:	01010113          	addi	sp,sp,16
8040a79c:	00008067          	ret
8040a7a0:	dd8f60ef          	jal	ra,80400d78 <intr_disable>
8040a7a4:	00c42783          	lw	a5,12(s0)
8040a7a8:	02978c63          	beq	a5,s1,8040a7e0 <del_timer+0xb4>
8040a7ac:	00042683          	lw	a3,0(s0)
8040a7b0:	00842703          	lw	a4,8(s0)
8040a7b4:	00068e63          	beqz	a3,8040a7d0 <del_timer+0xa4>
8040a7b8:	00090617          	auipc	a2,0x90
8040a7bc:	0b460613          	addi	a2,a2,180 # 8049a86c <timer_list>
8040a7c0:	00c78863          	beq	a5,a2,8040a7d0 <del_timer+0xa4>
8040a7c4:	ff87a603          	lw	a2,-8(a5)
8040a7c8:	00d606b3          	add	a3,a2,a3
8040a7cc:	fed7ac23          	sw	a3,-8(a5)
8040a7d0:	00f72223          	sw	a5,4(a4)
8040a7d4:	00e7a023          	sw	a4,0(a5)
8040a7d8:	00942623          	sw	s1,12(s0)
8040a7dc:	00942423          	sw	s1,8(s0)
8040a7e0:	00812403          	lw	s0,8(sp)
8040a7e4:	00c12083          	lw	ra,12(sp)
8040a7e8:	00412483          	lw	s1,4(sp)
8040a7ec:	01010113          	addi	sp,sp,16
8040a7f0:	d80f606f          	j	80400d70 <intr_enable>

8040a7f4 <run_timer_list>:
8040a7f4:	fe010113          	addi	sp,sp,-32
8040a7f8:	00112e23          	sw	ra,28(sp)
8040a7fc:	00812c23          	sw	s0,24(sp)
8040a800:	00912a23          	sw	s1,20(sp)
8040a804:	01212823          	sw	s2,16(sp)
8040a808:	01312623          	sw	s3,12(sp)
8040a80c:	01412423          	sw	s4,8(sp)
8040a810:	01512223          	sw	s5,4(sp)
8040a814:	01612023          	sw	s6,0(sp)
8040a818:	100027f3          	csrr	a5,sstatus
8040a81c:	0027f793          	andi	a5,a5,2
8040a820:	00000b13          	li	s6,0
8040a824:	12079463          	bnez	a5,8040a94c <run_timer_list+0x158>
8040a828:	00090997          	auipc	s3,0x90
8040a82c:	04498993          	addi	s3,s3,68 # 8049a86c <timer_list>
8040a830:	0049a403          	lw	s0,4(s3)
8040a834:	09340663          	beq	s0,s3,8040a8c0 <run_timer_list+0xcc>
8040a838:	ff842783          	lw	a5,-8(s0)
8040a83c:	ff840913          	addi	s2,s0,-8
8040a840:	12078c63          	beqz	a5,8040a978 <run_timer_list+0x184>
8040a844:	fff78793          	addi	a5,a5,-1
8040a848:	fef42c23          	sw	a5,-8(s0)
8040a84c:	06079a63          	bnez	a5,8040a8c0 <run_timer_list+0xcc>
8040a850:	00009a97          	auipc	s5,0x9
8040a854:	adca8a93          	addi	s5,s5,-1316 # 8041332c <CSWTCH.81+0x5fc>
8040a858:	00009a17          	auipc	s4,0x9
8040a85c:	a18a0a13          	addi	s4,s4,-1512 # 80413270 <CSWTCH.81+0x540>
8040a860:	0280006f          	j	8040a888 <run_timer_list+0x94>
8040a864:	0e07da63          	bgez	a5,8040a958 <run_timer_list+0x164>
8040a868:	00048513          	mv	a0,s1
8040a86c:	ba5ff0ef          	jal	ra,8040a410 <wakeup_proc>
8040a870:	00090513          	mv	a0,s2
8040a874:	eb9ff0ef          	jal	ra,8040a72c <del_timer>
8040a878:	05340463          	beq	s0,s3,8040a8c0 <run_timer_list+0xcc>
8040a87c:	ff842783          	lw	a5,-8(s0)
8040a880:	ff840913          	addi	s2,s0,-8
8040a884:	02079e63          	bnez	a5,8040a8c0 <run_timer_list+0xcc>
8040a888:	00492483          	lw	s1,4(s2)
8040a88c:	00442403          	lw	s0,4(s0)
8040a890:	0a84a783          	lw	a5,168(s1)
8040a894:	fc0798e3          	bnez	a5,8040a864 <run_timer_list+0x70>
8040a898:	0044a683          	lw	a3,4(s1)
8040a89c:	000a8613          	mv	a2,s5
8040a8a0:	0a200593          	li	a1,162
8040a8a4:	000a0513          	mv	a0,s4
8040a8a8:	aa5f50ef          	jal	ra,8040034c <__warn>
8040a8ac:	00048513          	mv	a0,s1
8040a8b0:	b61ff0ef          	jal	ra,8040a410 <wakeup_proc>
8040a8b4:	00090513          	mv	a0,s2
8040a8b8:	e75ff0ef          	jal	ra,8040a72c <del_timer>
8040a8bc:	fd3410e3          	bne	s0,s3,8040a87c <run_timer_list+0x88>
8040a8c0:	00090597          	auipc	a1,0x90
8040a8c4:	f8c5a583          	lw	a1,-116(a1) # 8049a84c <current>
8040a8c8:	00090797          	auipc	a5,0x90
8040a8cc:	f887a783          	lw	a5,-120(a5) # 8049a850 <idleproc>
8040a8d0:	06f58863          	beq	a1,a5,8040a940 <run_timer_list+0x14c>
8040a8d4:	00090797          	auipc	a5,0x90
8040a8d8:	f947a783          	lw	a5,-108(a5) # 8049a868 <sched_class>
8040a8dc:	0147a783          	lw	a5,20(a5)
8040a8e0:	00090517          	auipc	a0,0x90
8040a8e4:	f8452503          	lw	a0,-124(a0) # 8049a864 <rq>
8040a8e8:	000780e7          	jalr	a5
8040a8ec:	020b1663          	bnez	s6,8040a918 <run_timer_list+0x124>
8040a8f0:	01c12083          	lw	ra,28(sp)
8040a8f4:	01812403          	lw	s0,24(sp)
8040a8f8:	01412483          	lw	s1,20(sp)
8040a8fc:	01012903          	lw	s2,16(sp)
8040a900:	00c12983          	lw	s3,12(sp)
8040a904:	00812a03          	lw	s4,8(sp)
8040a908:	00412a83          	lw	s5,4(sp)
8040a90c:	00012b03          	lw	s6,0(sp)
8040a910:	02010113          	addi	sp,sp,32
8040a914:	00008067          	ret
8040a918:	01812403          	lw	s0,24(sp)
8040a91c:	01c12083          	lw	ra,28(sp)
8040a920:	01412483          	lw	s1,20(sp)
8040a924:	01012903          	lw	s2,16(sp)
8040a928:	00c12983          	lw	s3,12(sp)
8040a92c:	00812a03          	lw	s4,8(sp)
8040a930:	00412a83          	lw	s5,4(sp)
8040a934:	00012b03          	lw	s6,0(sp)
8040a938:	02010113          	addi	sp,sp,32
8040a93c:	c34f606f          	j	80400d70 <intr_enable>
8040a940:	00100793          	li	a5,1
8040a944:	00f5a823          	sw	a5,16(a1)
8040a948:	fa5ff06f          	j	8040a8ec <run_timer_list+0xf8>
8040a94c:	c2cf60ef          	jal	ra,80400d78 <intr_disable>
8040a950:	00100b13          	li	s6,1
8040a954:	ed5ff06f          	j	8040a828 <run_timer_list+0x34>
8040a958:	00009697          	auipc	a3,0x9
8040a95c:	9b068693          	addi	a3,a3,-1616 # 80413308 <CSWTCH.81+0x5d8>
8040a960:	00006617          	auipc	a2,0x6
8040a964:	36060613          	addi	a2,a2,864 # 80410cc0 <commands+0x3c>
8040a968:	09f00593          	li	a1,159
8040a96c:	00009517          	auipc	a0,0x9
8040a970:	90450513          	addi	a0,a0,-1788 # 80413270 <CSWTCH.81+0x540>
8040a974:	959f50ef          	jal	ra,804002cc <__panic>
8040a978:	00009697          	auipc	a3,0x9
8040a97c:	97c68693          	addi	a3,a3,-1668 # 804132f4 <CSWTCH.81+0x5c4>
8040a980:	00006617          	auipc	a2,0x6
8040a984:	34060613          	addi	a2,a2,832 # 80410cc0 <commands+0x3c>
8040a988:	09900593          	li	a1,153
8040a98c:	00009517          	auipc	a0,0x9
8040a990:	8e450513          	addi	a0,a0,-1820 # 80413270 <CSWTCH.81+0x540>
8040a994:	939f50ef          	jal	ra,804002cc <__panic>

8040a998 <stride_init>:
8040a998:	00a52223          	sw	a0,4(a0)
8040a99c:	00a52023          	sw	a0,0(a0)
8040a9a0:	00052823          	sw	zero,16(a0)
8040a9a4:	00052423          	sw	zero,8(a0)
8040a9a8:	00008067          	ret

8040a9ac <stride_pick_next>:
8040a9ac:	ff010113          	addi	sp,sp,-16
8040a9b0:	00812423          	sw	s0,8(sp)
8040a9b4:	01052403          	lw	s0,16(a0)
8040a9b8:	00112623          	sw	ra,12(sp)
8040a9bc:	00912223          	sw	s1,4(sp)
8040a9c0:	01212023          	sw	s2,0(sp)
8040a9c4:	04040263          	beqz	s0,8040aa08 <stride_pick_next+0x5c>
8040a9c8:	01042583          	lw	a1,16(s0)
8040a9cc:	00c42483          	lw	s1,12(s0)
8040a9d0:	f3840913          	addi	s2,s0,-200
8040a9d4:	40000537          	lui	a0,0x40000
8040a9d8:	02059463          	bnez	a1,8040aa00 <stride_pick_next+0x54>
8040a9dc:	00a484b3          	add	s1,s1,a0
8040a9e0:	00942623          	sw	s1,12(s0)
8040a9e4:	00c12083          	lw	ra,12(sp)
8040a9e8:	00812403          	lw	s0,8(sp)
8040a9ec:	00412483          	lw	s1,4(sp)
8040a9f0:	00090513          	mv	a0,s2
8040a9f4:	00012903          	lw	s2,0(sp)
8040a9f8:	01010113          	addi	sp,sp,16
8040a9fc:	00008067          	ret
8040aa00:	76d050ef          	jal	ra,8041096c <__udivsi3>
8040aa04:	fd9ff06f          	j	8040a9dc <stride_pick_next+0x30>
8040aa08:	00000913          	li	s2,0
8040aa0c:	fd9ff06f          	j	8040a9e4 <stride_pick_next+0x38>

8040aa10 <stride_proc_tick>:
8040aa10:	0c45a783          	lw	a5,196(a1)
8040aa14:	00f05663          	blez	a5,8040aa20 <stride_proc_tick+0x10>
8040aa18:	fff78793          	addi	a5,a5,-1
8040aa1c:	0cf5a223          	sw	a5,196(a1)
8040aa20:	00079663          	bnez	a5,8040aa2c <stride_proc_tick+0x1c>
8040aa24:	00100793          	li	a5,1
8040aa28:	00f5a823          	sw	a5,16(a1)
8040aa2c:	00008067          	ret

8040aa30 <skew_heap_merge.constprop.0>:
8040aa30:	fe010113          	addi	sp,sp,-32
8040aa34:	00812c23          	sw	s0,24(sp)
8040aa38:	00112e23          	sw	ra,28(sp)
8040aa3c:	00912a23          	sw	s1,20(sp)
8040aa40:	01212823          	sw	s2,16(sp)
8040aa44:	01312623          	sw	s3,12(sp)
8040aa48:	01412423          	sw	s4,8(sp)
8040aa4c:	01512223          	sw	s5,4(sp)
8040aa50:	01612023          	sw	s6,0(sp)
8040aa54:	00058413          	mv	s0,a1
8040aa58:	08050263          	beqz	a0,8040aadc <skew_heap_merge.constprop.0+0xac>
8040aa5c:	00050493          	mv	s1,a0
8040aa60:	10058a63          	beqz	a1,8040ab74 <skew_heap_merge.constprop.0+0x144>
8040aa64:	00c52783          	lw	a5,12(a0) # 4000000c <_binary_bin_sfs_img_size+0x3ff8800c>
8040aa68:	00c5a703          	lw	a4,12(a1)
8040aa6c:	40e786b3          	sub	a3,a5,a4
8040aa70:	0806cc63          	bltz	a3,8040ab08 <skew_heap_merge.constprop.0+0xd8>
8040aa74:	0085a903          	lw	s2,8(a1)
8040aa78:	0045aa03          	lw	s4,4(a1)
8040aa7c:	04090a63          	beqz	s2,8040aad0 <skew_heap_merge.constprop.0+0xa0>
8040aa80:	00c92703          	lw	a4,12(s2)
8040aa84:	40e786b3          	sub	a3,a5,a4
8040aa88:	0e06ca63          	bltz	a3,8040ab7c <skew_heap_merge.constprop.0+0x14c>
8040aa8c:	00892983          	lw	s3,8(s2)
8040aa90:	00492a83          	lw	s5,4(s2)
8040aa94:	14098a63          	beqz	s3,8040abe8 <skew_heap_merge.constprop.0+0x1b8>
8040aa98:	00c9a703          	lw	a4,12(s3)
8040aa9c:	40e787b3          	sub	a5,a5,a4
8040aaa0:	1807ce63          	bltz	a5,8040ac3c <skew_heap_merge.constprop.0+0x20c>
8040aaa4:	0089a583          	lw	a1,8(s3)
8040aaa8:	0049a483          	lw	s1,4(s3)
8040aaac:	f85ff0ef          	jal	ra,8040aa30 <skew_heap_merge.constprop.0>
8040aab0:	00a9a223          	sw	a0,4(s3)
8040aab4:	0099a423          	sw	s1,8(s3)
8040aab8:	00050463          	beqz	a0,8040aac0 <skew_heap_merge.constprop.0+0x90>
8040aabc:	01352023          	sw	s3,0(a0)
8040aac0:	01392223          	sw	s3,4(s2)
8040aac4:	01592423          	sw	s5,8(s2)
8040aac8:	0129a023          	sw	s2,0(s3)
8040aacc:	00090493          	mv	s1,s2
8040aad0:	00942223          	sw	s1,4(s0)
8040aad4:	01442423          	sw	s4,8(s0)
8040aad8:	0084a023          	sw	s0,0(s1)
8040aadc:	00040513          	mv	a0,s0
8040aae0:	01c12083          	lw	ra,28(sp)
8040aae4:	01812403          	lw	s0,24(sp)
8040aae8:	01412483          	lw	s1,20(sp)
8040aaec:	01012903          	lw	s2,16(sp)
8040aaf0:	00c12983          	lw	s3,12(sp)
8040aaf4:	00812a03          	lw	s4,8(sp)
8040aaf8:	00412a83          	lw	s5,4(sp)
8040aafc:	00012b03          	lw	s6,0(sp)
8040ab00:	02010113          	addi	sp,sp,32
8040ab04:	00008067          	ret
8040ab08:	00852903          	lw	s2,8(a0)
8040ab0c:	00452a03          	lw	s4,4(a0)
8040ab10:	04090c63          	beqz	s2,8040ab68 <skew_heap_merge.constprop.0+0x138>
8040ab14:	00c92783          	lw	a5,12(s2)
8040ab18:	40e78733          	sub	a4,a5,a4
8040ab1c:	0a074463          	bltz	a4,8040abc4 <skew_heap_merge.constprop.0+0x194>
8040ab20:	0085a983          	lw	s3,8(a1)
8040ab24:	0045aa83          	lw	s5,4(a1)
8040ab28:	02098a63          	beqz	s3,8040ab5c <skew_heap_merge.constprop.0+0x12c>
8040ab2c:	00c9a703          	lw	a4,12(s3)
8040ab30:	40e787b3          	sub	a5,a5,a4
8040ab34:	0e07c263          	bltz	a5,8040ac18 <skew_heap_merge.constprop.0+0x1e8>
8040ab38:	0089a583          	lw	a1,8(s3)
8040ab3c:	0049ab03          	lw	s6,4(s3)
8040ab40:	00090513          	mv	a0,s2
8040ab44:	eedff0ef          	jal	ra,8040aa30 <skew_heap_merge.constprop.0>
8040ab48:	00a9a223          	sw	a0,4(s3)
8040ab4c:	0169a423          	sw	s6,8(s3)
8040ab50:	00098913          	mv	s2,s3
8040ab54:	00050463          	beqz	a0,8040ab5c <skew_heap_merge.constprop.0+0x12c>
8040ab58:	01252023          	sw	s2,0(a0)
8040ab5c:	01242223          	sw	s2,4(s0)
8040ab60:	01542423          	sw	s5,8(s0)
8040ab64:	00892023          	sw	s0,0(s2)
8040ab68:	0084a223          	sw	s0,4(s1)
8040ab6c:	0144a423          	sw	s4,8(s1)
8040ab70:	00942023          	sw	s1,0(s0)
8040ab74:	00048513          	mv	a0,s1
8040ab78:	f69ff06f          	j	8040aae0 <skew_heap_merge.constprop.0+0xb0>
8040ab7c:	00852983          	lw	s3,8(a0)
8040ab80:	00452a83          	lw	s5,4(a0)
8040ab84:	02098863          	beqz	s3,8040abb4 <skew_heap_merge.constprop.0+0x184>
8040ab88:	00c9a783          	lw	a5,12(s3)
8040ab8c:	40e78733          	sub	a4,a5,a4
8040ab90:	06074063          	bltz	a4,8040abf0 <skew_heap_merge.constprop.0+0x1c0>
8040ab94:	00892583          	lw	a1,8(s2)
8040ab98:	00492b03          	lw	s6,4(s2)
8040ab9c:	00098513          	mv	a0,s3
8040aba0:	e91ff0ef          	jal	ra,8040aa30 <skew_heap_merge.constprop.0>
8040aba4:	00a92223          	sw	a0,4(s2)
8040aba8:	01692423          	sw	s6,8(s2)
8040abac:	00050463          	beqz	a0,8040abb4 <skew_heap_merge.constprop.0+0x184>
8040abb0:	01252023          	sw	s2,0(a0)
8040abb4:	0124a223          	sw	s2,4(s1)
8040abb8:	0154a423          	sw	s5,8(s1)
8040abbc:	00992023          	sw	s1,0(s2)
8040abc0:	f11ff06f          	j	8040aad0 <skew_heap_merge.constprop.0+0xa0>
8040abc4:	00892503          	lw	a0,8(s2)
8040abc8:	00492983          	lw	s3,4(s2)
8040abcc:	00090413          	mv	s0,s2
8040abd0:	e61ff0ef          	jal	ra,8040aa30 <skew_heap_merge.constprop.0>
8040abd4:	00a92223          	sw	a0,4(s2)
8040abd8:	01392423          	sw	s3,8(s2)
8040abdc:	f80506e3          	beqz	a0,8040ab68 <skew_heap_merge.constprop.0+0x138>
8040abe0:	01252023          	sw	s2,0(a0)
8040abe4:	f85ff06f          	j	8040ab68 <skew_heap_merge.constprop.0+0x138>
8040abe8:	00048993          	mv	s3,s1
8040abec:	ed5ff06f          	j	8040aac0 <skew_heap_merge.constprop.0+0x90>
8040abf0:	0089a503          	lw	a0,8(s3)
8040abf4:	0049ab03          	lw	s6,4(s3)
8040abf8:	00090593          	mv	a1,s2
8040abfc:	e35ff0ef          	jal	ra,8040aa30 <skew_heap_merge.constprop.0>
8040ac00:	00a9a223          	sw	a0,4(s3)
8040ac04:	0169a423          	sw	s6,8(s3)
8040ac08:	00098913          	mv	s2,s3
8040ac0c:	fa0504e3          	beqz	a0,8040abb4 <skew_heap_merge.constprop.0+0x184>
8040ac10:	01252023          	sw	s2,0(a0)
8040ac14:	fa1ff06f          	j	8040abb4 <skew_heap_merge.constprop.0+0x184>
8040ac18:	00892503          	lw	a0,8(s2)
8040ac1c:	00492b03          	lw	s6,4(s2)
8040ac20:	00098593          	mv	a1,s3
8040ac24:	e0dff0ef          	jal	ra,8040aa30 <skew_heap_merge.constprop.0>
8040ac28:	00a92223          	sw	a0,4(s2)
8040ac2c:	01692423          	sw	s6,8(s2)
8040ac30:	f20506e3          	beqz	a0,8040ab5c <skew_heap_merge.constprop.0+0x12c>
8040ac34:	01252023          	sw	s2,0(a0)
8040ac38:	f25ff06f          	j	8040ab5c <skew_heap_merge.constprop.0+0x12c>
8040ac3c:	00852503          	lw	a0,8(a0)
8040ac40:	0044ab03          	lw	s6,4(s1)
8040ac44:	00098593          	mv	a1,s3
8040ac48:	de9ff0ef          	jal	ra,8040aa30 <skew_heap_merge.constprop.0>
8040ac4c:	00a4a223          	sw	a0,4(s1)
8040ac50:	0164a423          	sw	s6,8(s1)
8040ac54:	f8050ae3          	beqz	a0,8040abe8 <skew_heap_merge.constprop.0+0x1b8>
8040ac58:	00952023          	sw	s1,0(a0)
8040ac5c:	00048993          	mv	s3,s1
8040ac60:	e61ff06f          	j	8040aac0 <skew_heap_merge.constprop.0+0x90>

8040ac64 <stride_enqueue>:
8040ac64:	fe010113          	addi	sp,sp,-32
8040ac68:	01212823          	sw	s2,16(sp)
8040ac6c:	01052903          	lw	s2,16(a0)
8040ac70:	00812c23          	sw	s0,24(sp)
8040ac74:	00912a23          	sw	s1,20(sp)
8040ac78:	00112e23          	sw	ra,28(sp)
8040ac7c:	01312623          	sw	s3,12(sp)
8040ac80:	01412423          	sw	s4,8(sp)
8040ac84:	01512223          	sw	s5,4(sp)
8040ac88:	0c05a423          	sw	zero,200(a1)
8040ac8c:	0c05a823          	sw	zero,208(a1)
8040ac90:	0c05a623          	sw	zero,204(a1)
8040ac94:	00058413          	mv	s0,a1
8040ac98:	00050493          	mv	s1,a0
8040ac9c:	0c858593          	addi	a1,a1,200
8040aca0:	00090e63          	beqz	s2,8040acbc <stride_enqueue+0x58>
8040aca4:	0d442703          	lw	a4,212(s0)
8040aca8:	00c92783          	lw	a5,12(s2)
8040acac:	40e787b3          	sub	a5,a5,a4
8040acb0:	0407cc63          	bltz	a5,8040ad08 <stride_enqueue+0xa4>
8040acb4:	0d242623          	sw	s2,204(s0)
8040acb8:	00b92023          	sw	a1,0(s2)
8040acbc:	0c442783          	lw	a5,196(s0)
8040acc0:	00b4a823          	sw	a1,16(s1)
8040acc4:	00c4a703          	lw	a4,12(s1)
8040acc8:	00078463          	beqz	a5,8040acd0 <stride_enqueue+0x6c>
8040accc:	00f75463          	bge	a4,a5,8040acd4 <stride_enqueue+0x70>
8040acd0:	0ce42223          	sw	a4,196(s0)
8040acd4:	0084a783          	lw	a5,8(s1)
8040acd8:	01c12083          	lw	ra,28(sp)
8040acdc:	0a942c23          	sw	s1,184(s0)
8040ace0:	01812403          	lw	s0,24(sp)
8040ace4:	00178793          	addi	a5,a5,1
8040ace8:	00f4a423          	sw	a5,8(s1)
8040acec:	01012903          	lw	s2,16(sp)
8040acf0:	01412483          	lw	s1,20(sp)
8040acf4:	00c12983          	lw	s3,12(sp)
8040acf8:	00812a03          	lw	s4,8(sp)
8040acfc:	00412a83          	lw	s5,4(sp)
8040ad00:	02010113          	addi	sp,sp,32
8040ad04:	00008067          	ret
8040ad08:	00892983          	lw	s3,8(s2)
8040ad0c:	00492a03          	lw	s4,4(s2)
8040ad10:	00098c63          	beqz	s3,8040ad28 <stride_enqueue+0xc4>
8040ad14:	00c9a783          	lw	a5,12(s3)
8040ad18:	40e78733          	sub	a4,a5,a4
8040ad1c:	02074063          	bltz	a4,8040ad3c <stride_enqueue+0xd8>
8040ad20:	0d342623          	sw	s3,204(s0)
8040ad24:	00b9a023          	sw	a1,0(s3)
8040ad28:	00b92223          	sw	a1,4(s2)
8040ad2c:	01492423          	sw	s4,8(s2)
8040ad30:	0125a023          	sw	s2,0(a1)
8040ad34:	00090593          	mv	a1,s2
8040ad38:	f85ff06f          	j	8040acbc <stride_enqueue+0x58>
8040ad3c:	0089a503          	lw	a0,8(s3)
8040ad40:	0049aa83          	lw	s5,4(s3)
8040ad44:	cedff0ef          	jal	ra,8040aa30 <skew_heap_merge.constprop.0>
8040ad48:	00a9a223          	sw	a0,4(s3)
8040ad4c:	0159a423          	sw	s5,8(s3)
8040ad50:	00098593          	mv	a1,s3
8040ad54:	fc050ae3          	beqz	a0,8040ad28 <stride_enqueue+0xc4>
8040ad58:	01352023          	sw	s3,0(a0)
8040ad5c:	fcdff06f          	j	8040ad28 <stride_enqueue+0xc4>

8040ad60 <stride_dequeue>:
8040ad60:	0b85a783          	lw	a5,184(a1)
8040ad64:	fd010113          	addi	sp,sp,-48
8040ad68:	02112623          	sw	ra,44(sp)
8040ad6c:	02812423          	sw	s0,40(sp)
8040ad70:	02912223          	sw	s1,36(sp)
8040ad74:	03212023          	sw	s2,32(sp)
8040ad78:	01312e23          	sw	s3,28(sp)
8040ad7c:	01412c23          	sw	s4,24(sp)
8040ad80:	01512a23          	sw	s5,20(sp)
8040ad84:	01612823          	sw	s6,16(sp)
8040ad88:	01712623          	sw	s7,12(sp)
8040ad8c:	01812423          	sw	s8,8(sp)
8040ad90:	01912223          	sw	s9,4(sp)
8040ad94:	01a12023          	sw	s10,0(sp)
8040ad98:	2aa79063          	bne	a5,a0,8040b038 <stride_dequeue+0x2d8>
8040ad9c:	00852783          	lw	a5,8(a0)
8040ada0:	00050b13          	mv	s6,a0
8040ada4:	28078a63          	beqz	a5,8040b038 <stride_dequeue+0x2d8>
8040ada8:	0cc5a903          	lw	s2,204(a1)
8040adac:	01052a83          	lw	s5,16(a0)
8040adb0:	0c85aa03          	lw	s4,200(a1)
8040adb4:	0d05a483          	lw	s1,208(a1)
8040adb8:	00058413          	mv	s0,a1
8040adbc:	16090263          	beqz	s2,8040af20 <stride_dequeue+0x1c0>
8040adc0:	16048c63          	beqz	s1,8040af38 <stride_dequeue+0x1d8>
8040adc4:	00c92703          	lw	a4,12(s2)
8040adc8:	00c4a683          	lw	a3,12(s1)
8040adcc:	40d70633          	sub	a2,a4,a3
8040add0:	0c064a63          	bltz	a2,8040aea4 <stride_dequeue+0x144>
8040add4:	0084a983          	lw	s3,8(s1)
8040add8:	0044ac03          	lw	s8,4(s1)
8040addc:	06098063          	beqz	s3,8040ae3c <stride_dequeue+0xdc>
8040ade0:	00c9a683          	lw	a3,12(s3)
8040ade4:	40d70633          	sub	a2,a4,a3
8040ade8:	14064e63          	bltz	a2,8040af44 <stride_dequeue+0x1e4>
8040adec:	0089ab83          	lw	s7,8(s3)
8040adf0:	0049ac83          	lw	s9,4(s3)
8040adf4:	020b8c63          	beqz	s7,8040ae2c <stride_dequeue+0xcc>
8040adf8:	00cba783          	lw	a5,12(s7)
8040adfc:	40f70733          	sub	a4,a4,a5
8040ae00:	20074863          	bltz	a4,8040b010 <stride_dequeue+0x2b0>
8040ae04:	008ba583          	lw	a1,8(s7)
8040ae08:	004bad03          	lw	s10,4(s7)
8040ae0c:	00090513          	mv	a0,s2
8040ae10:	c21ff0ef          	jal	ra,8040aa30 <skew_heap_merge.constprop.0>
8040ae14:	00aba223          	sw	a0,4(s7)
8040ae18:	01aba423          	sw	s10,8(s7)
8040ae1c:	008b2783          	lw	a5,8(s6)
8040ae20:	00050463          	beqz	a0,8040ae28 <stride_dequeue+0xc8>
8040ae24:	01752023          	sw	s7,0(a0)
8040ae28:	000b8913          	mv	s2,s7
8040ae2c:	0129a223          	sw	s2,4(s3)
8040ae30:	0199a423          	sw	s9,8(s3)
8040ae34:	01392023          	sw	s3,0(s2)
8040ae38:	00098913          	mv	s2,s3
8040ae3c:	0124a223          	sw	s2,4(s1)
8040ae40:	0184a423          	sw	s8,8(s1)
8040ae44:	00992023          	sw	s1,0(s2)
8040ae48:	0144a023          	sw	s4,0(s1)
8040ae4c:	0c0a0e63          	beqz	s4,8040af28 <stride_dequeue+0x1c8>
8040ae50:	004a2703          	lw	a4,4(s4)
8040ae54:	0c840413          	addi	s0,s0,200
8040ae58:	0c870c63          	beq	a4,s0,8040af30 <stride_dequeue+0x1d0>
8040ae5c:	009a2423          	sw	s1,8(s4)
8040ae60:	02c12083          	lw	ra,44(sp)
8040ae64:	02812403          	lw	s0,40(sp)
8040ae68:	fff78793          	addi	a5,a5,-1
8040ae6c:	015b2823          	sw	s5,16(s6)
8040ae70:	00fb2423          	sw	a5,8(s6)
8040ae74:	02412483          	lw	s1,36(sp)
8040ae78:	02012903          	lw	s2,32(sp)
8040ae7c:	01c12983          	lw	s3,28(sp)
8040ae80:	01812a03          	lw	s4,24(sp)
8040ae84:	01412a83          	lw	s5,20(sp)
8040ae88:	01012b03          	lw	s6,16(sp)
8040ae8c:	00c12b83          	lw	s7,12(sp)
8040ae90:	00812c03          	lw	s8,8(sp)
8040ae94:	00412c83          	lw	s9,4(sp)
8040ae98:	00012d03          	lw	s10,0(sp)
8040ae9c:	03010113          	addi	sp,sp,48
8040aea0:	00008067          	ret
8040aea4:	00892983          	lw	s3,8(s2)
8040aea8:	00492c03          	lw	s8,4(s2)
8040aeac:	04098e63          	beqz	s3,8040af08 <stride_dequeue+0x1a8>
8040aeb0:	00c9a703          	lw	a4,12(s3)
8040aeb4:	40d706b3          	sub	a3,a4,a3
8040aeb8:	0c06cc63          	bltz	a3,8040af90 <stride_dequeue+0x230>
8040aebc:	0084ab83          	lw	s7,8(s1)
8040aec0:	0044ac83          	lw	s9,4(s1)
8040aec4:	020b8c63          	beqz	s7,8040aefc <stride_dequeue+0x19c>
8040aec8:	00cba783          	lw	a5,12(s7)
8040aecc:	40f70733          	sub	a4,a4,a5
8040aed0:	10074c63          	bltz	a4,8040afe8 <stride_dequeue+0x288>
8040aed4:	008ba583          	lw	a1,8(s7)
8040aed8:	004bad03          	lw	s10,4(s7)
8040aedc:	00098513          	mv	a0,s3
8040aee0:	b51ff0ef          	jal	ra,8040aa30 <skew_heap_merge.constprop.0>
8040aee4:	00aba223          	sw	a0,4(s7)
8040aee8:	01aba423          	sw	s10,8(s7)
8040aeec:	008b2783          	lw	a5,8(s6)
8040aef0:	00050463          	beqz	a0,8040aef8 <stride_dequeue+0x198>
8040aef4:	01752023          	sw	s7,0(a0)
8040aef8:	000b8993          	mv	s3,s7
8040aefc:	0134a223          	sw	s3,4(s1)
8040af00:	0194a423          	sw	s9,8(s1)
8040af04:	0099a023          	sw	s1,0(s3)
8040af08:	00992223          	sw	s1,4(s2)
8040af0c:	01892423          	sw	s8,8(s2)
8040af10:	0124a023          	sw	s2,0(s1)
8040af14:	00090493          	mv	s1,s2
8040af18:	0144a023          	sw	s4,0(s1)
8040af1c:	f31ff06f          	j	8040ae4c <stride_dequeue+0xec>
8040af20:	f20494e3          	bnez	s1,8040ae48 <stride_dequeue+0xe8>
8040af24:	f20a16e3          	bnez	s4,8040ae50 <stride_dequeue+0xf0>
8040af28:	00048a93          	mv	s5,s1
8040af2c:	f35ff06f          	j	8040ae60 <stride_dequeue+0x100>
8040af30:	009a2223          	sw	s1,4(s4)
8040af34:	f2dff06f          	j	8040ae60 <stride_dequeue+0x100>
8040af38:	00090493          	mv	s1,s2
8040af3c:	0144a023          	sw	s4,0(s1)
8040af40:	f0dff06f          	j	8040ae4c <stride_dequeue+0xec>
8040af44:	00892b83          	lw	s7,8(s2)
8040af48:	00492c83          	lw	s9,4(s2)
8040af4c:	020b8a63          	beqz	s7,8040af80 <stride_dequeue+0x220>
8040af50:	00cba783          	lw	a5,12(s7)
8040af54:	40d786b3          	sub	a3,a5,a3
8040af58:	0606c263          	bltz	a3,8040afbc <stride_dequeue+0x25c>
8040af5c:	0089a583          	lw	a1,8(s3)
8040af60:	0049ad03          	lw	s10,4(s3)
8040af64:	000b8513          	mv	a0,s7
8040af68:	ac9ff0ef          	jal	ra,8040aa30 <skew_heap_merge.constprop.0>
8040af6c:	00a9a223          	sw	a0,4(s3)
8040af70:	01a9a423          	sw	s10,8(s3)
8040af74:	008b2783          	lw	a5,8(s6)
8040af78:	00050463          	beqz	a0,8040af80 <stride_dequeue+0x220>
8040af7c:	01352023          	sw	s3,0(a0)
8040af80:	01392223          	sw	s3,4(s2)
8040af84:	01992423          	sw	s9,8(s2)
8040af88:	0129a023          	sw	s2,0(s3)
8040af8c:	eb1ff06f          	j	8040ae3c <stride_dequeue+0xdc>
8040af90:	0089a503          	lw	a0,8(s3)
8040af94:	0049ab83          	lw	s7,4(s3)
8040af98:	00048593          	mv	a1,s1
8040af9c:	a95ff0ef          	jal	ra,8040aa30 <skew_heap_merge.constprop.0>
8040afa0:	00a9a223          	sw	a0,4(s3)
8040afa4:	0179a423          	sw	s7,8(s3)
8040afa8:	008b2783          	lw	a5,8(s6)
8040afac:	00050463          	beqz	a0,8040afb4 <stride_dequeue+0x254>
8040afb0:	01352023          	sw	s3,0(a0)
8040afb4:	00098493          	mv	s1,s3
8040afb8:	f51ff06f          	j	8040af08 <stride_dequeue+0x1a8>
8040afbc:	008ba503          	lw	a0,8(s7)
8040afc0:	004bad03          	lw	s10,4(s7)
8040afc4:	00098593          	mv	a1,s3
8040afc8:	a69ff0ef          	jal	ra,8040aa30 <skew_heap_merge.constprop.0>
8040afcc:	00aba223          	sw	a0,4(s7)
8040afd0:	01aba423          	sw	s10,8(s7)
8040afd4:	008b2783          	lw	a5,8(s6)
8040afd8:	00050463          	beqz	a0,8040afe0 <stride_dequeue+0x280>
8040afdc:	01752023          	sw	s7,0(a0)
8040afe0:	000b8993          	mv	s3,s7
8040afe4:	f9dff06f          	j	8040af80 <stride_dequeue+0x220>
8040afe8:	0089a503          	lw	a0,8(s3)
8040afec:	0049ad03          	lw	s10,4(s3)
8040aff0:	000b8593          	mv	a1,s7
8040aff4:	a3dff0ef          	jal	ra,8040aa30 <skew_heap_merge.constprop.0>
8040aff8:	00a9a223          	sw	a0,4(s3)
8040affc:	01a9a423          	sw	s10,8(s3)
8040b000:	008b2783          	lw	a5,8(s6)
8040b004:	ee050ce3          	beqz	a0,8040aefc <stride_dequeue+0x19c>
8040b008:	01352023          	sw	s3,0(a0)
8040b00c:	ef1ff06f          	j	8040aefc <stride_dequeue+0x19c>
8040b010:	00892503          	lw	a0,8(s2)
8040b014:	00492d03          	lw	s10,4(s2)
8040b018:	000b8593          	mv	a1,s7
8040b01c:	a15ff0ef          	jal	ra,8040aa30 <skew_heap_merge.constprop.0>
8040b020:	00a92223          	sw	a0,4(s2)
8040b024:	01a92423          	sw	s10,8(s2)
8040b028:	008b2783          	lw	a5,8(s6)
8040b02c:	e00500e3          	beqz	a0,8040ae2c <stride_dequeue+0xcc>
8040b030:	01252023          	sw	s2,0(a0)
8040b034:	df9ff06f          	j	8040ae2c <stride_dequeue+0xcc>
8040b038:	00008697          	auipc	a3,0x8
8040b03c:	31468693          	addi	a3,a3,788 # 8041334c <CSWTCH.81+0x61c>
8040b040:	00006617          	auipc	a2,0x6
8040b044:	c8060613          	addi	a2,a2,-896 # 80410cc0 <commands+0x3c>
8040b048:	06300593          	li	a1,99
8040b04c:	00008517          	auipc	a0,0x8
8040b050:	32450513          	addi	a0,a0,804 # 80413370 <CSWTCH.81+0x640>
8040b054:	a78f50ef          	jal	ra,804002cc <__panic>

8040b058 <sys_getpid>:
8040b058:	0008f797          	auipc	a5,0x8f
8040b05c:	7f47a783          	lw	a5,2036(a5) # 8049a84c <current>
8040b060:	0047a503          	lw	a0,4(a5)
8040b064:	00008067          	ret

8040b068 <sys_gettime>:
8040b068:	0008f517          	auipc	a0,0x8f
8040b06c:	79852503          	lw	a0,1944(a0) # 8049a800 <ticks>
8040b070:	00008067          	ret

8040b074 <sys_lab6_set_priority>:
8040b074:	00052503          	lw	a0,0(a0)
8040b078:	ff010113          	addi	sp,sp,-16
8040b07c:	00112623          	sw	ra,12(sp)
8040b080:	a34ff0ef          	jal	ra,8040a2b4 <lab6_set_priority>
8040b084:	00c12083          	lw	ra,12(sp)
8040b088:	00000513          	li	a0,0
8040b08c:	01010113          	addi	sp,sp,16
8040b090:	00008067          	ret

8040b094 <sys_dup>:
8040b094:	00452583          	lw	a1,4(a0)
8040b098:	00052503          	lw	a0,0(a0)
8040b09c:	a4cfc06f          	j	804072e8 <sysfile_dup>

8040b0a0 <sys_getdirentry>:
8040b0a0:	00452583          	lw	a1,4(a0)
8040b0a4:	00052503          	lw	a0,0(a0)
8040b0a8:	8c4fc06f          	j	8040716c <sysfile_getdirentry>

8040b0ac <sys_getcwd>:
8040b0ac:	00452583          	lw	a1,4(a0)
8040b0b0:	00052503          	lw	a0,0(a0)
8040b0b4:	fb5fb06f          	j	80407068 <sysfile_getcwd>

8040b0b8 <sys_fsync>:
8040b0b8:	00052503          	lw	a0,0(a0)
8040b0bc:	fa9fb06f          	j	80407064 <sysfile_fsync>

8040b0c0 <sys_fstat>:
8040b0c0:	00452583          	lw	a1,4(a0)
8040b0c4:	00052503          	lw	a0,0(a0)
8040b0c8:	eadfb06f          	j	80406f74 <sysfile_fstat>

8040b0cc <sys_seek>:
8040b0cc:	00852603          	lw	a2,8(a0)
8040b0d0:	00452583          	lw	a1,4(a0)
8040b0d4:	00052503          	lw	a0,0(a0)
8040b0d8:	e99fb06f          	j	80406f70 <sysfile_seek>

8040b0dc <sys_write>:
8040b0dc:	00852603          	lw	a2,8(a0)
8040b0e0:	00452583          	lw	a1,4(a0)
8040b0e4:	00052503          	lw	a0,0(a0)
8040b0e8:	cc5fb06f          	j	80406dac <sysfile_write>

8040b0ec <sys_read>:
8040b0ec:	00852603          	lw	a2,8(a0)
8040b0f0:	00452583          	lw	a1,4(a0)
8040b0f4:	00052503          	lw	a0,0(a0)
8040b0f8:	b05fb06f          	j	80406bfc <sysfile_read>

8040b0fc <sys_close>:
8040b0fc:	00052503          	lw	a0,0(a0)
8040b100:	af9fb06f          	j	80406bf8 <sysfile_close>

8040b104 <sys_open>:
8040b104:	00452583          	lw	a1,4(a0)
8040b108:	00052503          	lw	a0,0(a0)
8040b10c:	a91fb06f          	j	80406b9c <sysfile_open>

8040b110 <sys_pgdir>:
8040b110:	ff010113          	addi	sp,sp,-16
8040b114:	00112623          	sw	ra,12(sp)
8040b118:	cf0fa0ef          	jal	ra,80405608 <print_pgdir>
8040b11c:	00c12083          	lw	ra,12(sp)
8040b120:	00000513          	li	a0,0
8040b124:	01010113          	addi	sp,sp,16
8040b128:	00008067          	ret

8040b12c <sys_putc>:
8040b12c:	00052503          	lw	a0,0(a0)
8040b130:	ff010113          	addi	sp,sp,-16
8040b134:	00112623          	sw	ra,12(sp)
8040b138:	874f50ef          	jal	ra,804001ac <cputchar>
8040b13c:	00c12083          	lw	ra,12(sp)
8040b140:	00000513          	li	a0,0
8040b144:	01010113          	addi	sp,sp,16
8040b148:	00008067          	ret

8040b14c <sys_kill>:
8040b14c:	00052503          	lw	a0,0(a0)
8040b150:	e19fe06f          	j	80409f68 <do_kill>

8040b154 <sys_sleep>:
8040b154:	00052503          	lw	a0,0(a0)
8040b158:	97cff06f          	j	8040a2d4 <do_sleep>

8040b15c <sys_yield>:
8040b15c:	d89fe06f          	j	80409ee4 <do_yield>

8040b160 <sys_exec>:
8040b160:	00852603          	lw	a2,8(a0)
8040b164:	00452583          	lw	a1,4(a0)
8040b168:	00052503          	lw	a0,0(a0)
8040b16c:	bd4fe06f          	j	80409540 <do_execve>

8040b170 <sys_wait>:
8040b170:	00452583          	lw	a1,4(a0)
8040b174:	00052503          	lw	a0,0(a0)
8040b178:	d85fe06f          	j	80409efc <do_wait>

8040b17c <sys_fork>:
8040b17c:	0008f797          	auipc	a5,0x8f
8040b180:	6d07a783          	lw	a5,1744(a5) # 8049a84c <current>
8040b184:	0547a603          	lw	a2,84(a5)
8040b188:	00000513          	li	a0,0
8040b18c:	00862583          	lw	a1,8(a2)
8040b190:	85dfd06f          	j	804089ec <do_fork>

8040b194 <sys_exit>:
8040b194:	00052503          	lw	a0,0(a0)
8040b198:	da9fd06f          	j	80408f40 <do_exit>

8040b19c <syscall>:
8040b19c:	fd010113          	addi	sp,sp,-48
8040b1a0:	02912223          	sw	s1,36(sp)
8040b1a4:	0008f497          	auipc	s1,0x8f
8040b1a8:	6a848493          	addi	s1,s1,1704 # 8049a84c <current>
8040b1ac:	0004a703          	lw	a4,0(s1)
8040b1b0:	02812423          	sw	s0,40(sp)
8040b1b4:	03212023          	sw	s2,32(sp)
8040b1b8:	05472403          	lw	s0,84(a4)
8040b1bc:	02112623          	sw	ra,44(sp)
8040b1c0:	0ff00793          	li	a5,255
8040b1c4:	02842903          	lw	s2,40(s0)
8040b1c8:	0727e463          	bltu	a5,s2,8040b230 <syscall+0x94>
8040b1cc:	00291713          	slli	a4,s2,0x2
8040b1d0:	00008797          	auipc	a5,0x8
8040b1d4:	22078793          	addi	a5,a5,544 # 804133f0 <syscalls>
8040b1d8:	00e787b3          	add	a5,a5,a4
8040b1dc:	0007a783          	lw	a5,0(a5)
8040b1e0:	04078863          	beqz	a5,8040b230 <syscall+0x94>
8040b1e4:	02c42503          	lw	a0,44(s0)
8040b1e8:	03042583          	lw	a1,48(s0)
8040b1ec:	03442603          	lw	a2,52(s0)
8040b1f0:	03842683          	lw	a3,56(s0)
8040b1f4:	03c42703          	lw	a4,60(s0)
8040b1f8:	00a12623          	sw	a0,12(sp)
8040b1fc:	00b12823          	sw	a1,16(sp)
8040b200:	00c12a23          	sw	a2,20(sp)
8040b204:	00d12c23          	sw	a3,24(sp)
8040b208:	00e12e23          	sw	a4,28(sp)
8040b20c:	00c10513          	addi	a0,sp,12
8040b210:	000780e7          	jalr	a5
8040b214:	02c12083          	lw	ra,44(sp)
8040b218:	02a42423          	sw	a0,40(s0)
8040b21c:	02812403          	lw	s0,40(sp)
8040b220:	02412483          	lw	s1,36(sp)
8040b224:	02012903          	lw	s2,32(sp)
8040b228:	03010113          	addi	sp,sp,48
8040b22c:	00008067          	ret
8040b230:	00040513          	mv	a0,s0
8040b234:	d89f50ef          	jal	ra,80400fbc <print_trapframe>
8040b238:	0004a783          	lw	a5,0(s1)
8040b23c:	00090693          	mv	a3,s2
8040b240:	00008617          	auipc	a2,0x8
8040b244:	16c60613          	addi	a2,a2,364 # 804133ac <CSWTCH.81+0x67c>
8040b248:	0047a703          	lw	a4,4(a5)
8040b24c:	0cc00593          	li	a1,204
8040b250:	06078793          	addi	a5,a5,96
8040b254:	00008517          	auipc	a0,0x8
8040b258:	18450513          	addi	a0,a0,388 # 804133d8 <CSWTCH.81+0x6a8>
8040b25c:	870f50ef          	jal	ra,804002cc <__panic>

8040b260 <swapfs_init>:
8040b260:	ff010113          	addi	sp,sp,-16
8040b264:	00100513          	li	a0,1
8040b268:	00112623          	sw	ra,12(sp)
8040b26c:	d50f50ef          	jal	ra,804007bc <ide_device_valid>
8040b270:	02050263          	beqz	a0,8040b294 <swapfs_init+0x34>
8040b274:	00100513          	li	a0,1
8040b278:	d78f50ef          	jal	ra,804007f0 <ide_device_size>
8040b27c:	00c12083          	lw	ra,12(sp)
8040b280:	00355513          	srli	a0,a0,0x3
8040b284:	0008f797          	auipc	a5,0x8f
8040b288:	5aa7a023          	sw	a0,1440(a5) # 8049a824 <max_swap_offset>
8040b28c:	01010113          	addi	sp,sp,16
8040b290:	00008067          	ret
8040b294:	00008617          	auipc	a2,0x8
8040b298:	55c60613          	addi	a2,a2,1372 # 804137f0 <syscalls+0x400>
8040b29c:	00d00593          	li	a1,13
8040b2a0:	00008517          	auipc	a0,0x8
8040b2a4:	56c50513          	addi	a0,a0,1388 # 8041380c <syscalls+0x41c>
8040b2a8:	824f50ef          	jal	ra,804002cc <__panic>

8040b2ac <swapfs_read>:
8040b2ac:	ff010113          	addi	sp,sp,-16
8040b2b0:	00112623          	sw	ra,12(sp)
8040b2b4:	00855793          	srli	a5,a0,0x8
8040b2b8:	06078463          	beqz	a5,8040b320 <swapfs_read+0x74>
8040b2bc:	0008f717          	auipc	a4,0x8f
8040b2c0:	56872703          	lw	a4,1384(a4) # 8049a824 <max_swap_offset>
8040b2c4:	04e7fe63          	bgeu	a5,a4,8040b320 <swapfs_read+0x74>
8040b2c8:	0008f617          	auipc	a2,0x8f
8040b2cc:	57462603          	lw	a2,1396(a2) # 8049a83c <pages>
8040b2d0:	40c585b3          	sub	a1,a1,a2
8040b2d4:	4055d613          	srai	a2,a1,0x5
8040b2d8:	00009717          	auipc	a4,0x9
8040b2dc:	7e472703          	lw	a4,2020(a4) # 80414abc <nbase>
8040b2e0:	00e60633          	add	a2,a2,a4
8040b2e4:	00c61713          	slli	a4,a2,0xc
8040b2e8:	00c75713          	srli	a4,a4,0xc
8040b2ec:	0008f697          	auipc	a3,0x8f
8040b2f0:	54c6a683          	lw	a3,1356(a3) # 8049a838 <npage>
8040b2f4:	00379593          	slli	a1,a5,0x3
8040b2f8:	00c61613          	slli	a2,a2,0xc
8040b2fc:	04d77063          	bgeu	a4,a3,8040b33c <swapfs_read+0x90>
8040b300:	00c12083          	lw	ra,12(sp)
8040b304:	0008f797          	auipc	a5,0x8f
8040b308:	5447a783          	lw	a5,1348(a5) # 8049a848 <va_pa_offset>
8040b30c:	00800693          	li	a3,8
8040b310:	00f60633          	add	a2,a2,a5
8040b314:	00100513          	li	a0,1
8040b318:	01010113          	addi	sp,sp,16
8040b31c:	d0cf506f          	j	80400828 <ide_read_secs>
8040b320:	00050693          	mv	a3,a0
8040b324:	00008617          	auipc	a2,0x8
8040b328:	50060613          	addi	a2,a2,1280 # 80413824 <syscalls+0x434>
8040b32c:	01400593          	li	a1,20
8040b330:	00008517          	auipc	a0,0x8
8040b334:	4dc50513          	addi	a0,a0,1244 # 8041380c <syscalls+0x41c>
8040b338:	f95f40ef          	jal	ra,804002cc <__panic>
8040b33c:	00060693          	mv	a3,a2
8040b340:	06e00593          	li	a1,110
8040b344:	00006617          	auipc	a2,0x6
8040b348:	76460613          	addi	a2,a2,1892 # 80411aa8 <commands+0xe24>
8040b34c:	00006517          	auipc	a0,0x6
8040b350:	43050513          	addi	a0,a0,1072 # 8041177c <commands+0xaf8>
8040b354:	f79f40ef          	jal	ra,804002cc <__panic>

8040b358 <swapfs_write>:
8040b358:	ff010113          	addi	sp,sp,-16
8040b35c:	00112623          	sw	ra,12(sp)
8040b360:	00855793          	srli	a5,a0,0x8
8040b364:	06078463          	beqz	a5,8040b3cc <swapfs_write+0x74>
8040b368:	0008f717          	auipc	a4,0x8f
8040b36c:	4bc72703          	lw	a4,1212(a4) # 8049a824 <max_swap_offset>
8040b370:	04e7fe63          	bgeu	a5,a4,8040b3cc <swapfs_write+0x74>
8040b374:	0008f617          	auipc	a2,0x8f
8040b378:	4c862603          	lw	a2,1224(a2) # 8049a83c <pages>
8040b37c:	40c585b3          	sub	a1,a1,a2
8040b380:	4055d613          	srai	a2,a1,0x5
8040b384:	00009717          	auipc	a4,0x9
8040b388:	73872703          	lw	a4,1848(a4) # 80414abc <nbase>
8040b38c:	00e60633          	add	a2,a2,a4
8040b390:	00c61713          	slli	a4,a2,0xc
8040b394:	00c75713          	srli	a4,a4,0xc
8040b398:	0008f697          	auipc	a3,0x8f
8040b39c:	4a06a683          	lw	a3,1184(a3) # 8049a838 <npage>
8040b3a0:	00379593          	slli	a1,a5,0x3
8040b3a4:	00c61613          	slli	a2,a2,0xc
8040b3a8:	04d77063          	bgeu	a4,a3,8040b3e8 <swapfs_write+0x90>
8040b3ac:	00c12083          	lw	ra,12(sp)
8040b3b0:	0008f797          	auipc	a5,0x8f
8040b3b4:	4987a783          	lw	a5,1176(a5) # 8049a848 <va_pa_offset>
8040b3b8:	00800693          	li	a3,8
8040b3bc:	00f60633          	add	a2,a2,a5
8040b3c0:	00100513          	li	a0,1
8040b3c4:	01010113          	addi	sp,sp,16
8040b3c8:	cf8f506f          	j	804008c0 <ide_write_secs>
8040b3cc:	00050693          	mv	a3,a0
8040b3d0:	00008617          	auipc	a2,0x8
8040b3d4:	45460613          	addi	a2,a2,1108 # 80413824 <syscalls+0x434>
8040b3d8:	01900593          	li	a1,25
8040b3dc:	00008517          	auipc	a0,0x8
8040b3e0:	43050513          	addi	a0,a0,1072 # 8041380c <syscalls+0x41c>
8040b3e4:	ee9f40ef          	jal	ra,804002cc <__panic>
8040b3e8:	00060693          	mv	a3,a2
8040b3ec:	06e00593          	li	a1,110
8040b3f0:	00006617          	auipc	a2,0x6
8040b3f4:	6b860613          	addi	a2,a2,1720 # 80411aa8 <commands+0xe24>
8040b3f8:	00006517          	auipc	a0,0x6
8040b3fc:	38450513          	addi	a0,a0,900 # 8041177c <commands+0xaf8>
8040b400:	ecdf40ef          	jal	ra,804002cc <__panic>

8040b404 <vfs_do_add>:
8040b404:	fe010113          	addi	sp,sp,-32
8040b408:	00112e23          	sw	ra,28(sp)
8040b40c:	00812c23          	sw	s0,24(sp)
8040b410:	00912a23          	sw	s1,20(sp)
8040b414:	01212823          	sw	s2,16(sp)
8040b418:	01312623          	sw	s3,12(sp)
8040b41c:	01412423          	sw	s4,8(sp)
8040b420:	01512223          	sw	s5,4(sp)
8040b424:	01612023          	sw	s6,0(sp)
8040b428:	14050863          	beqz	a0,8040b578 <vfs_do_add+0x174>
8040b42c:	00050413          	mv	s0,a0
8040b430:	00058a13          	mv	s4,a1
8040b434:	00060b13          	mv	s6,a2
8040b438:	00068a93          	mv	s5,a3
8040b43c:	0e058663          	beqz	a1,8040b528 <vfs_do_add+0x124>
8040b440:	02c5a703          	lw	a4,44(a1)
8040b444:	000017b7          	lui	a5,0x1
8040b448:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040b44c:	0ef71063          	bne	a4,a5,8040b52c <vfs_do_add+0x128>
8040b450:	00040513          	mv	a0,s0
8040b454:	455040ef          	jal	ra,804100a8 <strlen>
8040b458:	01f00793          	li	a5,31
8040b45c:	10a7e663          	bltu	a5,a0,8040b568 <vfs_do_add+0x164>
8040b460:	00040513          	mv	a0,s0
8040b464:	c19f40ef          	jal	ra,8040007c <strdup>
8040b468:	00050493          	mv	s1,a0
8040b46c:	10050263          	beqz	a0,8040b570 <vfs_do_add+0x16c>
8040b470:	01800513          	li	a0,24
8040b474:	9a5f70ef          	jal	ra,80402e18 <kmalloc>
8040b478:	00050993          	mv	s3,a0
8040b47c:	08050e63          	beqz	a0,8040b518 <vfs_do_add+0x114>
8040b480:	0008e517          	auipc	a0,0x8e
8040b484:	35850513          	addi	a0,a0,856 # 804997d8 <vdev_list_sem>
8040b488:	0008f917          	auipc	s2,0x8f
8040b48c:	3ec90913          	addi	s2,s2,1004 # 8049a874 <vdev_list>
8040b490:	dc0fb0ef          	jal	ra,80406a50 <down>
8040b494:	00090413          	mv	s0,s2
8040b498:	0140006f          	j	8040b4ac <vfs_do_add+0xa8>
8040b49c:	ff042503          	lw	a0,-16(s0)
8040b4a0:	00048593          	mv	a1,s1
8040b4a4:	475040ef          	jal	ra,80410118 <strcmp>
8040b4a8:	0a050263          	beqz	a0,8040b54c <vfs_do_add+0x148>
8040b4ac:	00442403          	lw	s0,4(s0)
8040b4b0:	ff2416e3          	bne	s0,s2,8040b49c <vfs_do_add+0x98>
8040b4b4:	00442703          	lw	a4,4(s0)
8040b4b8:	01098793          	addi	a5,s3,16
8040b4bc:	0099a023          	sw	s1,0(s3)
8040b4c0:	0149a223          	sw	s4,4(s3)
8040b4c4:	0159a623          	sw	s5,12(s3)
8040b4c8:	0169a423          	sw	s6,8(s3)
8040b4cc:	00f72023          	sw	a5,0(a4)
8040b4d0:	0089a823          	sw	s0,16(s3)
8040b4d4:	00e9aa23          	sw	a4,20(s3)
8040b4d8:	0008e517          	auipc	a0,0x8e
8040b4dc:	30050513          	addi	a0,a0,768 # 804997d8 <vdev_list_sem>
8040b4e0:	00f42223          	sw	a5,4(s0)
8040b4e4:	00000413          	li	s0,0
8040b4e8:	d64fb0ef          	jal	ra,80406a4c <up>
8040b4ec:	01c12083          	lw	ra,28(sp)
8040b4f0:	00040513          	mv	a0,s0
8040b4f4:	01812403          	lw	s0,24(sp)
8040b4f8:	01412483          	lw	s1,20(sp)
8040b4fc:	01012903          	lw	s2,16(sp)
8040b500:	00c12983          	lw	s3,12(sp)
8040b504:	00812a03          	lw	s4,8(sp)
8040b508:	00412a83          	lw	s5,4(sp)
8040b50c:	00012b03          	lw	s6,0(sp)
8040b510:	02010113          	addi	sp,sp,32
8040b514:	00008067          	ret
8040b518:	ffc00413          	li	s0,-4
8040b51c:	00048513          	mv	a0,s1
8040b520:	a15f70ef          	jal	ra,80402f34 <kfree>
8040b524:	fc9ff06f          	j	8040b4ec <vfs_do_add+0xe8>
8040b528:	f20684e3          	beqz	a3,8040b450 <vfs_do_add+0x4c>
8040b52c:	00008697          	auipc	a3,0x8
8040b530:	34068693          	addi	a3,a3,832 # 8041386c <syscalls+0x47c>
8040b534:	00005617          	auipc	a2,0x5
8040b538:	78c60613          	addi	a2,a2,1932 # 80410cc0 <commands+0x3c>
8040b53c:	08f00593          	li	a1,143
8040b540:	00008517          	auipc	a0,0x8
8040b544:	31450513          	addi	a0,a0,788 # 80413854 <syscalls+0x464>
8040b548:	d85f40ef          	jal	ra,804002cc <__panic>
8040b54c:	0008e517          	auipc	a0,0x8e
8040b550:	28c50513          	addi	a0,a0,652 # 804997d8 <vdev_list_sem>
8040b554:	cf8fb0ef          	jal	ra,80406a4c <up>
8040b558:	00098513          	mv	a0,s3
8040b55c:	9d9f70ef          	jal	ra,80402f34 <kfree>
8040b560:	fe900413          	li	s0,-23
8040b564:	fb9ff06f          	j	8040b51c <vfs_do_add+0x118>
8040b568:	ff400413          	li	s0,-12
8040b56c:	f81ff06f          	j	8040b4ec <vfs_do_add+0xe8>
8040b570:	ffc00413          	li	s0,-4
8040b574:	f79ff06f          	j	8040b4ec <vfs_do_add+0xe8>
8040b578:	00008697          	auipc	a3,0x8
8040b57c:	2cc68693          	addi	a3,a3,716 # 80413844 <syscalls+0x454>
8040b580:	00005617          	auipc	a2,0x5
8040b584:	74060613          	addi	a2,a2,1856 # 80410cc0 <commands+0x3c>
8040b588:	08e00593          	li	a1,142
8040b58c:	00008517          	auipc	a0,0x8
8040b590:	2c850513          	addi	a0,a0,712 # 80413854 <syscalls+0x464>
8040b594:	d39f40ef          	jal	ra,804002cc <__panic>

8040b598 <find_mount.part.0>:
8040b598:	ff010113          	addi	sp,sp,-16
8040b59c:	00008697          	auipc	a3,0x8
8040b5a0:	2a868693          	addi	a3,a3,680 # 80413844 <syscalls+0x454>
8040b5a4:	00005617          	auipc	a2,0x5
8040b5a8:	71c60613          	addi	a2,a2,1820 # 80410cc0 <commands+0x3c>
8040b5ac:	0cd00593          	li	a1,205
8040b5b0:	00008517          	auipc	a0,0x8
8040b5b4:	2a450513          	addi	a0,a0,676 # 80413854 <syscalls+0x464>
8040b5b8:	00112623          	sw	ra,12(sp)
8040b5bc:	d11f40ef          	jal	ra,804002cc <__panic>

8040b5c0 <vfs_devlist_init>:
8040b5c0:	0008f797          	auipc	a5,0x8f
8040b5c4:	2b478793          	addi	a5,a5,692 # 8049a874 <vdev_list>
8040b5c8:	00100593          	li	a1,1
8040b5cc:	0008e517          	auipc	a0,0x8e
8040b5d0:	20c50513          	addi	a0,a0,524 # 804997d8 <vdev_list_sem>
8040b5d4:	00f7a223          	sw	a5,4(a5)
8040b5d8:	00f7a023          	sw	a5,0(a5)
8040b5dc:	c64fb06f          	j	80406a40 <sem_init>

8040b5e0 <vfs_cleanup>:
8040b5e0:	ff010113          	addi	sp,sp,-16
8040b5e4:	00912223          	sw	s1,4(sp)
8040b5e8:	0008f497          	auipc	s1,0x8f
8040b5ec:	28c48493          	addi	s1,s1,652 # 8049a874 <vdev_list>
8040b5f0:	0044a783          	lw	a5,4(s1)
8040b5f4:	00112623          	sw	ra,12(sp)
8040b5f8:	00812423          	sw	s0,8(sp)
8040b5fc:	04978863          	beq	a5,s1,8040b64c <vfs_cleanup+0x6c>
8040b600:	0008e517          	auipc	a0,0x8e
8040b604:	1d850513          	addi	a0,a0,472 # 804997d8 <vdev_list_sem>
8040b608:	c48fb0ef          	jal	ra,80406a50 <down>
8040b60c:	0044a403          	lw	s0,4(s1)
8040b610:	02940063          	beq	s0,s1,8040b630 <vfs_cleanup+0x50>
8040b614:	ff842783          	lw	a5,-8(s0)
8040b618:	00078513          	mv	a0,a5
8040b61c:	00078663          	beqz	a5,8040b628 <vfs_cleanup+0x48>
8040b620:	07c7a783          	lw	a5,124(a5)
8040b624:	000780e7          	jalr	a5
8040b628:	00442403          	lw	s0,4(s0)
8040b62c:	fe9414e3          	bne	s0,s1,8040b614 <vfs_cleanup+0x34>
8040b630:	00812403          	lw	s0,8(sp)
8040b634:	00c12083          	lw	ra,12(sp)
8040b638:	00412483          	lw	s1,4(sp)
8040b63c:	0008e517          	auipc	a0,0x8e
8040b640:	19c50513          	addi	a0,a0,412 # 804997d8 <vdev_list_sem>
8040b644:	01010113          	addi	sp,sp,16
8040b648:	c04fb06f          	j	80406a4c <up>
8040b64c:	00c12083          	lw	ra,12(sp)
8040b650:	00812403          	lw	s0,8(sp)
8040b654:	00412483          	lw	s1,4(sp)
8040b658:	01010113          	addi	sp,sp,16
8040b65c:	00008067          	ret

8040b660 <vfs_get_root>:
8040b660:	fe010113          	addi	sp,sp,-32
8040b664:	00112e23          	sw	ra,28(sp)
8040b668:	00812c23          	sw	s0,24(sp)
8040b66c:	00912a23          	sw	s1,20(sp)
8040b670:	01212823          	sw	s2,16(sp)
8040b674:	01312623          	sw	s3,12(sp)
8040b678:	01412423          	sw	s4,8(sp)
8040b67c:	0c050263          	beqz	a0,8040b740 <vfs_get_root+0xe0>
8040b680:	0008f917          	auipc	s2,0x8f
8040b684:	1f490913          	addi	s2,s2,500 # 8049a874 <vdev_list>
8040b688:	00492783          	lw	a5,4(s2)
8040b68c:	0b278663          	beq	a5,s2,8040b738 <vfs_get_root+0xd8>
8040b690:	00050993          	mv	s3,a0
8040b694:	0008e517          	auipc	a0,0x8e
8040b698:	14450513          	addi	a0,a0,324 # 804997d8 <vdev_list_sem>
8040b69c:	00058a13          	mv	s4,a1
8040b6a0:	00090413          	mv	s0,s2
8040b6a4:	bacfb0ef          	jal	ra,80406a50 <down>
8040b6a8:	0180006f          	j	8040b6c0 <vfs_get_root+0x60>
8040b6ac:	ff042583          	lw	a1,-16(s0)
8040b6b0:	00098513          	mv	a0,s3
8040b6b4:	265040ef          	jal	ra,80410118 <strcmp>
8040b6b8:	00050493          	mv	s1,a0
8040b6bc:	04050063          	beqz	a0,8040b6fc <vfs_get_root+0x9c>
8040b6c0:	00442403          	lw	s0,4(s0)
8040b6c4:	ff2414e3          	bne	s0,s2,8040b6ac <vfs_get_root+0x4c>
8040b6c8:	ff300493          	li	s1,-13
8040b6cc:	0008e517          	auipc	a0,0x8e
8040b6d0:	10c50513          	addi	a0,a0,268 # 804997d8 <vdev_list_sem>
8040b6d4:	b78fb0ef          	jal	ra,80406a4c <up>
8040b6d8:	01c12083          	lw	ra,28(sp)
8040b6dc:	01812403          	lw	s0,24(sp)
8040b6e0:	01012903          	lw	s2,16(sp)
8040b6e4:	00c12983          	lw	s3,12(sp)
8040b6e8:	00812a03          	lw	s4,8(sp)
8040b6ec:	00048513          	mv	a0,s1
8040b6f0:	01412483          	lw	s1,20(sp)
8040b6f4:	02010113          	addi	sp,sp,32
8040b6f8:	00008067          	ret
8040b6fc:	ff842503          	lw	a0,-8(s0)
8040b700:	00050c63          	beqz	a0,8040b718 <vfs_get_root+0xb8>
8040b704:	07452783          	lw	a5,116(a0)
8040b708:	000780e7          	jalr	a5
8040b70c:	00050a63          	beqz	a0,8040b720 <vfs_get_root+0xc0>
8040b710:	00aa2023          	sw	a0,0(s4)
8040b714:	fb9ff06f          	j	8040b6cc <vfs_get_root+0x6c>
8040b718:	ffc42783          	lw	a5,-4(s0)
8040b71c:	00078663          	beqz	a5,8040b728 <vfs_get_root+0xc8>
8040b720:	ff200493          	li	s1,-14
8040b724:	fa9ff06f          	j	8040b6cc <vfs_get_root+0x6c>
8040b728:	ff442503          	lw	a0,-12(s0)
8040b72c:	051000ef          	jal	ra,8040bf7c <inode_ref_inc>
8040b730:	ff442503          	lw	a0,-12(s0)
8040b734:	fd9ff06f          	j	8040b70c <vfs_get_root+0xac>
8040b738:	ff300493          	li	s1,-13
8040b73c:	f9dff06f          	j	8040b6d8 <vfs_get_root+0x78>
8040b740:	00008697          	auipc	a3,0x8
8040b744:	10468693          	addi	a3,a3,260 # 80413844 <syscalls+0x454>
8040b748:	00005617          	auipc	a2,0x5
8040b74c:	57860613          	addi	a2,a2,1400 # 80410cc0 <commands+0x3c>
8040b750:	04500593          	li	a1,69
8040b754:	00008517          	auipc	a0,0x8
8040b758:	10050513          	addi	a0,a0,256 # 80413854 <syscalls+0x464>
8040b75c:	b71f40ef          	jal	ra,804002cc <__panic>

8040b760 <vfs_get_devname>:
8040b760:	0008f697          	auipc	a3,0x8f
8040b764:	11468693          	addi	a3,a3,276 # 8049a874 <vdev_list>
8040b768:	00068793          	mv	a5,a3
8040b76c:	00051863          	bnez	a0,8040b77c <vfs_get_devname+0x1c>
8040b770:	0240006f          	j	8040b794 <vfs_get_devname+0x34>
8040b774:	ff87a703          	lw	a4,-8(a5)
8040b778:	00a70a63          	beq	a4,a0,8040b78c <vfs_get_devname+0x2c>
8040b77c:	0047a783          	lw	a5,4(a5)
8040b780:	fed79ae3          	bne	a5,a3,8040b774 <vfs_get_devname+0x14>
8040b784:	00000513          	li	a0,0
8040b788:	00008067          	ret
8040b78c:	ff07a503          	lw	a0,-16(a5)
8040b790:	00008067          	ret
8040b794:	ff010113          	addi	sp,sp,-16
8040b798:	00008697          	auipc	a3,0x8
8040b79c:	13068693          	addi	a3,a3,304 # 804138c8 <syscalls+0x4d8>
8040b7a0:	00005617          	auipc	a2,0x5
8040b7a4:	52060613          	addi	a2,a2,1312 # 80410cc0 <commands+0x3c>
8040b7a8:	06a00593          	li	a1,106
8040b7ac:	00008517          	auipc	a0,0x8
8040b7b0:	0a850513          	addi	a0,a0,168 # 80413854 <syscalls+0x464>
8040b7b4:	00112623          	sw	ra,12(sp)
8040b7b8:	b15f40ef          	jal	ra,804002cc <__panic>

8040b7bc <vfs_add_dev>:
8040b7bc:	00060693          	mv	a3,a2
8040b7c0:	00000613          	li	a2,0
8040b7c4:	c41ff06f          	j	8040b404 <vfs_do_add>

8040b7c8 <vfs_mount>:
8040b7c8:	fe010113          	addi	sp,sp,-32
8040b7cc:	01212823          	sw	s2,16(sp)
8040b7d0:	00050913          	mv	s2,a0
8040b7d4:	0008e517          	auipc	a0,0x8e
8040b7d8:	00450513          	addi	a0,a0,4 # 804997d8 <vdev_list_sem>
8040b7dc:	01312623          	sw	s3,12(sp)
8040b7e0:	00112e23          	sw	ra,28(sp)
8040b7e4:	00812c23          	sw	s0,24(sp)
8040b7e8:	00912a23          	sw	s1,20(sp)
8040b7ec:	00058993          	mv	s3,a1
8040b7f0:	a60fb0ef          	jal	ra,80406a50 <down>
8040b7f4:	0c090663          	beqz	s2,8040b8c0 <vfs_mount+0xf8>
8040b7f8:	0008f497          	auipc	s1,0x8f
8040b7fc:	07c48493          	addi	s1,s1,124 # 8049a874 <vdev_list>
8040b800:	0044a403          	lw	s0,4(s1)
8040b804:	00941863          	bne	s0,s1,8040b814 <vfs_mount+0x4c>
8040b808:	0a80006f          	j	8040b8b0 <vfs_mount+0xe8>
8040b80c:	00442403          	lw	s0,4(s0)
8040b810:	0a940063          	beq	s0,s1,8040b8b0 <vfs_mount+0xe8>
8040b814:	ffc42783          	lw	a5,-4(s0)
8040b818:	fe078ae3          	beqz	a5,8040b80c <vfs_mount+0x44>
8040b81c:	ff042503          	lw	a0,-16(s0)
8040b820:	00090593          	mv	a1,s2
8040b824:	0f5040ef          	jal	ra,80410118 <strcmp>
8040b828:	fe0512e3          	bnez	a0,8040b80c <vfs_mount+0x44>
8040b82c:	ff842783          	lw	a5,-8(s0)
8040b830:	08079463          	bnez	a5,8040b8b8 <vfs_mount+0xf0>
8040b834:	ff042783          	lw	a5,-16(s0)
8040b838:	0a078663          	beqz	a5,8040b8e4 <vfs_mount+0x11c>
8040b83c:	ffc42783          	lw	a5,-4(s0)
8040b840:	0a078263          	beqz	a5,8040b8e4 <vfs_mount+0x11c>
8040b844:	ff442503          	lw	a0,-12(s0)
8040b848:	06050e63          	beqz	a0,8040b8c4 <vfs_mount+0xfc>
8040b84c:	02c52703          	lw	a4,44(a0)
8040b850:	000017b7          	lui	a5,0x1
8040b854:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040b858:	06f71663          	bne	a4,a5,8040b8c4 <vfs_mount+0xfc>
8040b85c:	ff840593          	addi	a1,s0,-8
8040b860:	000980e7          	jalr	s3
8040b864:	00050493          	mv	s1,a0
8040b868:	00051e63          	bnez	a0,8040b884 <vfs_mount+0xbc>
8040b86c:	ff842783          	lw	a5,-8(s0)
8040b870:	08078a63          	beqz	a5,8040b904 <vfs_mount+0x13c>
8040b874:	ff042583          	lw	a1,-16(s0)
8040b878:	00008517          	auipc	a0,0x8
8040b87c:	0d050513          	addi	a0,a0,208 # 80413948 <syscalls+0x558>
8040b880:	8c9f40ef          	jal	ra,80400148 <cprintf>
8040b884:	0008e517          	auipc	a0,0x8e
8040b888:	f5450513          	addi	a0,a0,-172 # 804997d8 <vdev_list_sem>
8040b88c:	9c0fb0ef          	jal	ra,80406a4c <up>
8040b890:	01c12083          	lw	ra,28(sp)
8040b894:	01812403          	lw	s0,24(sp)
8040b898:	01012903          	lw	s2,16(sp)
8040b89c:	00c12983          	lw	s3,12(sp)
8040b8a0:	00048513          	mv	a0,s1
8040b8a4:	01412483          	lw	s1,20(sp)
8040b8a8:	02010113          	addi	sp,sp,32
8040b8ac:	00008067          	ret
8040b8b0:	ff300493          	li	s1,-13
8040b8b4:	fd1ff06f          	j	8040b884 <vfs_mount+0xbc>
8040b8b8:	ff100493          	li	s1,-15
8040b8bc:	fc9ff06f          	j	8040b884 <vfs_mount+0xbc>
8040b8c0:	cd9ff0ef          	jal	ra,8040b598 <find_mount.part.0>
8040b8c4:	00008697          	auipc	a3,0x8
8040b8c8:	03c68693          	addi	a3,a3,60 # 80413900 <syscalls+0x510>
8040b8cc:	00005617          	auipc	a2,0x5
8040b8d0:	3f460613          	addi	a2,a2,1012 # 80410cc0 <commands+0x3c>
8040b8d4:	0ed00593          	li	a1,237
8040b8d8:	00008517          	auipc	a0,0x8
8040b8dc:	f7c50513          	addi	a0,a0,-132 # 80413854 <syscalls+0x464>
8040b8e0:	9edf40ef          	jal	ra,804002cc <__panic>
8040b8e4:	00008697          	auipc	a3,0x8
8040b8e8:	ff068693          	addi	a3,a3,-16 # 804138d4 <syscalls+0x4e4>
8040b8ec:	00005617          	auipc	a2,0x5
8040b8f0:	3d460613          	addi	a2,a2,980 # 80410cc0 <commands+0x3c>
8040b8f4:	0eb00593          	li	a1,235
8040b8f8:	00008517          	auipc	a0,0x8
8040b8fc:	f5c50513          	addi	a0,a0,-164 # 80413854 <syscalls+0x464>
8040b900:	9cdf40ef          	jal	ra,804002cc <__panic>
8040b904:	00008697          	auipc	a3,0x8
8040b908:	03068693          	addi	a3,a3,48 # 80413934 <syscalls+0x544>
8040b90c:	00005617          	auipc	a2,0x5
8040b910:	3b460613          	addi	a2,a2,948 # 80410cc0 <commands+0x3c>
8040b914:	0ef00593          	li	a1,239
8040b918:	00008517          	auipc	a0,0x8
8040b91c:	f3c50513          	addi	a0,a0,-196 # 80413854 <syscalls+0x464>
8040b920:	9adf40ef          	jal	ra,804002cc <__panic>

8040b924 <vfs_get_curdir>:
8040b924:	0008f797          	auipc	a5,0x8f
8040b928:	f287a783          	lw	a5,-216(a5) # 8049a84c <current>
8040b92c:	0dc7a783          	lw	a5,220(a5)
8040b930:	ff010113          	addi	sp,sp,-16
8040b934:	00912223          	sw	s1,4(sp)
8040b938:	0007a483          	lw	s1,0(a5)
8040b93c:	00112623          	sw	ra,12(sp)
8040b940:	00812423          	sw	s0,8(sp)
8040b944:	02048663          	beqz	s1,8040b970 <vfs_get_curdir+0x4c>
8040b948:	00050413          	mv	s0,a0
8040b94c:	00048513          	mv	a0,s1
8040b950:	62c000ef          	jal	ra,8040bf7c <inode_ref_inc>
8040b954:	00000513          	li	a0,0
8040b958:	00942023          	sw	s1,0(s0)
8040b95c:	00c12083          	lw	ra,12(sp)
8040b960:	00812403          	lw	s0,8(sp)
8040b964:	00412483          	lw	s1,4(sp)
8040b968:	01010113          	addi	sp,sp,16
8040b96c:	00008067          	ret
8040b970:	ff000513          	li	a0,-16
8040b974:	fe9ff06f          	j	8040b95c <vfs_get_curdir+0x38>

8040b978 <vfs_set_curdir>:
8040b978:	fd010113          	addi	sp,sp,-48
8040b97c:	03212023          	sw	s2,32(sp)
8040b980:	0008f917          	auipc	s2,0x8f
8040b984:	ecc90913          	addi	s2,s2,-308 # 8049a84c <current>
8040b988:	00092783          	lw	a5,0(s2)
8040b98c:	02812423          	sw	s0,40(sp)
8040b990:	00050413          	mv	s0,a0
8040b994:	0dc7a503          	lw	a0,220(a5)
8040b998:	01312e23          	sw	s3,28(sp)
8040b99c:	02112623          	sw	ra,44(sp)
8040b9a0:	02912223          	sw	s1,36(sp)
8040b9a4:	959fc0ef          	jal	ra,804082fc <lock_files>
8040b9a8:	00092783          	lw	a5,0(s2)
8040b9ac:	0dc7a503          	lw	a0,220(a5)
8040b9b0:	00052983          	lw	s3,0(a0)
8040b9b4:	0b340863          	beq	s0,s3,8040ba64 <vfs_set_curdir+0xec>
8040b9b8:	08040a63          	beqz	s0,8040ba4c <vfs_set_curdir+0xd4>
8040b9bc:	03c42783          	lw	a5,60(s0)
8040b9c0:	0a078663          	beqz	a5,8040ba6c <vfs_set_curdir+0xf4>
8040b9c4:	0287a783          	lw	a5,40(a5)
8040b9c8:	0a078263          	beqz	a5,8040ba6c <vfs_set_curdir+0xf4>
8040b9cc:	00008597          	auipc	a1,0x8
8040b9d0:	ff458593          	addi	a1,a1,-12 # 804139c0 <syscalls+0x5d0>
8040b9d4:	00040513          	mv	a0,s0
8040b9d8:	5cc000ef          	jal	ra,8040bfa4 <inode_check>
8040b9dc:	03c42783          	lw	a5,60(s0)
8040b9e0:	00c10593          	addi	a1,sp,12
8040b9e4:	00040513          	mv	a0,s0
8040b9e8:	0287a783          	lw	a5,40(a5)
8040b9ec:	000780e7          	jalr	a5
8040b9f0:	00050493          	mv	s1,a0
8040b9f4:	00051e63          	bnez	a0,8040ba10 <vfs_set_curdir+0x98>
8040b9f8:	00c12683          	lw	a3,12(sp)
8040b9fc:	000077b7          	lui	a5,0x7
8040ba00:	00002737          	lui	a4,0x2
8040ba04:	00d7f7b3          	and	a5,a5,a3
8040ba08:	fee00493          	li	s1,-18
8040ba0c:	02e78863          	beq	a5,a4,8040ba3c <vfs_set_curdir+0xc4>
8040ba10:	00092783          	lw	a5,0(s2)
8040ba14:	0dc7a503          	lw	a0,220(a5) # 70dc <_binary_bin_swap_img_size-0xf24>
8040ba18:	8edfc0ef          	jal	ra,80408304 <unlock_files>
8040ba1c:	02c12083          	lw	ra,44(sp)
8040ba20:	02812403          	lw	s0,40(sp)
8040ba24:	02012903          	lw	s2,32(sp)
8040ba28:	01c12983          	lw	s3,28(sp)
8040ba2c:	00048513          	mv	a0,s1
8040ba30:	02412483          	lw	s1,36(sp)
8040ba34:	03010113          	addi	sp,sp,48
8040ba38:	00008067          	ret
8040ba3c:	00040513          	mv	a0,s0
8040ba40:	53c000ef          	jal	ra,8040bf7c <inode_ref_inc>
8040ba44:	00092783          	lw	a5,0(s2)
8040ba48:	0dc7a503          	lw	a0,220(a5)
8040ba4c:	00852023          	sw	s0,0(a0)
8040ba50:	00000493          	li	s1,0
8040ba54:	fc0982e3          	beqz	s3,8040ba18 <vfs_set_curdir+0xa0>
8040ba58:	00098513          	mv	a0,s3
8040ba5c:	614000ef          	jal	ra,8040c070 <inode_ref_dec>
8040ba60:	fb1ff06f          	j	8040ba10 <vfs_set_curdir+0x98>
8040ba64:	00000493          	li	s1,0
8040ba68:	fb1ff06f          	j	8040ba18 <vfs_set_curdir+0xa0>
8040ba6c:	00008697          	auipc	a3,0x8
8040ba70:	eec68693          	addi	a3,a3,-276 # 80413958 <syscalls+0x568>
8040ba74:	00005617          	auipc	a2,0x5
8040ba78:	24c60613          	addi	a2,a2,588 # 80410cc0 <commands+0x3c>
8040ba7c:	04300593          	li	a1,67
8040ba80:	00008517          	auipc	a0,0x8
8040ba84:	f2850513          	addi	a0,a0,-216 # 804139a8 <syscalls+0x5b8>
8040ba88:	845f40ef          	jal	ra,804002cc <__panic>

8040ba8c <vfs_chdir>:
8040ba8c:	fe010113          	addi	sp,sp,-32
8040ba90:	00c10593          	addi	a1,sp,12
8040ba94:	00812c23          	sw	s0,24(sp)
8040ba98:	00112e23          	sw	ra,28(sp)
8040ba9c:	300000ef          	jal	ra,8040bd9c <vfs_lookup>
8040baa0:	00050413          	mv	s0,a0
8040baa4:	00050c63          	beqz	a0,8040babc <vfs_chdir+0x30>
8040baa8:	01c12083          	lw	ra,28(sp)
8040baac:	00040513          	mv	a0,s0
8040bab0:	01812403          	lw	s0,24(sp)
8040bab4:	02010113          	addi	sp,sp,32
8040bab8:	00008067          	ret
8040babc:	00c12503          	lw	a0,12(sp)
8040bac0:	eb9ff0ef          	jal	ra,8040b978 <vfs_set_curdir>
8040bac4:	00050413          	mv	s0,a0
8040bac8:	00c12503          	lw	a0,12(sp)
8040bacc:	5a4000ef          	jal	ra,8040c070 <inode_ref_dec>
8040bad0:	01c12083          	lw	ra,28(sp)
8040bad4:	00040513          	mv	a0,s0
8040bad8:	01812403          	lw	s0,24(sp)
8040badc:	02010113          	addi	sp,sp,32
8040bae0:	00008067          	ret

8040bae4 <vfs_getcwd>:
8040bae4:	0008f797          	auipc	a5,0x8f
8040bae8:	d687a783          	lw	a5,-664(a5) # 8049a84c <current>
8040baec:	0dc7a783          	lw	a5,220(a5)
8040baf0:	fe010113          	addi	sp,sp,-32
8040baf4:	00912a23          	sw	s1,20(sp)
8040baf8:	0007a483          	lw	s1,0(a5)
8040bafc:	00112e23          	sw	ra,28(sp)
8040bb00:	00812c23          	sw	s0,24(sp)
8040bb04:	01212823          	sw	s2,16(sp)
8040bb08:	0c048663          	beqz	s1,8040bbd4 <vfs_getcwd+0xf0>
8040bb0c:	00050913          	mv	s2,a0
8040bb10:	00048513          	mv	a0,s1
8040bb14:	468000ef          	jal	ra,8040bf7c <inode_ref_inc>
8040bb18:	0384a503          	lw	a0,56(s1)
8040bb1c:	0c050063          	beqz	a0,8040bbdc <vfs_getcwd+0xf8>
8040bb20:	c41ff0ef          	jal	ra,8040b760 <vfs_get_devname>
8040bb24:	00050413          	mv	s0,a0
8040bb28:	580040ef          	jal	ra,804100a8 <strlen>
8040bb2c:	00050613          	mv	a2,a0
8040bb30:	00040593          	mv	a1,s0
8040bb34:	00000713          	li	a4,0
8040bb38:	00100693          	li	a3,1
8040bb3c:	00090513          	mv	a0,s2
8040bb40:	eacfc0ef          	jal	ra,804081ec <iobuf_move>
8040bb44:	00050413          	mv	s0,a0
8040bb48:	02050463          	beqz	a0,8040bb70 <vfs_getcwd+0x8c>
8040bb4c:	00048513          	mv	a0,s1
8040bb50:	520000ef          	jal	ra,8040c070 <inode_ref_dec>
8040bb54:	01c12083          	lw	ra,28(sp)
8040bb58:	00040513          	mv	a0,s0
8040bb5c:	01812403          	lw	s0,24(sp)
8040bb60:	01412483          	lw	s1,20(sp)
8040bb64:	01012903          	lw	s2,16(sp)
8040bb68:	02010113          	addi	sp,sp,32
8040bb6c:	00008067          	ret
8040bb70:	03a00793          	li	a5,58
8040bb74:	00000713          	li	a4,0
8040bb78:	00100693          	li	a3,1
8040bb7c:	00100613          	li	a2,1
8040bb80:	00f10593          	addi	a1,sp,15
8040bb84:	00090513          	mv	a0,s2
8040bb88:	00f107a3          	sb	a5,15(sp)
8040bb8c:	e60fc0ef          	jal	ra,804081ec <iobuf_move>
8040bb90:	00050413          	mv	s0,a0
8040bb94:	fa051ce3          	bnez	a0,8040bb4c <vfs_getcwd+0x68>
8040bb98:	03c4a783          	lw	a5,60(s1)
8040bb9c:	06078063          	beqz	a5,8040bbfc <vfs_getcwd+0x118>
8040bba0:	01c7a783          	lw	a5,28(a5)
8040bba4:	04078c63          	beqz	a5,8040bbfc <vfs_getcwd+0x118>
8040bba8:	00008597          	auipc	a1,0x8
8040bbac:	e8858593          	addi	a1,a1,-376 # 80413a30 <syscalls+0x640>
8040bbb0:	00048513          	mv	a0,s1
8040bbb4:	3f0000ef          	jal	ra,8040bfa4 <inode_check>
8040bbb8:	03c4a783          	lw	a5,60(s1)
8040bbbc:	00090593          	mv	a1,s2
8040bbc0:	00048513          	mv	a0,s1
8040bbc4:	01c7a783          	lw	a5,28(a5)
8040bbc8:	000780e7          	jalr	a5
8040bbcc:	00050413          	mv	s0,a0
8040bbd0:	f7dff06f          	j	8040bb4c <vfs_getcwd+0x68>
8040bbd4:	ff000413          	li	s0,-16
8040bbd8:	f7dff06f          	j	8040bb54 <vfs_getcwd+0x70>
8040bbdc:	00008697          	auipc	a3,0x8
8040bbe0:	dec68693          	addi	a3,a3,-532 # 804139c8 <syscalls+0x5d8>
8040bbe4:	00005617          	auipc	a2,0x5
8040bbe8:	0dc60613          	addi	a2,a2,220 # 80410cc0 <commands+0x3c>
8040bbec:	06e00593          	li	a1,110
8040bbf0:	00008517          	auipc	a0,0x8
8040bbf4:	db850513          	addi	a0,a0,-584 # 804139a8 <syscalls+0x5b8>
8040bbf8:	ed4f40ef          	jal	ra,804002cc <__panic>
8040bbfc:	00008697          	auipc	a3,0x8
8040bc00:	de068693          	addi	a3,a3,-544 # 804139dc <syscalls+0x5ec>
8040bc04:	00005617          	auipc	a2,0x5
8040bc08:	0bc60613          	addi	a2,a2,188 # 80410cc0 <commands+0x3c>
8040bc0c:	07800593          	li	a1,120
8040bc10:	00008517          	auipc	a0,0x8
8040bc14:	d9850513          	addi	a0,a0,-616 # 804139a8 <syscalls+0x5b8>
8040bc18:	eb4f40ef          	jal	ra,804002cc <__panic>

8040bc1c <get_device>:
8040bc1c:	fe010113          	addi	sp,sp,-32
8040bc20:	00812c23          	sw	s0,24(sp)
8040bc24:	00912a23          	sw	s1,20(sp)
8040bc28:	01212823          	sw	s2,16(sp)
8040bc2c:	00112e23          	sw	ra,28(sp)
8040bc30:	00054883          	lbu	a7,0(a0)
8040bc34:	00050413          	mv	s0,a0
8040bc38:	00058913          	mv	s2,a1
8040bc3c:	00060493          	mv	s1,a2
8040bc40:	02088663          	beqz	a7,8040bc6c <get_device+0x50>
8040bc44:	00088713          	mv	a4,a7
8040bc48:	00000793          	li	a5,0
8040bc4c:	03a00693          	li	a3,58
8040bc50:	02f00813          	li	a6,47
8040bc54:	02d70c63          	beq	a4,a3,8040bc8c <get_device+0x70>
8040bc58:	09070063          	beq	a4,a6,8040bcd8 <get_device+0xbc>
8040bc5c:	00178793          	addi	a5,a5,1
8040bc60:	00f40733          	add	a4,s0,a5
8040bc64:	00074703          	lbu	a4,0(a4) # 2000 <_binary_bin_swap_img_size-0x6000>
8040bc68:	fe0716e3          	bnez	a4,8040bc54 <get_device+0x38>
8040bc6c:	00892023          	sw	s0,0(s2)
8040bc70:	01812403          	lw	s0,24(sp)
8040bc74:	01c12083          	lw	ra,28(sp)
8040bc78:	01012903          	lw	s2,16(sp)
8040bc7c:	00048513          	mv	a0,s1
8040bc80:	01412483          	lw	s1,20(sp)
8040bc84:	02010113          	addi	sp,sp,32
8040bc88:	c9dff06f          	j	8040b924 <vfs_get_curdir>
8040bc8c:	04078863          	beqz	a5,8040bcdc <get_device+0xc0>
8040bc90:	00f40733          	add	a4,s0,a5
8040bc94:	00178793          	addi	a5,a5,1
8040bc98:	00070023          	sb	zero,0(a4)
8040bc9c:	00f407b3          	add	a5,s0,a5
8040bca0:	02f00613          	li	a2,47
8040bca4:	0007c703          	lbu	a4,0(a5)
8040bca8:	00078693          	mv	a3,a5
8040bcac:	00178793          	addi	a5,a5,1
8040bcb0:	fec70ae3          	beq	a4,a2,8040bca4 <get_device+0x88>
8040bcb4:	00040513          	mv	a0,s0
8040bcb8:	01812403          	lw	s0,24(sp)
8040bcbc:	01c12083          	lw	ra,28(sp)
8040bcc0:	00d92023          	sw	a3,0(s2)
8040bcc4:	00048593          	mv	a1,s1
8040bcc8:	01012903          	lw	s2,16(sp)
8040bccc:	01412483          	lw	s1,20(sp)
8040bcd0:	02010113          	addi	sp,sp,32
8040bcd4:	98dff06f          	j	8040b660 <vfs_get_root>
8040bcd8:	f8079ae3          	bnez	a5,8040bc6c <get_device+0x50>
8040bcdc:	02f00793          	li	a5,47
8040bce0:	06f88663          	beq	a7,a5,8040bd4c <get_device+0x130>
8040bce4:	03a00793          	li	a5,58
8040bce8:	08f89a63          	bne	a7,a5,8040bd7c <get_device+0x160>
8040bcec:	00c10513          	addi	a0,sp,12
8040bcf0:	c35ff0ef          	jal	ra,8040b924 <vfs_get_curdir>
8040bcf4:	04051063          	bnez	a0,8040bd34 <get_device+0x118>
8040bcf8:	00c12783          	lw	a5,12(sp)
8040bcfc:	0387a503          	lw	a0,56(a5)
8040bd00:	04050e63          	beqz	a0,8040bd5c <get_device+0x140>
8040bd04:	07452783          	lw	a5,116(a0)
8040bd08:	000780e7          	jalr	a5
8040bd0c:	00050793          	mv	a5,a0
8040bd10:	00c12503          	lw	a0,12(sp)
8040bd14:	00f4a023          	sw	a5,0(s1)
8040bd18:	358000ef          	jal	ra,8040c070 <inode_ref_dec>
8040bd1c:	02f00713          	li	a4,47
8040bd20:	00144783          	lbu	a5,1(s0)
8040bd24:	00140413          	addi	s0,s0,1
8040bd28:	fee78ce3          	beq	a5,a4,8040bd20 <get_device+0x104>
8040bd2c:	00892023          	sw	s0,0(s2)
8040bd30:	00000513          	li	a0,0
8040bd34:	01c12083          	lw	ra,28(sp)
8040bd38:	01812403          	lw	s0,24(sp)
8040bd3c:	01412483          	lw	s1,20(sp)
8040bd40:	01012903          	lw	s2,16(sp)
8040bd44:	02010113          	addi	sp,sp,32
8040bd48:	00008067          	ret
8040bd4c:	00048513          	mv	a0,s1
8040bd50:	07d000ef          	jal	ra,8040c5cc <vfs_get_bootfs>
8040bd54:	fc0504e3          	beqz	a0,8040bd1c <get_device+0x100>
8040bd58:	fddff06f          	j	8040bd34 <get_device+0x118>
8040bd5c:	00008697          	auipc	a3,0x8
8040bd60:	c6c68693          	addi	a3,a3,-916 # 804139c8 <syscalls+0x5d8>
8040bd64:	00005617          	auipc	a2,0x5
8040bd68:	f5c60613          	addi	a2,a2,-164 # 80410cc0 <commands+0x3c>
8040bd6c:	03900593          	li	a1,57
8040bd70:	00008517          	auipc	a0,0x8
8040bd74:	cdc50513          	addi	a0,a0,-804 # 80413a4c <syscalls+0x65c>
8040bd78:	d54f40ef          	jal	ra,804002cc <__panic>
8040bd7c:	00008697          	auipc	a3,0x8
8040bd80:	cc068693          	addi	a3,a3,-832 # 80413a3c <syscalls+0x64c>
8040bd84:	00005617          	auipc	a2,0x5
8040bd88:	f3c60613          	addi	a2,a2,-196 # 80410cc0 <commands+0x3c>
8040bd8c:	03300593          	li	a1,51
8040bd90:	00008517          	auipc	a0,0x8
8040bd94:	cbc50513          	addi	a0,a0,-836 # 80413a4c <syscalls+0x65c>
8040bd98:	d34f40ef          	jal	ra,804002cc <__panic>

8040bd9c <vfs_lookup>:
8040bd9c:	fd010113          	addi	sp,sp,-48
8040bda0:	02912223          	sw	s1,36(sp)
8040bda4:	01c10613          	addi	a2,sp,28
8040bda8:	00058493          	mv	s1,a1
8040bdac:	00c10593          	addi	a1,sp,12
8040bdb0:	02812423          	sw	s0,40(sp)
8040bdb4:	02112623          	sw	ra,44(sp)
8040bdb8:	03212023          	sw	s2,32(sp)
8040bdbc:	00a12623          	sw	a0,12(sp)
8040bdc0:	e5dff0ef          	jal	ra,8040bc1c <get_device>
8040bdc4:	00050413          	mv	s0,a0
8040bdc8:	04051e63          	bnez	a0,8040be24 <vfs_lookup+0x88>
8040bdcc:	00c12783          	lw	a5,12(sp)
8040bdd0:	01c12903          	lw	s2,28(sp)
8040bdd4:	0007c783          	lbu	a5,0(a5)
8040bdd8:	06078463          	beqz	a5,8040be40 <vfs_lookup+0xa4>
8040bddc:	08090263          	beqz	s2,8040be60 <vfs_lookup+0xc4>
8040bde0:	03c92783          	lw	a5,60(s2)
8040bde4:	06078e63          	beqz	a5,8040be60 <vfs_lookup+0xc4>
8040bde8:	0387a783          	lw	a5,56(a5)
8040bdec:	06078a63          	beqz	a5,8040be60 <vfs_lookup+0xc4>
8040bdf0:	00090513          	mv	a0,s2
8040bdf4:	00008597          	auipc	a1,0x8
8040bdf8:	cc058593          	addi	a1,a1,-832 # 80413ab4 <syscalls+0x6c4>
8040bdfc:	1a8000ef          	jal	ra,8040bfa4 <inode_check>
8040be00:	03c92783          	lw	a5,60(s2)
8040be04:	00c12583          	lw	a1,12(sp)
8040be08:	01c12503          	lw	a0,28(sp)
8040be0c:	0387a783          	lw	a5,56(a5)
8040be10:	00048613          	mv	a2,s1
8040be14:	000780e7          	jalr	a5
8040be18:	00050413          	mv	s0,a0
8040be1c:	01c12503          	lw	a0,28(sp)
8040be20:	250000ef          	jal	ra,8040c070 <inode_ref_dec>
8040be24:	02c12083          	lw	ra,44(sp)
8040be28:	00040513          	mv	a0,s0
8040be2c:	02812403          	lw	s0,40(sp)
8040be30:	02412483          	lw	s1,36(sp)
8040be34:	02012903          	lw	s2,32(sp)
8040be38:	03010113          	addi	sp,sp,48
8040be3c:	00008067          	ret
8040be40:	02c12083          	lw	ra,44(sp)
8040be44:	00040513          	mv	a0,s0
8040be48:	02812403          	lw	s0,40(sp)
8040be4c:	0124a023          	sw	s2,0(s1)
8040be50:	02412483          	lw	s1,36(sp)
8040be54:	02012903          	lw	s2,32(sp)
8040be58:	03010113          	addi	sp,sp,48
8040be5c:	00008067          	ret
8040be60:	00008697          	auipc	a3,0x8
8040be64:	c0468693          	addi	a3,a3,-1020 # 80413a64 <syscalls+0x674>
8040be68:	00005617          	auipc	a2,0x5
8040be6c:	e5860613          	addi	a2,a2,-424 # 80410cc0 <commands+0x3c>
8040be70:	04f00593          	li	a1,79
8040be74:	00008517          	auipc	a0,0x8
8040be78:	bd850513          	addi	a0,a0,-1064 # 80413a4c <syscalls+0x65c>
8040be7c:	c50f40ef          	jal	ra,804002cc <__panic>

8040be80 <vfs_lookup_parent>:
8040be80:	fd010113          	addi	sp,sp,-48
8040be84:	02812423          	sw	s0,40(sp)
8040be88:	02912223          	sw	s1,36(sp)
8040be8c:	00058413          	mv	s0,a1
8040be90:	00060493          	mv	s1,a2
8040be94:	00c10593          	addi	a1,sp,12
8040be98:	01c10613          	addi	a2,sp,28
8040be9c:	02112623          	sw	ra,44(sp)
8040bea0:	00a12623          	sw	a0,12(sp)
8040bea4:	d79ff0ef          	jal	ra,8040bc1c <get_device>
8040bea8:	00051a63          	bnez	a0,8040bebc <vfs_lookup_parent+0x3c>
8040beac:	00c12783          	lw	a5,12(sp)
8040beb0:	00f4a023          	sw	a5,0(s1)
8040beb4:	01c12783          	lw	a5,28(sp)
8040beb8:	00f42023          	sw	a5,0(s0)
8040bebc:	02c12083          	lw	ra,44(sp)
8040bec0:	02812403          	lw	s0,40(sp)
8040bec4:	02412483          	lw	s1,36(sp)
8040bec8:	03010113          	addi	sp,sp,48
8040becc:	00008067          	ret

8040bed0 <__alloc_inode>:
8040bed0:	ff010113          	addi	sp,sp,-16
8040bed4:	00812423          	sw	s0,8(sp)
8040bed8:	00050413          	mv	s0,a0
8040bedc:	04000513          	li	a0,64
8040bee0:	00112623          	sw	ra,12(sp)
8040bee4:	f35f60ef          	jal	ra,80402e18 <kmalloc>
8040bee8:	00050463          	beqz	a0,8040bef0 <__alloc_inode+0x20>
8040beec:	02852623          	sw	s0,44(a0)
8040bef0:	00c12083          	lw	ra,12(sp)
8040bef4:	00812403          	lw	s0,8(sp)
8040bef8:	01010113          	addi	sp,sp,16
8040befc:	00008067          	ret

8040bf00 <inode_init>:
8040bf00:	00100793          	li	a5,1
8040bf04:	02052a23          	sw	zero,52(a0)
8040bf08:	02b52e23          	sw	a1,60(a0)
8040bf0c:	02c52c23          	sw	a2,56(a0)
8040bf10:	02f52823          	sw	a5,48(a0)
8040bf14:	00008067          	ret

8040bf18 <inode_kill>:
8040bf18:	03052703          	lw	a4,48(a0)
8040bf1c:	ff010113          	addi	sp,sp,-16
8040bf20:	00112623          	sw	ra,12(sp)
8040bf24:	00071c63          	bnez	a4,8040bf3c <inode_kill+0x24>
8040bf28:	03452783          	lw	a5,52(a0)
8040bf2c:	02079863          	bnez	a5,8040bf5c <inode_kill+0x44>
8040bf30:	00c12083          	lw	ra,12(sp)
8040bf34:	01010113          	addi	sp,sp,16
8040bf38:	ffdf606f          	j	80402f34 <kfree>
8040bf3c:	00008697          	auipc	a3,0x8
8040bf40:	b8068693          	addi	a3,a3,-1152 # 80413abc <syscalls+0x6cc>
8040bf44:	00005617          	auipc	a2,0x5
8040bf48:	d7c60613          	addi	a2,a2,-644 # 80410cc0 <commands+0x3c>
8040bf4c:	02900593          	li	a1,41
8040bf50:	00008517          	auipc	a0,0x8
8040bf54:	b8850513          	addi	a0,a0,-1144 # 80413ad8 <syscalls+0x6e8>
8040bf58:	b74f40ef          	jal	ra,804002cc <__panic>
8040bf5c:	00008697          	auipc	a3,0x8
8040bf60:	b9068693          	addi	a3,a3,-1136 # 80413aec <syscalls+0x6fc>
8040bf64:	00005617          	auipc	a2,0x5
8040bf68:	d5c60613          	addi	a2,a2,-676 # 80410cc0 <commands+0x3c>
8040bf6c:	02a00593          	li	a1,42
8040bf70:	00008517          	auipc	a0,0x8
8040bf74:	b6850513          	addi	a0,a0,-1176 # 80413ad8 <syscalls+0x6e8>
8040bf78:	b54f40ef          	jal	ra,804002cc <__panic>

8040bf7c <inode_ref_inc>:
8040bf7c:	03052783          	lw	a5,48(a0)
8040bf80:	00050713          	mv	a4,a0
8040bf84:	00178513          	addi	a0,a5,1
8040bf88:	02a72823          	sw	a0,48(a4)
8040bf8c:	00008067          	ret

8040bf90 <inode_open_inc>:
8040bf90:	03452783          	lw	a5,52(a0)
8040bf94:	00050713          	mv	a4,a0
8040bf98:	00178513          	addi	a0,a5,1
8040bf9c:	02a72a23          	sw	a0,52(a4)
8040bfa0:	00008067          	ret

8040bfa4 <inode_check>:
8040bfa4:	ff010113          	addi	sp,sp,-16
8040bfa8:	00112623          	sw	ra,12(sp)
8040bfac:	04050263          	beqz	a0,8040bff0 <inode_check+0x4c>
8040bfb0:	03c52783          	lw	a5,60(a0)
8040bfb4:	02078e63          	beqz	a5,8040bff0 <inode_check+0x4c>
8040bfb8:	0007a703          	lw	a4,0(a5)
8040bfbc:	8c4ba7b7          	lui	a5,0x8c4ba
8040bfc0:	47678793          	addi	a5,a5,1142 # 8c4ba476 <end+0xc01fbe2>
8040bfc4:	08f71663          	bne	a4,a5,8040c050 <inode_check+0xac>
8040bfc8:	03052703          	lw	a4,48(a0)
8040bfcc:	03452783          	lw	a5,52(a0)
8040bfd0:	06f74063          	blt	a4,a5,8040c030 <inode_check+0x8c>
8040bfd4:	0407ce63          	bltz	a5,8040c030 <inode_check+0x8c>
8040bfd8:	000106b7          	lui	a3,0x10
8040bfdc:	02d75a63          	bge	a4,a3,8040c010 <inode_check+0x6c>
8040bfe0:	02d7d863          	bge	a5,a3,8040c010 <inode_check+0x6c>
8040bfe4:	00c12083          	lw	ra,12(sp)
8040bfe8:	01010113          	addi	sp,sp,16
8040bfec:	00008067          	ret
8040bff0:	00008697          	auipc	a3,0x8
8040bff4:	b1868693          	addi	a3,a3,-1256 # 80413b08 <syscalls+0x718>
8040bff8:	00005617          	auipc	a2,0x5
8040bffc:	cc860613          	addi	a2,a2,-824 # 80410cc0 <commands+0x3c>
8040c000:	06e00593          	li	a1,110
8040c004:	00008517          	auipc	a0,0x8
8040c008:	ad450513          	addi	a0,a0,-1324 # 80413ad8 <syscalls+0x6e8>
8040c00c:	ac0f40ef          	jal	ra,804002cc <__panic>
8040c010:	00008697          	auipc	a3,0x8
8040c014:	b7468693          	addi	a3,a3,-1164 # 80413b84 <syscalls+0x794>
8040c018:	00005617          	auipc	a2,0x5
8040c01c:	ca860613          	addi	a2,a2,-856 # 80410cc0 <commands+0x3c>
8040c020:	07200593          	li	a1,114
8040c024:	00008517          	auipc	a0,0x8
8040c028:	ab450513          	addi	a0,a0,-1356 # 80413ad8 <syscalls+0x6e8>
8040c02c:	aa0f40ef          	jal	ra,804002cc <__panic>
8040c030:	00008697          	auipc	a3,0x8
8040c034:	b2868693          	addi	a3,a3,-1240 # 80413b58 <syscalls+0x768>
8040c038:	00005617          	auipc	a2,0x5
8040c03c:	c8860613          	addi	a2,a2,-888 # 80410cc0 <commands+0x3c>
8040c040:	07100593          	li	a1,113
8040c044:	00008517          	auipc	a0,0x8
8040c048:	a9450513          	addi	a0,a0,-1388 # 80413ad8 <syscalls+0x6e8>
8040c04c:	a80f40ef          	jal	ra,804002cc <__panic>
8040c050:	00008697          	auipc	a3,0x8
8040c054:	ae068693          	addi	a3,a3,-1312 # 80413b30 <syscalls+0x740>
8040c058:	00005617          	auipc	a2,0x5
8040c05c:	c6860613          	addi	a2,a2,-920 # 80410cc0 <commands+0x3c>
8040c060:	06f00593          	li	a1,111
8040c064:	00008517          	auipc	a0,0x8
8040c068:	a7450513          	addi	a0,a0,-1420 # 80413ad8 <syscalls+0x6e8>
8040c06c:	a60f40ef          	jal	ra,804002cc <__panic>

8040c070 <inode_ref_dec>:
8040c070:	ff010113          	addi	sp,sp,-16
8040c074:	00812423          	sw	s0,8(sp)
8040c078:	03052403          	lw	s0,48(a0)
8040c07c:	00112623          	sw	ra,12(sp)
8040c080:	00912223          	sw	s1,4(sp)
8040c084:	01212023          	sw	s2,0(sp)
8040c088:	0a805663          	blez	s0,8040c134 <inode_ref_dec+0xc4>
8040c08c:	fff40413          	addi	s0,s0,-1
8040c090:	02852823          	sw	s0,48(a0)
8040c094:	00050493          	mv	s1,a0
8040c098:	02041a63          	bnez	s0,8040c0cc <inode_ref_dec+0x5c>
8040c09c:	03c52783          	lw	a5,60(a0)
8040c0a0:	06078a63          	beqz	a5,8040c114 <inode_ref_dec+0xa4>
8040c0a4:	0247a903          	lw	s2,36(a5)
8040c0a8:	06090663          	beqz	s2,8040c114 <inode_ref_dec+0xa4>
8040c0ac:	00008597          	auipc	a1,0x8
8040c0b0:	b8058593          	addi	a1,a1,-1152 # 80413c2c <syscalls+0x83c>
8040c0b4:	ef1ff0ef          	jal	ra,8040bfa4 <inode_check>
8040c0b8:	00048513          	mv	a0,s1
8040c0bc:	000900e7          	jalr	s2
8040c0c0:	00050663          	beqz	a0,8040c0cc <inode_ref_dec+0x5c>
8040c0c4:	ff100793          	li	a5,-15
8040c0c8:	02f51063          	bne	a0,a5,8040c0e8 <inode_ref_dec+0x78>
8040c0cc:	00c12083          	lw	ra,12(sp)
8040c0d0:	00040513          	mv	a0,s0
8040c0d4:	00812403          	lw	s0,8(sp)
8040c0d8:	00412483          	lw	s1,4(sp)
8040c0dc:	00012903          	lw	s2,0(sp)
8040c0e0:	01010113          	addi	sp,sp,16
8040c0e4:	00008067          	ret
8040c0e8:	00050593          	mv	a1,a0
8040c0ec:	00008517          	auipc	a0,0x8
8040c0f0:	b4850513          	addi	a0,a0,-1208 # 80413c34 <syscalls+0x844>
8040c0f4:	854f40ef          	jal	ra,80400148 <cprintf>
8040c0f8:	00c12083          	lw	ra,12(sp)
8040c0fc:	00040513          	mv	a0,s0
8040c100:	00812403          	lw	s0,8(sp)
8040c104:	00412483          	lw	s1,4(sp)
8040c108:	00012903          	lw	s2,0(sp)
8040c10c:	01010113          	addi	sp,sp,16
8040c110:	00008067          	ret
8040c114:	00008697          	auipc	a3,0x8
8040c118:	ac868693          	addi	a3,a3,-1336 # 80413bdc <syscalls+0x7ec>
8040c11c:	00005617          	auipc	a2,0x5
8040c120:	ba460613          	addi	a2,a2,-1116 # 80410cc0 <commands+0x3c>
8040c124:	04400593          	li	a1,68
8040c128:	00008517          	auipc	a0,0x8
8040c12c:	9b050513          	addi	a0,a0,-1616 # 80413ad8 <syscalls+0x6e8>
8040c130:	99cf40ef          	jal	ra,804002cc <__panic>
8040c134:	00008697          	auipc	a3,0x8
8040c138:	a8c68693          	addi	a3,a3,-1396 # 80413bc0 <syscalls+0x7d0>
8040c13c:	00005617          	auipc	a2,0x5
8040c140:	b8460613          	addi	a2,a2,-1148 # 80410cc0 <commands+0x3c>
8040c144:	03f00593          	li	a1,63
8040c148:	00008517          	auipc	a0,0x8
8040c14c:	99050513          	addi	a0,a0,-1648 # 80413ad8 <syscalls+0x6e8>
8040c150:	97cf40ef          	jal	ra,804002cc <__panic>

8040c154 <inode_open_dec>:
8040c154:	ff010113          	addi	sp,sp,-16
8040c158:	00812423          	sw	s0,8(sp)
8040c15c:	03452403          	lw	s0,52(a0)
8040c160:	00112623          	sw	ra,12(sp)
8040c164:	00912223          	sw	s1,4(sp)
8040c168:	01212023          	sw	s2,0(sp)
8040c16c:	0a805263          	blez	s0,8040c210 <inode_open_dec+0xbc>
8040c170:	fff40413          	addi	s0,s0,-1
8040c174:	02852a23          	sw	s0,52(a0)
8040c178:	00050493          	mv	s1,a0
8040c17c:	02041663          	bnez	s0,8040c1a8 <inode_open_dec+0x54>
8040c180:	03c52783          	lw	a5,60(a0)
8040c184:	06078663          	beqz	a5,8040c1f0 <inode_open_dec+0x9c>
8040c188:	0087a903          	lw	s2,8(a5)
8040c18c:	06090263          	beqz	s2,8040c1f0 <inode_open_dec+0x9c>
8040c190:	00008597          	auipc	a1,0x8
8040c194:	b3058593          	addi	a1,a1,-1232 # 80413cc0 <syscalls+0x8d0>
8040c198:	e0dff0ef          	jal	ra,8040bfa4 <inode_check>
8040c19c:	00048513          	mv	a0,s1
8040c1a0:	000900e7          	jalr	s2
8040c1a4:	02051063          	bnez	a0,8040c1c4 <inode_open_dec+0x70>
8040c1a8:	00c12083          	lw	ra,12(sp)
8040c1ac:	00040513          	mv	a0,s0
8040c1b0:	00812403          	lw	s0,8(sp)
8040c1b4:	00412483          	lw	s1,4(sp)
8040c1b8:	00012903          	lw	s2,0(sp)
8040c1bc:	01010113          	addi	sp,sp,16
8040c1c0:	00008067          	ret
8040c1c4:	00050593          	mv	a1,a0
8040c1c8:	00008517          	auipc	a0,0x8
8040c1cc:	b0050513          	addi	a0,a0,-1280 # 80413cc8 <syscalls+0x8d8>
8040c1d0:	f79f30ef          	jal	ra,80400148 <cprintf>
8040c1d4:	00c12083          	lw	ra,12(sp)
8040c1d8:	00040513          	mv	a0,s0
8040c1dc:	00812403          	lw	s0,8(sp)
8040c1e0:	00412483          	lw	s1,4(sp)
8040c1e4:	00012903          	lw	s2,0(sp)
8040c1e8:	01010113          	addi	sp,sp,16
8040c1ec:	00008067          	ret
8040c1f0:	00008697          	auipc	a3,0x8
8040c1f4:	a8068693          	addi	a3,a3,-1408 # 80413c70 <syscalls+0x880>
8040c1f8:	00005617          	auipc	a2,0x5
8040c1fc:	ac860613          	addi	a2,a2,-1336 # 80410cc0 <commands+0x3c>
8040c200:	06100593          	li	a1,97
8040c204:	00008517          	auipc	a0,0x8
8040c208:	8d450513          	addi	a0,a0,-1836 # 80413ad8 <syscalls+0x6e8>
8040c20c:	8c0f40ef          	jal	ra,804002cc <__panic>
8040c210:	00008697          	auipc	a3,0x8
8040c214:	a4468693          	addi	a3,a3,-1468 # 80413c54 <syscalls+0x864>
8040c218:	00005617          	auipc	a2,0x5
8040c21c:	aa860613          	addi	a2,a2,-1368 # 80410cc0 <commands+0x3c>
8040c220:	05c00593          	li	a1,92
8040c224:	00008517          	auipc	a0,0x8
8040c228:	8b450513          	addi	a0,a0,-1868 # 80413ad8 <syscalls+0x6e8>
8040c22c:	8a0f40ef          	jal	ra,804002cc <__panic>

8040c230 <vfs_open>:
8040c230:	fd010113          	addi	sp,sp,-48
8040c234:	02912223          	sw	s1,36(sp)
8040c238:	03212023          	sw	s2,32(sp)
8040c23c:	01312e23          	sw	s3,28(sp)
8040c240:	02112623          	sw	ra,44(sp)
8040c244:	02812423          	sw	s0,40(sp)
8040c248:	01412c23          	sw	s4,24(sp)
8040c24c:	01512a23          	sw	s5,20(sp)
8040c250:	0035f793          	andi	a5,a1,3
8040c254:	00058493          	mv	s1,a1
8040c258:	00050913          	mv	s2,a0
8040c25c:	00060993          	mv	s3,a2
8040c260:	16078a63          	beqz	a5,8040c3d4 <vfs_open+0x1a4>
8040c264:	00300713          	li	a4,3
8040c268:	0105fa93          	andi	s5,a1,16
8040c26c:	16e78063          	beq	a5,a4,8040c3cc <vfs_open+0x19c>
8040c270:	00410593          	addi	a1,sp,4
8040c274:	00090513          	mv	a0,s2
8040c278:	b25ff0ef          	jal	ra,8040bd9c <vfs_lookup>
8040c27c:	00050413          	mv	s0,a0
8040c280:	0044fa13          	andi	s4,s1,4
8040c284:	0c051c63          	bnez	a0,8040c35c <vfs_open+0x12c>
8040c288:	00c4f793          	andi	a5,s1,12
8040c28c:	00c00713          	li	a4,12
8040c290:	16e78663          	beq	a5,a4,8040c3fc <vfs_open+0x1cc>
8040c294:	00412403          	lw	s0,4(sp)
8040c298:	1a040663          	beqz	s0,8040c444 <vfs_open+0x214>
8040c29c:	03c42783          	lw	a5,60(s0)
8040c2a0:	16078263          	beqz	a5,8040c404 <vfs_open+0x1d4>
8040c2a4:	0047a783          	lw	a5,4(a5)
8040c2a8:	14078e63          	beqz	a5,8040c404 <vfs_open+0x1d4>
8040c2ac:	00040513          	mv	a0,s0
8040c2b0:	00008597          	auipc	a1,0x8
8040c2b4:	b0858593          	addi	a1,a1,-1272 # 80413db8 <syscalls+0x9c8>
8040c2b8:	cedff0ef          	jal	ra,8040bfa4 <inode_check>
8040c2bc:	03c42783          	lw	a5,60(s0)
8040c2c0:	00412503          	lw	a0,4(sp)
8040c2c4:	00048593          	mv	a1,s1
8040c2c8:	0047a783          	lw	a5,4(a5)
8040c2cc:	000780e7          	jalr	a5
8040c2d0:	00050413          	mv	s0,a0
8040c2d4:	00412503          	lw	a0,4(sp)
8040c2d8:	10041e63          	bnez	s0,8040c3f4 <vfs_open+0x1c4>
8040c2dc:	015a6a33          	or	s4,s4,s5
8040c2e0:	cb1ff0ef          	jal	ra,8040bf90 <inode_open_inc>
8040c2e4:	040a0463          	beqz	s4,8040c32c <vfs_open+0xfc>
8040c2e8:	00412483          	lw	s1,4(sp)
8040c2ec:	12048c63          	beqz	s1,8040c424 <vfs_open+0x1f4>
8040c2f0:	03c4a783          	lw	a5,60(s1)
8040c2f4:	12078863          	beqz	a5,8040c424 <vfs_open+0x1f4>
8040c2f8:	0307a783          	lw	a5,48(a5)
8040c2fc:	12078463          	beqz	a5,8040c424 <vfs_open+0x1f4>
8040c300:	00008597          	auipc	a1,0x8
8040c304:	b1458593          	addi	a1,a1,-1260 # 80413e14 <syscalls+0xa24>
8040c308:	00048513          	mv	a0,s1
8040c30c:	c99ff0ef          	jal	ra,8040bfa4 <inode_check>
8040c310:	03c4a783          	lw	a5,60(s1)
8040c314:	00412503          	lw	a0,4(sp)
8040c318:	00000593          	li	a1,0
8040c31c:	0307a783          	lw	a5,48(a5)
8040c320:	000780e7          	jalr	a5
8040c324:	00050793          	mv	a5,a0
8040c328:	0a051e63          	bnez	a0,8040c3e4 <vfs_open+0x1b4>
8040c32c:	00412783          	lw	a5,4(sp)
8040c330:	00f9a023          	sw	a5,0(s3)
8040c334:	02c12083          	lw	ra,44(sp)
8040c338:	00040513          	mv	a0,s0
8040c33c:	02812403          	lw	s0,40(sp)
8040c340:	02412483          	lw	s1,36(sp)
8040c344:	02012903          	lw	s2,32(sp)
8040c348:	01c12983          	lw	s3,28(sp)
8040c34c:	01812a03          	lw	s4,24(sp)
8040c350:	01412a83          	lw	s5,20(sp)
8040c354:	03010113          	addi	sp,sp,48
8040c358:	00008067          	ret
8040c35c:	ff000793          	li	a5,-16
8040c360:	fcf51ae3          	bne	a0,a5,8040c334 <vfs_open+0x104>
8040c364:	fc0a08e3          	beqz	s4,8040c334 <vfs_open+0x104>
8040c368:	00810613          	addi	a2,sp,8
8040c36c:	00c10593          	addi	a1,sp,12
8040c370:	00090513          	mv	a0,s2
8040c374:	b0dff0ef          	jal	ra,8040be80 <vfs_lookup_parent>
8040c378:	00050413          	mv	s0,a0
8040c37c:	fa051ce3          	bnez	a0,8040c334 <vfs_open+0x104>
8040c380:	00c12403          	lw	s0,12(sp)
8040c384:	0e040063          	beqz	s0,8040c464 <vfs_open+0x234>
8040c388:	03c42783          	lw	a5,60(s0)
8040c38c:	0c078c63          	beqz	a5,8040c464 <vfs_open+0x234>
8040c390:	0347a783          	lw	a5,52(a5)
8040c394:	0c078863          	beqz	a5,8040c464 <vfs_open+0x234>
8040c398:	00040513          	mv	a0,s0
8040c39c:	00008597          	auipc	a1,0x8
8040c3a0:	9b458593          	addi	a1,a1,-1612 # 80413d50 <syscalls+0x960>
8040c3a4:	c01ff0ef          	jal	ra,8040bfa4 <inode_check>
8040c3a8:	03c42783          	lw	a5,60(s0)
8040c3ac:	00812583          	lw	a1,8(sp)
8040c3b0:	00c12503          	lw	a0,12(sp)
8040c3b4:	0347a783          	lw	a5,52(a5)
8040c3b8:	0034d613          	srli	a2,s1,0x3
8040c3bc:	00410693          	addi	a3,sp,4
8040c3c0:	00167613          	andi	a2,a2,1
8040c3c4:	000780e7          	jalr	a5
8040c3c8:	ecdff06f          	j	8040c294 <vfs_open+0x64>
8040c3cc:	ffd00413          	li	s0,-3
8040c3d0:	f65ff06f          	j	8040c334 <vfs_open+0x104>
8040c3d4:	0105fa93          	andi	s5,a1,16
8040c3d8:	ffd00413          	li	s0,-3
8040c3dc:	f40a9ce3          	bnez	s5,8040c334 <vfs_open+0x104>
8040c3e0:	e91ff06f          	j	8040c270 <vfs_open+0x40>
8040c3e4:	00412503          	lw	a0,4(sp)
8040c3e8:	00078413          	mv	s0,a5
8040c3ec:	d69ff0ef          	jal	ra,8040c154 <inode_open_dec>
8040c3f0:	00412503          	lw	a0,4(sp)
8040c3f4:	c7dff0ef          	jal	ra,8040c070 <inode_ref_dec>
8040c3f8:	f3dff06f          	j	8040c334 <vfs_open+0x104>
8040c3fc:	fe900413          	li	s0,-23
8040c400:	f35ff06f          	j	8040c334 <vfs_open+0x104>
8040c404:	00008697          	auipc	a3,0x8
8040c408:	96468693          	addi	a3,a3,-1692 # 80413d68 <syscalls+0x978>
8040c40c:	00005617          	auipc	a2,0x5
8040c410:	8b460613          	addi	a2,a2,-1868 # 80410cc0 <commands+0x3c>
8040c414:	03300593          	li	a1,51
8040c418:	00008517          	auipc	a0,0x8
8040c41c:	92050513          	addi	a0,a0,-1760 # 80413d38 <syscalls+0x948>
8040c420:	eadf30ef          	jal	ra,804002cc <__panic>
8040c424:	00008697          	auipc	a3,0x8
8040c428:	99c68693          	addi	a3,a3,-1636 # 80413dc0 <syscalls+0x9d0>
8040c42c:	00005617          	auipc	a2,0x5
8040c430:	89460613          	addi	a2,a2,-1900 # 80410cc0 <commands+0x3c>
8040c434:	03a00593          	li	a1,58
8040c438:	00008517          	auipc	a0,0x8
8040c43c:	90050513          	addi	a0,a0,-1792 # 80413d38 <syscalls+0x948>
8040c440:	e8df30ef          	jal	ra,804002cc <__panic>
8040c444:	00008697          	auipc	a3,0x8
8040c448:	91468693          	addi	a3,a3,-1772 # 80413d58 <syscalls+0x968>
8040c44c:	00005617          	auipc	a2,0x5
8040c450:	87460613          	addi	a2,a2,-1932 # 80410cc0 <commands+0x3c>
8040c454:	03100593          	li	a1,49
8040c458:	00008517          	auipc	a0,0x8
8040c45c:	8e050513          	addi	a0,a0,-1824 # 80413d38 <syscalls+0x948>
8040c460:	e6df30ef          	jal	ra,804002cc <__panic>
8040c464:	00008697          	auipc	a3,0x8
8040c468:	88468693          	addi	a3,a3,-1916 # 80413ce8 <syscalls+0x8f8>
8040c46c:	00005617          	auipc	a2,0x5
8040c470:	85460613          	addi	a2,a2,-1964 # 80410cc0 <commands+0x3c>
8040c474:	02c00593          	li	a1,44
8040c478:	00008517          	auipc	a0,0x8
8040c47c:	8c050513          	addi	a0,a0,-1856 # 80413d38 <syscalls+0x948>
8040c480:	e4df30ef          	jal	ra,804002cc <__panic>

8040c484 <vfs_close>:
8040c484:	ff010113          	addi	sp,sp,-16
8040c488:	00112623          	sw	ra,12(sp)
8040c48c:	00812423          	sw	s0,8(sp)
8040c490:	00050413          	mv	s0,a0
8040c494:	cc1ff0ef          	jal	ra,8040c154 <inode_open_dec>
8040c498:	00040513          	mv	a0,s0
8040c49c:	bd5ff0ef          	jal	ra,8040c070 <inode_ref_dec>
8040c4a0:	00c12083          	lw	ra,12(sp)
8040c4a4:	00812403          	lw	s0,8(sp)
8040c4a8:	00000513          	li	a0,0
8040c4ac:	01010113          	addi	sp,sp,16
8040c4b0:	00008067          	ret

8040c4b4 <__alloc_fs>:
8040c4b4:	ff010113          	addi	sp,sp,-16
8040c4b8:	00812423          	sw	s0,8(sp)
8040c4bc:	00050413          	mv	s0,a0
8040c4c0:	08000513          	li	a0,128
8040c4c4:	00112623          	sw	ra,12(sp)
8040c4c8:	951f60ef          	jal	ra,80402e18 <kmalloc>
8040c4cc:	00050463          	beqz	a0,8040c4d4 <__alloc_fs+0x20>
8040c4d0:	06852623          	sw	s0,108(a0)
8040c4d4:	00c12083          	lw	ra,12(sp)
8040c4d8:	00812403          	lw	s0,8(sp)
8040c4dc:	01010113          	addi	sp,sp,16
8040c4e0:	00008067          	ret

8040c4e4 <vfs_init>:
8040c4e4:	ff010113          	addi	sp,sp,-16
8040c4e8:	00100593          	li	a1,1
8040c4ec:	0008d517          	auipc	a0,0x8d
8040c4f0:	2f850513          	addi	a0,a0,760 # 804997e4 <bootfs_sem>
8040c4f4:	00112623          	sw	ra,12(sp)
8040c4f8:	d48fa0ef          	jal	ra,80406a40 <sem_init>
8040c4fc:	00c12083          	lw	ra,12(sp)
8040c500:	01010113          	addi	sp,sp,16
8040c504:	8bcff06f          	j	8040b5c0 <vfs_devlist_init>

8040c508 <vfs_set_bootfs>:
8040c508:	fe010113          	addi	sp,sp,-32
8040c50c:	00812c23          	sw	s0,24(sp)
8040c510:	00112e23          	sw	ra,28(sp)
8040c514:	00912a23          	sw	s1,20(sp)
8040c518:	00012623          	sw	zero,12(sp)
8040c51c:	00050413          	mv	s0,a0
8040c520:	04050a63          	beqz	a0,8040c574 <vfs_set_bootfs+0x6c>
8040c524:	03a00593          	li	a1,58
8040c528:	42d030ef          	jal	ra,80410154 <strchr>
8040c52c:	08050c63          	beqz	a0,8040c5c4 <vfs_set_bootfs+0xbc>
8040c530:	00154783          	lbu	a5,1(a0)
8040c534:	08079863          	bnez	a5,8040c5c4 <vfs_set_bootfs+0xbc>
8040c538:	00040513          	mv	a0,s0
8040c53c:	d50ff0ef          	jal	ra,8040ba8c <vfs_chdir>
8040c540:	00050413          	mv	s0,a0
8040c544:	00050e63          	beqz	a0,8040c560 <vfs_set_bootfs+0x58>
8040c548:	01c12083          	lw	ra,28(sp)
8040c54c:	00040513          	mv	a0,s0
8040c550:	01812403          	lw	s0,24(sp)
8040c554:	01412483          	lw	s1,20(sp)
8040c558:	02010113          	addi	sp,sp,32
8040c55c:	00008067          	ret
8040c560:	00c10513          	addi	a0,sp,12
8040c564:	bc0ff0ef          	jal	ra,8040b924 <vfs_get_curdir>
8040c568:	00050413          	mv	s0,a0
8040c56c:	fc051ee3          	bnez	a0,8040c548 <vfs_set_bootfs+0x40>
8040c570:	00c12403          	lw	s0,12(sp)
8040c574:	0008d517          	auipc	a0,0x8d
8040c578:	27050513          	addi	a0,a0,624 # 804997e4 <bootfs_sem>
8040c57c:	cd4fa0ef          	jal	ra,80406a50 <down>
8040c580:	0008e797          	auipc	a5,0x8e
8040c584:	2fc78793          	addi	a5,a5,764 # 8049a87c <bootfs_node>
8040c588:	0007a483          	lw	s1,0(a5)
8040c58c:	0008d517          	auipc	a0,0x8d
8040c590:	25850513          	addi	a0,a0,600 # 804997e4 <bootfs_sem>
8040c594:	0087a023          	sw	s0,0(a5)
8040c598:	00000413          	li	s0,0
8040c59c:	cb0fa0ef          	jal	ra,80406a4c <up>
8040c5a0:	fa0484e3          	beqz	s1,8040c548 <vfs_set_bootfs+0x40>
8040c5a4:	00048513          	mv	a0,s1
8040c5a8:	ac9ff0ef          	jal	ra,8040c070 <inode_ref_dec>
8040c5ac:	01c12083          	lw	ra,28(sp)
8040c5b0:	00040513          	mv	a0,s0
8040c5b4:	01812403          	lw	s0,24(sp)
8040c5b8:	01412483          	lw	s1,20(sp)
8040c5bc:	02010113          	addi	sp,sp,32
8040c5c0:	00008067          	ret
8040c5c4:	ffd00413          	li	s0,-3
8040c5c8:	f81ff06f          	j	8040c548 <vfs_set_bootfs+0x40>

8040c5cc <vfs_get_bootfs>:
8040c5cc:	ff010113          	addi	sp,sp,-16
8040c5d0:	00912223          	sw	s1,4(sp)
8040c5d4:	0008e497          	auipc	s1,0x8e
8040c5d8:	2a848493          	addi	s1,s1,680 # 8049a87c <bootfs_node>
8040c5dc:	0004a783          	lw	a5,0(s1)
8040c5e0:	00112623          	sw	ra,12(sp)
8040c5e4:	00812423          	sw	s0,8(sp)
8040c5e8:	04078c63          	beqz	a5,8040c640 <vfs_get_bootfs+0x74>
8040c5ec:	00050413          	mv	s0,a0
8040c5f0:	0008d517          	auipc	a0,0x8d
8040c5f4:	1f450513          	addi	a0,a0,500 # 804997e4 <bootfs_sem>
8040c5f8:	c58fa0ef          	jal	ra,80406a50 <down>
8040c5fc:	0004a483          	lw	s1,0(s1)
8040c600:	02048a63          	beqz	s1,8040c634 <vfs_get_bootfs+0x68>
8040c604:	00048513          	mv	a0,s1
8040c608:	975ff0ef          	jal	ra,8040bf7c <inode_ref_inc>
8040c60c:	0008d517          	auipc	a0,0x8d
8040c610:	1d850513          	addi	a0,a0,472 # 804997e4 <bootfs_sem>
8040c614:	c38fa0ef          	jal	ra,80406a4c <up>
8040c618:	00000513          	li	a0,0
8040c61c:	00942023          	sw	s1,0(s0)
8040c620:	00c12083          	lw	ra,12(sp)
8040c624:	00812403          	lw	s0,8(sp)
8040c628:	00412483          	lw	s1,4(sp)
8040c62c:	01010113          	addi	sp,sp,16
8040c630:	00008067          	ret
8040c634:	0008d517          	auipc	a0,0x8d
8040c638:	1b050513          	addi	a0,a0,432 # 804997e4 <bootfs_sem>
8040c63c:	c10fa0ef          	jal	ra,80406a4c <up>
8040c640:	ff000513          	li	a0,-16
8040c644:	fddff06f          	j	8040c620 <vfs_get_bootfs+0x54>

8040c648 <stdin_open>:
8040c648:	00000513          	li	a0,0
8040c64c:	00059463          	bnez	a1,8040c654 <stdin_open+0xc>
8040c650:	00008067          	ret
8040c654:	ffd00513          	li	a0,-3
8040c658:	00008067          	ret

8040c65c <stdin_close>:
8040c65c:	00000513          	li	a0,0
8040c660:	00008067          	ret

8040c664 <stdin_ioctl>:
8040c664:	ffd00513          	li	a0,-3
8040c668:	00008067          	ret

8040c66c <stdin_io>:
8040c66c:	fb010113          	addi	sp,sp,-80
8040c670:	04112623          	sw	ra,76(sp)
8040c674:	04812423          	sw	s0,72(sp)
8040c678:	04912223          	sw	s1,68(sp)
8040c67c:	05212023          	sw	s2,64(sp)
8040c680:	03312e23          	sw	s3,60(sp)
8040c684:	03412c23          	sw	s4,56(sp)
8040c688:	03512a23          	sw	s5,52(sp)
8040c68c:	03612823          	sw	s6,48(sp)
8040c690:	03712623          	sw	s7,44(sp)
8040c694:	03812423          	sw	s8,40(sp)
8040c698:	03912223          	sw	s9,36(sp)
8040c69c:	18061e63          	bnez	a2,8040c838 <stdin_io+0x1cc>
8040c6a0:	0005ac03          	lw	s8,0(a1)
8040c6a4:	00c5ab83          	lw	s7,12(a1)
8040c6a8:	00058a93          	mv	s5,a1
8040c6ac:	100027f3          	csrr	a5,sstatus
8040c6b0:	0027f793          	andi	a5,a5,2
8040c6b4:	16079663          	bnez	a5,8040c820 <stdin_io+0x1b4>
8040c6b8:	00000c93          	li	s9,0
8040c6bc:	140b8e63          	beqz	s7,8040c818 <stdin_io+0x1ac>
8040c6c0:	0008e917          	auipc	s2,0x8e
8040c6c4:	1c890913          	addi	s2,s2,456 # 8049a888 <p_rpos>
8040c6c8:	00092783          	lw	a5,0(s2)
8040c6cc:	80000437          	lui	s0,0x80000
8040c6d0:	00001b37          	lui	s6,0x1
8040c6d4:	00000a13          	li	s4,0
8040c6d8:	0008e997          	auipc	s3,0x8e
8040c6dc:	1b498993          	addi	s3,s3,436 # 8049a88c <p_wpos>
8040c6e0:	00440413          	addi	s0,s0,4 # 80000004 <end+0xffb65770>
8040c6e4:	0008e497          	auipc	s1,0x8e
8040c6e8:	19c48493          	addi	s1,s1,412 # 8049a880 <__wait_queue>
8040c6ec:	fffb0b13          	addi	s6,s6,-1 # fff <_binary_bin_swap_img_size-0x7001>
8040c6f0:	0009a703          	lw	a4,0(s3)
8040c6f4:	02e7de63          	bge	a5,a4,8040c730 <stdin_io+0xc4>
8040c6f8:	0d80006f          	j	8040c7d0 <stdin_io+0x164>
8040c6fc:	e01fd0ef          	jal	ra,8040a4fc <schedule>
8040c700:	100027f3          	csrr	a5,sstatus
8040c704:	0027f793          	andi	a5,a5,2
8040c708:	00000c93          	li	s9,0
8040c70c:	04079863          	bnez	a5,8040c75c <stdin_io+0xf0>
8040c710:	00c10513          	addi	a0,sp,12
8040c714:	f39f90ef          	jal	ra,8040664c <wait_in_queue>
8040c718:	04051c63          	bnez	a0,8040c770 <stdin_io+0x104>
8040c71c:	01012783          	lw	a5,16(sp)
8040c720:	06879263          	bne	a5,s0,8040c784 <stdin_io+0x118>
8040c724:	00092783          	lw	a5,0(s2)
8040c728:	0009a703          	lw	a4,0(s3)
8040c72c:	0ae7c263          	blt	a5,a4,8040c7d0 <stdin_io+0x164>
8040c730:	00040613          	mv	a2,s0
8040c734:	00c10593          	addi	a1,sp,12
8040c738:	00048513          	mv	a0,s1
8040c73c:	8a0fa0ef          	jal	ra,804067dc <wait_current_set>
8040c740:	fa0c8ee3          	beqz	s9,8040c6fc <stdin_io+0x90>
8040c744:	e2cf40ef          	jal	ra,80400d70 <intr_enable>
8040c748:	db5fd0ef          	jal	ra,8040a4fc <schedule>
8040c74c:	100027f3          	csrr	a5,sstatus
8040c750:	0027f793          	andi	a5,a5,2
8040c754:	00000c93          	li	s9,0
8040c758:	fa078ce3          	beqz	a5,8040c710 <stdin_io+0xa4>
8040c75c:	e1cf40ef          	jal	ra,80400d78 <intr_disable>
8040c760:	00c10513          	addi	a0,sp,12
8040c764:	00100c93          	li	s9,1
8040c768:	ee5f90ef          	jal	ra,8040664c <wait_in_queue>
8040c76c:	fa0508e3          	beqz	a0,8040c71c <stdin_io+0xb0>
8040c770:	00c10593          	addi	a1,sp,12
8040c774:	00048513          	mv	a0,s1
8040c778:	e59f90ef          	jal	ra,804065d0 <wait_queue_del>
8040c77c:	01012783          	lw	a5,16(sp)
8040c780:	fa8782e3          	beq	a5,s0,8040c724 <stdin_io+0xb8>
8040c784:	080c9663          	bnez	s9,8040c810 <stdin_io+0x1a4>
8040c788:	080a0863          	beqz	s4,8040c818 <stdin_io+0x1ac>
8040c78c:	00caa783          	lw	a5,12(s5)
8040c790:	414787b3          	sub	a5,a5,s4
8040c794:	00faa623          	sw	a5,12(s5)
8040c798:	04c12083          	lw	ra,76(sp)
8040c79c:	04812403          	lw	s0,72(sp)
8040c7a0:	04412483          	lw	s1,68(sp)
8040c7a4:	04012903          	lw	s2,64(sp)
8040c7a8:	03c12983          	lw	s3,60(sp)
8040c7ac:	03412a83          	lw	s5,52(sp)
8040c7b0:	03012b03          	lw	s6,48(sp)
8040c7b4:	02c12b83          	lw	s7,44(sp)
8040c7b8:	02812c03          	lw	s8,40(sp)
8040c7bc:	02412c83          	lw	s9,36(sp)
8040c7c0:	000a0513          	mv	a0,s4
8040c7c4:	03812a03          	lw	s4,56(sp)
8040c7c8:	05010113          	addi	sp,sp,80
8040c7cc:	00008067          	ret
8040c7d0:	41f7d713          	srai	a4,a5,0x1f
8040c7d4:	01475693          	srli	a3,a4,0x14
8040c7d8:	00d78733          	add	a4,a5,a3
8040c7dc:	01677733          	and	a4,a4,s6
8040c7e0:	40d70733          	sub	a4,a4,a3
8040c7e4:	0008d697          	auipc	a3,0x8d
8040c7e8:	00c68693          	addi	a3,a3,12 # 804997f0 <stdin_buffer>
8040c7ec:	00e68733          	add	a4,a3,a4
8040c7f0:	00074683          	lbu	a3,0(a4)
8040c7f4:	00178793          	addi	a5,a5,1
8040c7f8:	014c0733          	add	a4,s8,s4
8040c7fc:	00d70023          	sb	a3,0(a4)
8040c800:	001a0a13          	addi	s4,s4,1
8040c804:	00f92023          	sw	a5,0(s2)
8040c808:	ef7a64e3          	bltu	s4,s7,8040c6f0 <stdin_io+0x84>
8040c80c:	f80c80e3          	beqz	s9,8040c78c <stdin_io+0x120>
8040c810:	d60f40ef          	jal	ra,80400d70 <intr_enable>
8040c814:	f60a1ce3          	bnez	s4,8040c78c <stdin_io+0x120>
8040c818:	00000a13          	li	s4,0
8040c81c:	f7dff06f          	j	8040c798 <stdin_io+0x12c>
8040c820:	d58f40ef          	jal	ra,80400d78 <intr_disable>
8040c824:	00100c93          	li	s9,1
8040c828:	e80b9ce3          	bnez	s7,8040c6c0 <stdin_io+0x54>
8040c82c:	d44f40ef          	jal	ra,80400d70 <intr_enable>
8040c830:	00000a13          	li	s4,0
8040c834:	f65ff06f          	j	8040c798 <stdin_io+0x12c>
8040c838:	ffd00a13          	li	s4,-3
8040c83c:	f5dff06f          	j	8040c798 <stdin_io+0x12c>

8040c840 <dev_stdin_write>:
8040c840:	00051463          	bnez	a0,8040c848 <dev_stdin_write+0x8>
8040c844:	00008067          	ret
8040c848:	ff010113          	addi	sp,sp,-16
8040c84c:	00812423          	sw	s0,8(sp)
8040c850:	00112623          	sw	ra,12(sp)
8040c854:	00912223          	sw	s1,4(sp)
8040c858:	00050413          	mv	s0,a0
8040c85c:	100027f3          	csrr	a5,sstatus
8040c860:	0027f793          	andi	a5,a5,2
8040c864:	00000493          	li	s1,0
8040c868:	0a079863          	bnez	a5,8040c918 <dev_stdin_write+0xd8>
8040c86c:	0008e597          	auipc	a1,0x8e
8040c870:	02058593          	addi	a1,a1,32 # 8049a88c <p_wpos>
8040c874:	0005a703          	lw	a4,0(a1)
8040c878:	00001637          	lui	a2,0x1
8040c87c:	fff60513          	addi	a0,a2,-1 # fff <_binary_bin_swap_img_size-0x7001>
8040c880:	41f75693          	srai	a3,a4,0x1f
8040c884:	0146d693          	srli	a3,a3,0x14
8040c888:	00d707b3          	add	a5,a4,a3
8040c88c:	00a7f7b3          	and	a5,a5,a0
8040c890:	40d787b3          	sub	a5,a5,a3
8040c894:	0008d697          	auipc	a3,0x8d
8040c898:	f5c68693          	addi	a3,a3,-164 # 804997f0 <stdin_buffer>
8040c89c:	00f687b3          	add	a5,a3,a5
8040c8a0:	00878023          	sb	s0,0(a5)
8040c8a4:	0008e797          	auipc	a5,0x8e
8040c8a8:	fe47a783          	lw	a5,-28(a5) # 8049a888 <p_rpos>
8040c8ac:	40f707b3          	sub	a5,a4,a5
8040c8b0:	00c7d663          	bge	a5,a2,8040c8bc <dev_stdin_write+0x7c>
8040c8b4:	00170713          	addi	a4,a4,1
8040c8b8:	00e5a023          	sw	a4,0(a1)
8040c8bc:	0008e517          	auipc	a0,0x8e
8040c8c0:	fc450513          	addi	a0,a0,-60 # 8049a880 <__wait_queue>
8040c8c4:	d79f90ef          	jal	ra,8040663c <wait_queue_empty>
8040c8c8:	02050863          	beqz	a0,8040c8f8 <dev_stdin_write+0xb8>
8040c8cc:	00049c63          	bnez	s1,8040c8e4 <dev_stdin_write+0xa4>
8040c8d0:	00c12083          	lw	ra,12(sp)
8040c8d4:	00812403          	lw	s0,8(sp)
8040c8d8:	00412483          	lw	s1,4(sp)
8040c8dc:	01010113          	addi	sp,sp,16
8040c8e0:	00008067          	ret
8040c8e4:	00812403          	lw	s0,8(sp)
8040c8e8:	00c12083          	lw	ra,12(sp)
8040c8ec:	00412483          	lw	s1,4(sp)
8040c8f0:	01010113          	addi	sp,sp,16
8040c8f4:	c7cf406f          	j	80400d70 <intr_enable>
8040c8f8:	800005b7          	lui	a1,0x80000
8040c8fc:	00100613          	li	a2,1
8040c900:	00458593          	addi	a1,a1,4 # 80000004 <end+0xffb65770>
8040c904:	0008e517          	auipc	a0,0x8e
8040c908:	f7c50513          	addi	a0,a0,-132 # 8049a880 <__wait_queue>
8040c90c:	dc1f90ef          	jal	ra,804066cc <wakeup_queue>
8040c910:	fc0480e3          	beqz	s1,8040c8d0 <dev_stdin_write+0x90>
8040c914:	fd1ff06f          	j	8040c8e4 <dev_stdin_write+0xa4>
8040c918:	c60f40ef          	jal	ra,80400d78 <intr_disable>
8040c91c:	00100493          	li	s1,1
8040c920:	f4dff06f          	j	8040c86c <dev_stdin_write+0x2c>

8040c924 <dev_init_stdin>:
8040c924:	ff010113          	addi	sp,sp,-16
8040c928:	00112623          	sw	ra,12(sp)
8040c92c:	00812423          	sw	s0,8(sp)
8040c930:	1d9000ef          	jal	ra,8040d308 <dev_create_inode>
8040c934:	08050c63          	beqz	a0,8040c9cc <dev_init_stdin+0xa8>
8040c938:	02c52703          	lw	a4,44(a0)
8040c93c:	000017b7          	lui	a5,0x1
8040c940:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040c944:	00050413          	mv	s0,a0
8040c948:	0af71c63          	bne	a4,a5,8040ca00 <dev_init_stdin+0xdc>
8040c94c:	00100793          	li	a5,1
8040c950:	00f42223          	sw	a5,4(s0)
8040c954:	00000797          	auipc	a5,0x0
8040c958:	cf478793          	addi	a5,a5,-780 # 8040c648 <stdin_open>
8040c95c:	00f42423          	sw	a5,8(s0)
8040c960:	00000797          	auipc	a5,0x0
8040c964:	cfc78793          	addi	a5,a5,-772 # 8040c65c <stdin_close>
8040c968:	00f42623          	sw	a5,12(s0)
8040c96c:	00000797          	auipc	a5,0x0
8040c970:	d0078793          	addi	a5,a5,-768 # 8040c66c <stdin_io>
8040c974:	00f42823          	sw	a5,16(s0)
8040c978:	00000797          	auipc	a5,0x0
8040c97c:	cec78793          	addi	a5,a5,-788 # 8040c664 <stdin_ioctl>
8040c980:	00f42a23          	sw	a5,20(s0)
8040c984:	0008e517          	auipc	a0,0x8e
8040c988:	efc50513          	addi	a0,a0,-260 # 8049a880 <__wait_queue>
8040c98c:	00042023          	sw	zero,0(s0)
8040c990:	0008e797          	auipc	a5,0x8e
8040c994:	ee07ae23          	sw	zero,-260(a5) # 8049a88c <p_wpos>
8040c998:	0008e797          	auipc	a5,0x8e
8040c99c:	ee07a823          	sw	zero,-272(a5) # 8049a888 <p_rpos>
8040c9a0:	c25f90ef          	jal	ra,804065c4 <wait_queue_init>
8040c9a4:	00000613          	li	a2,0
8040c9a8:	00040593          	mv	a1,s0
8040c9ac:	00007517          	auipc	a0,0x7
8040c9b0:	4ac50513          	addi	a0,a0,1196 # 80413e58 <syscalls+0xa68>
8040c9b4:	e09fe0ef          	jal	ra,8040b7bc <vfs_add_dev>
8040c9b8:	02051663          	bnez	a0,8040c9e4 <dev_init_stdin+0xc0>
8040c9bc:	00c12083          	lw	ra,12(sp)
8040c9c0:	00812403          	lw	s0,8(sp)
8040c9c4:	01010113          	addi	sp,sp,16
8040c9c8:	00008067          	ret
8040c9cc:	00007617          	auipc	a2,0x7
8040c9d0:	45460613          	addi	a2,a2,1108 # 80413e20 <syscalls+0xa30>
8040c9d4:	07500593          	li	a1,117
8040c9d8:	00007517          	auipc	a0,0x7
8040c9dc:	46450513          	addi	a0,a0,1124 # 80413e3c <syscalls+0xa4c>
8040c9e0:	8edf30ef          	jal	ra,804002cc <__panic>
8040c9e4:	00050693          	mv	a3,a0
8040c9e8:	00007617          	auipc	a2,0x7
8040c9ec:	47860613          	addi	a2,a2,1144 # 80413e60 <syscalls+0xa70>
8040c9f0:	07b00593          	li	a1,123
8040c9f4:	00007517          	auipc	a0,0x7
8040c9f8:	44850513          	addi	a0,a0,1096 # 80413e3c <syscalls+0xa4c>
8040c9fc:	8d1f30ef          	jal	ra,804002cc <__panic>
8040ca00:	00007697          	auipc	a3,0x7
8040ca04:	f0068693          	addi	a3,a3,-256 # 80413900 <syscalls+0x510>
8040ca08:	00004617          	auipc	a2,0x4
8040ca0c:	2b860613          	addi	a2,a2,696 # 80410cc0 <commands+0x3c>
8040ca10:	07700593          	li	a1,119
8040ca14:	00007517          	auipc	a0,0x7
8040ca18:	42850513          	addi	a0,a0,1064 # 80413e3c <syscalls+0xa4c>
8040ca1c:	8b1f30ef          	jal	ra,804002cc <__panic>

8040ca20 <disk0_open>:
8040ca20:	00000513          	li	a0,0
8040ca24:	00008067          	ret

8040ca28 <disk0_close>:
8040ca28:	00000513          	li	a0,0
8040ca2c:	00008067          	ret

8040ca30 <disk0_ioctl>:
8040ca30:	fec00513          	li	a0,-20
8040ca34:	00008067          	ret

8040ca38 <disk0_io>:
8040ca38:	fc010113          	addi	sp,sp,-64
8040ca3c:	0045a703          	lw	a4,4(a1)
8040ca40:	02812c23          	sw	s0,56(sp)
8040ca44:	00c5a403          	lw	s0,12(a1)
8040ca48:	000016b7          	lui	a3,0x1
8040ca4c:	03312623          	sw	s3,44(sp)
8040ca50:	01712e23          	sw	s7,28(sp)
8040ca54:	41f75993          	srai	s3,a4,0x1f
8040ca58:	fff68b93          	addi	s7,a3,-1 # fff <_binary_bin_swap_img_size-0x7001>
8040ca5c:	008767b3          	or	a5,a4,s0
8040ca60:	0179f9b3          	and	s3,s3,s7
8040ca64:	02112e23          	sw	ra,60(sp)
8040ca68:	02912a23          	sw	s1,52(sp)
8040ca6c:	03212823          	sw	s2,48(sp)
8040ca70:	03412423          	sw	s4,40(sp)
8040ca74:	03512223          	sw	s5,36(sp)
8040ca78:	03612023          	sw	s6,32(sp)
8040ca7c:	01812c23          	sw	s8,24(sp)
8040ca80:	01912a23          	sw	s9,20(sp)
8040ca84:	01a12823          	sw	s10,16(sp)
8040ca88:	0177f7b3          	and	a5,a5,s7
8040ca8c:	00e989b3          	add	s3,s3,a4
8040ca90:	16079263          	bnez	a5,8040cbf4 <disk0_io+0x1bc>
8040ca94:	00052783          	lw	a5,0(a0)
8040ca98:	40c9d993          	srai	s3,s3,0xc
8040ca9c:	00c45713          	srli	a4,s0,0xc
8040caa0:	00e98733          	add	a4,s3,a4
8040caa4:	14e7e863          	bltu	a5,a4,8040cbf4 <disk0_io+0x1bc>
8040caa8:	00000513          	li	a0,0
8040caac:	02d47e63          	bgeu	s0,a3,8040cae8 <disk0_io+0xb0>
8040cab0:	03c12083          	lw	ra,60(sp)
8040cab4:	03812403          	lw	s0,56(sp)
8040cab8:	03412483          	lw	s1,52(sp)
8040cabc:	03012903          	lw	s2,48(sp)
8040cac0:	02c12983          	lw	s3,44(sp)
8040cac4:	02812a03          	lw	s4,40(sp)
8040cac8:	02412a83          	lw	s5,36(sp)
8040cacc:	02012b03          	lw	s6,32(sp)
8040cad0:	01c12b83          	lw	s7,28(sp)
8040cad4:	01812c03          	lw	s8,24(sp)
8040cad8:	01412c83          	lw	s9,20(sp)
8040cadc:	01012d03          	lw	s10,16(sp)
8040cae0:	04010113          	addi	sp,sp,64
8040cae4:	00008067          	ret
8040cae8:	0008e517          	auipc	a0,0x8e
8040caec:	d0850513          	addi	a0,a0,-760 # 8049a7f0 <disk0_sem>
8040caf0:	00058a93          	mv	s5,a1
8040caf4:	00060b13          	mv	s6,a2
8040caf8:	0008ea17          	auipc	s4,0x8e
8040cafc:	d98a0a13          	addi	s4,s4,-616 # 8049a890 <disk0_buffer>
8040cb00:	f51f90ef          	jal	ra,80406a50 <down>
8040cb04:	00004c37          	lui	s8,0x4
8040cb08:	0600006f          	j	8040cb68 <disk0_io+0x130>
8040cb0c:	00c45493          	srli	s1,s0,0xc
8040cb10:	00349d13          	slli	s10,s1,0x3
8040cb14:	00040913          	mv	s2,s0
8040cb18:	00399c93          	slli	s9,s3,0x3
8040cb1c:	00058613          	mv	a2,a1
8040cb20:	000d0693          	mv	a3,s10
8040cb24:	000c8593          	mv	a1,s9
8040cb28:	00200513          	li	a0,2
8040cb2c:	cfdf30ef          	jal	ra,80400828 <ide_read_secs>
8040cb30:	10051663          	bnez	a0,8040cc3c <disk0_io+0x204>
8040cb34:	000a2583          	lw	a1,0(s4)
8040cb38:	00c10713          	addi	a4,sp,12
8040cb3c:	00100693          	li	a3,1
8040cb40:	00090613          	mv	a2,s2
8040cb44:	000a8513          	mv	a0,s5
8040cb48:	ea4fb0ef          	jal	ra,804081ec <iobuf_move>
8040cb4c:	00c12783          	lw	a5,12(sp)
8040cb50:	0b279663          	bne	a5,s2,8040cbfc <disk0_io+0x1c4>
8040cb54:	017977b3          	and	a5,s2,s7
8040cb58:	0a079263          	bnez	a5,8040cbfc <disk0_io+0x1c4>
8040cb5c:	41240433          	sub	s0,s0,s2
8040cb60:	009989b3          	add	s3,s3,s1
8040cb64:	06040e63          	beqz	s0,8040cbe0 <disk0_io+0x1a8>
8040cb68:	000a2583          	lw	a1,0(s4)
8040cb6c:	000b1c63          	bnez	s6,8040cb84 <disk0_io+0x14c>
8040cb70:	f9846ee3          	bltu	s0,s8,8040cb0c <disk0_io+0xd4>
8040cb74:	02000d13          	li	s10,32
8040cb78:	00400493          	li	s1,4
8040cb7c:	00004937          	lui	s2,0x4
8040cb80:	f99ff06f          	j	8040cb18 <disk0_io+0xe0>
8040cb84:	00c10713          	addi	a4,sp,12
8040cb88:	00000693          	li	a3,0
8040cb8c:	00004637          	lui	a2,0x4
8040cb90:	000a8513          	mv	a0,s5
8040cb94:	e58fb0ef          	jal	ra,804081ec <iobuf_move>
8040cb98:	00c12483          	lw	s1,12(sp)
8040cb9c:	08048063          	beqz	s1,8040cc1c <disk0_io+0x1e4>
8040cba0:	06946e63          	bltu	s0,s1,8040cc1c <disk0_io+0x1e4>
8040cba4:	0174f7b3          	and	a5,s1,s7
8040cba8:	06079a63          	bnez	a5,8040cc1c <disk0_io+0x1e4>
8040cbac:	00c4d493          	srli	s1,s1,0xc
8040cbb0:	000a2603          	lw	a2,0(s4)
8040cbb4:	00399913          	slli	s2,s3,0x3
8040cbb8:	00349c93          	slli	s9,s1,0x3
8040cbbc:	000c8693          	mv	a3,s9
8040cbc0:	00090593          	mv	a1,s2
8040cbc4:	00200513          	li	a0,2
8040cbc8:	cf9f30ef          	jal	ra,804008c0 <ide_write_secs>
8040cbcc:	08051e63          	bnez	a0,8040cc68 <disk0_io+0x230>
8040cbd0:	00c12903          	lw	s2,12(sp)
8040cbd4:	009989b3          	add	s3,s3,s1
8040cbd8:	41240433          	sub	s0,s0,s2
8040cbdc:	f80416e3          	bnez	s0,8040cb68 <disk0_io+0x130>
8040cbe0:	0008e517          	auipc	a0,0x8e
8040cbe4:	c1050513          	addi	a0,a0,-1008 # 8049a7f0 <disk0_sem>
8040cbe8:	e65f90ef          	jal	ra,80406a4c <up>
8040cbec:	00000513          	li	a0,0
8040cbf0:	ec1ff06f          	j	8040cab0 <disk0_io+0x78>
8040cbf4:	ffd00513          	li	a0,-3
8040cbf8:	eb9ff06f          	j	8040cab0 <disk0_io+0x78>
8040cbfc:	00007697          	auipc	a3,0x7
8040cc00:	37068693          	addi	a3,a3,880 # 80413f6c <syscalls+0xb7c>
8040cc04:	00004617          	auipc	a2,0x4
8040cc08:	0bc60613          	addi	a2,a2,188 # 80410cc0 <commands+0x3c>
8040cc0c:	06200593          	li	a1,98
8040cc10:	00007517          	auipc	a0,0x7
8040cc14:	2ac50513          	addi	a0,a0,684 # 80413ebc <syscalls+0xacc>
8040cc18:	eb4f30ef          	jal	ra,804002cc <__panic>
8040cc1c:	00007697          	auipc	a3,0x7
8040cc20:	26068693          	addi	a3,a3,608 # 80413e7c <syscalls+0xa8c>
8040cc24:	00004617          	auipc	a2,0x4
8040cc28:	09c60613          	addi	a2,a2,156 # 80410cc0 <commands+0x3c>
8040cc2c:	05700593          	li	a1,87
8040cc30:	00007517          	auipc	a0,0x7
8040cc34:	28c50513          	addi	a0,a0,652 # 80413ebc <syscalls+0xacc>
8040cc38:	e94f30ef          	jal	ra,804002cc <__panic>
8040cc3c:	00050893          	mv	a7,a0
8040cc40:	000d0813          	mv	a6,s10
8040cc44:	00048793          	mv	a5,s1
8040cc48:	000c8713          	mv	a4,s9
8040cc4c:	00098693          	mv	a3,s3
8040cc50:	00007617          	auipc	a2,0x7
8040cc54:	2d460613          	addi	a2,a2,724 # 80413f24 <syscalls+0xb34>
8040cc58:	02d00593          	li	a1,45
8040cc5c:	00007517          	auipc	a0,0x7
8040cc60:	26050513          	addi	a0,a0,608 # 80413ebc <syscalls+0xacc>
8040cc64:	e68f30ef          	jal	ra,804002cc <__panic>
8040cc68:	00050893          	mv	a7,a0
8040cc6c:	000c8813          	mv	a6,s9
8040cc70:	00048793          	mv	a5,s1
8040cc74:	00090713          	mv	a4,s2
8040cc78:	00098693          	mv	a3,s3
8040cc7c:	00007617          	auipc	a2,0x7
8040cc80:	25c60613          	addi	a2,a2,604 # 80413ed8 <syscalls+0xae8>
8040cc84:	03700593          	li	a1,55
8040cc88:	00007517          	auipc	a0,0x7
8040cc8c:	23450513          	addi	a0,a0,564 # 80413ebc <syscalls+0xacc>
8040cc90:	e3cf30ef          	jal	ra,804002cc <__panic>

8040cc94 <dev_init_disk0>:
8040cc94:	ff010113          	addi	sp,sp,-16
8040cc98:	00112623          	sw	ra,12(sp)
8040cc9c:	00812423          	sw	s0,8(sp)
8040cca0:	00912223          	sw	s1,4(sp)
8040cca4:	664000ef          	jal	ra,8040d308 <dev_create_inode>
8040cca8:	0a050c63          	beqz	a0,8040cd60 <dev_init_disk0+0xcc>
8040ccac:	02c52703          	lw	a4,44(a0)
8040ccb0:	000014b7          	lui	s1,0x1
8040ccb4:	23448793          	addi	a5,s1,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040ccb8:	00050413          	mv	s0,a0
8040ccbc:	10f71463          	bne	a4,a5,8040cdc4 <dev_init_disk0+0x130>
8040ccc0:	00200513          	li	a0,2
8040ccc4:	af9f30ef          	jal	ra,804007bc <ide_device_valid>
8040ccc8:	0e050263          	beqz	a0,8040cdac <dev_init_disk0+0x118>
8040cccc:	00200513          	li	a0,2
8040ccd0:	b21f30ef          	jal	ra,804007f0 <ide_device_size>
8040ccd4:	00355793          	srli	a5,a0,0x3
8040ccd8:	00f42023          	sw	a5,0(s0)
8040ccdc:	00000797          	auipc	a5,0x0
8040cce0:	d4478793          	addi	a5,a5,-700 # 8040ca20 <disk0_open>
8040cce4:	00f42423          	sw	a5,8(s0)
8040cce8:	00000797          	auipc	a5,0x0
8040ccec:	d4078793          	addi	a5,a5,-704 # 8040ca28 <disk0_close>
8040ccf0:	00f42623          	sw	a5,12(s0)
8040ccf4:	00000797          	auipc	a5,0x0
8040ccf8:	d4478793          	addi	a5,a5,-700 # 8040ca38 <disk0_io>
8040ccfc:	00f42823          	sw	a5,16(s0)
8040cd00:	00000797          	auipc	a5,0x0
8040cd04:	d3078793          	addi	a5,a5,-720 # 8040ca30 <disk0_ioctl>
8040cd08:	00f42a23          	sw	a5,20(s0)
8040cd0c:	00100593          	li	a1,1
8040cd10:	0008e517          	auipc	a0,0x8e
8040cd14:	ae050513          	addi	a0,a0,-1312 # 8049a7f0 <disk0_sem>
8040cd18:	00942223          	sw	s1,4(s0)
8040cd1c:	d25f90ef          	jal	ra,80406a40 <sem_init>
8040cd20:	00004537          	lui	a0,0x4
8040cd24:	8f4f60ef          	jal	ra,80402e18 <kmalloc>
8040cd28:	0008e797          	auipc	a5,0x8e
8040cd2c:	b6a7a423          	sw	a0,-1176(a5) # 8049a890 <disk0_buffer>
8040cd30:	06050263          	beqz	a0,8040cd94 <dev_init_disk0+0x100>
8040cd34:	00100613          	li	a2,1
8040cd38:	00040593          	mv	a1,s0
8040cd3c:	00007517          	auipc	a0,0x7
8040cd40:	2b850513          	addi	a0,a0,696 # 80413ff4 <syscalls+0xc04>
8040cd44:	a79fe0ef          	jal	ra,8040b7bc <vfs_add_dev>
8040cd48:	02051863          	bnez	a0,8040cd78 <dev_init_disk0+0xe4>
8040cd4c:	00c12083          	lw	ra,12(sp)
8040cd50:	00812403          	lw	s0,8(sp)
8040cd54:	00412483          	lw	s1,4(sp)
8040cd58:	01010113          	addi	sp,sp,16
8040cd5c:	00008067          	ret
8040cd60:	00007617          	auipc	a2,0x7
8040cd64:	23c60613          	addi	a2,a2,572 # 80413f9c <syscalls+0xbac>
8040cd68:	08700593          	li	a1,135
8040cd6c:	00007517          	auipc	a0,0x7
8040cd70:	15050513          	addi	a0,a0,336 # 80413ebc <syscalls+0xacc>
8040cd74:	d58f30ef          	jal	ra,804002cc <__panic>
8040cd78:	00050693          	mv	a3,a0
8040cd7c:	00007617          	auipc	a2,0x7
8040cd80:	28060613          	addi	a2,a2,640 # 80413ffc <syscalls+0xc0c>
8040cd84:	08d00593          	li	a1,141
8040cd88:	00007517          	auipc	a0,0x7
8040cd8c:	13450513          	addi	a0,a0,308 # 80413ebc <syscalls+0xacc>
8040cd90:	d3cf30ef          	jal	ra,804002cc <__panic>
8040cd94:	00007617          	auipc	a2,0x7
8040cd98:	24460613          	addi	a2,a2,580 # 80413fd8 <syscalls+0xbe8>
8040cd9c:	07f00593          	li	a1,127
8040cda0:	00007517          	auipc	a0,0x7
8040cda4:	11c50513          	addi	a0,a0,284 # 80413ebc <syscalls+0xacc>
8040cda8:	d24f30ef          	jal	ra,804002cc <__panic>
8040cdac:	00007617          	auipc	a2,0x7
8040cdb0:	20c60613          	addi	a2,a2,524 # 80413fb8 <syscalls+0xbc8>
8040cdb4:	07300593          	li	a1,115
8040cdb8:	00007517          	auipc	a0,0x7
8040cdbc:	10450513          	addi	a0,a0,260 # 80413ebc <syscalls+0xacc>
8040cdc0:	d0cf30ef          	jal	ra,804002cc <__panic>
8040cdc4:	00007697          	auipc	a3,0x7
8040cdc8:	b3c68693          	addi	a3,a3,-1220 # 80413900 <syscalls+0x510>
8040cdcc:	00004617          	auipc	a2,0x4
8040cdd0:	ef460613          	addi	a2,a2,-268 # 80410cc0 <commands+0x3c>
8040cdd4:	08900593          	li	a1,137
8040cdd8:	00007517          	auipc	a0,0x7
8040cddc:	0e450513          	addi	a0,a0,228 # 80413ebc <syscalls+0xacc>
8040cde0:	cecf30ef          	jal	ra,804002cc <__panic>

8040cde4 <stdout_open>:
8040cde4:	00100793          	li	a5,1
8040cde8:	00000513          	li	a0,0
8040cdec:	00f59463          	bne	a1,a5,8040cdf4 <stdout_open+0x10>
8040cdf0:	00008067          	ret
8040cdf4:	ffd00513          	li	a0,-3
8040cdf8:	00008067          	ret

8040cdfc <stdout_close>:
8040cdfc:	00000513          	li	a0,0
8040ce00:	00008067          	ret

8040ce04 <stdout_ioctl>:
8040ce04:	ffd00513          	li	a0,-3
8040ce08:	00008067          	ret

8040ce0c <stdout_io>:
8040ce0c:	04060c63          	beqz	a2,8040ce64 <stdout_io+0x58>
8040ce10:	00c5a783          	lw	a5,12(a1)
8040ce14:	ff010113          	addi	sp,sp,-16
8040ce18:	00812423          	sw	s0,8(sp)
8040ce1c:	00912223          	sw	s1,4(sp)
8040ce20:	00112623          	sw	ra,12(sp)
8040ce24:	0005a403          	lw	s0,0(a1)
8040ce28:	00058493          	mv	s1,a1
8040ce2c:	02078063          	beqz	a5,8040ce4c <stdout_io+0x40>
8040ce30:	00044503          	lbu	a0,0(s0)
8040ce34:	00140413          	addi	s0,s0,1
8040ce38:	b74f30ef          	jal	ra,804001ac <cputchar>
8040ce3c:	00c4a783          	lw	a5,12(s1)
8040ce40:	fff78793          	addi	a5,a5,-1
8040ce44:	00f4a623          	sw	a5,12(s1)
8040ce48:	fe0794e3          	bnez	a5,8040ce30 <stdout_io+0x24>
8040ce4c:	00c12083          	lw	ra,12(sp)
8040ce50:	00812403          	lw	s0,8(sp)
8040ce54:	00412483          	lw	s1,4(sp)
8040ce58:	00000513          	li	a0,0
8040ce5c:	01010113          	addi	sp,sp,16
8040ce60:	00008067          	ret
8040ce64:	ffd00513          	li	a0,-3
8040ce68:	00008067          	ret

8040ce6c <dev_init_stdout>:
8040ce6c:	ff010113          	addi	sp,sp,-16
8040ce70:	00112623          	sw	ra,12(sp)
8040ce74:	494000ef          	jal	ra,8040d308 <dev_create_inode>
8040ce78:	06050a63          	beqz	a0,8040ceec <dev_init_stdout+0x80>
8040ce7c:	02c52703          	lw	a4,44(a0)
8040ce80:	000017b7          	lui	a5,0x1
8040ce84:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040ce88:	00050593          	mv	a1,a0
8040ce8c:	08f71a63          	bne	a4,a5,8040cf20 <dev_init_stdout+0xb4>
8040ce90:	00100793          	li	a5,1
8040ce94:	00f52223          	sw	a5,4(a0)
8040ce98:	00000797          	auipc	a5,0x0
8040ce9c:	f4c78793          	addi	a5,a5,-180 # 8040cde4 <stdout_open>
8040cea0:	00f52423          	sw	a5,8(a0)
8040cea4:	00000797          	auipc	a5,0x0
8040cea8:	f5878793          	addi	a5,a5,-168 # 8040cdfc <stdout_close>
8040ceac:	00f52623          	sw	a5,12(a0)
8040ceb0:	00000797          	auipc	a5,0x0
8040ceb4:	f5c78793          	addi	a5,a5,-164 # 8040ce0c <stdout_io>
8040ceb8:	00f52823          	sw	a5,16(a0)
8040cebc:	00000797          	auipc	a5,0x0
8040cec0:	f4878793          	addi	a5,a5,-184 # 8040ce04 <stdout_ioctl>
8040cec4:	00052023          	sw	zero,0(a0)
8040cec8:	00f52a23          	sw	a5,20(a0)
8040cecc:	00000613          	li	a2,0
8040ced0:	00007517          	auipc	a0,0x7
8040ced4:	18050513          	addi	a0,a0,384 # 80414050 <syscalls+0xc60>
8040ced8:	8e5fe0ef          	jal	ra,8040b7bc <vfs_add_dev>
8040cedc:	02051463          	bnez	a0,8040cf04 <dev_init_stdout+0x98>
8040cee0:	00c12083          	lw	ra,12(sp)
8040cee4:	01010113          	addi	sp,sp,16
8040cee8:	00008067          	ret
8040ceec:	00007617          	auipc	a2,0x7
8040cef0:	12c60613          	addi	a2,a2,300 # 80414018 <syscalls+0xc28>
8040cef4:	03700593          	li	a1,55
8040cef8:	00007517          	auipc	a0,0x7
8040cefc:	13c50513          	addi	a0,a0,316 # 80414034 <syscalls+0xc44>
8040cf00:	bccf30ef          	jal	ra,804002cc <__panic>
8040cf04:	00050693          	mv	a3,a0
8040cf08:	00007617          	auipc	a2,0x7
8040cf0c:	15060613          	addi	a2,a2,336 # 80414058 <syscalls+0xc68>
8040cf10:	03d00593          	li	a1,61
8040cf14:	00007517          	auipc	a0,0x7
8040cf18:	12050513          	addi	a0,a0,288 # 80414034 <syscalls+0xc44>
8040cf1c:	bb0f30ef          	jal	ra,804002cc <__panic>
8040cf20:	00007697          	auipc	a3,0x7
8040cf24:	9e068693          	addi	a3,a3,-1568 # 80413900 <syscalls+0x510>
8040cf28:	00004617          	auipc	a2,0x4
8040cf2c:	d9860613          	addi	a2,a2,-616 # 80410cc0 <commands+0x3c>
8040cf30:	03900593          	li	a1,57
8040cf34:	00007517          	auipc	a0,0x7
8040cf38:	10050513          	addi	a0,a0,256 # 80414034 <syscalls+0xc44>
8040cf3c:	b90f30ef          	jal	ra,804002cc <__panic>

8040cf40 <dev_lookup>:
8040cf40:	0005c783          	lbu	a5,0(a1)
8040cf44:	02079e63          	bnez	a5,8040cf80 <dev_lookup+0x40>
8040cf48:	ff010113          	addi	sp,sp,-16
8040cf4c:	00812423          	sw	s0,8(sp)
8040cf50:	00912223          	sw	s1,4(sp)
8040cf54:	00112623          	sw	ra,12(sp)
8040cf58:	00050493          	mv	s1,a0
8040cf5c:	00060413          	mv	s0,a2
8040cf60:	81cff0ef          	jal	ra,8040bf7c <inode_ref_inc>
8040cf64:	00c12083          	lw	ra,12(sp)
8040cf68:	00942023          	sw	s1,0(s0)
8040cf6c:	00812403          	lw	s0,8(sp)
8040cf70:	00412483          	lw	s1,4(sp)
8040cf74:	00000513          	li	a0,0
8040cf78:	01010113          	addi	sp,sp,16
8040cf7c:	00008067          	ret
8040cf80:	ff000513          	li	a0,-16
8040cf84:	00008067          	ret

8040cf88 <dev_fstat>:
8040cf88:	ff010113          	addi	sp,sp,-16
8040cf8c:	00912223          	sw	s1,4(sp)
8040cf90:	00058493          	mv	s1,a1
8040cf94:	00812423          	sw	s0,8(sp)
8040cf98:	01000613          	li	a2,16
8040cf9c:	00050413          	mv	s0,a0
8040cfa0:	00000593          	li	a1,0
8040cfa4:	00048513          	mv	a0,s1
8040cfa8:	00112623          	sw	ra,12(sp)
8040cfac:	01212023          	sw	s2,0(sp)
8040cfb0:	1c4030ef          	jal	ra,80410174 <memset>
8040cfb4:	08040463          	beqz	s0,8040d03c <dev_fstat+0xb4>
8040cfb8:	03c42783          	lw	a5,60(s0)
8040cfbc:	08078063          	beqz	a5,8040d03c <dev_fstat+0xb4>
8040cfc0:	0287a783          	lw	a5,40(a5)
8040cfc4:	06078c63          	beqz	a5,8040d03c <dev_fstat+0xb4>
8040cfc8:	00007597          	auipc	a1,0x7
8040cfcc:	9f858593          	addi	a1,a1,-1544 # 804139c0 <syscalls+0x5d0>
8040cfd0:	00040513          	mv	a0,s0
8040cfd4:	fd1fe0ef          	jal	ra,8040bfa4 <inode_check>
8040cfd8:	03c42783          	lw	a5,60(s0)
8040cfdc:	00048593          	mv	a1,s1
8040cfe0:	00040513          	mv	a0,s0
8040cfe4:	0287a783          	lw	a5,40(a5)
8040cfe8:	000780e7          	jalr	a5
8040cfec:	00050913          	mv	s2,a0
8040cff0:	02051863          	bnez	a0,8040d020 <dev_fstat+0x98>
8040cff4:	02c42703          	lw	a4,44(s0)
8040cff8:	000017b7          	lui	a5,0x1
8040cffc:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040d000:	04f71e63          	bne	a4,a5,8040d05c <dev_fstat+0xd4>
8040d004:	00042583          	lw	a1,0(s0)
8040d008:	00442503          	lw	a0,4(s0)
8040d00c:	00100793          	li	a5,1
8040d010:	00f4a223          	sw	a5,4(s1)
8040d014:	00b4a423          	sw	a1,8(s1)
8040d018:	129030ef          	jal	ra,80410940 <__mulsi3>
8040d01c:	00a4a623          	sw	a0,12(s1)
8040d020:	00c12083          	lw	ra,12(sp)
8040d024:	00812403          	lw	s0,8(sp)
8040d028:	00412483          	lw	s1,4(sp)
8040d02c:	00090513          	mv	a0,s2
8040d030:	00012903          	lw	s2,0(sp)
8040d034:	01010113          	addi	sp,sp,16
8040d038:	00008067          	ret
8040d03c:	00007697          	auipc	a3,0x7
8040d040:	91c68693          	addi	a3,a3,-1764 # 80413958 <syscalls+0x568>
8040d044:	00004617          	auipc	a2,0x4
8040d048:	c7c60613          	addi	a2,a2,-900 # 80410cc0 <commands+0x3c>
8040d04c:	04200593          	li	a1,66
8040d050:	00007517          	auipc	a0,0x7
8040d054:	02450513          	addi	a0,a0,36 # 80414074 <syscalls+0xc84>
8040d058:	a74f30ef          	jal	ra,804002cc <__panic>
8040d05c:	00007697          	auipc	a3,0x7
8040d060:	8a468693          	addi	a3,a3,-1884 # 80413900 <syscalls+0x510>
8040d064:	00004617          	auipc	a2,0x4
8040d068:	c5c60613          	addi	a2,a2,-932 # 80410cc0 <commands+0x3c>
8040d06c:	04500593          	li	a1,69
8040d070:	00007517          	auipc	a0,0x7
8040d074:	00450513          	addi	a0,a0,4 # 80414074 <syscalls+0xc84>
8040d078:	a54f30ef          	jal	ra,804002cc <__panic>

8040d07c <dev_ioctl>:
8040d07c:	00050e63          	beqz	a0,8040d098 <dev_ioctl+0x1c>
8040d080:	02c52683          	lw	a3,44(a0)
8040d084:	00001737          	lui	a4,0x1
8040d088:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040d08c:	00e69663          	bne	a3,a4,8040d098 <dev_ioctl+0x1c>
8040d090:	01452783          	lw	a5,20(a0)
8040d094:	00078067          	jr	a5
8040d098:	ff010113          	addi	sp,sp,-16
8040d09c:	00007697          	auipc	a3,0x7
8040d0a0:	86468693          	addi	a3,a3,-1948 # 80413900 <syscalls+0x510>
8040d0a4:	00004617          	auipc	a2,0x4
8040d0a8:	c1c60613          	addi	a2,a2,-996 # 80410cc0 <commands+0x3c>
8040d0ac:	03500593          	li	a1,53
8040d0b0:	00007517          	auipc	a0,0x7
8040d0b4:	fc450513          	addi	a0,a0,-60 # 80414074 <syscalls+0xc84>
8040d0b8:	00112623          	sw	ra,12(sp)
8040d0bc:	a10f30ef          	jal	ra,804002cc <__panic>

8040d0c0 <dev_tryseek>:
8040d0c0:	ff010113          	addi	sp,sp,-16
8040d0c4:	00112623          	sw	ra,12(sp)
8040d0c8:	00812423          	sw	s0,8(sp)
8040d0cc:	00912223          	sw	s1,4(sp)
8040d0d0:	01212023          	sw	s2,0(sp)
8040d0d4:	06050663          	beqz	a0,8040d140 <dev_tryseek+0x80>
8040d0d8:	02c52703          	lw	a4,44(a0)
8040d0dc:	000017b7          	lui	a5,0x1
8040d0e0:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040d0e4:	04f71e63          	bne	a4,a5,8040d140 <dev_tryseek+0x80>
8040d0e8:	00052483          	lw	s1,0(a0)
8040d0ec:	04048663          	beqz	s1,8040d138 <dev_tryseek+0x78>
8040d0f0:	00452903          	lw	s2,4(a0)
8040d0f4:	00058413          	mv	s0,a1
8040d0f8:	00058513          	mv	a0,a1
8040d0fc:	00090593          	mv	a1,s2
8040d100:	0b5030ef          	jal	ra,804109b4 <__umodsi3>
8040d104:	02051a63          	bnez	a0,8040d138 <dev_tryseek+0x78>
8040d108:	02044863          	bltz	s0,8040d138 <dev_tryseek+0x78>
8040d10c:	00090593          	mv	a1,s2
8040d110:	00048513          	mv	a0,s1
8040d114:	02d030ef          	jal	ra,80410940 <__mulsi3>
8040d118:	02a47063          	bgeu	s0,a0,8040d138 <dev_tryseek+0x78>
8040d11c:	00000513          	li	a0,0
8040d120:	00c12083          	lw	ra,12(sp)
8040d124:	00812403          	lw	s0,8(sp)
8040d128:	00412483          	lw	s1,4(sp)
8040d12c:	00012903          	lw	s2,0(sp)
8040d130:	01010113          	addi	sp,sp,16
8040d134:	00008067          	ret
8040d138:	ffd00513          	li	a0,-3
8040d13c:	fe5ff06f          	j	8040d120 <dev_tryseek+0x60>
8040d140:	00006697          	auipc	a3,0x6
8040d144:	7c068693          	addi	a3,a3,1984 # 80413900 <syscalls+0x510>
8040d148:	00004617          	auipc	a2,0x4
8040d14c:	b7860613          	addi	a2,a2,-1160 # 80410cc0 <commands+0x3c>
8040d150:	05f00593          	li	a1,95
8040d154:	00007517          	auipc	a0,0x7
8040d158:	f2050513          	addi	a0,a0,-224 # 80414074 <syscalls+0xc84>
8040d15c:	970f30ef          	jal	ra,804002cc <__panic>

8040d160 <dev_gettype>:
8040d160:	02050e63          	beqz	a0,8040d19c <dev_gettype+0x3c>
8040d164:	02c52703          	lw	a4,44(a0)
8040d168:	000017b7          	lui	a5,0x1
8040d16c:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040d170:	02f71663          	bne	a4,a5,8040d19c <dev_gettype+0x3c>
8040d174:	00052703          	lw	a4,0(a0)
8040d178:	000057b7          	lui	a5,0x5
8040d17c:	00070863          	beqz	a4,8040d18c <dev_gettype+0x2c>
8040d180:	00f5a023          	sw	a5,0(a1)
8040d184:	00000513          	li	a0,0
8040d188:	00008067          	ret
8040d18c:	000047b7          	lui	a5,0x4
8040d190:	00f5a023          	sw	a5,0(a1)
8040d194:	00000513          	li	a0,0
8040d198:	00008067          	ret
8040d19c:	ff010113          	addi	sp,sp,-16
8040d1a0:	00006697          	auipc	a3,0x6
8040d1a4:	76068693          	addi	a3,a3,1888 # 80413900 <syscalls+0x510>
8040d1a8:	00004617          	auipc	a2,0x4
8040d1ac:	b1860613          	addi	a2,a2,-1256 # 80410cc0 <commands+0x3c>
8040d1b0:	05300593          	li	a1,83
8040d1b4:	00007517          	auipc	a0,0x7
8040d1b8:	ec050513          	addi	a0,a0,-320 # 80414074 <syscalls+0xc84>
8040d1bc:	00112623          	sw	ra,12(sp)
8040d1c0:	90cf30ef          	jal	ra,804002cc <__panic>

8040d1c4 <dev_write>:
8040d1c4:	02050063          	beqz	a0,8040d1e4 <dev_write+0x20>
8040d1c8:	02c52683          	lw	a3,44(a0)
8040d1cc:	00001737          	lui	a4,0x1
8040d1d0:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040d1d4:	00e69863          	bne	a3,a4,8040d1e4 <dev_write+0x20>
8040d1d8:	01052783          	lw	a5,16(a0)
8040d1dc:	00100613          	li	a2,1
8040d1e0:	00078067          	jr	a5 # 4000 <_binary_bin_swap_img_size-0x4000>
8040d1e4:	ff010113          	addi	sp,sp,-16
8040d1e8:	00006697          	auipc	a3,0x6
8040d1ec:	71868693          	addi	a3,a3,1816 # 80413900 <syscalls+0x510>
8040d1f0:	00004617          	auipc	a2,0x4
8040d1f4:	ad060613          	addi	a2,a2,-1328 # 80410cc0 <commands+0x3c>
8040d1f8:	02c00593          	li	a1,44
8040d1fc:	00007517          	auipc	a0,0x7
8040d200:	e7850513          	addi	a0,a0,-392 # 80414074 <syscalls+0xc84>
8040d204:	00112623          	sw	ra,12(sp)
8040d208:	8c4f30ef          	jal	ra,804002cc <__panic>

8040d20c <dev_read>:
8040d20c:	02050063          	beqz	a0,8040d22c <dev_read+0x20>
8040d210:	02c52683          	lw	a3,44(a0)
8040d214:	00001737          	lui	a4,0x1
8040d218:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040d21c:	00e69863          	bne	a3,a4,8040d22c <dev_read+0x20>
8040d220:	01052783          	lw	a5,16(a0)
8040d224:	00000613          	li	a2,0
8040d228:	00078067          	jr	a5
8040d22c:	ff010113          	addi	sp,sp,-16
8040d230:	00006697          	auipc	a3,0x6
8040d234:	6d068693          	addi	a3,a3,1744 # 80413900 <syscalls+0x510>
8040d238:	00004617          	auipc	a2,0x4
8040d23c:	a8860613          	addi	a2,a2,-1400 # 80410cc0 <commands+0x3c>
8040d240:	02300593          	li	a1,35
8040d244:	00007517          	auipc	a0,0x7
8040d248:	e3050513          	addi	a0,a0,-464 # 80414074 <syscalls+0xc84>
8040d24c:	00112623          	sw	ra,12(sp)
8040d250:	87cf30ef          	jal	ra,804002cc <__panic>

8040d254 <dev_close>:
8040d254:	00050e63          	beqz	a0,8040d270 <dev_close+0x1c>
8040d258:	02c52683          	lw	a3,44(a0)
8040d25c:	00001737          	lui	a4,0x1
8040d260:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040d264:	00e69663          	bne	a3,a4,8040d270 <dev_close+0x1c>
8040d268:	00c52783          	lw	a5,12(a0)
8040d26c:	00078067          	jr	a5
8040d270:	ff010113          	addi	sp,sp,-16
8040d274:	00006697          	auipc	a3,0x6
8040d278:	68c68693          	addi	a3,a3,1676 # 80413900 <syscalls+0x510>
8040d27c:	00004617          	auipc	a2,0x4
8040d280:	a4460613          	addi	a2,a2,-1468 # 80410cc0 <commands+0x3c>
8040d284:	01a00593          	li	a1,26
8040d288:	00007517          	auipc	a0,0x7
8040d28c:	dec50513          	addi	a0,a0,-532 # 80414074 <syscalls+0xc84>
8040d290:	00112623          	sw	ra,12(sp)
8040d294:	838f30ef          	jal	ra,804002cc <__panic>

8040d298 <dev_open>:
8040d298:	03c5f713          	andi	a4,a1,60
8040d29c:	02071063          	bnez	a4,8040d2bc <dev_open+0x24>
8040d2a0:	02050263          	beqz	a0,8040d2c4 <dev_open+0x2c>
8040d2a4:	02c52683          	lw	a3,44(a0)
8040d2a8:	00001737          	lui	a4,0x1
8040d2ac:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040d2b0:	00e69a63          	bne	a3,a4,8040d2c4 <dev_open+0x2c>
8040d2b4:	00852783          	lw	a5,8(a0)
8040d2b8:	00078067          	jr	a5
8040d2bc:	ffd00513          	li	a0,-3
8040d2c0:	00008067          	ret
8040d2c4:	ff010113          	addi	sp,sp,-16
8040d2c8:	00006697          	auipc	a3,0x6
8040d2cc:	63868693          	addi	a3,a3,1592 # 80413900 <syscalls+0x510>
8040d2d0:	00004617          	auipc	a2,0x4
8040d2d4:	9f060613          	addi	a2,a2,-1552 # 80410cc0 <commands+0x3c>
8040d2d8:	01100593          	li	a1,17
8040d2dc:	00007517          	auipc	a0,0x7
8040d2e0:	d9850513          	addi	a0,a0,-616 # 80414074 <syscalls+0xc84>
8040d2e4:	00112623          	sw	ra,12(sp)
8040d2e8:	fe5f20ef          	jal	ra,804002cc <__panic>

8040d2ec <dev_init>:
8040d2ec:	ff010113          	addi	sp,sp,-16
8040d2f0:	00112623          	sw	ra,12(sp)
8040d2f4:	e30ff0ef          	jal	ra,8040c924 <dev_init_stdin>
8040d2f8:	b75ff0ef          	jal	ra,8040ce6c <dev_init_stdout>
8040d2fc:	00c12083          	lw	ra,12(sp)
8040d300:	01010113          	addi	sp,sp,16
8040d304:	991ff06f          	j	8040cc94 <dev_init_disk0>

8040d308 <dev_create_inode>:
8040d308:	00001537          	lui	a0,0x1
8040d30c:	ff010113          	addi	sp,sp,-16
8040d310:	23450513          	addi	a0,a0,564 # 1234 <_binary_bin_swap_img_size-0x6dcc>
8040d314:	00812423          	sw	s0,8(sp)
8040d318:	00112623          	sw	ra,12(sp)
8040d31c:	bb5fe0ef          	jal	ra,8040bed0 <__alloc_inode>
8040d320:	00050413          	mv	s0,a0
8040d324:	00050a63          	beqz	a0,8040d338 <dev_create_inode+0x30>
8040d328:	00000613          	li	a2,0
8040d32c:	00007597          	auipc	a1,0x7
8040d330:	d5c58593          	addi	a1,a1,-676 # 80414088 <dev_node_ops>
8040d334:	bcdfe0ef          	jal	ra,8040bf00 <inode_init>
8040d338:	00c12083          	lw	ra,12(sp)
8040d33c:	00040513          	mv	a0,s0
8040d340:	00812403          	lw	s0,8(sp)
8040d344:	01010113          	addi	sp,sp,16
8040d348:	00008067          	ret

8040d34c <sfs_init>:
8040d34c:	ff010113          	addi	sp,sp,-16
8040d350:	00007517          	auipc	a0,0x7
8040d354:	ca450513          	addi	a0,a0,-860 # 80413ff4 <syscalls+0xc04>
8040d358:	00112623          	sw	ra,12(sp)
8040d35c:	4e8020ef          	jal	ra,8040f844 <sfs_mount>
8040d360:	00051863          	bnez	a0,8040d370 <sfs_init+0x24>
8040d364:	00c12083          	lw	ra,12(sp)
8040d368:	01010113          	addi	sp,sp,16
8040d36c:	00008067          	ret
8040d370:	00050693          	mv	a3,a0
8040d374:	00007617          	auipc	a2,0x7
8040d378:	d5460613          	addi	a2,a2,-684 # 804140c8 <dev_node_ops+0x40>
8040d37c:	01000593          	li	a1,16
8040d380:	00007517          	auipc	a0,0x7
8040d384:	d6850513          	addi	a0,a0,-664 # 804140e8 <dev_node_ops+0x60>
8040d388:	f45f20ef          	jal	ra,804002cc <__panic>

8040d38c <lock_sfs_fs>:
8040d38c:	03c50513          	addi	a0,a0,60
8040d390:	ec0f906f          	j	80406a50 <down>

8040d394 <lock_sfs_io>:
8040d394:	04850513          	addi	a0,a0,72
8040d398:	eb8f906f          	j	80406a50 <down>

8040d39c <unlock_sfs_fs>:
8040d39c:	03c50513          	addi	a0,a0,60
8040d3a0:	eacf906f          	j	80406a4c <up>

8040d3a4 <unlock_sfs_io>:
8040d3a4:	04850513          	addi	a0,a0,72
8040d3a8:	ea4f906f          	j	80406a4c <up>

8040d3ac <sfs_opendir>:
8040d3ac:	0235f593          	andi	a1,a1,35
8040d3b0:	00000513          	li	a0,0
8040d3b4:	00059463          	bnez	a1,8040d3bc <sfs_opendir+0x10>
8040d3b8:	00008067          	ret
8040d3bc:	fef00513          	li	a0,-17
8040d3c0:	00008067          	ret

8040d3c4 <sfs_openfile>:
8040d3c4:	00000513          	li	a0,0
8040d3c8:	00008067          	ret

8040d3cc <sfs_gettype>:
8040d3cc:	ff010113          	addi	sp,sp,-16
8040d3d0:	00112623          	sw	ra,12(sp)
8040d3d4:	06050e63          	beqz	a0,8040d450 <sfs_gettype+0x84>
8040d3d8:	02c52683          	lw	a3,44(a0)
8040d3dc:	000017b7          	lui	a5,0x1
8040d3e0:	23578713          	addi	a4,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
8040d3e4:	06e69663          	bne	a3,a4,8040d450 <sfs_gettype+0x84>
8040d3e8:	00052683          	lw	a3,0(a0)
8040d3ec:	00200713          	li	a4,2
8040d3f0:	0046d683          	lhu	a3,4(a3)
8040d3f4:	04e68263          	beq	a3,a4,8040d438 <sfs_gettype+0x6c>
8040d3f8:	00300713          	li	a4,3
8040d3fc:	02e68263          	beq	a3,a4,8040d420 <sfs_gettype+0x54>
8040d400:	00100713          	li	a4,1
8040d404:	02e68063          	beq	a3,a4,8040d424 <sfs_gettype+0x58>
8040d408:	00007617          	auipc	a2,0x7
8040d40c:	d4460613          	addi	a2,a2,-700 # 8041414c <dev_node_ops+0xc4>
8040d410:	38f00593          	li	a1,911
8040d414:	00007517          	auipc	a0,0x7
8040d418:	d2050513          	addi	a0,a0,-736 # 80414134 <dev_node_ops+0xac>
8040d41c:	eb1f20ef          	jal	ra,804002cc <__panic>
8040d420:	000037b7          	lui	a5,0x3
8040d424:	00c12083          	lw	ra,12(sp)
8040d428:	00f5a023          	sw	a5,0(a1)
8040d42c:	00000513          	li	a0,0
8040d430:	01010113          	addi	sp,sp,16
8040d434:	00008067          	ret
8040d438:	00c12083          	lw	ra,12(sp)
8040d43c:	000027b7          	lui	a5,0x2
8040d440:	00f5a023          	sw	a5,0(a1)
8040d444:	00000513          	li	a0,0
8040d448:	01010113          	addi	sp,sp,16
8040d44c:	00008067          	ret
8040d450:	00007697          	auipc	a3,0x7
8040d454:	cac68693          	addi	a3,a3,-852 # 804140fc <dev_node_ops+0x74>
8040d458:	00004617          	auipc	a2,0x4
8040d45c:	86860613          	addi	a2,a2,-1944 # 80410cc0 <commands+0x3c>
8040d460:	38300593          	li	a1,899
8040d464:	00007517          	auipc	a0,0x7
8040d468:	cd050513          	addi	a0,a0,-816 # 80414134 <dev_node_ops+0xac>
8040d46c:	e61f20ef          	jal	ra,804002cc <__panic>

8040d470 <sfs_fsync>:
8040d470:	fe010113          	addi	sp,sp,-32
8040d474:	01212823          	sw	s2,16(sp)
8040d478:	03852903          	lw	s2,56(a0)
8040d47c:	00112e23          	sw	ra,28(sp)
8040d480:	00812c23          	sw	s0,24(sp)
8040d484:	00912a23          	sw	s1,20(sp)
8040d488:	01312623          	sw	s3,12(sp)
8040d48c:	0a090a63          	beqz	s2,8040d540 <sfs_fsync+0xd0>
8040d490:	06c92783          	lw	a5,108(s2) # 406c <_binary_bin_swap_img_size-0x3f94>
8040d494:	0a079663          	bnez	a5,8040d540 <sfs_fsync+0xd0>
8040d498:	02c52703          	lw	a4,44(a0)
8040d49c:	000017b7          	lui	a5,0x1
8040d4a0:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
8040d4a4:	00050413          	mv	s0,a0
8040d4a8:	0af71c63          	bne	a4,a5,8040d560 <sfs_fsync+0xf0>
8040d4ac:	00852483          	lw	s1,8(a0)
8040d4b0:	02049263          	bnez	s1,8040d4d4 <sfs_fsync+0x64>
8040d4b4:	01c12083          	lw	ra,28(sp)
8040d4b8:	01812403          	lw	s0,24(sp)
8040d4bc:	01012903          	lw	s2,16(sp)
8040d4c0:	00c12983          	lw	s3,12(sp)
8040d4c4:	00048513          	mv	a0,s1
8040d4c8:	01412483          	lw	s1,20(sp)
8040d4cc:	02010113          	addi	sp,sp,32
8040d4d0:	00008067          	ret
8040d4d4:	01050993          	addi	s3,a0,16
8040d4d8:	00098513          	mv	a0,s3
8040d4dc:	d74f90ef          	jal	ra,80406a50 <down>
8040d4e0:	00842483          	lw	s1,8(s0)
8040d4e4:	02049663          	bnez	s1,8040d510 <sfs_fsync+0xa0>
8040d4e8:	00098513          	mv	a0,s3
8040d4ec:	d60f90ef          	jal	ra,80406a4c <up>
8040d4f0:	01c12083          	lw	ra,28(sp)
8040d4f4:	01812403          	lw	s0,24(sp)
8040d4f8:	01012903          	lw	s2,16(sp)
8040d4fc:	00c12983          	lw	s3,12(sp)
8040d500:	00048513          	mv	a0,s1
8040d504:	01412483          	lw	s1,20(sp)
8040d508:	02010113          	addi	sp,sp,32
8040d50c:	00008067          	ret
8040d510:	00442683          	lw	a3,4(s0)
8040d514:	00042583          	lw	a1,0(s0)
8040d518:	00042423          	sw	zero,8(s0)
8040d51c:	00000713          	li	a4,0
8040d520:	04000613          	li	a2,64
8040d524:	00090513          	mv	a0,s2
8040d528:	0bd020ef          	jal	ra,8040fde4 <sfs_wbuf>
8040d52c:	00050493          	mv	s1,a0
8040d530:	fa050ce3          	beqz	a0,8040d4e8 <sfs_fsync+0x78>
8040d534:	00100793          	li	a5,1
8040d538:	00f42423          	sw	a5,8(s0)
8040d53c:	fadff06f          	j	8040d4e8 <sfs_fsync+0x78>
8040d540:	00007697          	auipc	a3,0x7
8040d544:	c2468693          	addi	a3,a3,-988 # 80414164 <dev_node_ops+0xdc>
8040d548:	00003617          	auipc	a2,0x3
8040d54c:	77860613          	addi	a2,a2,1912 # 80410cc0 <commands+0x3c>
8040d550:	2c700593          	li	a1,711
8040d554:	00007517          	auipc	a0,0x7
8040d558:	be050513          	addi	a0,a0,-1056 # 80414134 <dev_node_ops+0xac>
8040d55c:	d71f20ef          	jal	ra,804002cc <__panic>
8040d560:	00007697          	auipc	a3,0x7
8040d564:	b9c68693          	addi	a3,a3,-1124 # 804140fc <dev_node_ops+0x74>
8040d568:	00003617          	auipc	a2,0x3
8040d56c:	75860613          	addi	a2,a2,1880 # 80410cc0 <commands+0x3c>
8040d570:	2c800593          	li	a1,712
8040d574:	00007517          	auipc	a0,0x7
8040d578:	bc050513          	addi	a0,a0,-1088 # 80414134 <dev_node_ops+0xac>
8040d57c:	d51f20ef          	jal	ra,804002cc <__panic>

8040d580 <sfs_fstat>:
8040d580:	ff010113          	addi	sp,sp,-16
8040d584:	00912223          	sw	s1,4(sp)
8040d588:	00058493          	mv	s1,a1
8040d58c:	00812423          	sw	s0,8(sp)
8040d590:	01000613          	li	a2,16
8040d594:	00050413          	mv	s0,a0
8040d598:	00000593          	li	a1,0
8040d59c:	00048513          	mv	a0,s1
8040d5a0:	00112623          	sw	ra,12(sp)
8040d5a4:	3d1020ef          	jal	ra,80410174 <memset>
8040d5a8:	06040e63          	beqz	s0,8040d624 <sfs_fstat+0xa4>
8040d5ac:	03c42783          	lw	a5,60(s0)
8040d5b0:	06078a63          	beqz	a5,8040d624 <sfs_fstat+0xa4>
8040d5b4:	0287a783          	lw	a5,40(a5)
8040d5b8:	06078663          	beqz	a5,8040d624 <sfs_fstat+0xa4>
8040d5bc:	00006597          	auipc	a1,0x6
8040d5c0:	40458593          	addi	a1,a1,1028 # 804139c0 <syscalls+0x5d0>
8040d5c4:	00040513          	mv	a0,s0
8040d5c8:	9ddfe0ef          	jal	ra,8040bfa4 <inode_check>
8040d5cc:	03c42783          	lw	a5,60(s0)
8040d5d0:	00048593          	mv	a1,s1
8040d5d4:	00040513          	mv	a0,s0
8040d5d8:	0287a783          	lw	a5,40(a5)
8040d5dc:	000780e7          	jalr	a5
8040d5e0:	02051863          	bnez	a0,8040d610 <sfs_fstat+0x90>
8040d5e4:	02c42703          	lw	a4,44(s0)
8040d5e8:	000017b7          	lui	a5,0x1
8040d5ec:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
8040d5f0:	04f71a63          	bne	a4,a5,8040d644 <sfs_fstat+0xc4>
8040d5f4:	00042783          	lw	a5,0(s0)
8040d5f8:	0067d683          	lhu	a3,6(a5)
8040d5fc:	0087a703          	lw	a4,8(a5)
8040d600:	0007a783          	lw	a5,0(a5)
8040d604:	00d4a223          	sw	a3,4(s1)
8040d608:	00e4a423          	sw	a4,8(s1)
8040d60c:	00f4a623          	sw	a5,12(s1)
8040d610:	00c12083          	lw	ra,12(sp)
8040d614:	00812403          	lw	s0,8(sp)
8040d618:	00412483          	lw	s1,4(sp)
8040d61c:	01010113          	addi	sp,sp,16
8040d620:	00008067          	ret
8040d624:	00006697          	auipc	a3,0x6
8040d628:	33468693          	addi	a3,a3,820 # 80413958 <syscalls+0x568>
8040d62c:	00003617          	auipc	a2,0x3
8040d630:	69460613          	addi	a2,a2,1684 # 80410cc0 <commands+0x3c>
8040d634:	2b800593          	li	a1,696
8040d638:	00007517          	auipc	a0,0x7
8040d63c:	afc50513          	addi	a0,a0,-1284 # 80414134 <dev_node_ops+0xac>
8040d640:	c8df20ef          	jal	ra,804002cc <__panic>
8040d644:	00007697          	auipc	a3,0x7
8040d648:	ab868693          	addi	a3,a3,-1352 # 804140fc <dev_node_ops+0x74>
8040d64c:	00003617          	auipc	a2,0x3
8040d650:	67460613          	addi	a2,a2,1652 # 80410cc0 <commands+0x3c>
8040d654:	2bb00593          	li	a1,699
8040d658:	00007517          	auipc	a0,0x7
8040d65c:	adc50513          	addi	a0,a0,-1316 # 80414134 <dev_node_ops+0xac>
8040d660:	c6df20ef          	jal	ra,804002cc <__panic>

8040d664 <sfs_tryseek>:
8040d664:	080007b7          	lui	a5,0x8000
8040d668:	08f5fa63          	bgeu	a1,a5,8040d6fc <sfs_tryseek+0x98>
8040d66c:	ff010113          	addi	sp,sp,-16
8040d670:	00812423          	sw	s0,8(sp)
8040d674:	00112623          	sw	ra,12(sp)
8040d678:	00912223          	sw	s1,4(sp)
8040d67c:	00050413          	mv	s0,a0
8040d680:	08050263          	beqz	a0,8040d704 <sfs_tryseek+0xa0>
8040d684:	02c52703          	lw	a4,44(a0)
8040d688:	000017b7          	lui	a5,0x1
8040d68c:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
8040d690:	06f71a63          	bne	a4,a5,8040d704 <sfs_tryseek+0xa0>
8040d694:	00052783          	lw	a5,0(a0)
8040d698:	00058493          	mv	s1,a1
8040d69c:	0007a783          	lw	a5,0(a5)
8040d6a0:	04b7f263          	bgeu	a5,a1,8040d6e4 <sfs_tryseek+0x80>
8040d6a4:	03c52783          	lw	a5,60(a0)
8040d6a8:	06078e63          	beqz	a5,8040d724 <sfs_tryseek+0xc0>
8040d6ac:	0307a783          	lw	a5,48(a5)
8040d6b0:	06078a63          	beqz	a5,8040d724 <sfs_tryseek+0xc0>
8040d6b4:	00006597          	auipc	a1,0x6
8040d6b8:	76058593          	addi	a1,a1,1888 # 80413e14 <syscalls+0xa24>
8040d6bc:	8e9fe0ef          	jal	ra,8040bfa4 <inode_check>
8040d6c0:	03c42783          	lw	a5,60(s0)
8040d6c4:	00040513          	mv	a0,s0
8040d6c8:	00812403          	lw	s0,8(sp)
8040d6cc:	00c12083          	lw	ra,12(sp)
8040d6d0:	0307a783          	lw	a5,48(a5)
8040d6d4:	00048593          	mv	a1,s1
8040d6d8:	00412483          	lw	s1,4(sp)
8040d6dc:	01010113          	addi	sp,sp,16
8040d6e0:	00078067          	jr	a5
8040d6e4:	00c12083          	lw	ra,12(sp)
8040d6e8:	00812403          	lw	s0,8(sp)
8040d6ec:	00412483          	lw	s1,4(sp)
8040d6f0:	00000513          	li	a0,0
8040d6f4:	01010113          	addi	sp,sp,16
8040d6f8:	00008067          	ret
8040d6fc:	ffd00513          	li	a0,-3
8040d700:	00008067          	ret
8040d704:	00007697          	auipc	a3,0x7
8040d708:	9f868693          	addi	a3,a3,-1544 # 804140fc <dev_node_ops+0x74>
8040d70c:	00003617          	auipc	a2,0x3
8040d710:	5b460613          	addi	a2,a2,1460 # 80410cc0 <commands+0x3c>
8040d714:	39a00593          	li	a1,922
8040d718:	00007517          	auipc	a0,0x7
8040d71c:	a1c50513          	addi	a0,a0,-1508 # 80414134 <dev_node_ops+0xac>
8040d720:	badf20ef          	jal	ra,804002cc <__panic>
8040d724:	00006697          	auipc	a3,0x6
8040d728:	69c68693          	addi	a3,a3,1692 # 80413dc0 <syscalls+0x9d0>
8040d72c:	00003617          	auipc	a2,0x3
8040d730:	59460613          	addi	a2,a2,1428 # 80410cc0 <commands+0x3c>
8040d734:	39c00593          	li	a1,924
8040d738:	00007517          	auipc	a0,0x7
8040d73c:	9fc50513          	addi	a0,a0,-1540 # 80414134 <dev_node_ops+0xac>
8040d740:	b8df20ef          	jal	ra,804002cc <__panic>

8040d744 <sfs_close>:
8040d744:	ff010113          	addi	sp,sp,-16
8040d748:	00112623          	sw	ra,12(sp)
8040d74c:	00812423          	sw	s0,8(sp)
8040d750:	04050063          	beqz	a0,8040d790 <sfs_close+0x4c>
8040d754:	03c52783          	lw	a5,60(a0)
8040d758:	00050413          	mv	s0,a0
8040d75c:	02078a63          	beqz	a5,8040d790 <sfs_close+0x4c>
8040d760:	0187a783          	lw	a5,24(a5)
8040d764:	02078663          	beqz	a5,8040d790 <sfs_close+0x4c>
8040d768:	00005597          	auipc	a1,0x5
8040d76c:	55458593          	addi	a1,a1,1364 # 80412cbc <default_pmm_manager+0xa90>
8040d770:	835fe0ef          	jal	ra,8040bfa4 <inode_check>
8040d774:	03c42783          	lw	a5,60(s0)
8040d778:	00040513          	mv	a0,s0
8040d77c:	00812403          	lw	s0,8(sp)
8040d780:	00c12083          	lw	ra,12(sp)
8040d784:	0187a783          	lw	a5,24(a5)
8040d788:	01010113          	addi	sp,sp,16
8040d78c:	00078067          	jr	a5
8040d790:	00005697          	auipc	a3,0x5
8040d794:	4dc68693          	addi	a3,a3,1244 # 80412c6c <default_pmm_manager+0xa40>
8040d798:	00003617          	auipc	a2,0x3
8040d79c:	52860613          	addi	a2,a2,1320 # 80410cc0 <commands+0x3c>
8040d7a0:	21c00593          	li	a1,540
8040d7a4:	00007517          	auipc	a0,0x7
8040d7a8:	99050513          	addi	a0,a0,-1648 # 80414134 <dev_node_ops+0xac>
8040d7ac:	b21f20ef          	jal	ra,804002cc <__panic>

8040d7b0 <sfs_io.part.0>:
8040d7b0:	ff010113          	addi	sp,sp,-16
8040d7b4:	00007697          	auipc	a3,0x7
8040d7b8:	94868693          	addi	a3,a3,-1720 # 804140fc <dev_node_ops+0x74>
8040d7bc:	00003617          	auipc	a2,0x3
8040d7c0:	50460613          	addi	a2,a2,1284 # 80410cc0 <commands+0x3c>
8040d7c4:	29700593          	li	a1,663
8040d7c8:	00007517          	auipc	a0,0x7
8040d7cc:	96c50513          	addi	a0,a0,-1684 # 80414134 <dev_node_ops+0xac>
8040d7d0:	00112623          	sw	ra,12(sp)
8040d7d4:	af9f20ef          	jal	ra,804002cc <__panic>

8040d7d8 <sfs_block_free>:
8040d7d8:	ff010113          	addi	sp,sp,-16
8040d7dc:	00912223          	sw	s1,4(sp)
8040d7e0:	00112623          	sw	ra,12(sp)
8040d7e4:	00812423          	sw	s0,8(sp)
8040d7e8:	00452683          	lw	a3,4(a0)
8040d7ec:	00058493          	mv	s1,a1
8040d7f0:	04058663          	beqz	a1,8040d83c <sfs_block_free+0x64>
8040d7f4:	04d5f463          	bgeu	a1,a3,8040d83c <sfs_block_free+0x64>
8040d7f8:	00050413          	mv	s0,a0
8040d7fc:	03052503          	lw	a0,48(a0)
8040d800:	260020ef          	jal	ra,8040fa60 <bitmap_test>
8040d804:	04051a63          	bnez	a0,8040d858 <sfs_block_free+0x80>
8040d808:	03042503          	lw	a0,48(s0)
8040d80c:	00048593          	mv	a1,s1
8040d810:	288020ef          	jal	ra,8040fa98 <bitmap_free>
8040d814:	00842783          	lw	a5,8(s0)
8040d818:	00100713          	li	a4,1
8040d81c:	00c12083          	lw	ra,12(sp)
8040d820:	00178793          	addi	a5,a5,1
8040d824:	02e42a23          	sw	a4,52(s0)
8040d828:	00f42423          	sw	a5,8(s0)
8040d82c:	00812403          	lw	s0,8(sp)
8040d830:	00412483          	lw	s1,4(sp)
8040d834:	01010113          	addi	sp,sp,16
8040d838:	00008067          	ret
8040d83c:	00048713          	mv	a4,s1
8040d840:	00007617          	auipc	a2,0x7
8040d844:	95060613          	addi	a2,a2,-1712 # 80414190 <dev_node_ops+0x108>
8040d848:	05300593          	li	a1,83
8040d84c:	00007517          	auipc	a0,0x7
8040d850:	8e850513          	addi	a0,a0,-1816 # 80414134 <dev_node_ops+0xac>
8040d854:	a79f20ef          	jal	ra,804002cc <__panic>
8040d858:	00007697          	auipc	a3,0x7
8040d85c:	a2c68693          	addi	a3,a3,-1492 # 80414284 <dev_node_ops+0x1fc>
8040d860:	00003617          	auipc	a2,0x3
8040d864:	46060613          	addi	a2,a2,1120 # 80410cc0 <commands+0x3c>
8040d868:	06a00593          	li	a1,106
8040d86c:	00007517          	auipc	a0,0x7
8040d870:	8c850513          	addi	a0,a0,-1848 # 80414134 <dev_node_ops+0xac>
8040d874:	a59f20ef          	jal	ra,804002cc <__panic>

8040d878 <sfs_reclaim>:
8040d878:	ff010113          	addi	sp,sp,-16
8040d87c:	00912223          	sw	s1,4(sp)
8040d880:	03852483          	lw	s1,56(a0)
8040d884:	00112623          	sw	ra,12(sp)
8040d888:	00812423          	sw	s0,8(sp)
8040d88c:	01212023          	sw	s2,0(sp)
8040d890:	16048c63          	beqz	s1,8040da08 <sfs_reclaim+0x190>
8040d894:	06c4a783          	lw	a5,108(s1)
8040d898:	16079863          	bnez	a5,8040da08 <sfs_reclaim+0x190>
8040d89c:	02c52703          	lw	a4,44(a0)
8040d8a0:	000017b7          	lui	a5,0x1
8040d8a4:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
8040d8a8:	00050413          	mv	s0,a0
8040d8ac:	18f71e63          	bne	a4,a5,8040da48 <sfs_reclaim+0x1d0>
8040d8b0:	00048513          	mv	a0,s1
8040d8b4:	ad9ff0ef          	jal	ra,8040d38c <lock_sfs_fs>
8040d8b8:	00c42783          	lw	a5,12(s0)
8040d8bc:	16f05663          	blez	a5,8040da28 <sfs_reclaim+0x1b0>
8040d8c0:	fff78793          	addi	a5,a5,-1
8040d8c4:	00f42623          	sw	a5,12(s0)
8040d8c8:	0e079463          	bnez	a5,8040d9b0 <sfs_reclaim+0x138>
8040d8cc:	03042903          	lw	s2,48(s0)
8040d8d0:	0e091063          	bnez	s2,8040d9b0 <sfs_reclaim+0x138>
8040d8d4:	00042783          	lw	a5,0(s0)
8040d8d8:	0067d783          	lhu	a5,6(a5)
8040d8dc:	02079e63          	bnez	a5,8040d918 <sfs_reclaim+0xa0>
8040d8e0:	03c42783          	lw	a5,60(s0)
8040d8e4:	18078263          	beqz	a5,8040da68 <sfs_reclaim+0x1f0>
8040d8e8:	0307a783          	lw	a5,48(a5)
8040d8ec:	16078e63          	beqz	a5,8040da68 <sfs_reclaim+0x1f0>
8040d8f0:	00006597          	auipc	a1,0x6
8040d8f4:	52458593          	addi	a1,a1,1316 # 80413e14 <syscalls+0xa24>
8040d8f8:	00040513          	mv	a0,s0
8040d8fc:	ea8fe0ef          	jal	ra,8040bfa4 <inode_check>
8040d900:	03c42783          	lw	a5,60(s0)
8040d904:	00000593          	li	a1,0
8040d908:	00040513          	mv	a0,s0
8040d90c:	0307a783          	lw	a5,48(a5)
8040d910:	000780e7          	jalr	a5
8040d914:	0e051663          	bnez	a0,8040da00 <sfs_reclaim+0x188>
8040d918:	00842783          	lw	a5,8(s0)
8040d91c:	02078c63          	beqz	a5,8040d954 <sfs_reclaim+0xdc>
8040d920:	03c42783          	lw	a5,60(s0)
8040d924:	16078263          	beqz	a5,8040da88 <sfs_reclaim+0x210>
8040d928:	0187a783          	lw	a5,24(a5)
8040d92c:	14078e63          	beqz	a5,8040da88 <sfs_reclaim+0x210>
8040d930:	00040513          	mv	a0,s0
8040d934:	00005597          	auipc	a1,0x5
8040d938:	38858593          	addi	a1,a1,904 # 80412cbc <default_pmm_manager+0xa90>
8040d93c:	e68fe0ef          	jal	ra,8040bfa4 <inode_check>
8040d940:	03c42783          	lw	a5,60(s0)
8040d944:	00040513          	mv	a0,s0
8040d948:	0187a783          	lw	a5,24(a5)
8040d94c:	000780e7          	jalr	a5
8040d950:	0a051863          	bnez	a0,8040da00 <sfs_reclaim+0x188>
8040d954:	01c42703          	lw	a4,28(s0)
8040d958:	02042783          	lw	a5,32(s0)
8040d95c:	00048513          	mv	a0,s1
8040d960:	00f72223          	sw	a5,4(a4)
8040d964:	00e7a023          	sw	a4,0(a5)
8040d968:	02442703          	lw	a4,36(s0)
8040d96c:	02842783          	lw	a5,40(s0)
8040d970:	00f72223          	sw	a5,4(a4)
8040d974:	00e7a023          	sw	a4,0(a5)
8040d978:	a25ff0ef          	jal	ra,8040d39c <unlock_sfs_fs>
8040d97c:	00042503          	lw	a0,0(s0)
8040d980:	00655783          	lhu	a5,6(a0)
8040d984:	04078a63          	beqz	a5,8040d9d8 <sfs_reclaim+0x160>
8040d988:	dacf50ef          	jal	ra,80402f34 <kfree>
8040d98c:	00040513          	mv	a0,s0
8040d990:	d88fe0ef          	jal	ra,8040bf18 <inode_kill>
8040d994:	00c12083          	lw	ra,12(sp)
8040d998:	00812403          	lw	s0,8(sp)
8040d99c:	00412483          	lw	s1,4(sp)
8040d9a0:	00090513          	mv	a0,s2
8040d9a4:	00012903          	lw	s2,0(sp)
8040d9a8:	01010113          	addi	sp,sp,16
8040d9ac:	00008067          	ret
8040d9b0:	ff100913          	li	s2,-15
8040d9b4:	00048513          	mv	a0,s1
8040d9b8:	9e5ff0ef          	jal	ra,8040d39c <unlock_sfs_fs>
8040d9bc:	00c12083          	lw	ra,12(sp)
8040d9c0:	00812403          	lw	s0,8(sp)
8040d9c4:	00412483          	lw	s1,4(sp)
8040d9c8:	00090513          	mv	a0,s2
8040d9cc:	00012903          	lw	s2,0(sp)
8040d9d0:	01010113          	addi	sp,sp,16
8040d9d4:	00008067          	ret
8040d9d8:	00442583          	lw	a1,4(s0)
8040d9dc:	00048513          	mv	a0,s1
8040d9e0:	df9ff0ef          	jal	ra,8040d7d8 <sfs_block_free>
8040d9e4:	00042503          	lw	a0,0(s0)
8040d9e8:	03c52583          	lw	a1,60(a0)
8040d9ec:	f8058ee3          	beqz	a1,8040d988 <sfs_reclaim+0x110>
8040d9f0:	00048513          	mv	a0,s1
8040d9f4:	de5ff0ef          	jal	ra,8040d7d8 <sfs_block_free>
8040d9f8:	00042503          	lw	a0,0(s0)
8040d9fc:	f8dff06f          	j	8040d988 <sfs_reclaim+0x110>
8040da00:	00050913          	mv	s2,a0
8040da04:	fb1ff06f          	j	8040d9b4 <sfs_reclaim+0x13c>
8040da08:	00006697          	auipc	a3,0x6
8040da0c:	75c68693          	addi	a3,a3,1884 # 80414164 <dev_node_ops+0xdc>
8040da10:	00003617          	auipc	a2,0x3
8040da14:	2b060613          	addi	a2,a2,688 # 80410cc0 <commands+0x3c>
8040da18:	35800593          	li	a1,856
8040da1c:	00006517          	auipc	a0,0x6
8040da20:	71850513          	addi	a0,a0,1816 # 80414134 <dev_node_ops+0xac>
8040da24:	8a9f20ef          	jal	ra,804002cc <__panic>
8040da28:	00006697          	auipc	a3,0x6
8040da2c:	79c68693          	addi	a3,a3,1948 # 804141c4 <dev_node_ops+0x13c>
8040da30:	00003617          	auipc	a2,0x3
8040da34:	29060613          	addi	a2,a2,656 # 80410cc0 <commands+0x3c>
8040da38:	35e00593          	li	a1,862
8040da3c:	00006517          	auipc	a0,0x6
8040da40:	6f850513          	addi	a0,a0,1784 # 80414134 <dev_node_ops+0xac>
8040da44:	889f20ef          	jal	ra,804002cc <__panic>
8040da48:	00006697          	auipc	a3,0x6
8040da4c:	6b468693          	addi	a3,a3,1716 # 804140fc <dev_node_ops+0x74>
8040da50:	00003617          	auipc	a2,0x3
8040da54:	27060613          	addi	a2,a2,624 # 80410cc0 <commands+0x3c>
8040da58:	35900593          	li	a1,857
8040da5c:	00006517          	auipc	a0,0x6
8040da60:	6d850513          	addi	a0,a0,1752 # 80414134 <dev_node_ops+0xac>
8040da64:	869f20ef          	jal	ra,804002cc <__panic>
8040da68:	00006697          	auipc	a3,0x6
8040da6c:	35868693          	addi	a3,a3,856 # 80413dc0 <syscalls+0x9d0>
8040da70:	00003617          	auipc	a2,0x3
8040da74:	25060613          	addi	a2,a2,592 # 80410cc0 <commands+0x3c>
8040da78:	36300593          	li	a1,867
8040da7c:	00006517          	auipc	a0,0x6
8040da80:	6b850513          	addi	a0,a0,1720 # 80414134 <dev_node_ops+0xac>
8040da84:	849f20ef          	jal	ra,804002cc <__panic>
8040da88:	00005697          	auipc	a3,0x5
8040da8c:	1e468693          	addi	a3,a3,484 # 80412c6c <default_pmm_manager+0xa40>
8040da90:	00003617          	auipc	a2,0x3
8040da94:	23060613          	addi	a2,a2,560 # 80410cc0 <commands+0x3c>
8040da98:	36800593          	li	a1,872
8040da9c:	00006517          	auipc	a0,0x6
8040daa0:	69850513          	addi	a0,a0,1688 # 80414134 <dev_node_ops+0xac>
8040daa4:	829f20ef          	jal	ra,804002cc <__panic>

8040daa8 <sfs_block_alloc>:
8040daa8:	ff010113          	addi	sp,sp,-16
8040daac:	00812423          	sw	s0,8(sp)
8040dab0:	00050413          	mv	s0,a0
8040dab4:	03052503          	lw	a0,48(a0)
8040dab8:	00912223          	sw	s1,4(sp)
8040dabc:	00112623          	sw	ra,12(sp)
8040dac0:	00058493          	mv	s1,a1
8040dac4:	705010ef          	jal	ra,8040f9c8 <bitmap_alloc>
8040dac8:	04051c63          	bnez	a0,8040db20 <sfs_block_alloc+0x78>
8040dacc:	00842783          	lw	a5,8(s0)
8040dad0:	0a078063          	beqz	a5,8040db70 <sfs_block_alloc+0xc8>
8040dad4:	fff78793          	addi	a5,a5,-1
8040dad8:	00f42423          	sw	a5,8(s0)
8040dadc:	00100793          	li	a5,1
8040dae0:	02f42a23          	sw	a5,52(s0)
8040dae4:	0004a583          	lw	a1,0(s1)
8040dae8:	00442683          	lw	a3,4(s0)
8040daec:	04058463          	beqz	a1,8040db34 <sfs_block_alloc+0x8c>
8040daf0:	04d5f263          	bgeu	a1,a3,8040db34 <sfs_block_alloc+0x8c>
8040daf4:	03042503          	lw	a0,48(s0)
8040daf8:	769010ef          	jal	ra,8040fa60 <bitmap_test>
8040dafc:	04051a63          	bnez	a0,8040db50 <sfs_block_alloc+0xa8>
8040db00:	00040513          	mv	a0,s0
8040db04:	00812403          	lw	s0,8(sp)
8040db08:	0004a583          	lw	a1,0(s1)
8040db0c:	00c12083          	lw	ra,12(sp)
8040db10:	00412483          	lw	s1,4(sp)
8040db14:	00100613          	li	a2,1
8040db18:	01010113          	addi	sp,sp,16
8040db1c:	4f00206f          	j	8041000c <sfs_clear_block>
8040db20:	00c12083          	lw	ra,12(sp)
8040db24:	00812403          	lw	s0,8(sp)
8040db28:	00412483          	lw	s1,4(sp)
8040db2c:	01010113          	addi	sp,sp,16
8040db30:	00008067          	ret
8040db34:	00058713          	mv	a4,a1
8040db38:	00006617          	auipc	a2,0x6
8040db3c:	65860613          	addi	a2,a2,1624 # 80414190 <dev_node_ops+0x108>
8040db40:	05300593          	li	a1,83
8040db44:	00006517          	auipc	a0,0x6
8040db48:	5f050513          	addi	a0,a0,1520 # 80414134 <dev_node_ops+0xac>
8040db4c:	f80f20ef          	jal	ra,804002cc <__panic>
8040db50:	00006697          	auipc	a3,0x6
8040db54:	6ac68693          	addi	a3,a3,1708 # 804141fc <dev_node_ops+0x174>
8040db58:	00003617          	auipc	a2,0x3
8040db5c:	16860613          	addi	a2,a2,360 # 80410cc0 <commands+0x3c>
8040db60:	06100593          	li	a1,97
8040db64:	00006517          	auipc	a0,0x6
8040db68:	5d050513          	addi	a0,a0,1488 # 80414134 <dev_node_ops+0xac>
8040db6c:	f60f20ef          	jal	ra,804002cc <__panic>
8040db70:	00006697          	auipc	a3,0x6
8040db74:	66c68693          	addi	a3,a3,1644 # 804141dc <dev_node_ops+0x154>
8040db78:	00003617          	auipc	a2,0x3
8040db7c:	14860613          	addi	a2,a2,328 # 80410cc0 <commands+0x3c>
8040db80:	05f00593          	li	a1,95
8040db84:	00006517          	auipc	a0,0x6
8040db88:	5b050513          	addi	a0,a0,1456 # 80414134 <dev_node_ops+0xac>
8040db8c:	f40f20ef          	jal	ra,804002cc <__panic>

8040db90 <sfs_bmap_load_nolock>:
8040db90:	fc010113          	addi	sp,sp,-64
8040db94:	03612023          	sw	s6,32(sp)
8040db98:	0005ab03          	lw	s6,0(a1)
8040db9c:	01712e23          	sw	s7,28(sp)
8040dba0:	02112e23          	sw	ra,60(sp)
8040dba4:	008b2b83          	lw	s7,8(s6)
8040dba8:	02812c23          	sw	s0,56(sp)
8040dbac:	02912a23          	sw	s1,52(sp)
8040dbb0:	03212823          	sw	s2,48(sp)
8040dbb4:	03312623          	sw	s3,44(sp)
8040dbb8:	03412423          	sw	s4,40(sp)
8040dbbc:	03512223          	sw	s5,36(sp)
8040dbc0:	01812c23          	sw	s8,24(sp)
8040dbc4:	01912a23          	sw	s9,20(sp)
8040dbc8:	22cbe063          	bltu	s7,a2,8040dde8 <sfs_bmap_load_nolock+0x258>
8040dbcc:	00b00793          	li	a5,11
8040dbd0:	00058a93          	mv	s5,a1
8040dbd4:	00060413          	mv	s0,a2
8040dbd8:	00050913          	mv	s2,a0
8040dbdc:	00068993          	mv	s3,a3
8040dbe0:	04c7f663          	bgeu	a5,a2,8040dc2c <sfs_bmap_load_nolock+0x9c>
8040dbe4:	ff460713          	addi	a4,a2,-12
8040dbe8:	3ff00793          	li	a5,1023
8040dbec:	24e7ec63          	bltu	a5,a4,8040de44 <sfs_bmap_load_nolock+0x2b4>
8040dbf0:	03cb2a03          	lw	s4,60(s6)
8040dbf4:	00012623          	sw	zero,12(sp)
8040dbf8:	00271c13          	slli	s8,a4,0x2
8040dbfc:	01412423          	sw	s4,8(sp)
8040dc00:	160a1463          	bnez	s4,8040dd68 <sfs_bmap_load_nolock+0x1d8>
8040dc04:	0ecb8863          	beq	s7,a2,8040dcf4 <sfs_bmap_load_nolock+0x164>
8040dc08:	00000a13          	li	s4,0
8040dc0c:	00492683          	lw	a3,4(s2)
8040dc10:	000a0713          	mv	a4,s4
8040dc14:	00006617          	auipc	a2,0x6
8040dc18:	57c60613          	addi	a2,a2,1404 # 80414190 <dev_node_ops+0x108>
8040dc1c:	05300593          	li	a1,83
8040dc20:	00006517          	auipc	a0,0x6
8040dc24:	51450513          	addi	a0,a0,1300 # 80414134 <dev_node_ops+0xac>
8040dc28:	ea4f20ef          	jal	ra,804002cc <__panic>
8040dc2c:	00261a13          	slli	s4,a2,0x2
8040dc30:	014b0a33          	add	s4,s6,s4
8040dc34:	00ca2583          	lw	a1,12(s4)
8040dc38:	00b12223          	sw	a1,4(sp)
8040dc3c:	02059663          	bnez	a1,8040dc68 <sfs_bmap_load_nolock+0xd8>
8040dc40:	fccb94e3          	bne	s7,a2,8040dc08 <sfs_bmap_load_nolock+0x78>
8040dc44:	00410593          	addi	a1,sp,4
8040dc48:	e61ff0ef          	jal	ra,8040daa8 <sfs_block_alloc>
8040dc4c:	00050493          	mv	s1,a0
8040dc50:	04051e63          	bnez	a0,8040dcac <sfs_bmap_load_nolock+0x11c>
8040dc54:	00412583          	lw	a1,4(sp)
8040dc58:	00100713          	li	a4,1
8040dc5c:	00ba2623          	sw	a1,12(s4)
8040dc60:	00eaa423          	sw	a4,8(s5)
8040dc64:	fa0582e3          	beqz	a1,8040dc08 <sfs_bmap_load_nolock+0x78>
8040dc68:	00492683          	lw	a3,4(s2)
8040dc6c:	1ad5fe63          	bgeu	a1,a3,8040de28 <sfs_bmap_load_nolock+0x298>
8040dc70:	03092503          	lw	a0,48(s2)
8040dc74:	5ed010ef          	jal	ra,8040fa60 <bitmap_test>
8040dc78:	1e051263          	bnez	a0,8040de5c <sfs_bmap_load_nolock+0x2cc>
8040dc7c:	00412a03          	lw	s4,4(sp)
8040dc80:	f80a06e3          	beqz	s4,8040dc0c <sfs_bmap_load_nolock+0x7c>
8040dc84:	00492783          	lw	a5,4(s2)
8040dc88:	f8fa72e3          	bgeu	s4,a5,8040dc0c <sfs_bmap_load_nolock+0x7c>
8040dc8c:	03092503          	lw	a0,48(s2)
8040dc90:	000a0593          	mv	a1,s4
8040dc94:	5cd010ef          	jal	ra,8040fa60 <bitmap_test>
8040dc98:	00050493          	mv	s1,a0
8040dc9c:	16051663          	bnez	a0,8040de08 <sfs_bmap_load_nolock+0x278>
8040dca0:	048b8263          	beq	s7,s0,8040dce4 <sfs_bmap_load_nolock+0x154>
8040dca4:	00098463          	beqz	s3,8040dcac <sfs_bmap_load_nolock+0x11c>
8040dca8:	0149a023          	sw	s4,0(s3)
8040dcac:	03c12083          	lw	ra,60(sp)
8040dcb0:	03812403          	lw	s0,56(sp)
8040dcb4:	03012903          	lw	s2,48(sp)
8040dcb8:	02c12983          	lw	s3,44(sp)
8040dcbc:	02812a03          	lw	s4,40(sp)
8040dcc0:	02412a83          	lw	s5,36(sp)
8040dcc4:	02012b03          	lw	s6,32(sp)
8040dcc8:	01c12b83          	lw	s7,28(sp)
8040dccc:	01812c03          	lw	s8,24(sp)
8040dcd0:	01412c83          	lw	s9,20(sp)
8040dcd4:	00048513          	mv	a0,s1
8040dcd8:	03412483          	lw	s1,52(sp)
8040dcdc:	04010113          	addi	sp,sp,64
8040dce0:	00008067          	ret
8040dce4:	008b2783          	lw	a5,8(s6)
8040dce8:	00178793          	addi	a5,a5,1
8040dcec:	00fb2423          	sw	a5,8(s6)
8040dcf0:	fb5ff06f          	j	8040dca4 <sfs_bmap_load_nolock+0x114>
8040dcf4:	00810593          	addi	a1,sp,8
8040dcf8:	db1ff0ef          	jal	ra,8040daa8 <sfs_block_alloc>
8040dcfc:	00050493          	mv	s1,a0
8040dd00:	00c10c93          	addi	s9,sp,12
8040dd04:	fa0514e3          	bnez	a0,8040dcac <sfs_bmap_load_nolock+0x11c>
8040dd08:	000c8593          	mv	a1,s9
8040dd0c:	00090513          	mv	a0,s2
8040dd10:	d99ff0ef          	jal	ra,8040daa8 <sfs_block_alloc>
8040dd14:	00050493          	mv	s1,a0
8040dd18:	0a051463          	bnez	a0,8040ddc0 <sfs_bmap_load_nolock+0x230>
8040dd1c:	00812683          	lw	a3,8(sp)
8040dd20:	000c8593          	mv	a1,s9
8040dd24:	000c0713          	mv	a4,s8
8040dd28:	00400613          	li	a2,4
8040dd2c:	00090513          	mv	a0,s2
8040dd30:	0b4020ef          	jal	ra,8040fde4 <sfs_wbuf>
8040dd34:	00c12583          	lw	a1,12(sp)
8040dd38:	00050493          	mv	s1,a0
8040dd3c:	06051e63          	bnez	a0,8040ddb8 <sfs_bmap_load_nolock+0x228>
8040dd40:	03cb2683          	lw	a3,60(s6)
8040dd44:	00812703          	lw	a4,8(sp)
8040dd48:	00b12223          	sw	a1,4(sp)
8040dd4c:	f0d70ce3          	beq	a4,a3,8040dc64 <sfs_bmap_load_nolock+0xd4>
8040dd50:	12069663          	bnez	a3,8040de7c <sfs_bmap_load_nolock+0x2ec>
8040dd54:	02eb2e23          	sw	a4,60(s6)
8040dd58:	00100713          	li	a4,1
8040dd5c:	00eaa423          	sw	a4,8(s5)
8040dd60:	ea0584e3          	beqz	a1,8040dc08 <sfs_bmap_load_nolock+0x78>
8040dd64:	f05ff06f          	j	8040dc68 <sfs_bmap_load_nolock+0xd8>
8040dd68:	00c10c93          	addi	s9,sp,12
8040dd6c:	000c0713          	mv	a4,s8
8040dd70:	000a0693          	mv	a3,s4
8040dd74:	00400613          	li	a2,4
8040dd78:	000c8593          	mv	a1,s9
8040dd7c:	7a1010ef          	jal	ra,8040fd1c <sfs_rbuf>
8040dd80:	00050493          	mv	s1,a0
8040dd84:	f20514e3          	bnez	a0,8040dcac <sfs_bmap_load_nolock+0x11c>
8040dd88:	00c12583          	lw	a1,12(sp)
8040dd8c:	04059463          	bnez	a1,8040ddd4 <sfs_bmap_load_nolock+0x244>
8040dd90:	f68b8ce3          	beq	s7,s0,8040dd08 <sfs_bmap_load_nolock+0x178>
8040dd94:	03cb2703          	lw	a4,60(s6)
8040dd98:	00812783          	lw	a5,8(sp)
8040dd9c:	00012223          	sw	zero,4(sp)
8040dda0:	e6e784e3          	beq	a5,a4,8040dc08 <sfs_bmap_load_nolock+0x78>
8040dda4:	0c071c63          	bnez	a4,8040de7c <sfs_bmap_load_nolock+0x2ec>
8040dda8:	02fb2e23          	sw	a5,60(s6)
8040ddac:	00100793          	li	a5,1
8040ddb0:	00faa423          	sw	a5,8(s5)
8040ddb4:	e55ff06f          	j	8040dc08 <sfs_bmap_load_nolock+0x78>
8040ddb8:	00090513          	mv	a0,s2
8040ddbc:	a1dff0ef          	jal	ra,8040d7d8 <sfs_block_free>
8040ddc0:	00812583          	lw	a1,8(sp)
8040ddc4:	eeba04e3          	beq	s4,a1,8040dcac <sfs_bmap_load_nolock+0x11c>
8040ddc8:	00090513          	mv	a0,s2
8040ddcc:	a0dff0ef          	jal	ra,8040d7d8 <sfs_block_free>
8040ddd0:	eddff06f          	j	8040dcac <sfs_bmap_load_nolock+0x11c>
8040ddd4:	03cb2683          	lw	a3,60(s6)
8040ddd8:	00812703          	lw	a4,8(sp)
8040dddc:	00b12223          	sw	a1,4(sp)
8040dde0:	f6e698e3          	bne	a3,a4,8040dd50 <sfs_bmap_load_nolock+0x1c0>
8040dde4:	e85ff06f          	j	8040dc68 <sfs_bmap_load_nolock+0xd8>
8040dde8:	00006697          	auipc	a3,0x6
8040ddec:	43868693          	addi	a3,a3,1080 # 80414220 <dev_node_ops+0x198>
8040ddf0:	00003617          	auipc	a2,0x3
8040ddf4:	ed060613          	addi	a2,a2,-304 # 80410cc0 <commands+0x3c>
8040ddf8:	16400593          	li	a1,356
8040ddfc:	00006517          	auipc	a0,0x6
8040de00:	33850513          	addi	a0,a0,824 # 80414134 <dev_node_ops+0xac>
8040de04:	cc8f20ef          	jal	ra,804002cc <__panic>
8040de08:	00006697          	auipc	a3,0x6
8040de0c:	47c68693          	addi	a3,a3,1148 # 80414284 <dev_node_ops+0x1fc>
8040de10:	00003617          	auipc	a2,0x3
8040de14:	eb060613          	addi	a2,a2,-336 # 80410cc0 <commands+0x3c>
8040de18:	16b00593          	li	a1,363
8040de1c:	00006517          	auipc	a0,0x6
8040de20:	31850513          	addi	a0,a0,792 # 80414134 <dev_node_ops+0xac>
8040de24:	ca8f20ef          	jal	ra,804002cc <__panic>
8040de28:	00058713          	mv	a4,a1
8040de2c:	00006617          	auipc	a2,0x6
8040de30:	36460613          	addi	a2,a2,868 # 80414190 <dev_node_ops+0x108>
8040de34:	05300593          	li	a1,83
8040de38:	00006517          	auipc	a0,0x6
8040de3c:	2fc50513          	addi	a0,a0,764 # 80414134 <dev_node_ops+0xac>
8040de40:	c8cf20ef          	jal	ra,804002cc <__panic>
8040de44:	00006617          	auipc	a2,0x6
8040de48:	40860613          	addi	a2,a2,1032 # 8041424c <dev_node_ops+0x1c4>
8040de4c:	11e00593          	li	a1,286
8040de50:	00006517          	auipc	a0,0x6
8040de54:	2e450513          	addi	a0,a0,740 # 80414134 <dev_node_ops+0xac>
8040de58:	c74f20ef          	jal	ra,804002cc <__panic>
8040de5c:	00006697          	auipc	a3,0x6
8040de60:	41c68693          	addi	a3,a3,1052 # 80414278 <dev_node_ops+0x1f0>
8040de64:	00003617          	auipc	a2,0x3
8040de68:	e5c60613          	addi	a2,a2,-420 # 80410cc0 <commands+0x3c>
8040de6c:	12100593          	li	a1,289
8040de70:	00006517          	auipc	a0,0x6
8040de74:	2c450513          	addi	a0,a0,708 # 80414134 <dev_node_ops+0xac>
8040de78:	c54f20ef          	jal	ra,804002cc <__panic>
8040de7c:	00006697          	auipc	a3,0x6
8040de80:	3bc68693          	addi	a3,a3,956 # 80414238 <dev_node_ops+0x1b0>
8040de84:	00003617          	auipc	a2,0x3
8040de88:	e3c60613          	addi	a2,a2,-452 # 80410cc0 <commands+0x3c>
8040de8c:	11800593          	li	a1,280
8040de90:	00006517          	auipc	a0,0x6
8040de94:	2a450513          	addi	a0,a0,676 # 80414134 <dev_node_ops+0xac>
8040de98:	c34f20ef          	jal	ra,804002cc <__panic>

8040de9c <sfs_io_nolock>:
8040de9c:	fa010113          	addi	sp,sp,-96
8040dea0:	05412423          	sw	s4,72(sp)
8040dea4:	00058a13          	mv	s4,a1
8040dea8:	0005a583          	lw	a1,0(a1)
8040deac:	04112e23          	sw	ra,92(sp)
8040deb0:	04812c23          	sw	s0,88(sp)
8040deb4:	0045d883          	lhu	a7,4(a1)
8040deb8:	04912a23          	sw	s1,84(sp)
8040debc:	05212823          	sw	s2,80(sp)
8040dec0:	05312623          	sw	s3,76(sp)
8040dec4:	05512223          	sw	s5,68(sp)
8040dec8:	05612023          	sw	s6,64(sp)
8040decc:	03712e23          	sw	s7,60(sp)
8040ded0:	03812c23          	sw	s8,56(sp)
8040ded4:	03912a23          	sw	s9,52(sp)
8040ded8:	03a12823          	sw	s10,48(sp)
8040dedc:	03b12623          	sw	s11,44(sp)
8040dee0:	00200813          	li	a6,2
8040dee4:	27088263          	beq	a7,a6,8040e148 <sfs_io_nolock+0x2ac>
8040dee8:	00072483          	lw	s1,0(a4)
8040deec:	00070993          	mv	s3,a4
8040def0:	0009a023          	sw	zero,0(s3)
8040def4:	08000737          	lui	a4,0x8000
8040def8:	00068413          	mv	s0,a3
8040defc:	00068c93          	mv	s9,a3
8040df00:	009684b3          	add	s1,a3,s1
8040df04:	22e6fe63          	bgeu	a3,a4,8040e140 <sfs_io_nolock+0x2a4>
8040df08:	22d4cc63          	blt	s1,a3,8040e140 <sfs_io_nolock+0x2a4>
8040df0c:	00000913          	li	s2,0
8040df10:	0c968c63          	beq	a3,s1,8040dfe8 <sfs_io_nolock+0x14c>
8040df14:	00050b13          	mv	s6,a0
8040df18:	00060b93          	mv	s7,a2
8040df1c:	00977463          	bgeu	a4,s1,8040df24 <sfs_io_nolock+0x88>
8040df20:	080004b7          	lui	s1,0x8000
8040df24:	10078263          	beqz	a5,8040e028 <sfs_io_nolock+0x18c>
8040df28:	00002797          	auipc	a5,0x2
8040df2c:	d4c78793          	addi	a5,a5,-692 # 8040fc74 <sfs_wblock>
8040df30:	00f12623          	sw	a5,12(sp)
8040df34:	00002797          	auipc	a5,0x2
8040df38:	eb078793          	addi	a5,a5,-336 # 8040fde4 <sfs_wbuf>
8040df3c:	00f12423          	sw	a5,8(sp)
8040df40:	00001737          	lui	a4,0x1
8040df44:	fff70d13          	addi	s10,a4,-1 # fff <_binary_bin_swap_img_size-0x7001>
8040df48:	40c45c13          	srai	s8,s0,0xc
8040df4c:	40c4da93          	srai	s5,s1,0xc
8040df50:	01a47d33          	and	s10,s0,s10
8040df54:	418a8ab3          	sub	s5,s5,s8
8040df58:	000d0d93          	mv	s11,s10
8040df5c:	040d0e63          	beqz	s10,8040dfb8 <sfs_io_nolock+0x11c>
8040df60:	40848db3          	sub	s11,s1,s0
8040df64:	0e0a9a63          	bnez	s5,8040e058 <sfs_io_nolock+0x1bc>
8040df68:	01c10693          	addi	a3,sp,28
8040df6c:	000c0613          	mv	a2,s8
8040df70:	000a0593          	mv	a1,s4
8040df74:	000b0513          	mv	a0,s6
8040df78:	c19ff0ef          	jal	ra,8040db90 <sfs_bmap_load_nolock>
8040df7c:	00050913          	mv	s2,a0
8040df80:	0e051c63          	bnez	a0,8040e078 <sfs_io_nolock+0x1dc>
8040df84:	01c12683          	lw	a3,28(sp)
8040df88:	00812783          	lw	a5,8(sp)
8040df8c:	000d0713          	mv	a4,s10
8040df90:	000d8613          	mv	a2,s11
8040df94:	000b8593          	mv	a1,s7
8040df98:	000b0513          	mv	a0,s6
8040df9c:	000780e7          	jalr	a5
8040dfa0:	00050913          	mv	s2,a0
8040dfa4:	0c051a63          	bnez	a0,8040e078 <sfs_io_nolock+0x1dc>
8040dfa8:	020a8063          	beqz	s5,8040dfc8 <sfs_io_nolock+0x12c>
8040dfac:	01bb8bb3          	add	s7,s7,s11
8040dfb0:	001c0c13          	addi	s8,s8,1 # 4001 <_binary_bin_swap_img_size-0x3fff>
8040dfb4:	fffa8a93          	addi	s5,s5,-1
8040dfb8:	120a9663          	bnez	s5,8040e0e4 <sfs_io_nolock+0x248>
8040dfbc:	01449493          	slli	s1,s1,0x14
8040dfc0:	0144d913          	srli	s2,s1,0x14
8040dfc4:	0c049c63          	bnez	s1,8040e09c <sfs_io_nolock+0x200>
8040dfc8:	01b40cb3          	add	s9,s0,s11
8040dfcc:	000a2783          	lw	a5,0(s4)
8040dfd0:	01b9a023          	sw	s11,0(s3)
8040dfd4:	0007a703          	lw	a4,0(a5)
8040dfd8:	01977863          	bgeu	a4,s9,8040dfe8 <sfs_io_nolock+0x14c>
8040dfdc:	0197a023          	sw	s9,0(a5)
8040dfe0:	00100793          	li	a5,1
8040dfe4:	00fa2423          	sw	a5,8(s4)
8040dfe8:	05c12083          	lw	ra,92(sp)
8040dfec:	05812403          	lw	s0,88(sp)
8040dff0:	05412483          	lw	s1,84(sp)
8040dff4:	04c12983          	lw	s3,76(sp)
8040dff8:	04812a03          	lw	s4,72(sp)
8040dffc:	04412a83          	lw	s5,68(sp)
8040e000:	04012b03          	lw	s6,64(sp)
8040e004:	03c12b83          	lw	s7,60(sp)
8040e008:	03812c03          	lw	s8,56(sp)
8040e00c:	03412c83          	lw	s9,52(sp)
8040e010:	03012d03          	lw	s10,48(sp)
8040e014:	02c12d83          	lw	s11,44(sp)
8040e018:	00090513          	mv	a0,s2
8040e01c:	05012903          	lw	s2,80(sp)
8040e020:	06010113          	addi	sp,sp,96
8040e024:	00008067          	ret
8040e028:	0005a783          	lw	a5,0(a1)
8040e02c:	00000913          	li	s2,0
8040e030:	faf47ce3          	bgeu	s0,a5,8040dfe8 <sfs_io_nolock+0x14c>
8040e034:	0497f663          	bgeu	a5,s1,8040e080 <sfs_io_nolock+0x1e4>
8040e038:	00078493          	mv	s1,a5
8040e03c:	00002797          	auipc	a5,0x2
8040e040:	b9078793          	addi	a5,a5,-1136 # 8040fbcc <sfs_rblock>
8040e044:	00f12623          	sw	a5,12(sp)
8040e048:	00002797          	auipc	a5,0x2
8040e04c:	cd478793          	addi	a5,a5,-812 # 8040fd1c <sfs_rbuf>
8040e050:	00f12423          	sw	a5,8(sp)
8040e054:	eedff06f          	j	8040df40 <sfs_io_nolock+0xa4>
8040e058:	01c10693          	addi	a3,sp,28
8040e05c:	000c0613          	mv	a2,s8
8040e060:	000a0593          	mv	a1,s4
8040e064:	000b0513          	mv	a0,s6
8040e068:	41a70db3          	sub	s11,a4,s10
8040e06c:	b25ff0ef          	jal	ra,8040db90 <sfs_bmap_load_nolock>
8040e070:	00050913          	mv	s2,a0
8040e074:	f00508e3          	beqz	a0,8040df84 <sfs_io_nolock+0xe8>
8040e078:	00000d93          	li	s11,0
8040e07c:	f51ff06f          	j	8040dfcc <sfs_io_nolock+0x130>
8040e080:	00002797          	auipc	a5,0x2
8040e084:	b4c78793          	addi	a5,a5,-1204 # 8040fbcc <sfs_rblock>
8040e088:	00f12623          	sw	a5,12(sp)
8040e08c:	00002797          	auipc	a5,0x2
8040e090:	c9078793          	addi	a5,a5,-880 # 8040fd1c <sfs_rbuf>
8040e094:	00f12423          	sw	a5,8(sp)
8040e098:	ea9ff06f          	j	8040df40 <sfs_io_nolock+0xa4>
8040e09c:	01c10693          	addi	a3,sp,28
8040e0a0:	000c0613          	mv	a2,s8
8040e0a4:	000a0593          	mv	a1,s4
8040e0a8:	000b0513          	mv	a0,s6
8040e0ac:	ae5ff0ef          	jal	ra,8040db90 <sfs_bmap_load_nolock>
8040e0b0:	08051263          	bnez	a0,8040e134 <sfs_io_nolock+0x298>
8040e0b4:	00812783          	lw	a5,8(sp)
8040e0b8:	01c12683          	lw	a3,28(sp)
8040e0bc:	00090613          	mv	a2,s2
8040e0c0:	00000713          	li	a4,0
8040e0c4:	000b8593          	mv	a1,s7
8040e0c8:	000b0513          	mv	a0,s6
8040e0cc:	000780e7          	jalr	a5
8040e0d0:	00090793          	mv	a5,s2
8040e0d4:	00050913          	mv	s2,a0
8040e0d8:	ee0518e3          	bnez	a0,8040dfc8 <sfs_io_nolock+0x12c>
8040e0dc:	00fd8db3          	add	s11,s11,a5
8040e0e0:	ee9ff06f          	j	8040dfc8 <sfs_io_nolock+0x12c>
8040e0e4:	01c10693          	addi	a3,sp,28
8040e0e8:	000c0613          	mv	a2,s8
8040e0ec:	000a0593          	mv	a1,s4
8040e0f0:	000b0513          	mv	a0,s6
8040e0f4:	a9dff0ef          	jal	ra,8040db90 <sfs_bmap_load_nolock>
8040e0f8:	00050913          	mv	s2,a0
8040e0fc:	ec0516e3          	bnez	a0,8040dfc8 <sfs_io_nolock+0x12c>
8040e100:	01c12603          	lw	a2,28(sp)
8040e104:	00c12783          	lw	a5,12(sp)
8040e108:	000a8693          	mv	a3,s5
8040e10c:	000b8593          	mv	a1,s7
8040e110:	000b0513          	mv	a0,s6
8040e114:	000780e7          	jalr	a5
8040e118:	00050913          	mv	s2,a0
8040e11c:	ea0516e3          	bnez	a0,8040dfc8 <sfs_io_nolock+0x12c>
8040e120:	00ca9713          	slli	a4,s5,0xc
8040e124:	00ed8db3          	add	s11,s11,a4
8040e128:	00eb8bb3          	add	s7,s7,a4
8040e12c:	015c0c33          	add	s8,s8,s5
8040e130:	e8dff06f          	j	8040dfbc <sfs_io_nolock+0x120>
8040e134:	01b40cb3          	add	s9,s0,s11
8040e138:	00050913          	mv	s2,a0
8040e13c:	e91ff06f          	j	8040dfcc <sfs_io_nolock+0x130>
8040e140:	ffd00913          	li	s2,-3
8040e144:	ea5ff06f          	j	8040dfe8 <sfs_io_nolock+0x14c>
8040e148:	00006697          	auipc	a3,0x6
8040e14c:	15868693          	addi	a3,a3,344 # 804142a0 <dev_node_ops+0x218>
8040e150:	00003617          	auipc	a2,0x3
8040e154:	b7060613          	addi	a2,a2,-1168 # 80410cc0 <commands+0x3c>
8040e158:	22b00593          	li	a1,555
8040e15c:	00006517          	auipc	a0,0x6
8040e160:	fd850513          	addi	a0,a0,-40 # 80414134 <dev_node_ops+0xac>
8040e164:	968f20ef          	jal	ra,804002cc <__panic>

8040e168 <sfs_read>:
8040e168:	fd010113          	addi	sp,sp,-48
8040e16c:	03212023          	sw	s2,32(sp)
8040e170:	03852903          	lw	s2,56(a0)
8040e174:	02112623          	sw	ra,44(sp)
8040e178:	02812423          	sw	s0,40(sp)
8040e17c:	02912223          	sw	s1,36(sp)
8040e180:	01312e23          	sw	s3,28(sp)
8040e184:	08090a63          	beqz	s2,8040e218 <sfs_read+0xb0>
8040e188:	06c92783          	lw	a5,108(s2)
8040e18c:	08079663          	bnez	a5,8040e218 <sfs_read+0xb0>
8040e190:	02c52703          	lw	a4,44(a0)
8040e194:	000017b7          	lui	a5,0x1
8040e198:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
8040e19c:	00050413          	mv	s0,a0
8040e1a0:	08f71c63          	bne	a4,a5,8040e238 <sfs_read+0xd0>
8040e1a4:	01050993          	addi	s3,a0,16
8040e1a8:	00098513          	mv	a0,s3
8040e1ac:	00058493          	mv	s1,a1
8040e1b0:	8a1f80ef          	jal	ra,80406a50 <down>
8040e1b4:	00c4a803          	lw	a6,12(s1) # 800000c <_binary_bin_sfs_img_size+0x7f8800c>
8040e1b8:	0044a683          	lw	a3,4(s1)
8040e1bc:	0004a603          	lw	a2,0(s1)
8040e1c0:	00040593          	mv	a1,s0
8040e1c4:	00000793          	li	a5,0
8040e1c8:	00c10713          	addi	a4,sp,12
8040e1cc:	00090513          	mv	a0,s2
8040e1d0:	01012623          	sw	a6,12(sp)
8040e1d4:	cc9ff0ef          	jal	ra,8040de9c <sfs_io_nolock>
8040e1d8:	00c12583          	lw	a1,12(sp)
8040e1dc:	00050413          	mv	s0,a0
8040e1e0:	02059663          	bnez	a1,8040e20c <sfs_read+0xa4>
8040e1e4:	00098513          	mv	a0,s3
8040e1e8:	865f80ef          	jal	ra,80406a4c <up>
8040e1ec:	02c12083          	lw	ra,44(sp)
8040e1f0:	00040513          	mv	a0,s0
8040e1f4:	02812403          	lw	s0,40(sp)
8040e1f8:	02412483          	lw	s1,36(sp)
8040e1fc:	02012903          	lw	s2,32(sp)
8040e200:	01c12983          	lw	s3,28(sp)
8040e204:	03010113          	addi	sp,sp,48
8040e208:	00008067          	ret
8040e20c:	00048513          	mv	a0,s1
8040e210:	894fa0ef          	jal	ra,804082a4 <iobuf_skip>
8040e214:	fd1ff06f          	j	8040e1e4 <sfs_read+0x7c>
8040e218:	00006697          	auipc	a3,0x6
8040e21c:	f4c68693          	addi	a3,a3,-180 # 80414164 <dev_node_ops+0xdc>
8040e220:	00003617          	auipc	a2,0x3
8040e224:	aa060613          	addi	a2,a2,-1376 # 80410cc0 <commands+0x3c>
8040e228:	29600593          	li	a1,662
8040e22c:	00006517          	auipc	a0,0x6
8040e230:	f0850513          	addi	a0,a0,-248 # 80414134 <dev_node_ops+0xac>
8040e234:	898f20ef          	jal	ra,804002cc <__panic>
8040e238:	d78ff0ef          	jal	ra,8040d7b0 <sfs_io.part.0>

8040e23c <sfs_write>:
8040e23c:	fd010113          	addi	sp,sp,-48
8040e240:	03212023          	sw	s2,32(sp)
8040e244:	03852903          	lw	s2,56(a0)
8040e248:	02112623          	sw	ra,44(sp)
8040e24c:	02812423          	sw	s0,40(sp)
8040e250:	02912223          	sw	s1,36(sp)
8040e254:	01312e23          	sw	s3,28(sp)
8040e258:	08090a63          	beqz	s2,8040e2ec <sfs_write+0xb0>
8040e25c:	06c92783          	lw	a5,108(s2)
8040e260:	08079663          	bnez	a5,8040e2ec <sfs_write+0xb0>
8040e264:	02c52703          	lw	a4,44(a0)
8040e268:	000017b7          	lui	a5,0x1
8040e26c:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
8040e270:	00050413          	mv	s0,a0
8040e274:	08f71c63          	bne	a4,a5,8040e30c <sfs_write+0xd0>
8040e278:	01050993          	addi	s3,a0,16
8040e27c:	00098513          	mv	a0,s3
8040e280:	00058493          	mv	s1,a1
8040e284:	fccf80ef          	jal	ra,80406a50 <down>
8040e288:	00c4a803          	lw	a6,12(s1)
8040e28c:	0044a683          	lw	a3,4(s1)
8040e290:	0004a603          	lw	a2,0(s1)
8040e294:	00040593          	mv	a1,s0
8040e298:	00100793          	li	a5,1
8040e29c:	00c10713          	addi	a4,sp,12
8040e2a0:	00090513          	mv	a0,s2
8040e2a4:	01012623          	sw	a6,12(sp)
8040e2a8:	bf5ff0ef          	jal	ra,8040de9c <sfs_io_nolock>
8040e2ac:	00c12583          	lw	a1,12(sp)
8040e2b0:	00050413          	mv	s0,a0
8040e2b4:	02059663          	bnez	a1,8040e2e0 <sfs_write+0xa4>
8040e2b8:	00098513          	mv	a0,s3
8040e2bc:	f90f80ef          	jal	ra,80406a4c <up>
8040e2c0:	02c12083          	lw	ra,44(sp)
8040e2c4:	00040513          	mv	a0,s0
8040e2c8:	02812403          	lw	s0,40(sp)
8040e2cc:	02412483          	lw	s1,36(sp)
8040e2d0:	02012903          	lw	s2,32(sp)
8040e2d4:	01c12983          	lw	s3,28(sp)
8040e2d8:	03010113          	addi	sp,sp,48
8040e2dc:	00008067          	ret
8040e2e0:	00048513          	mv	a0,s1
8040e2e4:	fc1f90ef          	jal	ra,804082a4 <iobuf_skip>
8040e2e8:	fd1ff06f          	j	8040e2b8 <sfs_write+0x7c>
8040e2ec:	00006697          	auipc	a3,0x6
8040e2f0:	e7868693          	addi	a3,a3,-392 # 80414164 <dev_node_ops+0xdc>
8040e2f4:	00003617          	auipc	a2,0x3
8040e2f8:	9cc60613          	addi	a2,a2,-1588 # 80410cc0 <commands+0x3c>
8040e2fc:	29600593          	li	a1,662
8040e300:	00006517          	auipc	a0,0x6
8040e304:	e3450513          	addi	a0,a0,-460 # 80414134 <dev_node_ops+0xac>
8040e308:	fc5f10ef          	jal	ra,804002cc <__panic>
8040e30c:	ca4ff0ef          	jal	ra,8040d7b0 <sfs_io.part.0>

8040e310 <sfs_dirent_read_nolock>:
8040e310:	0005a703          	lw	a4,0(a1)
8040e314:	fe010113          	addi	sp,sp,-32
8040e318:	00112e23          	sw	ra,28(sp)
8040e31c:	00475883          	lhu	a7,4(a4)
8040e320:	00812c23          	sw	s0,24(sp)
8040e324:	00912a23          	sw	s1,20(sp)
8040e328:	00200813          	li	a6,2
8040e32c:	09089263          	bne	a7,a6,8040e3b0 <sfs_dirent_read_nolock+0xa0>
8040e330:	00872703          	lw	a4,8(a4)
8040e334:	06e67e63          	bgeu	a2,a4,8040e3b0 <sfs_dirent_read_nolock+0xa0>
8040e338:	00068493          	mv	s1,a3
8040e33c:	00c10693          	addi	a3,sp,12
8040e340:	00050413          	mv	s0,a0
8040e344:	84dff0ef          	jal	ra,8040db90 <sfs_bmap_load_nolock>
8040e348:	00050c63          	beqz	a0,8040e360 <sfs_dirent_read_nolock+0x50>
8040e34c:	01c12083          	lw	ra,28(sp)
8040e350:	01812403          	lw	s0,24(sp)
8040e354:	01412483          	lw	s1,20(sp)
8040e358:	02010113          	addi	sp,sp,32
8040e35c:	00008067          	ret
8040e360:	00c12583          	lw	a1,12(sp)
8040e364:	00442683          	lw	a3,4(s0)
8040e368:	06058463          	beqz	a1,8040e3d0 <sfs_dirent_read_nolock+0xc0>
8040e36c:	06d5f263          	bgeu	a1,a3,8040e3d0 <sfs_dirent_read_nolock+0xc0>
8040e370:	03042503          	lw	a0,48(s0)
8040e374:	6ec010ef          	jal	ra,8040fa60 <bitmap_test>
8040e378:	06051a63          	bnez	a0,8040e3ec <sfs_dirent_read_nolock+0xdc>
8040e37c:	00c12683          	lw	a3,12(sp)
8040e380:	00000713          	li	a4,0
8040e384:	10400613          	li	a2,260
8040e388:	00048593          	mv	a1,s1
8040e38c:	00040513          	mv	a0,s0
8040e390:	18d010ef          	jal	ra,8040fd1c <sfs_rbuf>
8040e394:	fa051ce3          	bnez	a0,8040e34c <sfs_dirent_read_nolock+0x3c>
8040e398:	100481a3          	sb	zero,259(s1)
8040e39c:	01c12083          	lw	ra,28(sp)
8040e3a0:	01812403          	lw	s0,24(sp)
8040e3a4:	01412483          	lw	s1,20(sp)
8040e3a8:	02010113          	addi	sp,sp,32
8040e3ac:	00008067          	ret
8040e3b0:	00006697          	auipc	a3,0x6
8040e3b4:	f0c68693          	addi	a3,a3,-244 # 804142bc <dev_node_ops+0x234>
8040e3b8:	00003617          	auipc	a2,0x3
8040e3bc:	90860613          	addi	a2,a2,-1784 # 80410cc0 <commands+0x3c>
8040e3c0:	18e00593          	li	a1,398
8040e3c4:	00006517          	auipc	a0,0x6
8040e3c8:	d7050513          	addi	a0,a0,-656 # 80414134 <dev_node_ops+0xac>
8040e3cc:	f01f10ef          	jal	ra,804002cc <__panic>
8040e3d0:	00058713          	mv	a4,a1
8040e3d4:	00006617          	auipc	a2,0x6
8040e3d8:	dbc60613          	addi	a2,a2,-580 # 80414190 <dev_node_ops+0x108>
8040e3dc:	05300593          	li	a1,83
8040e3e0:	00006517          	auipc	a0,0x6
8040e3e4:	d5450513          	addi	a0,a0,-684 # 80414134 <dev_node_ops+0xac>
8040e3e8:	ee5f10ef          	jal	ra,804002cc <__panic>
8040e3ec:	00006697          	auipc	a3,0x6
8040e3f0:	e9868693          	addi	a3,a3,-360 # 80414284 <dev_node_ops+0x1fc>
8040e3f4:	00003617          	auipc	a2,0x3
8040e3f8:	8cc60613          	addi	a2,a2,-1844 # 80410cc0 <commands+0x3c>
8040e3fc:	19500593          	li	a1,405
8040e400:	00006517          	auipc	a0,0x6
8040e404:	d3450513          	addi	a0,a0,-716 # 80414134 <dev_node_ops+0xac>
8040e408:	ec5f10ef          	jal	ra,804002cc <__panic>

8040e40c <sfs_getdirentry>:
8040e40c:	fd010113          	addi	sp,sp,-48
8040e410:	01412c23          	sw	s4,24(sp)
8040e414:	00050a13          	mv	s4,a0
8040e418:	10400513          	li	a0,260
8040e41c:	01712623          	sw	s7,12(sp)
8040e420:	02112623          	sw	ra,44(sp)
8040e424:	02812423          	sw	s0,40(sp)
8040e428:	02912223          	sw	s1,36(sp)
8040e42c:	03212023          	sw	s2,32(sp)
8040e430:	01312e23          	sw	s3,28(sp)
8040e434:	01512a23          	sw	s5,20(sp)
8040e438:	01612823          	sw	s6,16(sp)
8040e43c:	01812423          	sw	s8,8(sp)
8040e440:	00058b93          	mv	s7,a1
8040e444:	9d5f40ef          	jal	ra,80402e18 <kmalloc>
8040e448:	12050a63          	beqz	a0,8040e57c <sfs_getdirentry+0x170>
8040e44c:	038a2a83          	lw	s5,56(s4)
8040e450:	120a8a63          	beqz	s5,8040e584 <sfs_getdirentry+0x178>
8040e454:	06caa783          	lw	a5,108(s5)
8040e458:	12079663          	bnez	a5,8040e584 <sfs_getdirentry+0x178>
8040e45c:	02ca2703          	lw	a4,44(s4)
8040e460:	000017b7          	lui	a5,0x1
8040e464:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
8040e468:	12f71e63          	bne	a4,a5,8040e5a4 <sfs_getdirentry+0x198>
8040e46c:	004ba983          	lw	s3,4(s7)
8040e470:	00050913          	mv	s2,a0
8040e474:	0e09c663          	bltz	s3,8040e560 <sfs_getdirentry+0x154>
8040e478:	0ff9f793          	andi	a5,s3,255
8040e47c:	0e079263          	bnez	a5,8040e560 <sfs_getdirentry+0x154>
8040e480:	000a2783          	lw	a5,0(s4)
8040e484:	0089d993          	srli	s3,s3,0x8
8040e488:	0087a783          	lw	a5,8(a5)
8040e48c:	0f37e263          	bltu	a5,s3,8040e570 <sfs_getdirentry+0x164>
8040e490:	010a0c13          	addi	s8,s4,16
8040e494:	000c0513          	mv	a0,s8
8040e498:	db8f80ef          	jal	ra,80406a50 <down>
8040e49c:	000a2783          	lw	a5,0(s4)
8040e4a0:	0087ab03          	lw	s6,8(a5)
8040e4a4:	0b605663          	blez	s6,8040e550 <sfs_getdirentry+0x144>
8040e4a8:	00000493          	li	s1,0
8040e4ac:	01c0006f          	j	8040e4c8 <sfs_getdirentry+0xbc>
8040e4b0:	00092783          	lw	a5,0(s2)
8040e4b4:	00078663          	beqz	a5,8040e4c0 <sfs_getdirentry+0xb4>
8040e4b8:	02098c63          	beqz	s3,8040e4f0 <sfs_getdirentry+0xe4>
8040e4bc:	fff98993          	addi	s3,s3,-1
8040e4c0:	00148493          	addi	s1,s1,1
8040e4c4:	089b0663          	beq	s6,s1,8040e550 <sfs_getdirentry+0x144>
8040e4c8:	00090693          	mv	a3,s2
8040e4cc:	00048613          	mv	a2,s1
8040e4d0:	000a0593          	mv	a1,s4
8040e4d4:	000a8513          	mv	a0,s5
8040e4d8:	e39ff0ef          	jal	ra,8040e310 <sfs_dirent_read_nolock>
8040e4dc:	00050413          	mv	s0,a0
8040e4e0:	fc0508e3          	beqz	a0,8040e4b0 <sfs_getdirentry+0xa4>
8040e4e4:	000c0513          	mv	a0,s8
8040e4e8:	d64f80ef          	jal	ra,80406a4c <up>
8040e4ec:	0280006f          	j	8040e514 <sfs_getdirentry+0x108>
8040e4f0:	000c0513          	mv	a0,s8
8040e4f4:	d58f80ef          	jal	ra,80406a4c <up>
8040e4f8:	00000713          	li	a4,0
8040e4fc:	00100693          	li	a3,1
8040e500:	10000613          	li	a2,256
8040e504:	00490593          	addi	a1,s2,4
8040e508:	000b8513          	mv	a0,s7
8040e50c:	ce1f90ef          	jal	ra,804081ec <iobuf_move>
8040e510:	00050413          	mv	s0,a0
8040e514:	00090513          	mv	a0,s2
8040e518:	a1df40ef          	jal	ra,80402f34 <kfree>
8040e51c:	02c12083          	lw	ra,44(sp)
8040e520:	00040513          	mv	a0,s0
8040e524:	02812403          	lw	s0,40(sp)
8040e528:	02412483          	lw	s1,36(sp)
8040e52c:	02012903          	lw	s2,32(sp)
8040e530:	01c12983          	lw	s3,28(sp)
8040e534:	01812a03          	lw	s4,24(sp)
8040e538:	01412a83          	lw	s5,20(sp)
8040e53c:	01012b03          	lw	s6,16(sp)
8040e540:	00c12b83          	lw	s7,12(sp)
8040e544:	00812c03          	lw	s8,8(sp)
8040e548:	03010113          	addi	sp,sp,48
8040e54c:	00008067          	ret
8040e550:	000c0513          	mv	a0,s8
8040e554:	ff000413          	li	s0,-16
8040e558:	cf4f80ef          	jal	ra,80406a4c <up>
8040e55c:	fb9ff06f          	j	8040e514 <sfs_getdirentry+0x108>
8040e560:	00090513          	mv	a0,s2
8040e564:	9d1f40ef          	jal	ra,80402f34 <kfree>
8040e568:	ffd00413          	li	s0,-3
8040e56c:	fb1ff06f          	j	8040e51c <sfs_getdirentry+0x110>
8040e570:	9c5f40ef          	jal	ra,80402f34 <kfree>
8040e574:	ff000413          	li	s0,-16
8040e578:	fa5ff06f          	j	8040e51c <sfs_getdirentry+0x110>
8040e57c:	ffc00413          	li	s0,-4
8040e580:	f9dff06f          	j	8040e51c <sfs_getdirentry+0x110>
8040e584:	00006697          	auipc	a3,0x6
8040e588:	be068693          	addi	a3,a3,-1056 # 80414164 <dev_node_ops+0xdc>
8040e58c:	00002617          	auipc	a2,0x2
8040e590:	73460613          	addi	a2,a2,1844 # 80410cc0 <commands+0x3c>
8040e594:	33a00593          	li	a1,826
8040e598:	00006517          	auipc	a0,0x6
8040e59c:	b9c50513          	addi	a0,a0,-1124 # 80414134 <dev_node_ops+0xac>
8040e5a0:	d2df10ef          	jal	ra,804002cc <__panic>
8040e5a4:	00006697          	auipc	a3,0x6
8040e5a8:	b5868693          	addi	a3,a3,-1192 # 804140fc <dev_node_ops+0x74>
8040e5ac:	00002617          	auipc	a2,0x2
8040e5b0:	71460613          	addi	a2,a2,1812 # 80410cc0 <commands+0x3c>
8040e5b4:	33b00593          	li	a1,827
8040e5b8:	00006517          	auipc	a0,0x6
8040e5bc:	b7c50513          	addi	a0,a0,-1156 # 80414134 <dev_node_ops+0xac>
8040e5c0:	d0df10ef          	jal	ra,804002cc <__panic>

8040e5c4 <sfs_dirent_search_nolock.constprop.0>:
8040e5c4:	fd010113          	addi	sp,sp,-48
8040e5c8:	01412c23          	sw	s4,24(sp)
8040e5cc:	00050a13          	mv	s4,a0
8040e5d0:	00060513          	mv	a0,a2
8040e5d4:	01312e23          	sw	s3,28(sp)
8040e5d8:	01612823          	sw	s6,16(sp)
8040e5dc:	01712623          	sw	s7,12(sp)
8040e5e0:	02112623          	sw	ra,44(sp)
8040e5e4:	02812423          	sw	s0,40(sp)
8040e5e8:	02912223          	sw	s1,36(sp)
8040e5ec:	03212023          	sw	s2,32(sp)
8040e5f0:	01512a23          	sw	s5,20(sp)
8040e5f4:	01812423          	sw	s8,8(sp)
8040e5f8:	00060b13          	mv	s6,a2
8040e5fc:	00058993          	mv	s3,a1
8040e600:	00068b93          	mv	s7,a3
8040e604:	2a5010ef          	jal	ra,804100a8 <strlen>
8040e608:	0ff00793          	li	a5,255
8040e60c:	0ca7e263          	bltu	a5,a0,8040e6d0 <sfs_dirent_search_nolock.constprop.0+0x10c>
8040e610:	10400513          	li	a0,260
8040e614:	805f40ef          	jal	ra,80402e18 <kmalloc>
8040e618:	00050913          	mv	s2,a0
8040e61c:	0a050663          	beqz	a0,8040e6c8 <sfs_dirent_search_nolock.constprop.0+0x104>
8040e620:	0009a783          	lw	a5,0(s3)
8040e624:	0087aa83          	lw	s5,8(a5)
8040e628:	09505663          	blez	s5,8040e6b4 <sfs_dirent_search_nolock.constprop.0+0xf0>
8040e62c:	00000493          	li	s1,0
8040e630:	00450c13          	addi	s8,a0,4
8040e634:	0280006f          	j	8040e65c <sfs_dirent_search_nolock.constprop.0+0x98>
8040e638:	00092783          	lw	a5,0(s2)
8040e63c:	00078c63          	beqz	a5,8040e654 <sfs_dirent_search_nolock.constprop.0+0x90>
8040e640:	000c0593          	mv	a1,s8
8040e644:	000b0513          	mv	a0,s6
8040e648:	2d1010ef          	jal	ra,80410118 <strcmp>
8040e64c:	00050413          	mv	s0,a0
8040e650:	06050663          	beqz	a0,8040e6bc <sfs_dirent_search_nolock.constprop.0+0xf8>
8040e654:	00148493          	addi	s1,s1,1
8040e658:	049a8e63          	beq	s5,s1,8040e6b4 <sfs_dirent_search_nolock.constprop.0+0xf0>
8040e65c:	00090693          	mv	a3,s2
8040e660:	00048613          	mv	a2,s1
8040e664:	00098593          	mv	a1,s3
8040e668:	000a0513          	mv	a0,s4
8040e66c:	ca5ff0ef          	jal	ra,8040e310 <sfs_dirent_read_nolock>
8040e670:	00050413          	mv	s0,a0
8040e674:	fc0502e3          	beqz	a0,8040e638 <sfs_dirent_search_nolock.constprop.0+0x74>
8040e678:	00090513          	mv	a0,s2
8040e67c:	8b9f40ef          	jal	ra,80402f34 <kfree>
8040e680:	02c12083          	lw	ra,44(sp)
8040e684:	00040513          	mv	a0,s0
8040e688:	02812403          	lw	s0,40(sp)
8040e68c:	02412483          	lw	s1,36(sp)
8040e690:	02012903          	lw	s2,32(sp)
8040e694:	01c12983          	lw	s3,28(sp)
8040e698:	01812a03          	lw	s4,24(sp)
8040e69c:	01412a83          	lw	s5,20(sp)
8040e6a0:	01012b03          	lw	s6,16(sp)
8040e6a4:	00c12b83          	lw	s7,12(sp)
8040e6a8:	00812c03          	lw	s8,8(sp)
8040e6ac:	03010113          	addi	sp,sp,48
8040e6b0:	00008067          	ret
8040e6b4:	ff000413          	li	s0,-16
8040e6b8:	fc1ff06f          	j	8040e678 <sfs_dirent_search_nolock.constprop.0+0xb4>
8040e6bc:	00092783          	lw	a5,0(s2)
8040e6c0:	00fba023          	sw	a5,0(s7)
8040e6c4:	fb5ff06f          	j	8040e678 <sfs_dirent_search_nolock.constprop.0+0xb4>
8040e6c8:	ffc00413          	li	s0,-4
8040e6cc:	fb5ff06f          	j	8040e680 <sfs_dirent_search_nolock.constprop.0+0xbc>
8040e6d0:	00006697          	auipc	a3,0x6
8040e6d4:	c3868693          	addi	a3,a3,-968 # 80414308 <dev_node_ops+0x280>
8040e6d8:	00002617          	auipc	a2,0x2
8040e6dc:	5e860613          	addi	a2,a2,1512 # 80410cc0 <commands+0x3c>
8040e6e0:	1ba00593          	li	a1,442
8040e6e4:	00006517          	auipc	a0,0x6
8040e6e8:	a5050513          	addi	a0,a0,-1456 # 80414134 <dev_node_ops+0xac>
8040e6ec:	be1f10ef          	jal	ra,804002cc <__panic>

8040e6f0 <sfs_truncfile>:
8040e6f0:	fa010113          	addi	sp,sp,-96
8040e6f4:	04112e23          	sw	ra,92(sp)
8040e6f8:	04812c23          	sw	s0,88(sp)
8040e6fc:	04912a23          	sw	s1,84(sp)
8040e700:	05212823          	sw	s2,80(sp)
8040e704:	05312623          	sw	s3,76(sp)
8040e708:	05412423          	sw	s4,72(sp)
8040e70c:	05512223          	sw	s5,68(sp)
8040e710:	05612023          	sw	s6,64(sp)
8040e714:	03712e23          	sw	s7,60(sp)
8040e718:	03812c23          	sw	s8,56(sp)
8040e71c:	03912a23          	sw	s9,52(sp)
8040e720:	03a12823          	sw	s10,48(sp)
8040e724:	03b12623          	sw	s11,44(sp)
8040e728:	080007b7          	lui	a5,0x8000
8040e72c:	1cb7ee63          	bltu	a5,a1,8040e908 <sfs_truncfile+0x218>
8040e730:	03852c83          	lw	s9,56(a0)
8040e734:	00050993          	mv	s3,a0
8040e738:	1c0c8c63          	beqz	s9,8040e910 <sfs_truncfile+0x220>
8040e73c:	06cca783          	lw	a5,108(s9)
8040e740:	1c079863          	bnez	a5,8040e910 <sfs_truncfile+0x220>
8040e744:	02c52703          	lw	a4,44(a0)
8040e748:	000014b7          	lui	s1,0x1
8040e74c:	23548793          	addi	a5,s1,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
8040e750:	1ef71063          	bne	a4,a5,8040e930 <sfs_truncfile+0x240>
8040e754:	00052a83          	lw	s5,0(a0)
8040e758:	fff48493          	addi	s1,s1,-1
8040e75c:	009584b3          	add	s1,a1,s1
8040e760:	000aa783          	lw	a5,0(s5)
8040e764:	00058a13          	mv	s4,a1
8040e768:	00c4d493          	srli	s1,s1,0xc
8040e76c:	04f59863          	bne	a1,a5,8040e7bc <sfs_truncfile+0xcc>
8040e770:	008aa783          	lw	a5,8(s5)
8040e774:	00000913          	li	s2,0
8040e778:	1ef49c63          	bne	s1,a5,8040e970 <sfs_truncfile+0x280>
8040e77c:	05c12083          	lw	ra,92(sp)
8040e780:	05812403          	lw	s0,88(sp)
8040e784:	05412483          	lw	s1,84(sp)
8040e788:	04c12983          	lw	s3,76(sp)
8040e78c:	04812a03          	lw	s4,72(sp)
8040e790:	04412a83          	lw	s5,68(sp)
8040e794:	04012b03          	lw	s6,64(sp)
8040e798:	03c12b83          	lw	s7,60(sp)
8040e79c:	03812c03          	lw	s8,56(sp)
8040e7a0:	03412c83          	lw	s9,52(sp)
8040e7a4:	03012d03          	lw	s10,48(sp)
8040e7a8:	02c12d83          	lw	s11,44(sp)
8040e7ac:	00090513          	mv	a0,s2
8040e7b0:	05012903          	lw	s2,80(sp)
8040e7b4:	06010113          	addi	sp,sp,96
8040e7b8:	00008067          	ret
8040e7bc:	01050b13          	addi	s6,a0,16
8040e7c0:	000b0513          	mv	a0,s6
8040e7c4:	a8cf80ef          	jal	ra,80406a50 <down>
8040e7c8:	008aa403          	lw	s0,8(s5)
8040e7cc:	0c946463          	bltu	s0,s1,8040e894 <sfs_truncfile+0x1a4>
8040e7d0:	0e84f663          	bgeu	s1,s0,8040e8bc <sfs_truncfile+0x1cc>
8040e7d4:	00b00d93          	li	s11,11
8040e7d8:	00100b93          	li	s7,1
8040e7dc:	07c0006f          	j	8040e858 <sfs_truncfile+0x168>
8040e7e0:	ff370913          	addi	s2,a4,-13
8040e7e4:	3ff00713          	li	a4,1023
8040e7e8:	07276063          	bltu	a4,s2,8040e848 <sfs_truncfile+0x158>
8040e7ec:	03cd2c03          	lw	s8,60(s10)
8040e7f0:	040c0c63          	beqz	s8,8040e848 <sfs_truncfile+0x158>
8040e7f4:	004ca783          	lw	a5,4(s9)
8040e7f8:	1cfc7c63          	bgeu	s8,a5,8040e9d0 <sfs_truncfile+0x2e0>
8040e7fc:	030ca503          	lw	a0,48(s9)
8040e800:	000c0593          	mv	a1,s8
8040e804:	25c010ef          	jal	ra,8040fa60 <bitmap_test>
8040e808:	1a051463          	bnez	a0,8040e9b0 <sfs_truncfile+0x2c0>
8040e80c:	00291713          	slli	a4,s2,0x2
8040e810:	000c0693          	mv	a3,s8
8040e814:	00400613          	li	a2,4
8040e818:	01810593          	addi	a1,sp,24
8040e81c:	000c8513          	mv	a0,s9
8040e820:	00e12623          	sw	a4,12(sp)
8040e824:	00012e23          	sw	zero,28(sp)
8040e828:	4f4010ef          	jal	ra,8040fd1c <sfs_rbuf>
8040e82c:	00050913          	mv	s2,a0
8040e830:	0a051063          	bnez	a0,8040e8d0 <sfs_truncfile+0x1e0>
8040e834:	01812783          	lw	a5,24(sp)
8040e838:	00c12703          	lw	a4,12(sp)
8040e83c:	0a079063          	bnez	a5,8040e8dc <sfs_truncfile+0x1ec>
8040e840:	008d2783          	lw	a5,8(s10)
8040e844:	fff78793          	addi	a5,a5,-1 # 7ffffff <_binary_bin_sfs_img_size+0x7f87fff>
8040e848:	00fd2423          	sw	a5,8(s10)
8040e84c:	0179a423          	sw	s7,8(s3)
8040e850:	fff40413          	addi	s0,s0,-1
8040e854:	06848263          	beq	s1,s0,8040e8b8 <sfs_truncfile+0x1c8>
8040e858:	0009ad03          	lw	s10,0(s3)
8040e85c:	008d2703          	lw	a4,8(s10)
8040e860:	0e070863          	beqz	a4,8040e950 <sfs_truncfile+0x260>
8040e864:	fff70793          	addi	a5,a4,-1
8040e868:	f6fdece3          	bltu	s11,a5,8040e7e0 <sfs_truncfile+0xf0>
8040e86c:	00271713          	slli	a4,a4,0x2
8040e870:	00ed0933          	add	s2,s10,a4
8040e874:	00892583          	lw	a1,8(s2)
8040e878:	fc0588e3          	beqz	a1,8040e848 <sfs_truncfile+0x158>
8040e87c:	000c8513          	mv	a0,s9
8040e880:	f59fe0ef          	jal	ra,8040d7d8 <sfs_block_free>
8040e884:	00092423          	sw	zero,8(s2)
8040e888:	008d2783          	lw	a5,8(s10)
8040e88c:	fff78793          	addi	a5,a5,-1
8040e890:	fb9ff06f          	j	8040e848 <sfs_truncfile+0x158>
8040e894:	00000693          	li	a3,0
8040e898:	00040613          	mv	a2,s0
8040e89c:	00098593          	mv	a1,s3
8040e8a0:	000c8513          	mv	a0,s9
8040e8a4:	aecff0ef          	jal	ra,8040db90 <sfs_bmap_load_nolock>
8040e8a8:	00050913          	mv	s2,a0
8040e8ac:	02051263          	bnez	a0,8040e8d0 <sfs_truncfile+0x1e0>
8040e8b0:	00140413          	addi	s0,s0,1
8040e8b4:	fe8490e3          	bne	s1,s0,8040e894 <sfs_truncfile+0x1a4>
8040e8b8:	008aa403          	lw	s0,8(s5)
8040e8bc:	0c849a63          	bne	s1,s0,8040e990 <sfs_truncfile+0x2a0>
8040e8c0:	014aa023          	sw	s4,0(s5)
8040e8c4:	00100793          	li	a5,1
8040e8c8:	00f9a423          	sw	a5,8(s3)
8040e8cc:	00000913          	li	s2,0
8040e8d0:	000b0513          	mv	a0,s6
8040e8d4:	978f80ef          	jal	ra,80406a4c <up>
8040e8d8:	ea5ff06f          	j	8040e77c <sfs_truncfile+0x8c>
8040e8dc:	000c0693          	mv	a3,s8
8040e8e0:	00400613          	li	a2,4
8040e8e4:	01c10593          	addi	a1,sp,28
8040e8e8:	000c8513          	mv	a0,s9
8040e8ec:	4f8010ef          	jal	ra,8040fde4 <sfs_wbuf>
8040e8f0:	00050913          	mv	s2,a0
8040e8f4:	fc051ee3          	bnez	a0,8040e8d0 <sfs_truncfile+0x1e0>
8040e8f8:	01812583          	lw	a1,24(sp)
8040e8fc:	000c8513          	mv	a0,s9
8040e900:	ed9fe0ef          	jal	ra,8040d7d8 <sfs_block_free>
8040e904:	f3dff06f          	j	8040e840 <sfs_truncfile+0x150>
8040e908:	ffd00913          	li	s2,-3
8040e90c:	e71ff06f          	j	8040e77c <sfs_truncfile+0x8c>
8040e910:	00006697          	auipc	a3,0x6
8040e914:	85468693          	addi	a3,a3,-1964 # 80414164 <dev_node_ops+0xdc>
8040e918:	00002617          	auipc	a2,0x2
8040e91c:	3a860613          	addi	a2,a2,936 # 80410cc0 <commands+0x3c>
8040e920:	3a900593          	li	a1,937
8040e924:	00006517          	auipc	a0,0x6
8040e928:	81050513          	addi	a0,a0,-2032 # 80414134 <dev_node_ops+0xac>
8040e92c:	9a1f10ef          	jal	ra,804002cc <__panic>
8040e930:	00005697          	auipc	a3,0x5
8040e934:	7cc68693          	addi	a3,a3,1996 # 804140fc <dev_node_ops+0x74>
8040e938:	00002617          	auipc	a2,0x2
8040e93c:	38860613          	addi	a2,a2,904 # 80410cc0 <commands+0x3c>
8040e940:	3aa00593          	li	a1,938
8040e944:	00005517          	auipc	a0,0x5
8040e948:	7f050513          	addi	a0,a0,2032 # 80414134 <dev_node_ops+0xac>
8040e94c:	981f10ef          	jal	ra,804002cc <__panic>
8040e950:	00006697          	auipc	a3,0x6
8040e954:	9f468693          	addi	a3,a3,-1548 # 80414344 <dev_node_ops+0x2bc>
8040e958:	00002617          	auipc	a2,0x2
8040e95c:	36860613          	addi	a2,a2,872 # 80410cc0 <commands+0x3c>
8040e960:	17b00593          	li	a1,379
8040e964:	00005517          	auipc	a0,0x5
8040e968:	7d050513          	addi	a0,a0,2000 # 80414134 <dev_node_ops+0xac>
8040e96c:	961f10ef          	jal	ra,804002cc <__panic>
8040e970:	00006697          	auipc	a3,0x6
8040e974:	9bc68693          	addi	a3,a3,-1604 # 8041432c <dev_node_ops+0x2a4>
8040e978:	00002617          	auipc	a2,0x2
8040e97c:	34860613          	addi	a2,a2,840 # 80410cc0 <commands+0x3c>
8040e980:	3b100593          	li	a1,945
8040e984:	00005517          	auipc	a0,0x5
8040e988:	7b050513          	addi	a0,a0,1968 # 80414134 <dev_node_ops+0xac>
8040e98c:	941f10ef          	jal	ra,804002cc <__panic>
8040e990:	00006697          	auipc	a3,0x6
8040e994:	9fc68693          	addi	a3,a3,-1540 # 8041438c <dev_node_ops+0x304>
8040e998:	00002617          	auipc	a2,0x2
8040e99c:	32860613          	addi	a2,a2,808 # 80410cc0 <commands+0x3c>
8040e9a0:	3ca00593          	li	a1,970
8040e9a4:	00005517          	auipc	a0,0x5
8040e9a8:	79050513          	addi	a0,a0,1936 # 80414134 <dev_node_ops+0xac>
8040e9ac:	921f10ef          	jal	ra,804002cc <__panic>
8040e9b0:	00006697          	auipc	a3,0x6
8040e9b4:	9a868693          	addi	a3,a3,-1624 # 80414358 <dev_node_ops+0x2d0>
8040e9b8:	00002617          	auipc	a2,0x2
8040e9bc:	30860613          	addi	a2,a2,776 # 80410cc0 <commands+0x3c>
8040e9c0:	12b00593          	li	a1,299
8040e9c4:	00005517          	auipc	a0,0x5
8040e9c8:	77050513          	addi	a0,a0,1904 # 80414134 <dev_node_ops+0xac>
8040e9cc:	901f10ef          	jal	ra,804002cc <__panic>
8040e9d0:	000c0713          	mv	a4,s8
8040e9d4:	00078693          	mv	a3,a5
8040e9d8:	00005617          	auipc	a2,0x5
8040e9dc:	7b860613          	addi	a2,a2,1976 # 80414190 <dev_node_ops+0x108>
8040e9e0:	05300593          	li	a1,83
8040e9e4:	00005517          	auipc	a0,0x5
8040e9e8:	75050513          	addi	a0,a0,1872 # 80414134 <dev_node_ops+0xac>
8040e9ec:	8e1f10ef          	jal	ra,804002cc <__panic>

8040e9f0 <sfs_load_inode>:
8040e9f0:	fe010113          	addi	sp,sp,-32
8040e9f4:	00112e23          	sw	ra,28(sp)
8040e9f8:	00812c23          	sw	s0,24(sp)
8040e9fc:	00912a23          	sw	s1,20(sp)
8040ea00:	01212823          	sw	s2,16(sp)
8040ea04:	00060493          	mv	s1,a2
8040ea08:	00050913          	mv	s2,a0
8040ea0c:	01312623          	sw	s3,12(sp)
8040ea10:	01412423          	sw	s4,8(sp)
8040ea14:	00058993          	mv	s3,a1
8040ea18:	01512223          	sw	s5,4(sp)
8040ea1c:	971fe0ef          	jal	ra,8040d38c <lock_sfs_fs>
8040ea20:	00a00593          	li	a1,10
8040ea24:	06892403          	lw	s0,104(s2)
8040ea28:	00048513          	mv	a0,s1
8040ea2c:	6dd010ef          	jal	ra,80410908 <hash32>
8040ea30:	00351713          	slli	a4,a0,0x3
8040ea34:	00e40733          	add	a4,s0,a4
8040ea38:	00070413          	mv	s0,a4
8040ea3c:	00c0006f          	j	8040ea48 <sfs_load_inode+0x58>
8040ea40:	fe042783          	lw	a5,-32(s0)
8040ea44:	14f48863          	beq	s1,a5,8040eb94 <sfs_load_inode+0x1a4>
8040ea48:	00442403          	lw	s0,4(s0)
8040ea4c:	fe871ae3          	bne	a4,s0,8040ea40 <sfs_load_inode+0x50>
8040ea50:	04000513          	li	a0,64
8040ea54:	bc4f40ef          	jal	ra,80402e18 <kmalloc>
8040ea58:	00050a93          	mv	s5,a0
8040ea5c:	1a050e63          	beqz	a0,8040ec18 <sfs_load_inode+0x228>
8040ea60:	00492683          	lw	a3,4(s2)
8040ea64:	1c048e63          	beqz	s1,8040ec40 <sfs_load_inode+0x250>
8040ea68:	1cd4fc63          	bgeu	s1,a3,8040ec40 <sfs_load_inode+0x250>
8040ea6c:	03092503          	lw	a0,48(s2)
8040ea70:	00048593          	mv	a1,s1
8040ea74:	7ed000ef          	jal	ra,8040fa60 <bitmap_test>
8040ea78:	1e051263          	bnez	a0,8040ec5c <sfs_load_inode+0x26c>
8040ea7c:	00000713          	li	a4,0
8040ea80:	00048693          	mv	a3,s1
8040ea84:	04000613          	li	a2,64
8040ea88:	000a8593          	mv	a1,s5
8040ea8c:	00090513          	mv	a0,s2
8040ea90:	28c010ef          	jal	ra,8040fd1c <sfs_rbuf>
8040ea94:	00050413          	mv	s0,a0
8040ea98:	12051263          	bnez	a0,8040ebbc <sfs_load_inode+0x1cc>
8040ea9c:	006ad783          	lhu	a5,6(s5)
8040eaa0:	18078063          	beqz	a5,8040ec20 <sfs_load_inode+0x230>
8040eaa4:	00001437          	lui	s0,0x1
8040eaa8:	23540513          	addi	a0,s0,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
8040eaac:	c24fd0ef          	jal	ra,8040bed0 <__alloc_inode>
8040eab0:	00050a13          	mv	s4,a0
8040eab4:	10050263          	beqz	a0,8040ebb8 <sfs_load_inode+0x1c8>
8040eab8:	004ad683          	lhu	a3,4(s5)
8040eabc:	00100793          	li	a5,1
8040eac0:	10f69863          	bne	a3,a5,8040ebd0 <sfs_load_inode+0x1e0>
8040eac4:	00090613          	mv	a2,s2
8040eac8:	00006597          	auipc	a1,0x6
8040eacc:	98858593          	addi	a1,a1,-1656 # 80414450 <sfs_node_fileops>
8040ead0:	c30fd0ef          	jal	ra,8040bf00 <inode_init>
8040ead4:	02ca2783          	lw	a5,44(s4)
8040ead8:	23540413          	addi	s0,s0,565
8040eadc:	10879e63          	bne	a5,s0,8040ebf8 <sfs_load_inode+0x208>
8040eae0:	00100793          	li	a5,1
8040eae4:	00fa2623          	sw	a5,12(s4)
8040eae8:	015a2023          	sw	s5,0(s4)
8040eaec:	009a2223          	sw	s1,4(s4)
8040eaf0:	000a2423          	sw	zero,8(s4)
8040eaf4:	00100593          	li	a1,1
8040eaf8:	010a0513          	addi	a0,s4,16
8040eafc:	f45f70ef          	jal	ra,80406a40 <sem_init>
8040eb00:	02ca2703          	lw	a4,44(s4)
8040eb04:	000017b7          	lui	a5,0x1
8040eb08:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
8040eb0c:	18f71463          	bne	a4,a5,8040ec94 <sfs_load_inode+0x2a4>
8040eb10:	06492703          	lw	a4,100(s2)
8040eb14:	01ca0793          	addi	a5,s4,28
8040eb18:	004a2503          	lw	a0,4(s4)
8040eb1c:	00f72023          	sw	a5,0(a4)
8040eb20:	06f92223          	sw	a5,100(s2)
8040eb24:	06090793          	addi	a5,s2,96
8040eb28:	06892403          	lw	s0,104(s2)
8040eb2c:	00a00593          	li	a1,10
8040eb30:	02ea2023          	sw	a4,32(s4)
8040eb34:	00fa2e23          	sw	a5,28(s4)
8040eb38:	5d1010ef          	jal	ra,80410908 <hash32>
8040eb3c:	00351793          	slli	a5,a0,0x3
8040eb40:	00f407b3          	add	a5,s0,a5
8040eb44:	0047a703          	lw	a4,4(a5)
8040eb48:	024a0693          	addi	a3,s4,36
8040eb4c:	00d72023          	sw	a3,0(a4)
8040eb50:	00d7a223          	sw	a3,4(a5)
8040eb54:	02ea2423          	sw	a4,40(s4)
8040eb58:	02fa2223          	sw	a5,36(s4)
8040eb5c:	00090513          	mv	a0,s2
8040eb60:	83dfe0ef          	jal	ra,8040d39c <unlock_sfs_fs>
8040eb64:	00000413          	li	s0,0
8040eb68:	0149a023          	sw	s4,0(s3)
8040eb6c:	01c12083          	lw	ra,28(sp)
8040eb70:	00040513          	mv	a0,s0
8040eb74:	01812403          	lw	s0,24(sp)
8040eb78:	01412483          	lw	s1,20(sp)
8040eb7c:	01012903          	lw	s2,16(sp)
8040eb80:	00c12983          	lw	s3,12(sp)
8040eb84:	00812a03          	lw	s4,8(sp)
8040eb88:	00412a83          	lw	s5,4(sp)
8040eb8c:	02010113          	addi	sp,sp,32
8040eb90:	00008067          	ret
8040eb94:	fdc40a13          	addi	s4,s0,-36
8040eb98:	000a0513          	mv	a0,s4
8040eb9c:	be0fd0ef          	jal	ra,8040bf7c <inode_ref_inc>
8040eba0:	00100793          	li	a5,1
8040eba4:	faf51ce3          	bne	a0,a5,8040eb5c <sfs_load_inode+0x16c>
8040eba8:	fe842783          	lw	a5,-24(s0)
8040ebac:	00178793          	addi	a5,a5,1
8040ebb0:	fef42423          	sw	a5,-24(s0)
8040ebb4:	fa9ff06f          	j	8040eb5c <sfs_load_inode+0x16c>
8040ebb8:	ffc00413          	li	s0,-4
8040ebbc:	000a8513          	mv	a0,s5
8040ebc0:	b74f40ef          	jal	ra,80402f34 <kfree>
8040ebc4:	00090513          	mv	a0,s2
8040ebc8:	fd4fe0ef          	jal	ra,8040d39c <unlock_sfs_fs>
8040ebcc:	fa1ff06f          	j	8040eb6c <sfs_load_inode+0x17c>
8040ebd0:	00200793          	li	a5,2
8040ebd4:	0af69463          	bne	a3,a5,8040ec7c <sfs_load_inode+0x28c>
8040ebd8:	00090613          	mv	a2,s2
8040ebdc:	00006597          	auipc	a1,0x6
8040ebe0:	83458593          	addi	a1,a1,-1996 # 80414410 <sfs_node_dirops>
8040ebe4:	b1cfd0ef          	jal	ra,8040bf00 <inode_init>
8040ebe8:	02ca2703          	lw	a4,44(s4)
8040ebec:	000017b7          	lui	a5,0x1
8040ebf0:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
8040ebf4:	eef706e3          	beq	a4,a5,8040eae0 <sfs_load_inode+0xf0>
8040ebf8:	00005697          	auipc	a3,0x5
8040ebfc:	50468693          	addi	a3,a3,1284 # 804140fc <dev_node_ops+0x74>
8040ec00:	00002617          	auipc	a2,0x2
8040ec04:	0c060613          	addi	a2,a2,192 # 80410cc0 <commands+0x3c>
8040ec08:	07700593          	li	a1,119
8040ec0c:	00005517          	auipc	a0,0x5
8040ec10:	52850513          	addi	a0,a0,1320 # 80414134 <dev_node_ops+0xac>
8040ec14:	eb8f10ef          	jal	ra,804002cc <__panic>
8040ec18:	ffc00413          	li	s0,-4
8040ec1c:	fa9ff06f          	j	8040ebc4 <sfs_load_inode+0x1d4>
8040ec20:	00005697          	auipc	a3,0x5
8040ec24:	78468693          	addi	a3,a3,1924 # 804143a4 <dev_node_ops+0x31c>
8040ec28:	00002617          	auipc	a2,0x2
8040ec2c:	09860613          	addi	a2,a2,152 # 80410cc0 <commands+0x3c>
8040ec30:	0ad00593          	li	a1,173
8040ec34:	00005517          	auipc	a0,0x5
8040ec38:	50050513          	addi	a0,a0,1280 # 80414134 <dev_node_ops+0xac>
8040ec3c:	e90f10ef          	jal	ra,804002cc <__panic>
8040ec40:	00048713          	mv	a4,s1
8040ec44:	00005617          	auipc	a2,0x5
8040ec48:	54c60613          	addi	a2,a2,1356 # 80414190 <dev_node_ops+0x108>
8040ec4c:	05300593          	li	a1,83
8040ec50:	00005517          	auipc	a0,0x5
8040ec54:	4e450513          	addi	a0,a0,1252 # 80414134 <dev_node_ops+0xac>
8040ec58:	e74f10ef          	jal	ra,804002cc <__panic>
8040ec5c:	00005697          	auipc	a3,0x5
8040ec60:	62868693          	addi	a3,a3,1576 # 80414284 <dev_node_ops+0x1fc>
8040ec64:	00002617          	auipc	a2,0x2
8040ec68:	05c60613          	addi	a2,a2,92 # 80410cc0 <commands+0x3c>
8040ec6c:	0a800593          	li	a1,168
8040ec70:	00005517          	auipc	a0,0x5
8040ec74:	4c450513          	addi	a0,a0,1220 # 80414134 <dev_node_ops+0xac>
8040ec78:	e54f10ef          	jal	ra,804002cc <__panic>
8040ec7c:	00005617          	auipc	a2,0x5
8040ec80:	4d060613          	addi	a2,a2,1232 # 8041414c <dev_node_ops+0xc4>
8040ec84:	02e00593          	li	a1,46
8040ec88:	00005517          	auipc	a0,0x5
8040ec8c:	4ac50513          	addi	a0,a0,1196 # 80414134 <dev_node_ops+0xac>
8040ec90:	e3cf10ef          	jal	ra,804002cc <__panic>
8040ec94:	00005697          	auipc	a3,0x5
8040ec98:	46868693          	addi	a3,a3,1128 # 804140fc <dev_node_ops+0x74>
8040ec9c:	00002617          	auipc	a2,0x2
8040eca0:	02460613          	addi	a2,a2,36 # 80410cc0 <commands+0x3c>
8040eca4:	0b100593          	li	a1,177
8040eca8:	00005517          	auipc	a0,0x5
8040ecac:	48c50513          	addi	a0,a0,1164 # 80414134 <dev_node_ops+0xac>
8040ecb0:	e1cf10ef          	jal	ra,804002cc <__panic>

8040ecb4 <sfs_lookup>:
8040ecb4:	fd010113          	addi	sp,sp,-48
8040ecb8:	03212023          	sw	s2,32(sp)
8040ecbc:	03852903          	lw	s2,56(a0)
8040ecc0:	02112623          	sw	ra,44(sp)
8040ecc4:	02812423          	sw	s0,40(sp)
8040ecc8:	02912223          	sw	s1,36(sp)
8040eccc:	01312e23          	sw	s3,28(sp)
8040ecd0:	01412c23          	sw	s4,24(sp)
8040ecd4:	10090263          	beqz	s2,8040edd8 <sfs_lookup+0x124>
8040ecd8:	06c92783          	lw	a5,108(s2)
8040ecdc:	0e079e63          	bnez	a5,8040edd8 <sfs_lookup+0x124>
8040ece0:	0005c783          	lbu	a5,0(a1)
8040ece4:	00058493          	mv	s1,a1
8040ece8:	0c078863          	beqz	a5,8040edb8 <sfs_lookup+0x104>
8040ecec:	02f00713          	li	a4,47
8040ecf0:	0ce78463          	beq	a5,a4,8040edb8 <sfs_lookup+0x104>
8040ecf4:	00050413          	mv	s0,a0
8040ecf8:	00060a13          	mv	s4,a2
8040ecfc:	a80fd0ef          	jal	ra,8040bf7c <inode_ref_inc>
8040ed00:	02c42703          	lw	a4,44(s0)
8040ed04:	000017b7          	lui	a5,0x1
8040ed08:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
8040ed0c:	0ef71663          	bne	a4,a5,8040edf8 <sfs_lookup+0x144>
8040ed10:	00042703          	lw	a4,0(s0)
8040ed14:	00200793          	li	a5,2
8040ed18:	00475703          	lhu	a4,4(a4)
8040ed1c:	08f71663          	bne	a4,a5,8040eda8 <sfs_lookup+0xf4>
8040ed20:	01040993          	addi	s3,s0,16
8040ed24:	00098513          	mv	a0,s3
8040ed28:	d29f70ef          	jal	ra,80406a50 <down>
8040ed2c:	00048613          	mv	a2,s1
8040ed30:	00c10693          	addi	a3,sp,12
8040ed34:	00040593          	mv	a1,s0
8040ed38:	00090513          	mv	a0,s2
8040ed3c:	889ff0ef          	jal	ra,8040e5c4 <sfs_dirent_search_nolock.constprop.0>
8040ed40:	00050493          	mv	s1,a0
8040ed44:	00098513          	mv	a0,s3
8040ed48:	d05f70ef          	jal	ra,80406a4c <up>
8040ed4c:	02048863          	beqz	s1,8040ed7c <sfs_lookup+0xc8>
8040ed50:	00040513          	mv	a0,s0
8040ed54:	b1cfd0ef          	jal	ra,8040c070 <inode_ref_dec>
8040ed58:	02c12083          	lw	ra,44(sp)
8040ed5c:	02812403          	lw	s0,40(sp)
8040ed60:	02012903          	lw	s2,32(sp)
8040ed64:	01c12983          	lw	s3,28(sp)
8040ed68:	01812a03          	lw	s4,24(sp)
8040ed6c:	00048513          	mv	a0,s1
8040ed70:	02412483          	lw	s1,36(sp)
8040ed74:	03010113          	addi	sp,sp,48
8040ed78:	00008067          	ret
8040ed7c:	00c12603          	lw	a2,12(sp)
8040ed80:	00810593          	addi	a1,sp,8
8040ed84:	00090513          	mv	a0,s2
8040ed88:	c69ff0ef          	jal	ra,8040e9f0 <sfs_load_inode>
8040ed8c:	00050493          	mv	s1,a0
8040ed90:	00040513          	mv	a0,s0
8040ed94:	adcfd0ef          	jal	ra,8040c070 <inode_ref_dec>
8040ed98:	fc0490e3          	bnez	s1,8040ed58 <sfs_lookup+0xa4>
8040ed9c:	00812783          	lw	a5,8(sp)
8040eda0:	00fa2023          	sw	a5,0(s4)
8040eda4:	fb5ff06f          	j	8040ed58 <sfs_lookup+0xa4>
8040eda8:	00040513          	mv	a0,s0
8040edac:	ac4fd0ef          	jal	ra,8040c070 <inode_ref_dec>
8040edb0:	fee00493          	li	s1,-18
8040edb4:	fa5ff06f          	j	8040ed58 <sfs_lookup+0xa4>
8040edb8:	00005697          	auipc	a3,0x5
8040edbc:	60068693          	addi	a3,a3,1536 # 804143b8 <dev_node_ops+0x330>
8040edc0:	00002617          	auipc	a2,0x2
8040edc4:	f0060613          	addi	a2,a2,-256 # 80410cc0 <commands+0x3c>
8040edc8:	3db00593          	li	a1,987
8040edcc:	00005517          	auipc	a0,0x5
8040edd0:	36850513          	addi	a0,a0,872 # 80414134 <dev_node_ops+0xac>
8040edd4:	cf8f10ef          	jal	ra,804002cc <__panic>
8040edd8:	00005697          	auipc	a3,0x5
8040eddc:	38c68693          	addi	a3,a3,908 # 80414164 <dev_node_ops+0xdc>
8040ede0:	00002617          	auipc	a2,0x2
8040ede4:	ee060613          	addi	a2,a2,-288 # 80410cc0 <commands+0x3c>
8040ede8:	3da00593          	li	a1,986
8040edec:	00005517          	auipc	a0,0x5
8040edf0:	34850513          	addi	a0,a0,840 # 80414134 <dev_node_ops+0xac>
8040edf4:	cd8f10ef          	jal	ra,804002cc <__panic>
8040edf8:	00005697          	auipc	a3,0x5
8040edfc:	30468693          	addi	a3,a3,772 # 804140fc <dev_node_ops+0x74>
8040ee00:	00002617          	auipc	a2,0x2
8040ee04:	ec060613          	addi	a2,a2,-320 # 80410cc0 <commands+0x3c>
8040ee08:	3dd00593          	li	a1,989
8040ee0c:	00005517          	auipc	a0,0x5
8040ee10:	32850513          	addi	a0,a0,808 # 80414134 <dev_node_ops+0xac>
8040ee14:	cb8f10ef          	jal	ra,804002cc <__panic>

8040ee18 <sfs_namefile>:
8040ee18:	00c5a703          	lw	a4,12(a1)
8040ee1c:	fa010113          	addi	sp,sp,-96
8040ee20:	04112e23          	sw	ra,92(sp)
8040ee24:	04812c23          	sw	s0,88(sp)
8040ee28:	04912a23          	sw	s1,84(sp)
8040ee2c:	05212823          	sw	s2,80(sp)
8040ee30:	05312623          	sw	s3,76(sp)
8040ee34:	05412423          	sw	s4,72(sp)
8040ee38:	05512223          	sw	s5,68(sp)
8040ee3c:	05612023          	sw	s6,64(sp)
8040ee40:	03712e23          	sw	s7,60(sp)
8040ee44:	03812c23          	sw	s8,56(sp)
8040ee48:	03912a23          	sw	s9,52(sp)
8040ee4c:	03a12823          	sw	s10,48(sp)
8040ee50:	03b12623          	sw	s11,44(sp)
8040ee54:	00b12623          	sw	a1,12(sp)
8040ee58:	00200793          	li	a5,2
8040ee5c:	24e7fa63          	bgeu	a5,a4,8040f0b0 <sfs_namefile+0x298>
8040ee60:	00050913          	mv	s2,a0
8040ee64:	10400513          	li	a0,260
8040ee68:	fb1f30ef          	jal	ra,80402e18 <kmalloc>
8040ee6c:	00050c13          	mv	s8,a0
8040ee70:	24050063          	beqz	a0,8040f0b0 <sfs_namefile+0x298>
8040ee74:	03892403          	lw	s0,56(s2)
8040ee78:	2a040063          	beqz	s0,8040f118 <sfs_namefile+0x300>
8040ee7c:	06c42783          	lw	a5,108(s0)
8040ee80:	28079c63          	bnez	a5,8040f118 <sfs_namefile+0x300>
8040ee84:	02c92483          	lw	s1,44(s2)
8040ee88:	000017b7          	lui	a5,0x1
8040ee8c:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6dcb>
8040ee90:	26f49463          	bne	s1,a5,8040f0f8 <sfs_namefile+0x2e0>
8040ee94:	00c12703          	lw	a4,12(sp)
8040ee98:	00090513          	mv	a0,s2
8040ee9c:	00090a13          	mv	s4,s2
8040eea0:	00c72783          	lw	a5,12(a4)
8040eea4:	00072a83          	lw	s5,0(a4)
8040eea8:	01090993          	addi	s3,s2,16
8040eeac:	ffe78b13          	addi	s6,a5,-2
8040eeb0:	00fa8ab3          	add	s5,s5,a5
8040eeb4:	00005c97          	auipc	s9,0x5
8040eeb8:	524c8c93          	addi	s9,s9,1316 # 804143d8 <dev_node_ops+0x350>
8040eebc:	8c0fd0ef          	jal	ra,8040bf7c <inode_ref_inc>
8040eec0:	004c0b93          	addi	s7,s8,4
8040eec4:	00912423          	sw	s1,8(sp)
8040eec8:	00098513          	mv	a0,s3
8040eecc:	b85f70ef          	jal	ra,80406a50 <down>
8040eed0:	01c10693          	addi	a3,sp,28
8040eed4:	000c8613          	mv	a2,s9
8040eed8:	000a0593          	mv	a1,s4
8040eedc:	00040513          	mv	a0,s0
8040eee0:	ee4ff0ef          	jal	ra,8040e5c4 <sfs_dirent_search_nolock.constprop.0>
8040eee4:	00050d93          	mv	s11,a0
8040eee8:	00098513          	mv	a0,s3
8040eeec:	b61f70ef          	jal	ra,80406a4c <up>
8040eef0:	040d8a63          	beqz	s11,8040ef44 <sfs_namefile+0x12c>
8040eef4:	00090513          	mv	a0,s2
8040eef8:	978fd0ef          	jal	ra,8040c070 <inode_ref_dec>
8040eefc:	000c0513          	mv	a0,s8
8040ef00:	834f40ef          	jal	ra,80402f34 <kfree>
8040ef04:	05c12083          	lw	ra,92(sp)
8040ef08:	05812403          	lw	s0,88(sp)
8040ef0c:	05412483          	lw	s1,84(sp)
8040ef10:	05012903          	lw	s2,80(sp)
8040ef14:	04c12983          	lw	s3,76(sp)
8040ef18:	04812a03          	lw	s4,72(sp)
8040ef1c:	04412a83          	lw	s5,68(sp)
8040ef20:	04012b03          	lw	s6,64(sp)
8040ef24:	03c12b83          	lw	s7,60(sp)
8040ef28:	03812c03          	lw	s8,56(sp)
8040ef2c:	03412c83          	lw	s9,52(sp)
8040ef30:	03012d03          	lw	s10,48(sp)
8040ef34:	000d8513          	mv	a0,s11
8040ef38:	02c12d83          	lw	s11,44(sp)
8040ef3c:	06010113          	addi	sp,sp,96
8040ef40:	00008067          	ret
8040ef44:	01c12603          	lw	a2,28(sp)
8040ef48:	01810593          	addi	a1,sp,24
8040ef4c:	00040513          	mv	a0,s0
8040ef50:	aa1ff0ef          	jal	ra,8040e9f0 <sfs_load_inode>
8040ef54:	00050d93          	mv	s11,a0
8040ef58:	f8051ee3          	bnez	a0,8040eef4 <sfs_namefile+0xdc>
8040ef5c:	00090513          	mv	a0,s2
8040ef60:	004a2483          	lw	s1,4(s4)
8040ef64:	90cfd0ef          	jal	ra,8040c070 <inode_ref_dec>
8040ef68:	01812d03          	lw	s10,24(sp)
8040ef6c:	0f2d0263          	beq	s10,s2,8040f050 <sfs_namefile+0x238>
8040ef70:	160d0463          	beqz	s10,8040f0d8 <sfs_namefile+0x2c0>
8040ef74:	02cd2703          	lw	a4,44(s10)
8040ef78:	00812783          	lw	a5,8(sp)
8040ef7c:	14f71e63          	bne	a4,a5,8040f0d8 <sfs_namefile+0x2c0>
8040ef80:	004d2703          	lw	a4,4(s10)
8040ef84:	000d0a13          	mv	s4,s10
8040ef88:	12970863          	beq	a4,s1,8040f0b8 <sfs_namefile+0x2a0>
8040ef8c:	000d2703          	lw	a4,0(s10)
8040ef90:	00200793          	li	a5,2
8040ef94:	00475703          	lhu	a4,4(a4)
8040ef98:	12f71063          	bne	a4,a5,8040f0b8 <sfs_namefile+0x2a0>
8040ef9c:	010d0993          	addi	s3,s10,16
8040efa0:	00098513          	mv	a0,s3
8040efa4:	aadf70ef          	jal	ra,80406a50 <down>
8040efa8:	000d2703          	lw	a4,0(s10)
8040efac:	00872903          	lw	s2,8(a4)
8040efb0:	01204c63          	bgtz	s2,8040efc8 <sfs_namefile+0x1b0>
8040efb4:	07c0006f          	j	8040f030 <sfs_namefile+0x218>
8040efb8:	000c2703          	lw	a4,0(s8)
8040efbc:	02e48663          	beq	s1,a4,8040efe8 <sfs_namefile+0x1d0>
8040efc0:	001d8d93          	addi	s11,s11,1
8040efc4:	07b90663          	beq	s2,s11,8040f030 <sfs_namefile+0x218>
8040efc8:	000c0693          	mv	a3,s8
8040efcc:	000d8613          	mv	a2,s11
8040efd0:	000d0593          	mv	a1,s10
8040efd4:	00040513          	mv	a0,s0
8040efd8:	b38ff0ef          	jal	ra,8040e310 <sfs_dirent_read_nolock>
8040efdc:	00050713          	mv	a4,a0
8040efe0:	fc050ce3          	beqz	a0,8040efb8 <sfs_namefile+0x1a0>
8040efe4:	0500006f          	j	8040f034 <sfs_namefile+0x21c>
8040efe8:	00098513          	mv	a0,s3
8040efec:	a61f70ef          	jal	ra,80406a4c <up>
8040eff0:	000b8513          	mv	a0,s7
8040eff4:	0b4010ef          	jal	ra,804100a8 <strlen>
8040eff8:	00150793          	addi	a5,a0,1
8040effc:	00050613          	mv	a2,a0
8040f000:	0afb6263          	bltu	s6,a5,8040f0a4 <sfs_namefile+0x28c>
8040f004:	fff64493          	not	s1,a2
8040f008:	009a84b3          	add	s1,s5,s1
8040f00c:	000b8593          	mv	a1,s7
8040f010:	00048513          	mv	a0,s1
8040f014:	40fb0b33          	sub	s6,s6,a5
8040f018:	1cc010ef          	jal	ra,804101e4 <memcpy>
8040f01c:	02f00793          	li	a5,47
8040f020:	fefa8fa3          	sb	a5,-1(s5)
8040f024:	000d0913          	mv	s2,s10
8040f028:	00048a93          	mv	s5,s1
8040f02c:	e9dff06f          	j	8040eec8 <sfs_namefile+0xb0>
8040f030:	ff000713          	li	a4,-16
8040f034:	00098513          	mv	a0,s3
8040f038:	00e12423          	sw	a4,8(sp)
8040f03c:	a11f70ef          	jal	ra,80406a4c <up>
8040f040:	00812703          	lw	a4,8(sp)
8040f044:	000d0913          	mv	s2,s10
8040f048:	00070d93          	mv	s11,a4
8040f04c:	ea9ff06f          	j	8040eef4 <sfs_namefile+0xdc>
8040f050:	00090513          	mv	a0,s2
8040f054:	81cfd0ef          	jal	ra,8040c070 <inode_ref_dec>
8040f058:	00c12403          	lw	s0,12(sp)
8040f05c:	000a8593          	mv	a1,s5
8040f060:	00c42703          	lw	a4,12(s0)
8040f064:	00042503          	lw	a0,0(s0)
8040f068:	ffe70713          	addi	a4,a4,-2
8040f06c:	41670b33          	sub	s6,a4,s6
8040f070:	000b0613          	mv	a2,s6
8040f074:	00150513          	addi	a0,a0,1
8040f078:	118010ef          	jal	ra,80410190 <memmove>
8040f07c:	02f00713          	li	a4,47
8040f080:	fee50fa3          	sb	a4,-1(a0)
8040f084:	01650533          	add	a0,a0,s6
8040f088:	00050023          	sb	zero,0(a0)
8040f08c:	000b0593          	mv	a1,s6
8040f090:	00040513          	mv	a0,s0
8040f094:	a10f90ef          	jal	ra,804082a4 <iobuf_skip>
8040f098:	000c0513          	mv	a0,s8
8040f09c:	e99f30ef          	jal	ra,80402f34 <kfree>
8040f0a0:	e65ff06f          	j	8040ef04 <sfs_namefile+0xec>
8040f0a4:	000d0913          	mv	s2,s10
8040f0a8:	ffc00d93          	li	s11,-4
8040f0ac:	e49ff06f          	j	8040eef4 <sfs_namefile+0xdc>
8040f0b0:	ffc00d93          	li	s11,-4
8040f0b4:	e51ff06f          	j	8040ef04 <sfs_namefile+0xec>
8040f0b8:	00005697          	auipc	a3,0x5
8040f0bc:	32468693          	addi	a3,a3,804 # 804143dc <dev_node_ops+0x354>
8040f0c0:	00002617          	auipc	a2,0x2
8040f0c4:	c0060613          	addi	a2,a2,-1024 # 80410cc0 <commands+0x3c>
8040f0c8:	2f900593          	li	a1,761
8040f0cc:	00005517          	auipc	a0,0x5
8040f0d0:	06850513          	addi	a0,a0,104 # 80414134 <dev_node_ops+0xac>
8040f0d4:	9f8f10ef          	jal	ra,804002cc <__panic>
8040f0d8:	00005697          	auipc	a3,0x5
8040f0dc:	02468693          	addi	a3,a3,36 # 804140fc <dev_node_ops+0x74>
8040f0e0:	00002617          	auipc	a2,0x2
8040f0e4:	be060613          	addi	a2,a2,-1056 # 80410cc0 <commands+0x3c>
8040f0e8:	2f800593          	li	a1,760
8040f0ec:	00005517          	auipc	a0,0x5
8040f0f0:	04850513          	addi	a0,a0,72 # 80414134 <dev_node_ops+0xac>
8040f0f4:	9d8f10ef          	jal	ra,804002cc <__panic>
8040f0f8:	00005697          	auipc	a3,0x5
8040f0fc:	00468693          	addi	a3,a3,4 # 804140fc <dev_node_ops+0x74>
8040f100:	00002617          	auipc	a2,0x2
8040f104:	bc060613          	addi	a2,a2,-1088 # 80410cc0 <commands+0x3c>
8040f108:	2e500593          	li	a1,741
8040f10c:	00005517          	auipc	a0,0x5
8040f110:	02850513          	addi	a0,a0,40 # 80414134 <dev_node_ops+0xac>
8040f114:	9b8f10ef          	jal	ra,804002cc <__panic>
8040f118:	00005697          	auipc	a3,0x5
8040f11c:	04c68693          	addi	a3,a3,76 # 80414164 <dev_node_ops+0xdc>
8040f120:	00002617          	auipc	a2,0x2
8040f124:	ba060613          	addi	a2,a2,-1120 # 80410cc0 <commands+0x3c>
8040f128:	2e400593          	li	a1,740
8040f12c:	00005517          	auipc	a0,0x5
8040f130:	00850513          	addi	a0,a0,8 # 80414134 <dev_node_ops+0xac>
8040f134:	998f10ef          	jal	ra,804002cc <__panic>

8040f138 <sfs_unmount>:
8040f138:	ff010113          	addi	sp,sp,-16
8040f13c:	00112623          	sw	ra,12(sp)
8040f140:	00812423          	sw	s0,8(sp)
8040f144:	00912223          	sw	s1,4(sp)
8040f148:	06050263          	beqz	a0,8040f1ac <sfs_unmount+0x74>
8040f14c:	06c52783          	lw	a5,108(a0)
8040f150:	00050413          	mv	s0,a0
8040f154:	04079c63          	bnez	a5,8040f1ac <sfs_unmount+0x74>
8040f158:	06452703          	lw	a4,100(a0)
8040f15c:	06050793          	addi	a5,a0,96
8040f160:	04f71263          	bne	a4,a5,8040f1a4 <sfs_unmount+0x6c>
8040f164:	03452483          	lw	s1,52(a0)
8040f168:	06049263          	bnez	s1,8040f1cc <sfs_unmount+0x94>
8040f16c:	03052503          	lw	a0,48(a0)
8040f170:	195000ef          	jal	ra,8040fb04 <bitmap_destroy>
8040f174:	03842503          	lw	a0,56(s0)
8040f178:	dbdf30ef          	jal	ra,80402f34 <kfree>
8040f17c:	06842503          	lw	a0,104(s0)
8040f180:	db5f30ef          	jal	ra,80402f34 <kfree>
8040f184:	00040513          	mv	a0,s0
8040f188:	dadf30ef          	jal	ra,80402f34 <kfree>
8040f18c:	00c12083          	lw	ra,12(sp)
8040f190:	00812403          	lw	s0,8(sp)
8040f194:	00048513          	mv	a0,s1
8040f198:	00412483          	lw	s1,4(sp)
8040f19c:	01010113          	addi	sp,sp,16
8040f1a0:	00008067          	ret
8040f1a4:	ff100493          	li	s1,-15
8040f1a8:	fe5ff06f          	j	8040f18c <sfs_unmount+0x54>
8040f1ac:	00005697          	auipc	a3,0x5
8040f1b0:	fb868693          	addi	a3,a3,-72 # 80414164 <dev_node_ops+0xdc>
8040f1b4:	00002617          	auipc	a2,0x2
8040f1b8:	b0c60613          	addi	a2,a2,-1268 # 80410cc0 <commands+0x3c>
8040f1bc:	04100593          	li	a1,65
8040f1c0:	00005517          	auipc	a0,0x5
8040f1c4:	2d050513          	addi	a0,a0,720 # 80414490 <sfs_node_fileops+0x40>
8040f1c8:	904f10ef          	jal	ra,804002cc <__panic>
8040f1cc:	00005697          	auipc	a3,0x5
8040f1d0:	2dc68693          	addi	a3,a3,732 # 804144a8 <sfs_node_fileops+0x58>
8040f1d4:	00002617          	auipc	a2,0x2
8040f1d8:	aec60613          	addi	a2,a2,-1300 # 80410cc0 <commands+0x3c>
8040f1dc:	04500593          	li	a1,69
8040f1e0:	00005517          	auipc	a0,0x5
8040f1e4:	2b050513          	addi	a0,a0,688 # 80414490 <sfs_node_fileops+0x40>
8040f1e8:	8e4f10ef          	jal	ra,804002cc <__panic>

8040f1ec <sfs_cleanup>:
8040f1ec:	ff010113          	addi	sp,sp,-16
8040f1f0:	00112623          	sw	ra,12(sp)
8040f1f4:	00812423          	sw	s0,8(sp)
8040f1f8:	00912223          	sw	s1,4(sp)
8040f1fc:	01212023          	sw	s2,0(sp)
8040f200:	08050e63          	beqz	a0,8040f29c <sfs_cleanup+0xb0>
8040f204:	06c52783          	lw	a5,108(a0)
8040f208:	00050493          	mv	s1,a0
8040f20c:	08079863          	bnez	a5,8040f29c <sfs_cleanup+0xb0>
8040f210:	00452703          	lw	a4,4(a0)
8040f214:	00852683          	lw	a3,8(a0)
8040f218:	00c50913          	addi	s2,a0,12
8040f21c:	00090593          	mv	a1,s2
8040f220:	40d70633          	sub	a2,a4,a3
8040f224:	00005517          	auipc	a0,0x5
8040f228:	29850513          	addi	a0,a0,664 # 804144bc <sfs_node_fileops+0x6c>
8040f22c:	f1df00ef          	jal	ra,80400148 <cprintf>
8040f230:	02000413          	li	s0,32
8040f234:	00c0006f          	j	8040f240 <sfs_cleanup+0x54>
8040f238:	fff40413          	addi	s0,s0,-1
8040f23c:	02040663          	beqz	s0,8040f268 <sfs_cleanup+0x7c>
8040f240:	0704a783          	lw	a5,112(s1)
8040f244:	00048513          	mv	a0,s1
8040f248:	000780e7          	jalr	a5
8040f24c:	fe0516e3          	bnez	a0,8040f238 <sfs_cleanup+0x4c>
8040f250:	00c12083          	lw	ra,12(sp)
8040f254:	00812403          	lw	s0,8(sp)
8040f258:	00412483          	lw	s1,4(sp)
8040f25c:	00012903          	lw	s2,0(sp)
8040f260:	01010113          	addi	sp,sp,16
8040f264:	00008067          	ret
8040f268:	00812403          	lw	s0,8(sp)
8040f26c:	00c12083          	lw	ra,12(sp)
8040f270:	00412483          	lw	s1,4(sp)
8040f274:	00090693          	mv	a3,s2
8040f278:	00012903          	lw	s2,0(sp)
8040f27c:	00050713          	mv	a4,a0
8040f280:	00005617          	auipc	a2,0x5
8040f284:	25c60613          	addi	a2,a2,604 # 804144dc <sfs_node_fileops+0x8c>
8040f288:	05f00593          	li	a1,95
8040f28c:	00005517          	auipc	a0,0x5
8040f290:	20450513          	addi	a0,a0,516 # 80414490 <sfs_node_fileops+0x40>
8040f294:	01010113          	addi	sp,sp,16
8040f298:	8b4f106f          	j	8040034c <__warn>
8040f29c:	00005697          	auipc	a3,0x5
8040f2a0:	ec868693          	addi	a3,a3,-312 # 80414164 <dev_node_ops+0xdc>
8040f2a4:	00002617          	auipc	a2,0x2
8040f2a8:	a1c60613          	addi	a2,a2,-1508 # 80410cc0 <commands+0x3c>
8040f2ac:	05400593          	li	a1,84
8040f2b0:	00005517          	auipc	a0,0x5
8040f2b4:	1e050513          	addi	a0,a0,480 # 80414490 <sfs_node_fileops+0x40>
8040f2b8:	814f10ef          	jal	ra,804002cc <__panic>

8040f2bc <sfs_sync>:
8040f2bc:	fe010113          	addi	sp,sp,-32
8040f2c0:	00112e23          	sw	ra,28(sp)
8040f2c4:	00812c23          	sw	s0,24(sp)
8040f2c8:	00912a23          	sw	s1,20(sp)
8040f2cc:	01212823          	sw	s2,16(sp)
8040f2d0:	01312623          	sw	s3,12(sp)
8040f2d4:	01412423          	sw	s4,8(sp)
8040f2d8:	10050a63          	beqz	a0,8040f3ec <sfs_sync+0x130>
8040f2dc:	06c52783          	lw	a5,108(a0)
8040f2e0:	00050a13          	mv	s4,a0
8040f2e4:	10079463          	bnez	a5,8040f3ec <sfs_sync+0x130>
8040f2e8:	8a4fe0ef          	jal	ra,8040d38c <lock_sfs_fs>
8040f2ec:	064a2403          	lw	s0,100(s4)
8040f2f0:	060a0913          	addi	s2,s4,96
8040f2f4:	04890263          	beq	s2,s0,8040f338 <sfs_sync+0x7c>
8040f2f8:	00004997          	auipc	s3,0x4
8040f2fc:	9c498993          	addi	s3,s3,-1596 # 80412cbc <default_pmm_manager+0xa90>
8040f300:	02042783          	lw	a5,32(s0)
8040f304:	fe440493          	addi	s1,s0,-28
8040f308:	0c078263          	beqz	a5,8040f3cc <sfs_sync+0x110>
8040f30c:	0187a783          	lw	a5,24(a5)
8040f310:	0a078e63          	beqz	a5,8040f3cc <sfs_sync+0x110>
8040f314:	00098593          	mv	a1,s3
8040f318:	00048513          	mv	a0,s1
8040f31c:	c89fc0ef          	jal	ra,8040bfa4 <inode_check>
8040f320:	02042783          	lw	a5,32(s0)
8040f324:	00048513          	mv	a0,s1
8040f328:	0187a783          	lw	a5,24(a5)
8040f32c:	000780e7          	jalr	a5
8040f330:	00442403          	lw	s0,4(s0)
8040f334:	fc8916e3          	bne	s2,s0,8040f300 <sfs_sync+0x44>
8040f338:	000a0513          	mv	a0,s4
8040f33c:	860fe0ef          	jal	ra,8040d39c <unlock_sfs_fs>
8040f340:	034a2503          	lw	a0,52(s4)
8040f344:	02051263          	bnez	a0,8040f368 <sfs_sync+0xac>
8040f348:	01c12083          	lw	ra,28(sp)
8040f34c:	01812403          	lw	s0,24(sp)
8040f350:	01412483          	lw	s1,20(sp)
8040f354:	01012903          	lw	s2,16(sp)
8040f358:	00c12983          	lw	s3,12(sp)
8040f35c:	00812a03          	lw	s4,8(sp)
8040f360:	02010113          	addi	sp,sp,32
8040f364:	00008067          	ret
8040f368:	020a2a23          	sw	zero,52(s4)
8040f36c:	000a0513          	mv	a0,s4
8040f370:	361000ef          	jal	ra,8040fed0 <sfs_sync_super>
8040f374:	02050663          	beqz	a0,8040f3a0 <sfs_sync+0xe4>
8040f378:	01c12083          	lw	ra,28(sp)
8040f37c:	01812403          	lw	s0,24(sp)
8040f380:	00100793          	li	a5,1
8040f384:	02fa2a23          	sw	a5,52(s4)
8040f388:	01412483          	lw	s1,20(sp)
8040f38c:	01012903          	lw	s2,16(sp)
8040f390:	00c12983          	lw	s3,12(sp)
8040f394:	00812a03          	lw	s4,8(sp)
8040f398:	02010113          	addi	sp,sp,32
8040f39c:	00008067          	ret
8040f3a0:	000a0513          	mv	a0,s4
8040f3a4:	3a1000ef          	jal	ra,8040ff44 <sfs_sync_freemap>
8040f3a8:	fc0518e3          	bnez	a0,8040f378 <sfs_sync+0xbc>
8040f3ac:	01c12083          	lw	ra,28(sp)
8040f3b0:	01812403          	lw	s0,24(sp)
8040f3b4:	01412483          	lw	s1,20(sp)
8040f3b8:	01012903          	lw	s2,16(sp)
8040f3bc:	00c12983          	lw	s3,12(sp)
8040f3c0:	00812a03          	lw	s4,8(sp)
8040f3c4:	02010113          	addi	sp,sp,32
8040f3c8:	00008067          	ret
8040f3cc:	00004697          	auipc	a3,0x4
8040f3d0:	8a068693          	addi	a3,a3,-1888 # 80412c6c <default_pmm_manager+0xa40>
8040f3d4:	00002617          	auipc	a2,0x2
8040f3d8:	8ec60613          	addi	a2,a2,-1812 # 80410cc0 <commands+0x3c>
8040f3dc:	01b00593          	li	a1,27
8040f3e0:	00005517          	auipc	a0,0x5
8040f3e4:	0b050513          	addi	a0,a0,176 # 80414490 <sfs_node_fileops+0x40>
8040f3e8:	ee5f00ef          	jal	ra,804002cc <__panic>
8040f3ec:	00005697          	auipc	a3,0x5
8040f3f0:	d7868693          	addi	a3,a3,-648 # 80414164 <dev_node_ops+0xdc>
8040f3f4:	00002617          	auipc	a2,0x2
8040f3f8:	8cc60613          	addi	a2,a2,-1844 # 80410cc0 <commands+0x3c>
8040f3fc:	01500593          	li	a1,21
8040f400:	00005517          	auipc	a0,0x5
8040f404:	09050513          	addi	a0,a0,144 # 80414490 <sfs_node_fileops+0x40>
8040f408:	ec5f00ef          	jal	ra,804002cc <__panic>

8040f40c <sfs_get_root>:
8040f40c:	fe010113          	addi	sp,sp,-32
8040f410:	00112e23          	sw	ra,28(sp)
8040f414:	02050663          	beqz	a0,8040f440 <sfs_get_root+0x34>
8040f418:	06c52783          	lw	a5,108(a0)
8040f41c:	02079263          	bnez	a5,8040f440 <sfs_get_root+0x34>
8040f420:	00100613          	li	a2,1
8040f424:	00c10593          	addi	a1,sp,12
8040f428:	dc8ff0ef          	jal	ra,8040e9f0 <sfs_load_inode>
8040f42c:	02051a63          	bnez	a0,8040f460 <sfs_get_root+0x54>
8040f430:	01c12083          	lw	ra,28(sp)
8040f434:	00c12503          	lw	a0,12(sp)
8040f438:	02010113          	addi	sp,sp,32
8040f43c:	00008067          	ret
8040f440:	00005697          	auipc	a3,0x5
8040f444:	d2468693          	addi	a3,a3,-732 # 80414164 <dev_node_ops+0xdc>
8040f448:	00002617          	auipc	a2,0x2
8040f44c:	87860613          	addi	a2,a2,-1928 # 80410cc0 <commands+0x3c>
8040f450:	03600593          	li	a1,54
8040f454:	00005517          	auipc	a0,0x5
8040f458:	03c50513          	addi	a0,a0,60 # 80414490 <sfs_node_fileops+0x40>
8040f45c:	e71f00ef          	jal	ra,804002cc <__panic>
8040f460:	00050693          	mv	a3,a0
8040f464:	00005617          	auipc	a2,0x5
8040f468:	09460613          	addi	a2,a2,148 # 804144f8 <sfs_node_fileops+0xa8>
8040f46c:	03700593          	li	a1,55
8040f470:	00005517          	auipc	a0,0x5
8040f474:	02050513          	addi	a0,a0,32 # 80414490 <sfs_node_fileops+0x40>
8040f478:	e55f00ef          	jal	ra,804002cc <__panic>

8040f47c <sfs_do_mount>:
8040f47c:	00452703          	lw	a4,4(a0)
8040f480:	f9010113          	addi	sp,sp,-112
8040f484:	06112623          	sw	ra,108(sp)
8040f488:	06812423          	sw	s0,104(sp)
8040f48c:	06912223          	sw	s1,100(sp)
8040f490:	07212023          	sw	s2,96(sp)
8040f494:	05312e23          	sw	s3,92(sp)
8040f498:	05412c23          	sw	s4,88(sp)
8040f49c:	05512a23          	sw	s5,84(sp)
8040f4a0:	05612823          	sw	s6,80(sp)
8040f4a4:	05712623          	sw	s7,76(sp)
8040f4a8:	05812423          	sw	s8,72(sp)
8040f4ac:	05912223          	sw	s9,68(sp)
8040f4b0:	05a12023          	sw	s10,64(sp)
8040f4b4:	03b12e23          	sw	s11,60(sp)
8040f4b8:	000017b7          	lui	a5,0x1
8040f4bc:	30f71463          	bne	a4,a5,8040f7c4 <sfs_do_mount+0x348>
8040f4c0:	00050913          	mv	s2,a0
8040f4c4:	00000513          	li	a0,0
8040f4c8:	00058b13          	mv	s6,a1
8040f4cc:	fe9fc0ef          	jal	ra,8040c4b4 <__alloc_fs>
8040f4d0:	00050413          	mv	s0,a0
8040f4d4:	30050463          	beqz	a0,8040f7dc <sfs_do_mount+0x360>
8040f4d8:	06c52a83          	lw	s5,108(a0)
8040f4dc:	320a9463          	bnez	s5,8040f804 <sfs_do_mount+0x388>
8040f4e0:	03252623          	sw	s2,44(a0)
8040f4e4:	00001537          	lui	a0,0x1
8040f4e8:	931f30ef          	jal	ra,80402e18 <kmalloc>
8040f4ec:	02a42c23          	sw	a0,56(s0)
8040f4f0:	00050493          	mv	s1,a0
8040f4f4:	1c050e63          	beqz	a0,8040f6d0 <sfs_do_mount+0x254>
8040f4f8:	00050593          	mv	a1,a0
8040f4fc:	00000693          	li	a3,0
8040f500:	00001637          	lui	a2,0x1
8040f504:	02010513          	addi	a0,sp,32
8040f508:	cd1f80ef          	jal	ra,804081d8 <iobuf_init>
8040f50c:	01092783          	lw	a5,16(s2)
8040f510:	00050593          	mv	a1,a0
8040f514:	00000613          	li	a2,0
8040f518:	00090513          	mv	a0,s2
8040f51c:	000780e7          	jalr	a5 # 1000 <_binary_bin_swap_img_size-0x7000>
8040f520:	00050a13          	mv	s4,a0
8040f524:	14051e63          	bnez	a0,8040f680 <sfs_do_mount+0x204>
8040f528:	0004a583          	lw	a1,0(s1)
8040f52c:	2f8dc637          	lui	a2,0x2f8dc
8040f530:	e2a60613          	addi	a2,a2,-470 # 2f8dbe2a <_binary_bin_sfs_img_size+0x2f863e2a>
8040f534:	1ac59e63          	bne	a1,a2,8040f6f0 <sfs_do_mount+0x274>
8040f538:	0044a783          	lw	a5,4(s1)
8040f53c:	00092603          	lw	a2,0(s2)
8040f540:	18f66c63          	bltu	a2,a5,8040f6d8 <sfs_do_mount+0x25c>
8040f544:	020485a3          	sb	zero,43(s1)
8040f548:	0084af03          	lw	t5,8(s1)
8040f54c:	00c4ae83          	lw	t4,12(s1)
8040f550:	0104ae03          	lw	t3,16(s1)
8040f554:	0144a303          	lw	t1,20(s1)
8040f558:	0184a883          	lw	a7,24(s1)
8040f55c:	01c4a803          	lw	a6,28(s1)
8040f560:	0204a603          	lw	a2,32(s1)
8040f564:	0244a683          	lw	a3,36(s1)
8040f568:	0284a703          	lw	a4,40(s1)
8040f56c:	00002537          	lui	a0,0x2
8040f570:	00f42223          	sw	a5,4(s0)
8040f574:	00b42023          	sw	a1,0(s0)
8040f578:	01e42423          	sw	t5,8(s0)
8040f57c:	01d42623          	sw	t4,12(s0)
8040f580:	01c42823          	sw	t3,16(s0)
8040f584:	00642a23          	sw	t1,20(s0)
8040f588:	01142c23          	sw	a7,24(s0)
8040f58c:	01042e23          	sw	a6,28(s0)
8040f590:	02c42023          	sw	a2,32(s0)
8040f594:	02d42223          	sw	a3,36(s0)
8040f598:	02e42423          	sw	a4,40(s0)
8040f59c:	87df30ef          	jal	ra,80402e18 <kmalloc>
8040f5a0:	00a12623          	sw	a0,12(sp)
8040f5a4:	06a42423          	sw	a0,104(s0)
8040f5a8:	00050793          	mv	a5,a0
8040f5ac:	22050063          	beqz	a0,8040f7cc <sfs_do_mount+0x350>
8040f5b0:	00002737          	lui	a4,0x2
8040f5b4:	00e50733          	add	a4,a0,a4
8040f5b8:	00f7a223          	sw	a5,4(a5)
8040f5bc:	00f7a023          	sw	a5,0(a5)
8040f5c0:	00878793          	addi	a5,a5,8
8040f5c4:	fef71ae3          	bne	a4,a5,8040f5b8 <sfs_do_mount+0x13c>
8040f5c8:	0044ac03          	lw	s8,4(s1)
8040f5cc:	000087b7          	lui	a5,0x8
8040f5d0:	fff78993          	addi	s3,a5,-1 # 7fff <_binary_bin_swap_img_size-0x1>
8040f5d4:	013c0c33          	add	s8,s8,s3
8040f5d8:	ffff87b7          	lui	a5,0xffff8
8040f5dc:	00fc7c33          	and	s8,s8,a5
8040f5e0:	000c0513          	mv	a0,s8
8040f5e4:	294000ef          	jal	ra,8040f878 <bitmap_create>
8040f5e8:	02a42823          	sw	a0,48(s0)
8040f5ec:	00050c93          	mv	s9,a0
8040f5f0:	1c050663          	beqz	a0,8040f7bc <sfs_do_mount+0x340>
8040f5f4:	0044a783          	lw	a5,4(s1)
8040f5f8:	01c10593          	addi	a1,sp,28
8040f5fc:	013787b3          	add	a5,a5,s3
8040f600:	00f7db93          	srli	s7,a5,0xf
8040f604:	52c000ef          	jal	ra,8040fb30 <bitmap_getdata>
8040f608:	00050993          	mv	s3,a0
8040f60c:	1c050c63          	beqz	a0,8040f7e4 <sfs_do_mount+0x368>
8040f610:	01c12703          	lw	a4,28(sp)
8040f614:	00cb9693          	slli	a3,s7,0xc
8040f618:	1ce69663          	bne	a3,a4,8040f7e4 <sfs_do_mount+0x368>
8040f61c:	00002db7          	lui	s11,0x2
8040f620:	40ad8db3          	sub	s11,s11,a0
8040f624:	000b9c63          	bnez	s7,8040f63c <sfs_do_mount+0x1c0>
8040f628:	0dc0006f          	j	8040f704 <sfs_do_mount+0x288>
8040f62c:	00001737          	lui	a4,0x1
8040f630:	fffb8b93          	addi	s7,s7,-1
8040f634:	00e989b3          	add	s3,s3,a4
8040f638:	0c0b8663          	beqz	s7,8040f704 <sfs_do_mount+0x288>
8040f63c:	01b986b3          	add	a3,s3,s11
8040f640:	00001637          	lui	a2,0x1
8040f644:	00098593          	mv	a1,s3
8040f648:	02010513          	addi	a0,sp,32
8040f64c:	b8df80ef          	jal	ra,804081d8 <iobuf_init>
8040f650:	01092703          	lw	a4,16(s2)
8040f654:	00050593          	mv	a1,a0
8040f658:	00000613          	li	a2,0
8040f65c:	00090513          	mv	a0,s2
8040f660:	000700e7          	jalr	a4 # 1000 <_binary_bin_swap_img_size-0x7000>
8040f664:	00050d13          	mv	s10,a0
8040f668:	fc0502e3          	beqz	a0,8040f62c <sfs_do_mount+0x1b0>
8040f66c:	000c8513          	mv	a0,s9
8040f670:	494000ef          	jal	ra,8040fb04 <bitmap_destroy>
8040f674:	000d0a13          	mv	s4,s10
8040f678:	00c12503          	lw	a0,12(sp)
8040f67c:	8b9f30ef          	jal	ra,80402f34 <kfree>
8040f680:	00048513          	mv	a0,s1
8040f684:	8b1f30ef          	jal	ra,80402f34 <kfree>
8040f688:	00040513          	mv	a0,s0
8040f68c:	8a9f30ef          	jal	ra,80402f34 <kfree>
8040f690:	06c12083          	lw	ra,108(sp)
8040f694:	06812403          	lw	s0,104(sp)
8040f698:	06412483          	lw	s1,100(sp)
8040f69c:	06012903          	lw	s2,96(sp)
8040f6a0:	05c12983          	lw	s3,92(sp)
8040f6a4:	05412a83          	lw	s5,84(sp)
8040f6a8:	05012b03          	lw	s6,80(sp)
8040f6ac:	04c12b83          	lw	s7,76(sp)
8040f6b0:	04812c03          	lw	s8,72(sp)
8040f6b4:	04412c83          	lw	s9,68(sp)
8040f6b8:	04012d03          	lw	s10,64(sp)
8040f6bc:	03c12d83          	lw	s11,60(sp)
8040f6c0:	000a0513          	mv	a0,s4
8040f6c4:	05812a03          	lw	s4,88(sp)
8040f6c8:	07010113          	addi	sp,sp,112
8040f6cc:	00008067          	ret
8040f6d0:	ffc00a13          	li	s4,-4
8040f6d4:	fb5ff06f          	j	8040f688 <sfs_do_mount+0x20c>
8040f6d8:	00078593          	mv	a1,a5
8040f6dc:	00005517          	auipc	a0,0x5
8040f6e0:	e7050513          	addi	a0,a0,-400 # 8041454c <sfs_node_fileops+0xfc>
8040f6e4:	a65f00ef          	jal	ra,80400148 <cprintf>
8040f6e8:	ffd00a13          	li	s4,-3
8040f6ec:	f95ff06f          	j	8040f680 <sfs_do_mount+0x204>
8040f6f0:	00005517          	auipc	a0,0x5
8040f6f4:	e2450513          	addi	a0,a0,-476 # 80414514 <sfs_node_fileops+0xc4>
8040f6f8:	a51f00ef          	jal	ra,80400148 <cprintf>
8040f6fc:	ffd00a13          	li	s4,-3
8040f700:	f81ff06f          	j	8040f680 <sfs_do_mount+0x204>
8040f704:	00442903          	lw	s2,4(s0)
8040f708:	00000493          	li	s1,0
8040f70c:	0c0c0463          	beqz	s8,8040f7d4 <sfs_do_mount+0x358>
8040f710:	00048593          	mv	a1,s1
8040f714:	000c8513          	mv	a0,s9
8040f718:	348000ef          	jal	ra,8040fa60 <bitmap_test>
8040f71c:	00a03533          	snez	a0,a0
8040f720:	00148493          	addi	s1,s1,1
8040f724:	00aa8ab3          	add	s5,s5,a0
8040f728:	fe9c14e3          	bne	s8,s1,8040f710 <sfs_do_mount+0x294>
8040f72c:	00842783          	lw	a5,8(s0)
8040f730:	0f579a63          	bne	a5,s5,8040f824 <sfs_do_mount+0x3a8>
8040f734:	00100593          	li	a1,1
8040f738:	03c40513          	addi	a0,s0,60
8040f73c:	02042a23          	sw	zero,52(s0)
8040f740:	b00f70ef          	jal	ra,80406a40 <sem_init>
8040f744:	00100593          	li	a1,1
8040f748:	04840513          	addi	a0,s0,72
8040f74c:	af4f70ef          	jal	ra,80406a40 <sem_init>
8040f750:	00100593          	li	a1,1
8040f754:	05440513          	addi	a0,s0,84
8040f758:	ae8f70ef          	jal	ra,80406a40 <sem_init>
8040f75c:	06040793          	addi	a5,s0,96
8040f760:	06f42223          	sw	a5,100(s0)
8040f764:	06f42023          	sw	a5,96(s0)
8040f768:	00090713          	mv	a4,s2
8040f76c:	000a8693          	mv	a3,s5
8040f770:	41590633          	sub	a2,s2,s5
8040f774:	00c40593          	addi	a1,s0,12
8040f778:	00005517          	auipc	a0,0x5
8040f77c:	e5c50513          	addi	a0,a0,-420 # 804145d4 <sfs_node_fileops+0x184>
8040f780:	9c9f00ef          	jal	ra,80400148 <cprintf>
8040f784:	00000797          	auipc	a5,0x0
8040f788:	b3878793          	addi	a5,a5,-1224 # 8040f2bc <sfs_sync>
8040f78c:	06f42823          	sw	a5,112(s0)
8040f790:	00000797          	auipc	a5,0x0
8040f794:	c7c78793          	addi	a5,a5,-900 # 8040f40c <sfs_get_root>
8040f798:	06f42a23          	sw	a5,116(s0)
8040f79c:	00000797          	auipc	a5,0x0
8040f7a0:	99c78793          	addi	a5,a5,-1636 # 8040f138 <sfs_unmount>
8040f7a4:	06f42c23          	sw	a5,120(s0)
8040f7a8:	00000797          	auipc	a5,0x0
8040f7ac:	a4478793          	addi	a5,a5,-1468 # 8040f1ec <sfs_cleanup>
8040f7b0:	06f42e23          	sw	a5,124(s0)
8040f7b4:	008b2023          	sw	s0,0(s6)
8040f7b8:	ed9ff06f          	j	8040f690 <sfs_do_mount+0x214>
8040f7bc:	ffc00a13          	li	s4,-4
8040f7c0:	eb9ff06f          	j	8040f678 <sfs_do_mount+0x1fc>
8040f7c4:	ff200a13          	li	s4,-14
8040f7c8:	ec9ff06f          	j	8040f690 <sfs_do_mount+0x214>
8040f7cc:	ffc00a13          	li	s4,-4
8040f7d0:	eb1ff06f          	j	8040f680 <sfs_do_mount+0x204>
8040f7d4:	00000a93          	li	s5,0
8040f7d8:	f55ff06f          	j	8040f72c <sfs_do_mount+0x2b0>
8040f7dc:	ffc00a13          	li	s4,-4
8040f7e0:	eb1ff06f          	j	8040f690 <sfs_do_mount+0x214>
8040f7e4:	00005697          	auipc	a3,0x5
8040f7e8:	d9868693          	addi	a3,a3,-616 # 8041457c <sfs_node_fileops+0x12c>
8040f7ec:	00001617          	auipc	a2,0x1
8040f7f0:	4d460613          	addi	a2,a2,1236 # 80410cc0 <commands+0x3c>
8040f7f4:	08300593          	li	a1,131
8040f7f8:	00005517          	auipc	a0,0x5
8040f7fc:	c9850513          	addi	a0,a0,-872 # 80414490 <sfs_node_fileops+0x40>
8040f800:	acdf00ef          	jal	ra,804002cc <__panic>
8040f804:	00005697          	auipc	a3,0x5
8040f808:	96068693          	addi	a3,a3,-1696 # 80414164 <dev_node_ops+0xdc>
8040f80c:	00001617          	auipc	a2,0x1
8040f810:	4b460613          	addi	a2,a2,1204 # 80410cc0 <commands+0x3c>
8040f814:	0a300593          	li	a1,163
8040f818:	00005517          	auipc	a0,0x5
8040f81c:	c7850513          	addi	a0,a0,-904 # 80414490 <sfs_node_fileops+0x40>
8040f820:	aadf00ef          	jal	ra,804002cc <__panic>
8040f824:	00005697          	auipc	a3,0x5
8040f828:	d8468693          	addi	a3,a3,-636 # 804145a8 <sfs_node_fileops+0x158>
8040f82c:	00001617          	auipc	a2,0x1
8040f830:	49460613          	addi	a2,a2,1172 # 80410cc0 <commands+0x3c>
8040f834:	0e000593          	li	a1,224
8040f838:	00005517          	auipc	a0,0x5
8040f83c:	c5850513          	addi	a0,a0,-936 # 80414490 <sfs_node_fileops+0x40>
8040f840:	a8df00ef          	jal	ra,804002cc <__panic>

8040f844 <sfs_mount>:
8040f844:	00000597          	auipc	a1,0x0
8040f848:	c3858593          	addi	a1,a1,-968 # 8040f47c <sfs_do_mount>
8040f84c:	f7dfb06f          	j	8040b7c8 <vfs_mount>

8040f850 <bitmap_translate.part.0>:
8040f850:	ff010113          	addi	sp,sp,-16
8040f854:	00005697          	auipc	a3,0x5
8040f858:	da068693          	addi	a3,a3,-608 # 804145f4 <sfs_node_fileops+0x1a4>
8040f85c:	00001617          	auipc	a2,0x1
8040f860:	46460613          	addi	a2,a2,1124 # 80410cc0 <commands+0x3c>
8040f864:	04c00593          	li	a1,76
8040f868:	00005517          	auipc	a0,0x5
8040f86c:	da450513          	addi	a0,a0,-604 # 8041460c <sfs_node_fileops+0x1bc>
8040f870:	00112623          	sw	ra,12(sp)
8040f874:	a59f00ef          	jal	ra,804002cc <__panic>

8040f878 <bitmap_create>:
8040f878:	fe010113          	addi	sp,sp,-32
8040f87c:	00112e23          	sw	ra,28(sp)
8040f880:	00812c23          	sw	s0,24(sp)
8040f884:	00912a23          	sw	s1,20(sp)
8040f888:	01212823          	sw	s2,16(sp)
8040f88c:	01312623          	sw	s3,12(sp)
8040f890:	01412423          	sw	s4,8(sp)
8040f894:	fff50713          	addi	a4,a0,-1
8040f898:	fde00793          	li	a5,-34
8040f89c:	0ce7e663          	bltu	a5,a4,8040f968 <bitmap_create+0xf0>
8040f8a0:	00050413          	mv	s0,a0
8040f8a4:	00c00513          	li	a0,12
8040f8a8:	d70f30ef          	jal	ra,80402e18 <kmalloc>
8040f8ac:	00050493          	mv	s1,a0
8040f8b0:	08050263          	beqz	a0,8040f934 <bitmap_create+0xbc>
8040f8b4:	01f40993          	addi	s3,s0,31
8040f8b8:	0059d913          	srli	s2,s3,0x5
8040f8bc:	00291a13          	slli	s4,s2,0x2
8040f8c0:	000a0513          	mv	a0,s4
8040f8c4:	d54f30ef          	jal	ra,80402e18 <kmalloc>
8040f8c8:	08050863          	beqz	a0,8040f958 <bitmap_create+0xe0>
8040f8cc:	0084a023          	sw	s0,0(s1)
8040f8d0:	0124a223          	sw	s2,4(s1)
8040f8d4:	000a0613          	mv	a2,s4
8040f8d8:	0ff00593          	li	a1,255
8040f8dc:	099000ef          	jal	ra,80410174 <memset>
8040f8e0:	00a4a423          	sw	a0,8(s1)
8040f8e4:	fe09f993          	andi	s3,s3,-32
8040f8e8:	04898663          	beq	s3,s0,8040f934 <bitmap_create+0xbc>
8040f8ec:	fff90913          	addi	s2,s2,-1
8040f8f0:	00591793          	slli	a5,s2,0x5
8040f8f4:	00545713          	srli	a4,s0,0x5
8040f8f8:	40f407b3          	sub	a5,s0,a5
8040f8fc:	0b271663          	bne	a4,s2,8040f9a8 <bitmap_create+0x130>
8040f900:	fff78693          	addi	a3,a5,-1
8040f904:	01e00613          	li	a2,30
8040f908:	08d66063          	bltu	a2,a3,8040f988 <bitmap_create+0x110>
8040f90c:	00271713          	slli	a4,a4,0x2
8040f910:	00e50533          	add	a0,a0,a4
8040f914:	00052703          	lw	a4,0(a0)
8040f918:	00100593          	li	a1,1
8040f91c:	02000613          	li	a2,32
8040f920:	00f596b3          	sll	a3,a1,a5
8040f924:	00178793          	addi	a5,a5,1
8040f928:	00d74733          	xor	a4,a4,a3
8040f92c:	fec79ae3          	bne	a5,a2,8040f920 <bitmap_create+0xa8>
8040f930:	00e52023          	sw	a4,0(a0)
8040f934:	01c12083          	lw	ra,28(sp)
8040f938:	01812403          	lw	s0,24(sp)
8040f93c:	01012903          	lw	s2,16(sp)
8040f940:	00c12983          	lw	s3,12(sp)
8040f944:	00812a03          	lw	s4,8(sp)
8040f948:	00048513          	mv	a0,s1
8040f94c:	01412483          	lw	s1,20(sp)
8040f950:	02010113          	addi	sp,sp,32
8040f954:	00008067          	ret
8040f958:	00048513          	mv	a0,s1
8040f95c:	dd8f30ef          	jal	ra,80402f34 <kfree>
8040f960:	00000493          	li	s1,0
8040f964:	fd1ff06f          	j	8040f934 <bitmap_create+0xbc>
8040f968:	00005697          	auipc	a3,0x5
8040f96c:	cbc68693          	addi	a3,a3,-836 # 80414624 <sfs_node_fileops+0x1d4>
8040f970:	00001617          	auipc	a2,0x1
8040f974:	35060613          	addi	a2,a2,848 # 80410cc0 <commands+0x3c>
8040f978:	01500593          	li	a1,21
8040f97c:	00005517          	auipc	a0,0x5
8040f980:	c9050513          	addi	a0,a0,-880 # 8041460c <sfs_node_fileops+0x1bc>
8040f984:	949f00ef          	jal	ra,804002cc <__panic>
8040f988:	00005697          	auipc	a3,0x5
8040f98c:	cdc68693          	addi	a3,a3,-804 # 80414664 <sfs_node_fileops+0x214>
8040f990:	00001617          	auipc	a2,0x1
8040f994:	33060613          	addi	a2,a2,816 # 80410cc0 <commands+0x3c>
8040f998:	02b00593          	li	a1,43
8040f99c:	00005517          	auipc	a0,0x5
8040f9a0:	c7050513          	addi	a0,a0,-912 # 8041460c <sfs_node_fileops+0x1bc>
8040f9a4:	929f00ef          	jal	ra,804002cc <__panic>
8040f9a8:	00005697          	auipc	a3,0x5
8040f9ac:	ca468693          	addi	a3,a3,-860 # 8041464c <sfs_node_fileops+0x1fc>
8040f9b0:	00001617          	auipc	a2,0x1
8040f9b4:	31060613          	addi	a2,a2,784 # 80410cc0 <commands+0x3c>
8040f9b8:	02a00593          	li	a1,42
8040f9bc:	00005517          	auipc	a0,0x5
8040f9c0:	c5050513          	addi	a0,a0,-944 # 8041460c <sfs_node_fileops+0x1bc>
8040f9c4:	909f00ef          	jal	ra,804002cc <__panic>

8040f9c8 <bitmap_alloc>:
8040f9c8:	00452603          	lw	a2,4(a0)
8040f9cc:	00852783          	lw	a5,8(a0)
8040f9d0:	06060063          	beqz	a2,8040fa30 <bitmap_alloc+0x68>
8040f9d4:	00000713          	li	a4,0
8040f9d8:	0100006f          	j	8040f9e8 <bitmap_alloc+0x20>
8040f9dc:	00170713          	addi	a4,a4,1
8040f9e0:	00478793          	addi	a5,a5,4
8040f9e4:	04e60663          	beq	a2,a4,8040fa30 <bitmap_alloc+0x68>
8040f9e8:	0007a683          	lw	a3,0(a5)
8040f9ec:	fe0688e3          	beqz	a3,8040f9dc <bitmap_alloc+0x14>
8040f9f0:	00000613          	li	a2,0
8040f9f4:	00100893          	li	a7,1
8040f9f8:	02000313          	li	t1,32
8040f9fc:	00c0006f          	j	8040fa08 <bitmap_alloc+0x40>
8040fa00:	00160613          	addi	a2,a2,1
8040fa04:	02660a63          	beq	a2,t1,8040fa38 <bitmap_alloc+0x70>
8040fa08:	00c89533          	sll	a0,a7,a2
8040fa0c:	00a6f833          	and	a6,a3,a0
8040fa10:	fe0808e3          	beqz	a6,8040fa00 <bitmap_alloc+0x38>
8040fa14:	00a6c6b3          	xor	a3,a3,a0
8040fa18:	00571713          	slli	a4,a4,0x5
8040fa1c:	00d7a023          	sw	a3,0(a5)
8040fa20:	00c70733          	add	a4,a4,a2
8040fa24:	00e5a023          	sw	a4,0(a1)
8040fa28:	00000513          	li	a0,0
8040fa2c:	00008067          	ret
8040fa30:	ffc00513          	li	a0,-4
8040fa34:	00008067          	ret
8040fa38:	ff010113          	addi	sp,sp,-16
8040fa3c:	00003697          	auipc	a3,0x3
8040fa40:	c3068693          	addi	a3,a3,-976 # 8041266c <default_pmm_manager+0x440>
8040fa44:	00001617          	auipc	a2,0x1
8040fa48:	27c60613          	addi	a2,a2,636 # 80410cc0 <commands+0x3c>
8040fa4c:	04300593          	li	a1,67
8040fa50:	00005517          	auipc	a0,0x5
8040fa54:	bbc50513          	addi	a0,a0,-1092 # 8041460c <sfs_node_fileops+0x1bc>
8040fa58:	00112623          	sw	ra,12(sp)
8040fa5c:	871f00ef          	jal	ra,804002cc <__panic>

8040fa60 <bitmap_test>:
8040fa60:	00052783          	lw	a5,0(a0)
8040fa64:	02f5f463          	bgeu	a1,a5,8040fa8c <bitmap_test+0x2c>
8040fa68:	00852783          	lw	a5,8(a0)
8040fa6c:	0055d713          	srli	a4,a1,0x5
8040fa70:	00271713          	slli	a4,a4,0x2
8040fa74:	00e787b3          	add	a5,a5,a4
8040fa78:	0007a503          	lw	a0,0(a5)
8040fa7c:	00100793          	li	a5,1
8040fa80:	00b795b3          	sll	a1,a5,a1
8040fa84:	00a5f533          	and	a0,a1,a0
8040fa88:	00008067          	ret
8040fa8c:	ff010113          	addi	sp,sp,-16
8040fa90:	00112623          	sw	ra,12(sp)
8040fa94:	dbdff0ef          	jal	ra,8040f850 <bitmap_translate.part.0>

8040fa98 <bitmap_free>:
8040fa98:	00052783          	lw	a5,0(a0)
8040fa9c:	ff010113          	addi	sp,sp,-16
8040faa0:	00112623          	sw	ra,12(sp)
8040faa4:	02f5fe63          	bgeu	a1,a5,8040fae0 <bitmap_free+0x48>
8040faa8:	00852783          	lw	a5,8(a0)
8040faac:	0055d713          	srli	a4,a1,0x5
8040fab0:	00271713          	slli	a4,a4,0x2
8040fab4:	00e787b3          	add	a5,a5,a4
8040fab8:	0007a703          	lw	a4,0(a5)
8040fabc:	00100693          	li	a3,1
8040fac0:	00b695b3          	sll	a1,a3,a1
8040fac4:	00b776b3          	and	a3,a4,a1
8040fac8:	00069e63          	bnez	a3,8040fae4 <bitmap_free+0x4c>
8040facc:	00c12083          	lw	ra,12(sp)
8040fad0:	00b76733          	or	a4,a4,a1
8040fad4:	00e7a023          	sw	a4,0(a5)
8040fad8:	01010113          	addi	sp,sp,16
8040fadc:	00008067          	ret
8040fae0:	d71ff0ef          	jal	ra,8040f850 <bitmap_translate.part.0>
8040fae4:	00005697          	auipc	a3,0x5
8040fae8:	ba868693          	addi	a3,a3,-1112 # 8041468c <sfs_node_fileops+0x23c>
8040faec:	00001617          	auipc	a2,0x1
8040faf0:	1d460613          	addi	a2,a2,468 # 80410cc0 <commands+0x3c>
8040faf4:	05f00593          	li	a1,95
8040faf8:	00005517          	auipc	a0,0x5
8040fafc:	b1450513          	addi	a0,a0,-1260 # 8041460c <sfs_node_fileops+0x1bc>
8040fb00:	fccf00ef          	jal	ra,804002cc <__panic>

8040fb04 <bitmap_destroy>:
8040fb04:	ff010113          	addi	sp,sp,-16
8040fb08:	00812423          	sw	s0,8(sp)
8040fb0c:	00050413          	mv	s0,a0
8040fb10:	00852503          	lw	a0,8(a0)
8040fb14:	00112623          	sw	ra,12(sp)
8040fb18:	c1cf30ef          	jal	ra,80402f34 <kfree>
8040fb1c:	00040513          	mv	a0,s0
8040fb20:	00812403          	lw	s0,8(sp)
8040fb24:	00c12083          	lw	ra,12(sp)
8040fb28:	01010113          	addi	sp,sp,16
8040fb2c:	c08f306f          	j	80402f34 <kfree>

8040fb30 <bitmap_getdata>:
8040fb30:	00058863          	beqz	a1,8040fb40 <bitmap_getdata+0x10>
8040fb34:	00452783          	lw	a5,4(a0)
8040fb38:	00279793          	slli	a5,a5,0x2
8040fb3c:	00f5a023          	sw	a5,0(a1)
8040fb40:	00852503          	lw	a0,8(a0)
8040fb44:	00008067          	ret

8040fb48 <sfs_rwblock_nolock>:
8040fb48:	fe010113          	addi	sp,sp,-32
8040fb4c:	00812c23          	sw	s0,24(sp)
8040fb50:	00912a23          	sw	s1,20(sp)
8040fb54:	00112e23          	sw	ra,28(sp)
8040fb58:	00060793          	mv	a5,a2
8040fb5c:	00050413          	mv	s0,a0
8040fb60:	00068493          	mv	s1,a3
8040fb64:	00061463          	bnez	a2,8040fb6c <sfs_rwblock_nolock+0x24>
8040fb68:	04071263          	bnez	a4,8040fbac <sfs_rwblock_nolock+0x64>
8040fb6c:	00442703          	lw	a4,4(s0)
8040fb70:	02e7fe63          	bgeu	a5,a4,8040fbac <sfs_rwblock_nolock+0x64>
8040fb74:	00001637          	lui	a2,0x1
8040fb78:	00c79693          	slli	a3,a5,0xc
8040fb7c:	00010513          	mv	a0,sp
8040fb80:	e58f80ef          	jal	ra,804081d8 <iobuf_init>
8040fb84:	00050593          	mv	a1,a0
8040fb88:	02c42503          	lw	a0,44(s0)
8040fb8c:	00048613          	mv	a2,s1
8040fb90:	01052703          	lw	a4,16(a0)
8040fb94:	000700e7          	jalr	a4
8040fb98:	01c12083          	lw	ra,28(sp)
8040fb9c:	01812403          	lw	s0,24(sp)
8040fba0:	01412483          	lw	s1,20(sp)
8040fba4:	02010113          	addi	sp,sp,32
8040fba8:	00008067          	ret
8040fbac:	00005697          	auipc	a3,0x5
8040fbb0:	af068693          	addi	a3,a3,-1296 # 8041469c <sfs_node_fileops+0x24c>
8040fbb4:	00001617          	auipc	a2,0x1
8040fbb8:	10c60613          	addi	a2,a2,268 # 80410cc0 <commands+0x3c>
8040fbbc:	01500593          	li	a1,21
8040fbc0:	00005517          	auipc	a0,0x5
8040fbc4:	b1050513          	addi	a0,a0,-1264 # 804146d0 <sfs_node_fileops+0x280>
8040fbc8:	f04f00ef          	jal	ra,804002cc <__panic>

8040fbcc <sfs_rblock>:
8040fbcc:	fe010113          	addi	sp,sp,-32
8040fbd0:	01312623          	sw	s3,12(sp)
8040fbd4:	00068993          	mv	s3,a3
8040fbd8:	00812c23          	sw	s0,24(sp)
8040fbdc:	01212823          	sw	s2,16(sp)
8040fbe0:	01412423          	sw	s4,8(sp)
8040fbe4:	00112e23          	sw	ra,28(sp)
8040fbe8:	00912a23          	sw	s1,20(sp)
8040fbec:	01512223          	sw	s5,4(sp)
8040fbf0:	00050a13          	mv	s4,a0
8040fbf4:	00058913          	mv	s2,a1
8040fbf8:	00060413          	mv	s0,a2
8040fbfc:	f98fd0ef          	jal	ra,8040d394 <lock_sfs_io>
8040fc00:	06098663          	beqz	s3,8040fc6c <sfs_rblock+0xa0>
8040fc04:	013409b3          	add	s3,s0,s3
8040fc08:	00001ab7          	lui	s5,0x1
8040fc0c:	00c0006f          	j	8040fc18 <sfs_rblock+0x4c>
8040fc10:	01590933          	add	s2,s2,s5
8040fc14:	04898c63          	beq	s3,s0,8040fc6c <sfs_rblock+0xa0>
8040fc18:	00040613          	mv	a2,s0
8040fc1c:	00090593          	mv	a1,s2
8040fc20:	00100713          	li	a4,1
8040fc24:	00000693          	li	a3,0
8040fc28:	000a0513          	mv	a0,s4
8040fc2c:	f1dff0ef          	jal	ra,8040fb48 <sfs_rwblock_nolock>
8040fc30:	00050493          	mv	s1,a0
8040fc34:	00140413          	addi	s0,s0,1
8040fc38:	fc050ce3          	beqz	a0,8040fc10 <sfs_rblock+0x44>
8040fc3c:	000a0513          	mv	a0,s4
8040fc40:	f64fd0ef          	jal	ra,8040d3a4 <unlock_sfs_io>
8040fc44:	01c12083          	lw	ra,28(sp)
8040fc48:	01812403          	lw	s0,24(sp)
8040fc4c:	01012903          	lw	s2,16(sp)
8040fc50:	00c12983          	lw	s3,12(sp)
8040fc54:	00812a03          	lw	s4,8(sp)
8040fc58:	00412a83          	lw	s5,4(sp)
8040fc5c:	00048513          	mv	a0,s1
8040fc60:	01412483          	lw	s1,20(sp)
8040fc64:	02010113          	addi	sp,sp,32
8040fc68:	00008067          	ret
8040fc6c:	00000493          	li	s1,0
8040fc70:	fcdff06f          	j	8040fc3c <sfs_rblock+0x70>

8040fc74 <sfs_wblock>:
8040fc74:	fe010113          	addi	sp,sp,-32
8040fc78:	01312623          	sw	s3,12(sp)
8040fc7c:	00068993          	mv	s3,a3
8040fc80:	00812c23          	sw	s0,24(sp)
8040fc84:	01212823          	sw	s2,16(sp)
8040fc88:	01412423          	sw	s4,8(sp)
8040fc8c:	00112e23          	sw	ra,28(sp)
8040fc90:	00912a23          	sw	s1,20(sp)
8040fc94:	01512223          	sw	s5,4(sp)
8040fc98:	00050a13          	mv	s4,a0
8040fc9c:	00058913          	mv	s2,a1
8040fca0:	00060413          	mv	s0,a2
8040fca4:	ef0fd0ef          	jal	ra,8040d394 <lock_sfs_io>
8040fca8:	06098663          	beqz	s3,8040fd14 <sfs_wblock+0xa0>
8040fcac:	013409b3          	add	s3,s0,s3
8040fcb0:	00001ab7          	lui	s5,0x1
8040fcb4:	00c0006f          	j	8040fcc0 <sfs_wblock+0x4c>
8040fcb8:	01590933          	add	s2,s2,s5
8040fcbc:	04898c63          	beq	s3,s0,8040fd14 <sfs_wblock+0xa0>
8040fcc0:	00040613          	mv	a2,s0
8040fcc4:	00090593          	mv	a1,s2
8040fcc8:	00100713          	li	a4,1
8040fccc:	00100693          	li	a3,1
8040fcd0:	000a0513          	mv	a0,s4
8040fcd4:	e75ff0ef          	jal	ra,8040fb48 <sfs_rwblock_nolock>
8040fcd8:	00050493          	mv	s1,a0
8040fcdc:	00140413          	addi	s0,s0,1
8040fce0:	fc050ce3          	beqz	a0,8040fcb8 <sfs_wblock+0x44>
8040fce4:	000a0513          	mv	a0,s4
8040fce8:	ebcfd0ef          	jal	ra,8040d3a4 <unlock_sfs_io>
8040fcec:	01c12083          	lw	ra,28(sp)
8040fcf0:	01812403          	lw	s0,24(sp)
8040fcf4:	01012903          	lw	s2,16(sp)
8040fcf8:	00c12983          	lw	s3,12(sp)
8040fcfc:	00812a03          	lw	s4,8(sp)
8040fd00:	00412a83          	lw	s5,4(sp)
8040fd04:	00048513          	mv	a0,s1
8040fd08:	01412483          	lw	s1,20(sp)
8040fd0c:	02010113          	addi	sp,sp,32
8040fd10:	00008067          	ret
8040fd14:	00000493          	li	s1,0
8040fd18:	fcdff06f          	j	8040fce4 <sfs_wblock+0x70>

8040fd1c <sfs_rbuf>:
8040fd1c:	fe010113          	addi	sp,sp,-32
8040fd20:	00112e23          	sw	ra,28(sp)
8040fd24:	00812c23          	sw	s0,24(sp)
8040fd28:	00912a23          	sw	s1,20(sp)
8040fd2c:	01212823          	sw	s2,16(sp)
8040fd30:	01312623          	sw	s3,12(sp)
8040fd34:	01412423          	sw	s4,8(sp)
8040fd38:	000017b7          	lui	a5,0x1
8040fd3c:	08f77463          	bgeu	a4,a5,8040fdc4 <sfs_rbuf+0xa8>
8040fd40:	00070493          	mv	s1,a4
8040fd44:	00c70733          	add	a4,a4,a2
8040fd48:	00060993          	mv	s3,a2
8040fd4c:	06e7ec63          	bltu	a5,a4,8040fdc4 <sfs_rbuf+0xa8>
8040fd50:	00068913          	mv	s2,a3
8040fd54:	00050413          	mv	s0,a0
8040fd58:	00058a13          	mv	s4,a1
8040fd5c:	e38fd0ef          	jal	ra,8040d394 <lock_sfs_io>
8040fd60:	03842583          	lw	a1,56(s0)
8040fd64:	00090613          	mv	a2,s2
8040fd68:	00100713          	li	a4,1
8040fd6c:	00000693          	li	a3,0
8040fd70:	00040513          	mv	a0,s0
8040fd74:	dd5ff0ef          	jal	ra,8040fb48 <sfs_rwblock_nolock>
8040fd78:	00050913          	mv	s2,a0
8040fd7c:	02050863          	beqz	a0,8040fdac <sfs_rbuf+0x90>
8040fd80:	00040513          	mv	a0,s0
8040fd84:	e20fd0ef          	jal	ra,8040d3a4 <unlock_sfs_io>
8040fd88:	01c12083          	lw	ra,28(sp)
8040fd8c:	01812403          	lw	s0,24(sp)
8040fd90:	01412483          	lw	s1,20(sp)
8040fd94:	00c12983          	lw	s3,12(sp)
8040fd98:	00812a03          	lw	s4,8(sp)
8040fd9c:	00090513          	mv	a0,s2
8040fda0:	01012903          	lw	s2,16(sp)
8040fda4:	02010113          	addi	sp,sp,32
8040fda8:	00008067          	ret
8040fdac:	03842583          	lw	a1,56(s0)
8040fdb0:	00098613          	mv	a2,s3
8040fdb4:	000a0513          	mv	a0,s4
8040fdb8:	009585b3          	add	a1,a1,s1
8040fdbc:	428000ef          	jal	ra,804101e4 <memcpy>
8040fdc0:	fc1ff06f          	j	8040fd80 <sfs_rbuf+0x64>
8040fdc4:	00005697          	auipc	a3,0x5
8040fdc8:	92468693          	addi	a3,a3,-1756 # 804146e8 <sfs_node_fileops+0x298>
8040fdcc:	00001617          	auipc	a2,0x1
8040fdd0:	ef460613          	addi	a2,a2,-268 # 80410cc0 <commands+0x3c>
8040fdd4:	05500593          	li	a1,85
8040fdd8:	00005517          	auipc	a0,0x5
8040fddc:	8f850513          	addi	a0,a0,-1800 # 804146d0 <sfs_node_fileops+0x280>
8040fde0:	cecf00ef          	jal	ra,804002cc <__panic>

8040fde4 <sfs_wbuf>:
8040fde4:	fe010113          	addi	sp,sp,-32
8040fde8:	00112e23          	sw	ra,28(sp)
8040fdec:	00812c23          	sw	s0,24(sp)
8040fdf0:	00912a23          	sw	s1,20(sp)
8040fdf4:	01212823          	sw	s2,16(sp)
8040fdf8:	01312623          	sw	s3,12(sp)
8040fdfc:	01412423          	sw	s4,8(sp)
8040fe00:	01512223          	sw	s5,4(sp)
8040fe04:	000017b7          	lui	a5,0x1
8040fe08:	0af77463          	bgeu	a4,a5,8040feb0 <sfs_wbuf+0xcc>
8040fe0c:	00070913          	mv	s2,a4
8040fe10:	00c70733          	add	a4,a4,a2
8040fe14:	00060a13          	mv	s4,a2
8040fe18:	08e7ec63          	bltu	a5,a4,8040feb0 <sfs_wbuf+0xcc>
8040fe1c:	00050413          	mv	s0,a0
8040fe20:	00068993          	mv	s3,a3
8040fe24:	00058a93          	mv	s5,a1
8040fe28:	d6cfd0ef          	jal	ra,8040d394 <lock_sfs_io>
8040fe2c:	03842583          	lw	a1,56(s0)
8040fe30:	00100713          	li	a4,1
8040fe34:	00000693          	li	a3,0
8040fe38:	00098613          	mv	a2,s3
8040fe3c:	00040513          	mv	a0,s0
8040fe40:	d09ff0ef          	jal	ra,8040fb48 <sfs_rwblock_nolock>
8040fe44:	00050493          	mv	s1,a0
8040fe48:	02050a63          	beqz	a0,8040fe7c <sfs_wbuf+0x98>
8040fe4c:	00040513          	mv	a0,s0
8040fe50:	d54fd0ef          	jal	ra,8040d3a4 <unlock_sfs_io>
8040fe54:	01c12083          	lw	ra,28(sp)
8040fe58:	01812403          	lw	s0,24(sp)
8040fe5c:	01012903          	lw	s2,16(sp)
8040fe60:	00c12983          	lw	s3,12(sp)
8040fe64:	00812a03          	lw	s4,8(sp)
8040fe68:	00412a83          	lw	s5,4(sp)
8040fe6c:	00048513          	mv	a0,s1
8040fe70:	01412483          	lw	s1,20(sp)
8040fe74:	02010113          	addi	sp,sp,32
8040fe78:	00008067          	ret
8040fe7c:	03842503          	lw	a0,56(s0)
8040fe80:	000a0613          	mv	a2,s4
8040fe84:	000a8593          	mv	a1,s5
8040fe88:	01250533          	add	a0,a0,s2
8040fe8c:	358000ef          	jal	ra,804101e4 <memcpy>
8040fe90:	03842583          	lw	a1,56(s0)
8040fe94:	00100713          	li	a4,1
8040fe98:	00100693          	li	a3,1
8040fe9c:	00098613          	mv	a2,s3
8040fea0:	00040513          	mv	a0,s0
8040fea4:	ca5ff0ef          	jal	ra,8040fb48 <sfs_rwblock_nolock>
8040fea8:	00050493          	mv	s1,a0
8040feac:	fa1ff06f          	j	8040fe4c <sfs_wbuf+0x68>
8040feb0:	00005697          	auipc	a3,0x5
8040feb4:	83868693          	addi	a3,a3,-1992 # 804146e8 <sfs_node_fileops+0x298>
8040feb8:	00001617          	auipc	a2,0x1
8040febc:	e0860613          	addi	a2,a2,-504 # 80410cc0 <commands+0x3c>
8040fec0:	06b00593          	li	a1,107
8040fec4:	00005517          	auipc	a0,0x5
8040fec8:	80c50513          	addi	a0,a0,-2036 # 804146d0 <sfs_node_fileops+0x280>
8040fecc:	c00f00ef          	jal	ra,804002cc <__panic>

8040fed0 <sfs_sync_super>:
8040fed0:	ff010113          	addi	sp,sp,-16
8040fed4:	00112623          	sw	ra,12(sp)
8040fed8:	00812423          	sw	s0,8(sp)
8040fedc:	00912223          	sw	s1,4(sp)
8040fee0:	00050413          	mv	s0,a0
8040fee4:	cb0fd0ef          	jal	ra,8040d394 <lock_sfs_io>
8040fee8:	03842503          	lw	a0,56(s0)
8040feec:	00001637          	lui	a2,0x1
8040fef0:	00000593          	li	a1,0
8040fef4:	280000ef          	jal	ra,80410174 <memset>
8040fef8:	03842503          	lw	a0,56(s0)
8040fefc:	00040593          	mv	a1,s0
8040ff00:	02c00613          	li	a2,44
8040ff04:	2e0000ef          	jal	ra,804101e4 <memcpy>
8040ff08:	03842583          	lw	a1,56(s0)
8040ff0c:	00000713          	li	a4,0
8040ff10:	00100693          	li	a3,1
8040ff14:	00000613          	li	a2,0
8040ff18:	00040513          	mv	a0,s0
8040ff1c:	c2dff0ef          	jal	ra,8040fb48 <sfs_rwblock_nolock>
8040ff20:	00050493          	mv	s1,a0
8040ff24:	00040513          	mv	a0,s0
8040ff28:	c7cfd0ef          	jal	ra,8040d3a4 <unlock_sfs_io>
8040ff2c:	00c12083          	lw	ra,12(sp)
8040ff30:	00812403          	lw	s0,8(sp)
8040ff34:	00048513          	mv	a0,s1
8040ff38:	00412483          	lw	s1,4(sp)
8040ff3c:	01010113          	addi	sp,sp,16
8040ff40:	00008067          	ret

8040ff44 <sfs_sync_freemap>:
8040ff44:	fe010113          	addi	sp,sp,-32
8040ff48:	01312623          	sw	s3,12(sp)
8040ff4c:	01412423          	sw	s4,8(sp)
8040ff50:	00452983          	lw	s3,4(a0)
8040ff54:	00050a13          	mv	s4,a0
8040ff58:	03052503          	lw	a0,48(a0)
8040ff5c:	000087b7          	lui	a5,0x8
8040ff60:	fff78793          	addi	a5,a5,-1 # 7fff <_binary_bin_swap_img_size-0x1>
8040ff64:	00000593          	li	a1,0
8040ff68:	01212823          	sw	s2,16(sp)
8040ff6c:	00112e23          	sw	ra,28(sp)
8040ff70:	00812c23          	sw	s0,24(sp)
8040ff74:	00912a23          	sw	s1,20(sp)
8040ff78:	01512223          	sw	s5,4(sp)
8040ff7c:	00f989b3          	add	s3,s3,a5
8040ff80:	bb1ff0ef          	jal	ra,8040fb30 <bitmap_getdata>
8040ff84:	00f9d993          	srli	s3,s3,0xf
8040ff88:	00050913          	mv	s2,a0
8040ff8c:	000a0513          	mv	a0,s4
8040ff90:	c04fd0ef          	jal	ra,8040d394 <lock_sfs_io>
8040ff94:	06098863          	beqz	s3,80410004 <sfs_sync_freemap+0xc0>
8040ff98:	00200493          	li	s1,2
8040ff9c:	00001ab7          	lui	s5,0x1
8040ffa0:	00298993          	addi	s3,s3,2
8040ffa4:	00c0006f          	j	8040ffb0 <sfs_sync_freemap+0x6c>
8040ffa8:	01590933          	add	s2,s2,s5
8040ffac:	05348c63          	beq	s1,s3,80410004 <sfs_sync_freemap+0xc0>
8040ffb0:	00048613          	mv	a2,s1
8040ffb4:	00090593          	mv	a1,s2
8040ffb8:	00100713          	li	a4,1
8040ffbc:	00100693          	li	a3,1
8040ffc0:	000a0513          	mv	a0,s4
8040ffc4:	b85ff0ef          	jal	ra,8040fb48 <sfs_rwblock_nolock>
8040ffc8:	00050413          	mv	s0,a0
8040ffcc:	00148493          	addi	s1,s1,1
8040ffd0:	fc050ce3          	beqz	a0,8040ffa8 <sfs_sync_freemap+0x64>
8040ffd4:	000a0513          	mv	a0,s4
8040ffd8:	bccfd0ef          	jal	ra,8040d3a4 <unlock_sfs_io>
8040ffdc:	01c12083          	lw	ra,28(sp)
8040ffe0:	00040513          	mv	a0,s0
8040ffe4:	01812403          	lw	s0,24(sp)
8040ffe8:	01412483          	lw	s1,20(sp)
8040ffec:	01012903          	lw	s2,16(sp)
8040fff0:	00c12983          	lw	s3,12(sp)
8040fff4:	00812a03          	lw	s4,8(sp)
8040fff8:	00412a83          	lw	s5,4(sp)
8040fffc:	02010113          	addi	sp,sp,32
80410000:	00008067          	ret
80410004:	00000413          	li	s0,0
80410008:	fcdff06f          	j	8040ffd4 <sfs_sync_freemap+0x90>

8041000c <sfs_clear_block>:
8041000c:	fe010113          	addi	sp,sp,-32
80410010:	00812c23          	sw	s0,24(sp)
80410014:	01212823          	sw	s2,16(sp)
80410018:	01312623          	sw	s3,12(sp)
8041001c:	00112e23          	sw	ra,28(sp)
80410020:	00060993          	mv	s3,a2
80410024:	00912a23          	sw	s1,20(sp)
80410028:	00050913          	mv	s2,a0
8041002c:	00058413          	mv	s0,a1
80410030:	b64fd0ef          	jal	ra,8040d394 <lock_sfs_io>
80410034:	03892503          	lw	a0,56(s2)
80410038:	00001637          	lui	a2,0x1
8041003c:	00000593          	li	a1,0
80410040:	134000ef          	jal	ra,80410174 <memset>
80410044:	04098e63          	beqz	s3,804100a0 <sfs_clear_block+0x94>
80410048:	013409b3          	add	s3,s0,s3
8041004c:	0080006f          	j	80410054 <sfs_clear_block+0x48>
80410050:	04898863          	beq	s3,s0,804100a0 <sfs_clear_block+0x94>
80410054:	03892583          	lw	a1,56(s2)
80410058:	00040613          	mv	a2,s0
8041005c:	00100713          	li	a4,1
80410060:	00100693          	li	a3,1
80410064:	00090513          	mv	a0,s2
80410068:	ae1ff0ef          	jal	ra,8040fb48 <sfs_rwblock_nolock>
8041006c:	00050493          	mv	s1,a0
80410070:	00140413          	addi	s0,s0,1
80410074:	fc050ee3          	beqz	a0,80410050 <sfs_clear_block+0x44>
80410078:	00090513          	mv	a0,s2
8041007c:	b28fd0ef          	jal	ra,8040d3a4 <unlock_sfs_io>
80410080:	01c12083          	lw	ra,28(sp)
80410084:	01812403          	lw	s0,24(sp)
80410088:	01012903          	lw	s2,16(sp)
8041008c:	00c12983          	lw	s3,12(sp)
80410090:	00048513          	mv	a0,s1
80410094:	01412483          	lw	s1,20(sp)
80410098:	02010113          	addi	sp,sp,32
8041009c:	00008067          	ret
804100a0:	00000493          	li	s1,0
804100a4:	fd5ff06f          	j	80410078 <sfs_clear_block+0x6c>

804100a8 <strlen>:
804100a8:	00054783          	lbu	a5,0(a0)
804100ac:	00050713          	mv	a4,a0
804100b0:	00000513          	li	a0,0
804100b4:	00078c63          	beqz	a5,804100cc <strlen+0x24>
804100b8:	00150513          	addi	a0,a0,1
804100bc:	00a707b3          	add	a5,a4,a0
804100c0:	0007c783          	lbu	a5,0(a5)
804100c4:	fe079ae3          	bnez	a5,804100b8 <strlen+0x10>
804100c8:	00008067          	ret
804100cc:	00008067          	ret

804100d0 <strnlen>:
804100d0:	00000793          	li	a5,0
804100d4:	00059863          	bnez	a1,804100e4 <strnlen+0x14>
804100d8:	01c0006f          	j	804100f4 <strnlen+0x24>
804100dc:	00178793          	addi	a5,a5,1
804100e0:	00f58a63          	beq	a1,a5,804100f4 <strnlen+0x24>
804100e4:	00f50733          	add	a4,a0,a5
804100e8:	00074703          	lbu	a4,0(a4)
804100ec:	fe0718e3          	bnez	a4,804100dc <strnlen+0xc>
804100f0:	00078593          	mv	a1,a5
804100f4:	00058513          	mv	a0,a1
804100f8:	00008067          	ret

804100fc <strcpy>:
804100fc:	00050793          	mv	a5,a0
80410100:	0005c703          	lbu	a4,0(a1)
80410104:	00178793          	addi	a5,a5,1
80410108:	00158593          	addi	a1,a1,1
8041010c:	fee78fa3          	sb	a4,-1(a5)
80410110:	fe0718e3          	bnez	a4,80410100 <strcpy+0x4>
80410114:	00008067          	ret

80410118 <strcmp>:
80410118:	00054783          	lbu	a5,0(a0)
8041011c:	0005c703          	lbu	a4,0(a1)
80410120:	00079a63          	bnez	a5,80410134 <strcmp+0x1c>
80410124:	01c0006f          	j	80410140 <strcmp+0x28>
80410128:	00054783          	lbu	a5,0(a0)
8041012c:	0005c703          	lbu	a4,0(a1)
80410130:	00078c63          	beqz	a5,80410148 <strcmp+0x30>
80410134:	00150513          	addi	a0,a0,1
80410138:	00158593          	addi	a1,a1,1
8041013c:	fee786e3          	beq	a5,a4,80410128 <strcmp+0x10>
80410140:	40e78533          	sub	a0,a5,a4
80410144:	00008067          	ret
80410148:	00000793          	li	a5,0
8041014c:	40e78533          	sub	a0,a5,a4
80410150:	00008067          	ret

80410154 <strchr>:
80410154:	00054783          	lbu	a5,0(a0)
80410158:	00078a63          	beqz	a5,8041016c <strchr+0x18>
8041015c:	00f58a63          	beq	a1,a5,80410170 <strchr+0x1c>
80410160:	00154783          	lbu	a5,1(a0)
80410164:	00150513          	addi	a0,a0,1
80410168:	fe079ae3          	bnez	a5,8041015c <strchr+0x8>
8041016c:	00000513          	li	a0,0
80410170:	00008067          	ret

80410174 <memset>:
80410174:	00060c63          	beqz	a2,8041018c <memset+0x18>
80410178:	00c50633          	add	a2,a0,a2
8041017c:	00050793          	mv	a5,a0
80410180:	00178793          	addi	a5,a5,1
80410184:	feb78fa3          	sb	a1,-1(a5)
80410188:	fec79ce3          	bne	a5,a2,80410180 <memset+0xc>
8041018c:	00008067          	ret

80410190 <memmove>:
80410190:	02a5f663          	bgeu	a1,a0,804101bc <memmove+0x2c>
80410194:	00c587b3          	add	a5,a1,a2
80410198:	02f57263          	bgeu	a0,a5,804101bc <memmove+0x2c>
8041019c:	00c50733          	add	a4,a0,a2
804101a0:	02060e63          	beqz	a2,804101dc <memmove+0x4c>
804101a4:	fff7c683          	lbu	a3,-1(a5)
804101a8:	fff78793          	addi	a5,a5,-1
804101ac:	fff70713          	addi	a4,a4,-1
804101b0:	00d70023          	sb	a3,0(a4)
804101b4:	fef598e3          	bne	a1,a5,804101a4 <memmove+0x14>
804101b8:	00008067          	ret
804101bc:	00c586b3          	add	a3,a1,a2
804101c0:	00050793          	mv	a5,a0
804101c4:	00060e63          	beqz	a2,804101e0 <memmove+0x50>
804101c8:	0005c703          	lbu	a4,0(a1)
804101cc:	00158593          	addi	a1,a1,1
804101d0:	00178793          	addi	a5,a5,1
804101d4:	fee78fa3          	sb	a4,-1(a5)
804101d8:	fed598e3          	bne	a1,a3,804101c8 <memmove+0x38>
804101dc:	00008067          	ret
804101e0:	00008067          	ret

804101e4 <memcpy>:
804101e4:	02060063          	beqz	a2,80410204 <memcpy+0x20>
804101e8:	00c58633          	add	a2,a1,a2
804101ec:	00050793          	mv	a5,a0
804101f0:	0005c703          	lbu	a4,0(a1)
804101f4:	00158593          	addi	a1,a1,1
804101f8:	00178793          	addi	a5,a5,1
804101fc:	fee78fa3          	sb	a4,-1(a5)
80410200:	fec598e3          	bne	a1,a2,804101f0 <memcpy+0xc>
80410204:	00008067          	ret

80410208 <printnum>:
80410208:	fd010113          	addi	sp,sp,-48
8041020c:	02912223          	sw	s1,36(sp)
80410210:	01312e23          	sw	s3,28(sp)
80410214:	00050493          	mv	s1,a0
80410218:	00058993          	mv	s3,a1
8041021c:	00068513          	mv	a0,a3
80410220:	00078593          	mv	a1,a5
80410224:	02812423          	sw	s0,40(sp)
80410228:	03212023          	sw	s2,32(sp)
8041022c:	01412c23          	sw	s4,24(sp)
80410230:	01512a23          	sw	s5,20(sp)
80410234:	01612823          	sw	s6,16(sp)
80410238:	01712623          	sw	s7,12(sp)
8041023c:	01812423          	sw	s8,8(sp)
80410240:	00080413          	mv	s0,a6
80410244:	02112623          	sw	ra,44(sp)
80410248:	00068b13          	mv	s6,a3
8041024c:	00078a93          	mv	s5,a5
80410250:	00060913          	mv	s2,a2
80410254:	00070c13          	mv	s8,a4
80410258:	00088a13          	mv	s4,a7
8041025c:	758000ef          	jal	ra,804109b4 <__umodsi3>
80410260:	00050b93          	mv	s7,a0
80410264:	fff40413          	addi	s0,s0,-1
80410268:	060c1863          	bnez	s8,804102d8 <printnum+0xd0>
8041026c:	075b7663          	bgeu	s6,s5,804102d8 <printnum+0xd0>
80410270:	00805e63          	blez	s0,8041028c <printnum+0x84>
80410274:	fff40413          	addi	s0,s0,-1
80410278:	00098613          	mv	a2,s3
8041027c:	00090593          	mv	a1,s2
80410280:	000a0513          	mv	a0,s4
80410284:	000480e7          	jalr	s1
80410288:	fe0416e3          	bnez	s0,80410274 <printnum+0x6c>
8041028c:	00004797          	auipc	a5,0x4
80410290:	4a078793          	addi	a5,a5,1184 # 8041472c <sfs_node_fileops+0x2dc>
80410294:	01778533          	add	a0,a5,s7
80410298:	02812403          	lw	s0,40(sp)
8041029c:	02c12083          	lw	ra,44(sp)
804102a0:	01812a03          	lw	s4,24(sp)
804102a4:	01412a83          	lw	s5,20(sp)
804102a8:	01012b03          	lw	s6,16(sp)
804102ac:	00c12b83          	lw	s7,12(sp)
804102b0:	00812c03          	lw	s8,8(sp)
804102b4:	00054503          	lbu	a0,0(a0)
804102b8:	00098613          	mv	a2,s3
804102bc:	00090593          	mv	a1,s2
804102c0:	01c12983          	lw	s3,28(sp)
804102c4:	02012903          	lw	s2,32(sp)
804102c8:	00048793          	mv	a5,s1
804102cc:	02412483          	lw	s1,36(sp)
804102d0:	03010113          	addi	sp,sp,48
804102d4:	00078067          	jr	a5
804102d8:	000a8593          	mv	a1,s5
804102dc:	000b0513          	mv	a0,s6
804102e0:	68c000ef          	jal	ra,8041096c <__udivsi3>
804102e4:	00050693          	mv	a3,a0
804102e8:	000a0893          	mv	a7,s4
804102ec:	00040813          	mv	a6,s0
804102f0:	000a8793          	mv	a5,s5
804102f4:	00000713          	li	a4,0
804102f8:	00090613          	mv	a2,s2
804102fc:	00098593          	mv	a1,s3
80410300:	00048513          	mv	a0,s1
80410304:	f05ff0ef          	jal	ra,80410208 <printnum>
80410308:	f85ff06f          	j	8041028c <printnum+0x84>

8041030c <sprintputch>:
8041030c:	0085a783          	lw	a5,8(a1)
80410310:	0005a703          	lw	a4,0(a1)
80410314:	0045a683          	lw	a3,4(a1)
80410318:	00178793          	addi	a5,a5,1
8041031c:	00f5a423          	sw	a5,8(a1)
80410320:	00d77863          	bgeu	a4,a3,80410330 <sprintputch+0x24>
80410324:	00170793          	addi	a5,a4,1
80410328:	00f5a023          	sw	a5,0(a1)
8041032c:	00a70023          	sb	a0,0(a4)
80410330:	00008067          	ret

80410334 <vprintfmt>:
80410334:	fb010113          	addi	sp,sp,-80
80410338:	04912223          	sw	s1,68(sp)
8041033c:	05212023          	sw	s2,64(sp)
80410340:	03312e23          	sw	s3,60(sp)
80410344:	03412c23          	sw	s4,56(sp)
80410348:	03512a23          	sw	s5,52(sp)
8041034c:	03612823          	sw	s6,48(sp)
80410350:	03712623          	sw	s7,44(sp)
80410354:	01b12e23          	sw	s11,28(sp)
80410358:	04112623          	sw	ra,76(sp)
8041035c:	04812423          	sw	s0,72(sp)
80410360:	03812423          	sw	s8,40(sp)
80410364:	03912223          	sw	s9,36(sp)
80410368:	03a12023          	sw	s10,32(sp)
8041036c:	00050993          	mv	s3,a0
80410370:	00058913          	mv	s2,a1
80410374:	00060493          	mv	s1,a2
80410378:	00068d93          	mv	s11,a3
8041037c:	00070a93          	mv	s5,a4
80410380:	02500a13          	li	s4,37
80410384:	00004b17          	auipc	s6,0x4
80410388:	3d0b0b13          	addi	s6,s6,976 # 80414754 <sfs_node_fileops+0x304>
8041038c:	fff00b93          	li	s7,-1
80410390:	000dc503          	lbu	a0,0(s11) # 2000 <_binary_bin_swap_img_size-0x6000>
80410394:	001d8413          	addi	s0,s11,1
80410398:	03450063          	beq	a0,s4,804103b8 <vprintfmt+0x84>
8041039c:	06050063          	beqz	a0,804103fc <vprintfmt+0xc8>
804103a0:	00090613          	mv	a2,s2
804103a4:	00048593          	mv	a1,s1
804103a8:	00140413          	addi	s0,s0,1
804103ac:	000980e7          	jalr	s3
804103b0:	fff44503          	lbu	a0,-1(s0)
804103b4:	ff4514e3          	bne	a0,s4,8041039c <vprintfmt+0x68>
804103b8:	00044683          	lbu	a3,0(s0)
804103bc:	02000893          	li	a7,32
804103c0:	00000d13          	li	s10,0
804103c4:	00000513          	li	a0,0
804103c8:	fff00c93          	li	s9,-1
804103cc:	fff00c13          	li	s8,-1
804103d0:	05500613          	li	a2,85
804103d4:	00900593          	li	a1,9
804103d8:	fdd68793          	addi	a5,a3,-35
804103dc:	0ff7f793          	andi	a5,a5,255
804103e0:	00140d93          	addi	s11,s0,1
804103e4:	06f66863          	bltu	a2,a5,80410454 <vprintfmt+0x120>
804103e8:	00279793          	slli	a5,a5,0x2
804103ec:	016787b3          	add	a5,a5,s6
804103f0:	0007a783          	lw	a5,0(a5)
804103f4:	016787b3          	add	a5,a5,s6
804103f8:	00078067          	jr	a5
804103fc:	04c12083          	lw	ra,76(sp)
80410400:	04812403          	lw	s0,72(sp)
80410404:	04412483          	lw	s1,68(sp)
80410408:	04012903          	lw	s2,64(sp)
8041040c:	03c12983          	lw	s3,60(sp)
80410410:	03812a03          	lw	s4,56(sp)
80410414:	03412a83          	lw	s5,52(sp)
80410418:	03012b03          	lw	s6,48(sp)
8041041c:	02c12b83          	lw	s7,44(sp)
80410420:	02812c03          	lw	s8,40(sp)
80410424:	02412c83          	lw	s9,36(sp)
80410428:	02012d03          	lw	s10,32(sp)
8041042c:	01c12d83          	lw	s11,28(sp)
80410430:	05010113          	addi	sp,sp,80
80410434:	00008067          	ret
80410438:	00068893          	mv	a7,a3
8041043c:	00144683          	lbu	a3,1(s0)
80410440:	000d8413          	mv	s0,s11
80410444:	00140d93          	addi	s11,s0,1
80410448:	fdd68793          	addi	a5,a3,-35
8041044c:	0ff7f793          	andi	a5,a5,255
80410450:	f8f67ce3          	bgeu	a2,a5,804103e8 <vprintfmt+0xb4>
80410454:	00090613          	mv	a2,s2
80410458:	00048593          	mv	a1,s1
8041045c:	02500513          	li	a0,37
80410460:	000980e7          	jalr	s3
80410464:	fff44783          	lbu	a5,-1(s0)
80410468:	00040d93          	mv	s11,s0
8041046c:	f34782e3          	beq	a5,s4,80410390 <vprintfmt+0x5c>
80410470:	ffedc783          	lbu	a5,-2(s11)
80410474:	fffd8d93          	addi	s11,s11,-1
80410478:	ff479ce3          	bne	a5,s4,80410470 <vprintfmt+0x13c>
8041047c:	f15ff06f          	j	80410390 <vprintfmt+0x5c>
80410480:	00144303          	lbu	t1,1(s0)
80410484:	fd068c93          	addi	s9,a3,-48
80410488:	000d8413          	mv	s0,s11
8041048c:	fd030793          	addi	a5,t1,-48
80410490:	00030693          	mv	a3,t1
80410494:	02f5e663          	bltu	a1,a5,804104c0 <vprintfmt+0x18c>
80410498:	002c9793          	slli	a5,s9,0x2
8041049c:	01978733          	add	a4,a5,s9
804104a0:	00140413          	addi	s0,s0,1
804104a4:	00171713          	slli	a4,a4,0x1
804104a8:	00670733          	add	a4,a4,t1
804104ac:	00044303          	lbu	t1,0(s0)
804104b0:	fd070c93          	addi	s9,a4,-48
804104b4:	fd030793          	addi	a5,t1,-48
804104b8:	00030693          	mv	a3,t1
804104bc:	fcf5fee3          	bgeu	a1,a5,80410498 <vprintfmt+0x164>
804104c0:	f00c5ce3          	bgez	s8,804103d8 <vprintfmt+0xa4>
804104c4:	000c8c13          	mv	s8,s9
804104c8:	fff00c93          	li	s9,-1
804104cc:	f0dff06f          	j	804103d8 <vprintfmt+0xa4>
804104d0:	fffc4793          	not	a5,s8
804104d4:	41f7d793          	srai	a5,a5,0x1f
804104d8:	00144683          	lbu	a3,1(s0)
804104dc:	00fc7c33          	and	s8,s8,a5
804104e0:	000d8413          	mv	s0,s11
804104e4:	ef5ff06f          	j	804103d8 <vprintfmt+0xa4>
804104e8:	000aac83          	lw	s9,0(s5) # 1000 <_binary_bin_swap_img_size-0x7000>
804104ec:	00144683          	lbu	a3,1(s0)
804104f0:	004a8a93          	addi	s5,s5,4
804104f4:	000d8413          	mv	s0,s11
804104f8:	fc9ff06f          	j	804104c0 <vprintfmt+0x18c>
804104fc:	00100793          	li	a5,1
80410500:	2ea7ce63          	blt	a5,a0,804107fc <vprintfmt+0x4c8>
80410504:	000aa683          	lw	a3,0(s5)
80410508:	00000713          	li	a4,0
8041050c:	004a8a93          	addi	s5,s5,4
80410510:	01000793          	li	a5,16
80410514:	000c0813          	mv	a6,s8
80410518:	00048613          	mv	a2,s1
8041051c:	00090593          	mv	a1,s2
80410520:	00098513          	mv	a0,s3
80410524:	ce5ff0ef          	jal	ra,80410208 <printnum>
80410528:	e69ff06f          	j	80410390 <vprintfmt+0x5c>
8041052c:	000aa503          	lw	a0,0(s5)
80410530:	00090613          	mv	a2,s2
80410534:	00048593          	mv	a1,s1
80410538:	004a8a93          	addi	s5,s5,4
8041053c:	000980e7          	jalr	s3
80410540:	e51ff06f          	j	80410390 <vprintfmt+0x5c>
80410544:	00100793          	li	a5,1
80410548:	28a7cc63          	blt	a5,a0,804107e0 <vprintfmt+0x4ac>
8041054c:	000aa683          	lw	a3,0(s5)
80410550:	00000713          	li	a4,0
80410554:	004a8a93          	addi	s5,s5,4
80410558:	00a00793          	li	a5,10
8041055c:	fb9ff06f          	j	80410514 <vprintfmt+0x1e0>
80410560:	00144683          	lbu	a3,1(s0)
80410564:	00100d13          	li	s10,1
80410568:	000d8413          	mv	s0,s11
8041056c:	e6dff06f          	j	804103d8 <vprintfmt+0xa4>
80410570:	00090613          	mv	a2,s2
80410574:	00048593          	mv	a1,s1
80410578:	02500513          	li	a0,37
8041057c:	000980e7          	jalr	s3
80410580:	e11ff06f          	j	80410390 <vprintfmt+0x5c>
80410584:	00144683          	lbu	a3,1(s0)
80410588:	00150513          	addi	a0,a0,1
8041058c:	000d8413          	mv	s0,s11
80410590:	e49ff06f          	j	804103d8 <vprintfmt+0xa4>
80410594:	00100793          	li	a5,1
80410598:	22a7c663          	blt	a5,a0,804107c4 <vprintfmt+0x490>
8041059c:	000aa683          	lw	a3,0(s5)
804105a0:	00000713          	li	a4,0
804105a4:	004a8a93          	addi	s5,s5,4
804105a8:	00800793          	li	a5,8
804105ac:	f69ff06f          	j	80410514 <vprintfmt+0x1e0>
804105b0:	03000513          	li	a0,48
804105b4:	00090613          	mv	a2,s2
804105b8:	00048593          	mv	a1,s1
804105bc:	01112423          	sw	a7,8(sp)
804105c0:	000980e7          	jalr	s3
804105c4:	00090613          	mv	a2,s2
804105c8:	00048593          	mv	a1,s1
804105cc:	07800513          	li	a0,120
804105d0:	000980e7          	jalr	s3
804105d4:	004a8a93          	addi	s5,s5,4
804105d8:	00812883          	lw	a7,8(sp)
804105dc:	00000713          	li	a4,0
804105e0:	01000793          	li	a5,16
804105e4:	ffcaa683          	lw	a3,-4(s5)
804105e8:	f2dff06f          	j	80410514 <vprintfmt+0x1e0>
804105ec:	000aa403          	lw	s0,0(s5)
804105f0:	004a8793          	addi	a5,s5,4
804105f4:	00f12623          	sw	a5,12(sp)
804105f8:	22040063          	beqz	s0,80410818 <vprintfmt+0x4e4>
804105fc:	17805063          	blez	s8,8041075c <vprintfmt+0x428>
80410600:	02d00793          	li	a5,45
80410604:	10f89e63          	bne	a7,a5,80410720 <vprintfmt+0x3ec>
80410608:	00044783          	lbu	a5,0(s0)
8041060c:	00078513          	mv	a0,a5
80410610:	04078663          	beqz	a5,8041065c <vprintfmt+0x328>
80410614:	00140a93          	addi	s5,s0,1
80410618:	05e00413          	li	s0,94
8041061c:	000cc663          	bltz	s9,80410628 <vprintfmt+0x2f4>
80410620:	fffc8c93          	addi	s9,s9,-1
80410624:	037c8a63          	beq	s9,s7,80410658 <vprintfmt+0x324>
80410628:	00090613          	mv	a2,s2
8041062c:	00048593          	mv	a1,s1
80410630:	140d0263          	beqz	s10,80410774 <vprintfmt+0x440>
80410634:	fe078793          	addi	a5,a5,-32
80410638:	12f47e63          	bgeu	s0,a5,80410774 <vprintfmt+0x440>
8041063c:	03f00513          	li	a0,63
80410640:	000980e7          	jalr	s3
80410644:	000ac783          	lbu	a5,0(s5)
80410648:	fffc0c13          	addi	s8,s8,-1
8041064c:	001a8a93          	addi	s5,s5,1
80410650:	00078513          	mv	a0,a5
80410654:	fc0794e3          	bnez	a5,8041061c <vprintfmt+0x2e8>
80410658:	01805e63          	blez	s8,80410674 <vprintfmt+0x340>
8041065c:	fffc0c13          	addi	s8,s8,-1
80410660:	00090613          	mv	a2,s2
80410664:	00048593          	mv	a1,s1
80410668:	02000513          	li	a0,32
8041066c:	000980e7          	jalr	s3
80410670:	fe0c16e3          	bnez	s8,8041065c <vprintfmt+0x328>
80410674:	00c12a83          	lw	s5,12(sp)
80410678:	d19ff06f          	j	80410390 <vprintfmt+0x5c>
8041067c:	00100793          	li	a5,1
80410680:	12a7c663          	blt	a5,a0,804107ac <vprintfmt+0x478>
80410684:	000aad03          	lw	s10,0(s5)
80410688:	004a8793          	addi	a5,s5,4
8041068c:	00078a93          	mv	s5,a5
80410690:	41fd5413          	srai	s0,s10,0x1f
80410694:	0e044463          	bltz	s0,8041077c <vprintfmt+0x448>
80410698:	000d0693          	mv	a3,s10
8041069c:	00040713          	mv	a4,s0
804106a0:	00a00793          	li	a5,10
804106a4:	e71ff06f          	j	80410514 <vprintfmt+0x1e0>
804106a8:	000aa703          	lw	a4,0(s5)
804106ac:	01800693          	li	a3,24
804106b0:	004a8a93          	addi	s5,s5,4
804106b4:	41f75793          	srai	a5,a4,0x1f
804106b8:	00e7c733          	xor	a4,a5,a4
804106bc:	40f70733          	sub	a4,a4,a5
804106c0:	02e6ce63          	blt	a3,a4,804106fc <vprintfmt+0x3c8>
804106c4:	00271793          	slli	a5,a4,0x2
804106c8:	00004697          	auipc	a3,0x4
804106cc:	39068693          	addi	a3,a3,912 # 80414a58 <error_string>
804106d0:	00f687b3          	add	a5,a3,a5
804106d4:	0007a783          	lw	a5,0(a5)
804106d8:	02078263          	beqz	a5,804106fc <vprintfmt+0x3c8>
804106dc:	00078713          	mv	a4,a5
804106e0:	00000697          	auipc	a3,0x0
804106e4:	35c68693          	addi	a3,a3,860 # 80410a3c <etext+0x24>
804106e8:	00048613          	mv	a2,s1
804106ec:	00090593          	mv	a1,s2
804106f0:	00098513          	mv	a0,s3
804106f4:	160000ef          	jal	ra,80410854 <printfmt>
804106f8:	c99ff06f          	j	80410390 <vprintfmt+0x5c>
804106fc:	00004697          	auipc	a3,0x4
80410700:	04c68693          	addi	a3,a3,76 # 80414748 <sfs_node_fileops+0x2f8>
80410704:	00048613          	mv	a2,s1
80410708:	00090593          	mv	a1,s2
8041070c:	00098513          	mv	a0,s3
80410710:	144000ef          	jal	ra,80410854 <printfmt>
80410714:	c7dff06f          	j	80410390 <vprintfmt+0x5c>
80410718:	00004417          	auipc	s0,0x4
8041071c:	02840413          	addi	s0,s0,40 # 80414740 <sfs_node_fileops+0x2f0>
80410720:	000c8593          	mv	a1,s9
80410724:	00040513          	mv	a0,s0
80410728:	01112423          	sw	a7,8(sp)
8041072c:	9a5ff0ef          	jal	ra,804100d0 <strnlen>
80410730:	40ac0c33          	sub	s8,s8,a0
80410734:	00812883          	lw	a7,8(sp)
80410738:	03805263          	blez	s8,8041075c <vprintfmt+0x428>
8041073c:	00088513          	mv	a0,a7
80410740:	00090613          	mv	a2,s2
80410744:	00048593          	mv	a1,s1
80410748:	01112423          	sw	a7,8(sp)
8041074c:	fffc0c13          	addi	s8,s8,-1
80410750:	000980e7          	jalr	s3
80410754:	00812883          	lw	a7,8(sp)
80410758:	fe0c12e3          	bnez	s8,8041073c <vprintfmt+0x408>
8041075c:	00044783          	lbu	a5,0(s0)
80410760:	00140a93          	addi	s5,s0,1
80410764:	00078513          	mv	a0,a5
80410768:	f00786e3          	beqz	a5,80410674 <vprintfmt+0x340>
8041076c:	05e00413          	li	s0,94
80410770:	eadff06f          	j	8041061c <vprintfmt+0x2e8>
80410774:	000980e7          	jalr	s3
80410778:	ecdff06f          	j	80410644 <vprintfmt+0x310>
8041077c:	00090613          	mv	a2,s2
80410780:	00048593          	mv	a1,s1
80410784:	02d00513          	li	a0,45
80410788:	01112423          	sw	a7,8(sp)
8041078c:	000980e7          	jalr	s3
80410790:	01a037b3          	snez	a5,s10
80410794:	40800733          	neg	a4,s0
80410798:	40f70733          	sub	a4,a4,a5
8041079c:	00812883          	lw	a7,8(sp)
804107a0:	41a006b3          	neg	a3,s10
804107a4:	00a00793          	li	a5,10
804107a8:	d6dff06f          	j	80410514 <vprintfmt+0x1e0>
804107ac:	007a8a93          	addi	s5,s5,7
804107b0:	ff8afa93          	andi	s5,s5,-8
804107b4:	000aad03          	lw	s10,0(s5)
804107b8:	004aa403          	lw	s0,4(s5)
804107bc:	008a8a93          	addi	s5,s5,8
804107c0:	ed5ff06f          	j	80410694 <vprintfmt+0x360>
804107c4:	007a8a93          	addi	s5,s5,7
804107c8:	ff8afa93          	andi	s5,s5,-8
804107cc:	000aa683          	lw	a3,0(s5)
804107d0:	004aa703          	lw	a4,4(s5)
804107d4:	00800793          	li	a5,8
804107d8:	008a8a93          	addi	s5,s5,8
804107dc:	d39ff06f          	j	80410514 <vprintfmt+0x1e0>
804107e0:	007a8a93          	addi	s5,s5,7
804107e4:	ff8afa93          	andi	s5,s5,-8
804107e8:	000aa683          	lw	a3,0(s5)
804107ec:	004aa703          	lw	a4,4(s5)
804107f0:	00a00793          	li	a5,10
804107f4:	008a8a93          	addi	s5,s5,8
804107f8:	d1dff06f          	j	80410514 <vprintfmt+0x1e0>
804107fc:	007a8a93          	addi	s5,s5,7
80410800:	ff8afa93          	andi	s5,s5,-8
80410804:	000aa683          	lw	a3,0(s5)
80410808:	004aa703          	lw	a4,4(s5)
8041080c:	01000793          	li	a5,16
80410810:	008a8a93          	addi	s5,s5,8
80410814:	d01ff06f          	j	80410514 <vprintfmt+0x1e0>
80410818:	03805263          	blez	s8,8041083c <vprintfmt+0x508>
8041081c:	02d00793          	li	a5,45
80410820:	eef89ce3          	bne	a7,a5,80410718 <vprintfmt+0x3e4>
80410824:	00004417          	auipc	s0,0x4
80410828:	f1c40413          	addi	s0,s0,-228 # 80414740 <sfs_node_fileops+0x2f0>
8041082c:	02800793          	li	a5,40
80410830:	02800513          	li	a0,40
80410834:	00140a93          	addi	s5,s0,1
80410838:	de1ff06f          	j	80410618 <vprintfmt+0x2e4>
8041083c:	00004a97          	auipc	s5,0x4
80410840:	f05a8a93          	addi	s5,s5,-251 # 80414741 <sfs_node_fileops+0x2f1>
80410844:	02800513          	li	a0,40
80410848:	02800793          	li	a5,40
8041084c:	05e00413          	li	s0,94
80410850:	dcdff06f          	j	8041061c <vprintfmt+0x2e8>

80410854 <printfmt>:
80410854:	fd010113          	addi	sp,sp,-48
80410858:	02010313          	addi	t1,sp,32
8041085c:	02e12023          	sw	a4,32(sp)
80410860:	00030713          	mv	a4,t1
80410864:	00112e23          	sw	ra,28(sp)
80410868:	02f12223          	sw	a5,36(sp)
8041086c:	03012423          	sw	a6,40(sp)
80410870:	03112623          	sw	a7,44(sp)
80410874:	00612623          	sw	t1,12(sp)
80410878:	abdff0ef          	jal	ra,80410334 <vprintfmt>
8041087c:	01c12083          	lw	ra,28(sp)
80410880:	03010113          	addi	sp,sp,48
80410884:	00008067          	ret

80410888 <snprintf>:
80410888:	fc010113          	addi	sp,sp,-64
8041088c:	fff58593          	addi	a1,a1,-1
80410890:	02c10313          	addi	t1,sp,44
80410894:	00b505b3          	add	a1,a0,a1
80410898:	00112e23          	sw	ra,28(sp)
8041089c:	02d12623          	sw	a3,44(sp)
804108a0:	02e12823          	sw	a4,48(sp)
804108a4:	02f12a23          	sw	a5,52(sp)
804108a8:	03012c23          	sw	a6,56(sp)
804108ac:	03112e23          	sw	a7,60(sp)
804108b0:	00612023          	sw	t1,0(sp)
804108b4:	00a12223          	sw	a0,4(sp)
804108b8:	00b12423          	sw	a1,8(sp)
804108bc:	00012623          	sw	zero,12(sp)
804108c0:	04050063          	beqz	a0,80410900 <snprintf+0x78>
804108c4:	02a5ee63          	bltu	a1,a0,80410900 <snprintf+0x78>
804108c8:	ffff75b7          	lui	a1,0xffff7
804108cc:	00060693          	mv	a3,a2
804108d0:	00000517          	auipc	a0,0x0
804108d4:	a3c50513          	addi	a0,a0,-1476 # 8041030c <sprintputch>
804108d8:	00030713          	mv	a4,t1
804108dc:	00410613          	addi	a2,sp,4
804108e0:	ad958593          	addi	a1,a1,-1319 # ffff6ad9 <end+0x7fb5c245>
804108e4:	a51ff0ef          	jal	ra,80410334 <vprintfmt>
804108e8:	00412783          	lw	a5,4(sp)
804108ec:	00078023          	sb	zero,0(a5)
804108f0:	00c12503          	lw	a0,12(sp)
804108f4:	01c12083          	lw	ra,28(sp)
804108f8:	04010113          	addi	sp,sp,64
804108fc:	00008067          	ret
80410900:	ffd00513          	li	a0,-3
80410904:	ff1ff06f          	j	804108f4 <snprintf+0x6c>

80410908 <hash32>:
80410908:	00351793          	slli	a5,a0,0x3
8041090c:	40a787b3          	sub	a5,a5,a0
80410910:	00679793          	slli	a5,a5,0x6
80410914:	40a78733          	sub	a4,a5,a0
80410918:	00371793          	slli	a5,a4,0x3
8041091c:	40e787b3          	sub	a5,a5,a4
80410920:	00379793          	slli	a5,a5,0x3
80410924:	00a787b3          	add	a5,a5,a0
80410928:	01079793          	slli	a5,a5,0x10
8041092c:	40f50533          	sub	a0,a0,a5
80410930:	02000793          	li	a5,32
80410934:	40b787b3          	sub	a5,a5,a1
80410938:	00f55533          	srl	a0,a0,a5
8041093c:	00008067          	ret

80410940 <__mulsi3>:
80410940:	00050613          	mv	a2,a0
80410944:	00000513          	li	a0,0
80410948:	0015f693          	andi	a3,a1,1
8041094c:	00068463          	beqz	a3,80410954 <__mulsi3+0x14>
80410950:	00c50533          	add	a0,a0,a2
80410954:	0015d593          	srli	a1,a1,0x1
80410958:	00161613          	slli	a2,a2,0x1
8041095c:	fe0596e3          	bnez	a1,80410948 <__mulsi3+0x8>
80410960:	00008067          	ret

80410964 <__divsi3>:
80410964:	06054063          	bltz	a0,804109c4 <__umodsi3+0x10>
80410968:	0605c663          	bltz	a1,804109d4 <__umodsi3+0x20>

8041096c <__udivsi3>:
8041096c:	00058613          	mv	a2,a1
80410970:	00050593          	mv	a1,a0
80410974:	fff00513          	li	a0,-1
80410978:	02060c63          	beqz	a2,804109b0 <__udivsi3+0x44>
8041097c:	00100693          	li	a3,1
80410980:	00b67a63          	bgeu	a2,a1,80410994 <__udivsi3+0x28>
80410984:	00c05863          	blez	a2,80410994 <__udivsi3+0x28>
80410988:	00161613          	slli	a2,a2,0x1
8041098c:	00169693          	slli	a3,a3,0x1
80410990:	feb66ae3          	bltu	a2,a1,80410984 <__udivsi3+0x18>
80410994:	00000513          	li	a0,0
80410998:	00c5e663          	bltu	a1,a2,804109a4 <__udivsi3+0x38>
8041099c:	40c585b3          	sub	a1,a1,a2
804109a0:	00d56533          	or	a0,a0,a3
804109a4:	0016d693          	srli	a3,a3,0x1
804109a8:	00165613          	srli	a2,a2,0x1
804109ac:	fe0696e3          	bnez	a3,80410998 <__udivsi3+0x2c>
804109b0:	00008067          	ret

804109b4 <__umodsi3>:
804109b4:	00008293          	mv	t0,ra
804109b8:	fb5ff0ef          	jal	ra,8041096c <__udivsi3>
804109bc:	00058513          	mv	a0,a1
804109c0:	00028067          	jr	t0
804109c4:	40a00533          	neg	a0,a0
804109c8:	0005d863          	bgez	a1,804109d8 <__umodsi3+0x24>
804109cc:	40b005b3          	neg	a1,a1
804109d0:	f9dff06f          	j	8041096c <__udivsi3>
804109d4:	40b005b3          	neg	a1,a1
804109d8:	00008293          	mv	t0,ra
804109dc:	f91ff0ef          	jal	ra,8041096c <__udivsi3>
804109e0:	40a00533          	neg	a0,a0
804109e4:	00028067          	jr	t0

804109e8 <__modsi3>:
804109e8:	00008293          	mv	t0,ra
804109ec:	0005ca63          	bltz	a1,80410a00 <__modsi3+0x18>
804109f0:	00054c63          	bltz	a0,80410a08 <__modsi3+0x20>
804109f4:	f79ff0ef          	jal	ra,8041096c <__udivsi3>
804109f8:	00058513          	mv	a0,a1
804109fc:	00028067          	jr	t0
80410a00:	40b005b3          	neg	a1,a1
80410a04:	fe0558e3          	bgez	a0,804109f4 <__modsi3+0xc>
80410a08:	40a00533          	neg	a0,a0
80410a0c:	f61ff0ef          	jal	ra,8041096c <__udivsi3>
80410a10:	40b00533          	neg	a0,a1
80410a14:	00028067          	jr	t0

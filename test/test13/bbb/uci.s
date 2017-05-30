#NO_APP
	.text
	.align	2
	.globl	_getCPUModel
_getCPUModel:
	move.l #_cpustr.3126,d0
	move.l d0,a0
	clr.b (a0)
	rts
.LC0:
	.ascii "\12\0"
.LC1:
	.ascii " \0"
	.align	2
	.globl	_showMoveList
_showMoveList:
	lea (-3072,sp),sp
	movem.l #15934,-(sp)
	pea 40(sp)
	jsr _generateMoves
	move.l d0,d3
	addq.l #4,sp
	jle .L11
	lea (40,sp),a2
	moveq #0,d2
	move.l #_printf,d4
	lea _move_make,a6
	lea _kingLoc,a5
	lea _isAttacked,a4
	lea _move_unmake,a3
	move.l #_printMove,d5
.L5:
	move.l a2,-(sp)
	jsr (a6)
	move.b _board+128,d1
	move.b d1,d0
	lsr.b #3,d0
	and.l #255,d0
	moveq #1,d6
	sub.l d0,d6
	move.l d6,d0
	add.l d6,d0
	add.l d0,d0
	move.l (a5,d0.l),-(sp)
	and.l #255,d1
	move.l d1,-(sp)
	jsr (a4)
	lea (12,sp),sp
	tst.l d0
	jeq .L12
	move.l a2,-(sp)
	jsr (a3)
	addq.l #1,d2
	lea (12,a2),a2
	addq.l #4,sp
	cmp.l d3,d2
	jne .L5
.L6:
	pea .LC0
	move.l d4,a0
	jsr (a0)
	addq.l #4,sp
	movem.l (sp)+,#31868
	lea (3072,sp),sp
	rts
.L12:
	move.l d2,a0
	add.l d2,a0
	add.l d2,a0
	add.l a0,a0
	add.l a0,a0
	move.l #3112,d0
	add.l sp,d0
	add.l d0,a0
	lea (-3072,a0),a0
	move.l 8(a0),-(sp)
	move.l 4(a0),-(sp)
	move.l (a0),-(sp)
	move.l d5,a0
	jsr (a0)
	pea .LC1
	move.l d4,a0
	jsr (a0)
	lea (16,sp),sp
	move.l a2,-(sp)
	jsr (a3)
	addq.l #1,d2
	lea (12,a2),a2
	addq.l #4,sp
	cmp.l d3,d2
	jne .L5
	jra .L6
.L11:
	move.l #_printf,d0
	pea .LC0
	move.l d0,a0
	jsr (a0)
	addq.l #4,sp
	movem.l (sp)+,#31868
	lea (3072,sp),sp
	rts
.LC2:
	.ascii " %d\12\0"
	.align	2
	.globl	_ParseScore
_ParseScore:
	lea (-3876,sp),sp
	movem.l #16190,-(sp)
	move.l 3924(sp),d0
	addq.l #6,d0
	move.l d0,-(sp)
	jsr _atoi
	move.l d0,d4
	lea (852,sp),a2
	move.l a2,-(sp)
	jsr _generateMoves
	move.l d0,d3
	addq.l #8,sp
	jle .L13
	moveq #0,d2
	lea _move_make,a6
	lea _kingLoc,a5
	lea _isAttacked,a4
	lea _move_unmake,a3
	move.l #_printMove,d7
	moveq #44,d5
	add.l sp,d5
	move.l #_AlphaBeta,d6
.L16:
	move.l a2,-(sp)
	jsr (a6)
	move.b _board+128,d0
	lsr.b #3,d0
	and.l #255,d0
	moveq #1,d1
	sub.l d0,d1
	move.l d1,d0
	add.l d1,d0
	add.l d0,d0
	move.l (a5,d0.l),-(sp)
	moveq #0,d0
	move.b _board+128,d0
	move.l d0,-(sp)
	jsr (a4)
	lea (12,sp),sp
	tst.l d0
	jeq .L21
	move.l a2,-(sp)
	jsr (a3)
	addq.l #1,d2
	lea (12,a2),a2
	addq.l #4,sp
	cmp.l d3,d2
	jne .L16
.L13:
	movem.l (sp)+,#31996
	lea (3876,sp),sp
	rts
.L21:
	move.l d2,a0
	add.l d2,a0
	add.l d2,a0
	add.l a0,a0
	add.l a0,a0
	move.l #3920,d0
	add.l sp,d0
	add.l d0,a0
	lea (-3072,a0),a0
	move.l 8(a0),-(sp)
	move.l 4(a0),-(sp)
	move.l (a0),-(sp)
	move.l d7,a0
	jsr (a0)
	move.l 3940(sp),-(sp)
	pea 1.w
	move.l d5,-(sp)
	pea 32000.w
	pea -32000.w
	move.l d4,-(sp)
	move.l d6,a0
	jsr (a0)
	lea (36,sp),sp
	neg.l d0
	move.l d0,-(sp)
	pea .LC2
	jsr _printf
	addq.l #8,sp
	move.l a2,-(sp)
	jsr (a3)
	addq.l #1,d2
	lea (12,a2),a2
	addq.l #4,sp
	cmp.l d3,d2
	jne .L16
	jra .L13
.LC3:
	.ascii "Perft(%d)=%lld Nps: %lld (%d ms)\12\0"
	.align	2
	.globl	_ParsePerft
_ParsePerft:
	movem.l #15904,-(sp)
	move.l 28(sp),d0
	addq.l #6,d0
	move.l d0,-(sp)
	jsr _atoi
	move.l d0,d6
	lea _get_ms,a2
	jsr (a2)
	move.l d0,d2
	moveq #0,d0
	not.b d0
	and.l d6,d0
	move.l d0,-(sp)
	jsr _Perft
	move.l d0,d4
	move.l d1,d5
	jsr (a2)
	addq.l #8,sp
	cmp.l d2,d0
	jeq .L26
	sub.l d2,d0
	move.l d0,-(sp)
	move.l d5,d3
	moveq #27,d1
	lsr.l d1,d3
	move.l d4,d1
	lsl.l #5,d1
	move.l d3,d2
	or.l d1,d2
	move.l d5,d3
	lsl.l #5,d3
	sub.l d5,d3
	subx.l d4,d2
	add.l d3,d3
	addx.l d2,d2
	add.l d3,d3
	addx.l d2,d2
	add.l d5,d3
	addx.l d4,d2
	add.l d3,d3
	addx.l d2,d2
	add.l d3,d3
	addx.l d2,d2
	add.l d3,d3
	addx.l d2,d2
	move.l d0,-(sp)
	clr.l -(sp)
	move.l d3,-(sp)
	move.l d2,-(sp)
	jsr ___udivdi3
	lea (12,sp),sp
	move.l d1,(sp)
	move.l d0,-(sp)
	move.l d5,-(sp)
	move.l d4,-(sp)
	move.l d6,-(sp)
	pea .LC3
	jsr _printf
	lea (28,sp),sp
	movem.l (sp)+,#1148
	rts
.L26:
	move.l d2,d0
	addq.l #1,d0
	sub.l d2,d0
	move.l d0,-(sp)
	move.l d5,d3
	moveq #27,d1
	lsr.l d1,d3
	move.l d4,d1
	lsl.l #5,d1
	move.l d3,d2
	or.l d1,d2
	move.l d5,d3
	lsl.l #5,d3
	sub.l d5,d3
	subx.l d4,d2
	add.l d3,d3
	addx.l d2,d2
	add.l d3,d3
	addx.l d2,d2
	add.l d5,d3
	addx.l d4,d2
	add.l d3,d3
	addx.l d2,d2
	add.l d3,d3
	addx.l d2,d2
	add.l d3,d3
	addx.l d2,d2
	move.l d0,-(sp)
	clr.l -(sp)
	move.l d3,-(sp)
	move.l d2,-(sp)
	jsr ___udivdi3
	lea (12,sp),sp
	move.l d1,(sp)
	move.l d0,-(sp)
	move.l d5,-(sp)
	move.l d4,-(sp)
	move.l d6,-(sp)
	pea .LC3
	jsr _printf
	lea (28,sp),sp
	movem.l (sp)+,#1148
	rts
	.align	2
	.globl	_ParseDivide
_ParseDivide:
	movem.l #15904,-(sp)
	move.l 28(sp),d0
	addq.l #7,d0
	move.l d0,-(sp)
	jsr _atoi
	move.l d0,d6
	lea _get_ms,a2
	jsr (a2)
	move.l d0,d2
	moveq #0,d0
	not.b d0
	and.l d6,d0
	move.l d0,-(sp)
	jsr _Divide
	move.l d0,d4
	move.l d1,d5
	jsr (a2)
	addq.l #8,sp
	cmp.l d2,d0
	jeq .L31
	sub.l d2,d0
	move.l d0,-(sp)
	move.l d5,d3
	moveq #27,d1
	lsr.l d1,d3
	move.l d4,d1
	lsl.l #5,d1
	move.l d3,d2
	or.l d1,d2
	move.l d5,d3
	lsl.l #5,d3
	sub.l d5,d3
	subx.l d4,d2
	add.l d3,d3
	addx.l d2,d2
	add.l d3,d3
	addx.l d2,d2
	add.l d5,d3
	addx.l d4,d2
	add.l d3,d3
	addx.l d2,d2
	add.l d3,d3
	addx.l d2,d2
	add.l d3,d3
	addx.l d2,d2
	move.l d0,-(sp)
	smi d1
	ext.w d1
	ext.l d1
	move.l d1,-(sp)
	move.l d3,-(sp)
	move.l d2,-(sp)
	jsr ___udivdi3
	lea (12,sp),sp
	move.l d1,(sp)
	move.l d0,-(sp)
	move.l d5,-(sp)
	move.l d4,-(sp)
	move.l d6,-(sp)
	pea .LC3
	jsr _printf
	lea (28,sp),sp
	movem.l (sp)+,#1148
	rts
.L31:
	move.l d2,d0
	addq.l #1,d0
	sub.l d2,d0
	move.l d0,-(sp)
	move.l d5,d3
	moveq #27,d1
	lsr.l d1,d3
	move.l d4,d1
	lsl.l #5,d1
	move.l d3,d2
	or.l d1,d2
	move.l d5,d3
	lsl.l #5,d3
	sub.l d5,d3
	subx.l d4,d2
	add.l d3,d3
	addx.l d2,d2
	add.l d3,d3
	addx.l d2,d2
	add.l d5,d3
	addx.l d4,d2
	add.l d3,d3
	addx.l d2,d2
	add.l d3,d3
	addx.l d2,d2
	add.l d3,d3
	addx.l d2,d2
	move.l d0,-(sp)
	smi d1
	ext.w d1
	ext.l d1
	move.l d1,-(sp)
	move.l d3,-(sp)
	move.l d2,-(sp)
	jsr ___udivdi3
	lea (12,sp),sp
	move.l d1,(sp)
	move.l d0,-(sp)
	move.l d5,-(sp)
	move.l d4,-(sp)
	move.l d6,-(sp)
	pea .LC3
	jsr _printf
	lea (28,sp),sp
	movem.l (sp)+,#1148
	rts
.LC4:
	.ascii "../src/wac.epd\0"
.LC5:
	.ascii "testepd xxxx filename (where xxxx is time per position in milliseconds.\12\0"
	.align	2
	.globl	_ParseTestEPD
_ParseTestEPD:
	move.l a2,-(sp)
	move.l d2,-(sp)
	move.l 12(sp),a2
	pea .LC1
	pea 8(a2)
	jsr _strstr
	move.l d0,a1
	addq.l #8,sp
	tst.l d0
	jeq .L38
	move.l d0,d2
	addq.l #1,d2
	clr.b (a1)
	move.l d2,a0
.L34:
	tst.b (a0)+
	jne .L34
	move.l d2,d0
	sub.l a0,d0
	not.l d0
	clr.b (a1,d0.l)
	pea 7(a2)
	jsr _atoi
	move.l d0,-(sp)
	move.l d2,-(sp)
	jsr _testEPD
	lea (12,sp),sp
	move.l (sp)+,d2
	move.l (sp)+,a2
	rts
.L38:
	pea 100.w
	pea .LC4
	jsr _testEPD
	addq.l #8,sp
	move.l #.LC5,12(sp)
	move.l (sp)+,d2
	move.l (sp)+,a2
	jra _printf
.LC6:
	.ascii "infinite\0"
.LC7:
	.ascii "binc\0"
.LC8:
	.ascii "winc\0"
.LC9:
	.ascii "wtime\0"
.LC10:
	.ascii "btime\0"
.LC11:
	.ascii "movestogo\0"
.LC12:
	.ascii "movetime\0"
.LC13:
	.ascii "depth\0"
.LC14:
	.ascii "Time taken: %d\12\0"
.LC15:
	.ascii "a\0"
.LC16:
	.ascii "error.txt\0"
.LC17:
	.ascii "%s\12\0"
.LC18:
	.ascii "time:%d start:%d stop:%d depth:%d timeset:%d\12\0"
.LC19:
	.ascii "Time taken: %d\12\12\0"
	.align	2
	.globl	_ParseGo
_ParseGo:
	movem.l #16184,-(sp)
	move.l 40(sp),d2
	move.l 44(sp),a2
	clr.l 16(a2)
	pea .LC6
	move.l d2,-(sp)
	lea _strstr,a3
	jsr (a3)
	pea .LC7
	move.l d2,-(sp)
	jsr (a3)
	lea (16,sp),sp
	tst.l d0
	jeq .L57
	cmp.b #8,_board+128.l
	jeq .L79
.L57:
	moveq #0,d5
.L40:
	pea .LC8
	move.l d2,-(sp)
	jsr (a3)
	addq.l #8,sp
	tst.l d0
	jeq .L41
	tst.b _board+128
	jeq .L80
.L41:
	pea .LC9
	move.l d2,-(sp)
	jsr (a3)
	addq.l #8,sp
	tst.l d0
	jeq .L59
	tst.b _board+128
	jeq .L81
.L59:
	moveq #-1,d3
.L42:
	pea .LC10
	move.l d2,-(sp)
	jsr (a3)
	addq.l #8,sp
	tst.l d0
	jeq .L43
	cmp.b #8,_board+128.l
	jeq .L82
.L43:
	pea .LC11
	move.l d2,-(sp)
	jsr (a3)
	addq.l #8,sp
	tst.l d0
	jeq .L60
	move.l d0,a0
	pea 10(a0)
	jsr _atoi
	move.l d0,d6
	addq.l #4,sp
.L44:
	pea .LC12
	move.l d2,-(sp)
	jsr (a3)
	addq.l #8,sp
	tst.l d0
	jeq .L45
	move.l d0,a0
	pea 9(a0)
	lea _atoi,a4
	jsr (a4)
	move.l d0,d7
	pea .LC13
	move.l d2,-(sp)
	jsr (a3)
	lea (12,sp),sp
	tst.l d0
	jeq .L83
	move.l d0,a0
	pea 6(a0)
	jsr (a4)
	move.l d0,d4
	addq.l #4,sp
.L46:
	moveq #-1,d0
	lea _get_ms,a4
	cmp.l d7,d0
	jeq .L84
.L47:
	jsr (a4)
	move.l d0,a3
	move.l d0,4(a2)
	move.l d4,12(a2)
	moveq #1,d1
	moveq #1,d0
	move.l d0,16(a2)
	move.l d1,-(sp)
	move.l d7,-(sp)
	jsr ___divsi3
	addq.l #8,sp
	moveq #-10,d3
	add.l d0,d3
	add.l d5,a3
	add.l d3,a3
	move.l a3,8(a2)
.L48:
	addq.l #1,d4
	jeq .L55
	clr.l 16(a2)
.L50:
	move.l a2,-(sp)
	jsr _think
	move.l d0,d5
	jsr (a4)
	move.l d0,d4
	sub.l 4(a2),d0
	move.l d0,-(sp)
	pea .LC14
	jsr _printf
	move.l ___sF,a0
	move.l 4(a0),-(sp)
	jsr _fflush
	lea (16,sp),sp
	tst.l d5
	jeq .L85
	movem.l (sp)+,#7420
	rts
.L81:
	move.l d0,a0
	pea 6(a0)
	jsr _atoi
	move.l d0,d3
	addq.l #4,sp
	jra .L42
.L80:
	move.l d0,a0
	pea 5(a0)
	jsr _atoi
	move.l d0,d5
	addq.l #4,sp
	jra .L41
.L83:
	moveq #-1,d4
	moveq #-1,d0
	lea _get_ms,a4
	cmp.l d7,d0
	jne .L47
.L84:
	jsr (a4)
	move.l d0,a3
	move.l d0,4(a2)
	move.l d4,12(a2)
	moveq #-1,d0
	cmp.l d3,d0
	jeq .L48
	move.l d3,d1
	moveq #1,d0
	move.l d0,16(a2)
	move.l d6,-(sp)
	move.l d1,-(sp)
	jsr ___divsi3
	addq.l #8,sp
	moveq #-10,d3
	add.l d0,d3
	add.l d5,a3
	add.l d3,a3
	move.l a3,8(a2)
	jra .L48
.L85:
	pea .LC15
	pea .LC16
	jsr _fopen
	move.l d0,d5
	jsr _board2fen
	move.l d0,-(sp)
	pea .LC17
	move.l d5,-(sp)
	lea _fprintf,a3
	jsr (a3)
	move.l d2,-(sp)
	pea .LC17
	move.l d5,-(sp)
	jsr (a3)
	lea (28,sp),sp
	move.l 16(a2),(sp)
	move.l 12(a2),-(sp)
	move.l 8(a2),-(sp)
	move.l 4(a2),-(sp)
	move.l d3,-(sp)
	pea .LC18
	move.l d5,-(sp)
	jsr (a3)
	sub.l 4(a2),d4
	move.l d4,-(sp)
	pea .LC19
	move.l d5,-(sp)
	jsr (a3)
	lea (40,sp),sp
	move.l d5,40(sp)
	movem.l (sp)+,#7420
	jra _fclose
.L45:
	pea .LC13
	move.l d2,-(sp)
	jsr (a3)
	addq.l #8,sp
	tst.l d0
	jeq .L86
	moveq #-1,d7
	lea _atoi,a3
	move.l d0,a0
	pea 6(a0)
	jsr (a3)
	move.l d0,d4
	addq.l #4,sp
	jra .L46
.L60:
	moveq #30,d6
	jra .L44
.L86:
	lea _get_ms,a4
	jsr (a4)
	move.l d0,a3
	move.l d0,4(a2)
	moveq #-1,d0
	move.l d0,12(a2)
	cmp.l d3,d0
	jne .L87
.L55:
	move.l #200,12(a2)
	jra .L50
.L82:
	move.l d0,a0
	pea 6(a0)
	jsr _atoi
	move.l d0,d3
	addq.l #4,sp
	jra .L43
.L79:
	move.l d0,a0
	pea 5(a0)
	jsr _atoi
	move.l d0,d5
	addq.l #4,sp
	jra .L40
.L87:
	move.l d3,d1
	moveq #-1,d4
	moveq #1,d0
	move.l d0,16(a2)
	move.l d6,-(sp)
	move.l d1,-(sp)
	jsr ___divsi3
	addq.l #8,sp
	moveq #-10,d3
	add.l d0,d3
	add.l d5,a3
	add.l d3,a3
	move.l a3,8(a2)
	jra .L48
	.align	2
	.globl	_ParseMove
_ParseMove:
	lea (-3072,sp),sp
	movem.l #14392,-(sp)
	move.l 3100(sp),a2
	move.b 1(a2),d0
	move.b d0,d1
	add.b #-49,d1
	cmp.b #7,d1
	jhi .L91
	move.b 3(a2),d1
	move.b d1,d2
	add.b #-49,d2
	cmp.b #7,d2
	jhi .L91
	move.b (a2),d2
	move.b d2,d3
	add.b #-97,d3
	cmp.b #7,d3
	jhi .L91
	move.b 2(a2),d3
	move.b d3,d4
	add.b #-97,d4
	cmp.b #7,d4
	jls .L107
.L91:
	moveq #0,d0
.L88:
	movem.l (sp)+,#7196
	lea (3072,sp),sp
	rts
.L107:
	ext.w d0
	move.w d0,a0
	moveq #-49,d0
	add.l a0,d0
	lsl.l #4,d0
	ext.w d2
	move.w d2,a0
	lea -97(a0,d0.l),a3
	ext.w d1
	move.w d1,a0
	moveq #-49,d0
	add.l a0,d0
	lsl.l #4,d0
	ext.w d3
	move.w d3,a0
	lea -97(a0,d0.l),a4
	pea 24(sp)
	jsr _generateMoves
	move.l d0,d3
	addq.l #4,sp
	jle .L91
	lea (24,sp),a0
	moveq #0,d1
	move.l (a0),d0
	moveq #0,d2
	not.b d2
	and.l d0,d2
	cmp.l a3,d2
	jeq .L108
.L92:
	addq.l #1,d1
	lea (12,a0),a0
	cmp.l d3,d1
	jeq .L91
.L103:
	move.l (a0),d0
	moveq #0,d2
	not.b d2
	and.l d0,d2
	cmp.l a3,d2
	jne .L92
.L108:
	move.l d0,d2
	asr.l #8,d2
	moveq #0,d4
	not.b d4
	and.l d2,d4
	cmp.l a4,d4
	jne .L92
	move.l d0,d2
	swap d2
	asr.w #8,d2
	ext.l d2
	moveq #7,d4
	and.l d4,d2
	jeq .L88
	moveq #6,d4
	cmp.l d2,d4
	jeq .L109
	moveq #5,d4
	cmp.l d2,d4
	jeq .L110
	moveq #7,d4
	cmp.l d2,d4
	jne .L95
	cmp.b #113,4(a2)
	jeq .L88
	addq.l #1,d1
	lea (12,a0),a0
	cmp.l d3,d1
	jne .L103
	jra .L91
.L109:
	cmp.b #114,4(a2)
	jeq .L88
	addq.l #1,d1
	lea (12,a0),a0
	cmp.l d3,d1
	jne .L103
	jra .L91
.L110:
	cmp.b #98,4(a2)
	jeq .L88
	addq.l #1,d1
	lea (12,a0),a0
	cmp.l d3,d1
	jne .L103
	jra .L91
.L95:
	subq.l #3,d2
	jne .L92
	cmp.b #110,4(a2)
	jeq .L88
	addq.l #1,d1
	lea (12,a0),a0
	cmp.l d3,d1
	jne .L103
	jra .L91
.LC20:
	.ascii "%s %d (move in decimal if you want a breakpoint %d ;-)\12\0"
	.align	2
	.globl	_listMoves
_listMoves:
	lea (-3072,sp),sp
	movem.l #16190,-(sp)
	moveq #44,d4
	add.l sp,d4
	move.l d4,-(sp)
	jsr _generateMoves
	move.l d0,d3
	addq.l #4,sp
	jle .L111
	move.l d4,a2
	moveq #0,d2
	move.l #_pickMove,d5
	lea _move_make,a6
	lea _kingLoc,a5
	lea _isAttacked,a4
	lea _move_unmake,a3
.L113:
	move.l d3,-(sp)
	move.l d2,-(sp)
	move.l d4,-(sp)
	move.l d5,a0
	jsr (a0)
	move.l a2,-(sp)
	jsr (a6)
	move.b _board+128,d1
	move.b d1,d0
	lsr.b #3,d0
	and.l #255,d0
	moveq #1,d6
	sub.l d0,d6
	move.l d6,d0
	add.l d6,d0
	add.l d0,d0
	move.l (a5,d0.l),-(sp)
	and.l #255,d1
	move.l d1,-(sp)
	jsr (a4)
	lea (24,sp),sp
	tst.l d0
	jeq .L114
	move.l a2,-(sp)
	jsr (a3)
	addq.l #1,d2
	lea (12,a2),a2
	addq.l #4,sp
	cmp.l d2,d3
	jne .L113
.L111:
	movem.l (sp)+,#31996
	lea (3072,sp),sp
	rts
.L114:
	move.l (a2),d7
	move.l 8(a2),d6
	move.l d7,-(sp)
	jsr _moveToUCI
	move.l d7,-(sp)
	move.l d6,-(sp)
	move.l d0,-(sp)
	pea .LC20
	jsr _printf
	move.l a2,-(sp)
	jsr (a3)
	addq.l #1,d2
	lea (12,a2),a2
	lea (24,sp),sp
	cmp.l d3,d2
	jne .L113
	movem.l (sp)+,#31996
	lea (3072,sp),sp
	rts
.LC21:
	.ascii "startpos\0"
.LC22:
	.ascii "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1\0"
.LC23:
	.ascii "fen\0"
.LC24:
	.ascii "moves\0"
.LC25:
	.ascii "Ply: %d FiftyCounter: %d\12\0"
	.align	2
	.globl	_ParsePosition
_ParsePosition:
	lea (-12,sp),sp
	movem.l #56,-(sp)
	move.w #9,a2
	add.l 28(sp),a2
	pea 8.w
	pea .LC21
	move.l a2,-(sp)
	jsr _strncmp
	lea (12,sp),sp
	tst.l d0
	jne .L121
	clr.w _board+142
	pea .LC22
	jsr _fen2board
	addq.l #4,sp
	lea _strstr,a3
.L122:
	pea .LC24
	move.l a2,-(sp)
	jsr (a3)
	addq.l #8,sp
	tst.l d0
	jeq .L125
	move.l d0,a2
	addq.l #6,a2
	move.l d0,a0
	tst.b 6(a0)
	jeq .L125
	lea _ParseMove,a3
	lea _move_make,a4
.L130:
	move.l a2,-(sp)
	jsr (a3)
	addq.l #4,sp
	tst.l d0
	jeq .L125
	move.l d0,12(sp)
	pea 12(sp)
	jsr (a4)
	move.b (a2),d0
	and.b #-33,d0
	addq.l #4,sp
	jeq .L131
.L129:
	addq.l #1,a2
	move.b (a2),d0
	and.b #-33,d0
	jne .L129
.L131:
	move.l a2,a0
	addq.l #1,a2
	tst.b 1(a0)
	jne .L130
.L125:
	jsr _printBoard
	moveq #0,d0
	move.b _board+131,d0
	move.l d0,-(sp)
	move.w _board+132,a0
	move.l a0,-(sp)
	pea .LC25
	jsr _printf
	lea (12,sp),sp
	movem.l (sp)+,#7168
	lea (12,sp),sp
	rts
.L121:
	pea .LC23
	move.l a2,-(sp)
	lea _strstr,a3
	jsr (a3)
	addq.l #8,sp
	tst.l d0
	jeq .L139
	move.l d0,a0
	pea 4(a0)
	jsr _fen2board
	addq.l #4,sp
	jra .L122
.L139:
	pea .LC22
	jsr _fen2board
	addq.l #4,sp
	jra .L122
.LC26:
	.ascii "sc v0.7.3f\0"
.LC27:
	.ascii "%s, written by Alex Argiropoulos (compiler's version used: gcc-6)\12\0"
.LC28:
	.ascii "isready\0"
.LC29:
	.ascii "readyok\12\0"
.LC30:
	.ascii "uci\0"
.LC31:
	.ascii "ucinewgame\0"
.LC32:
	.ascii "position startpos\12\0"
.LC33:
	.ascii "id name %s\12\0"
.LC34:
	.ascii "id author Alex Argiropoulos, Greece\12\0"
.LC35:
	.ascii "uciok\12\0"
.LC36:
	.ascii "position\0"
.LC37:
	.ascii "go\0"
.LC38:
	.ascii "perft\0"
.LC39:
	.ascii "score\0"
.LC40:
	.ascii "divide\0"
.LC41:
	.ascii "movelist\0"
.LC42:
	.ascii "d\0"
.LC43:
	.ascii "ls\0"
.LC44:
	.ascii "testepd\0"
.LC45:
	.ascii "eval\0"
.LC46:
	.ascii "Eval=%d\12\0"
.LC47:
	.ascii "version\0"
.LC48:
	.ascii "%s\12%s\12- 0x88 board\12- Iterative deepening\12- Null move reduction\12- Futility pruning\12- Razoring pruning\12- MVV/LVA\12- Killer heuristics\12- History heuristics\12- Transposition tables\12- Late Move Reductions\12\0"
.LC49:
	.ascii "quit\0"
	.align	2
	.globl	_input_loop
_input_loop:
	lea (-7984,sp),sp
	movem.l #16190,-(sp)
	pea .LC26
	pea .LC27
	jsr _printf
	addq.l #8,sp
	lea _strncmp,a6
	lea (3932,sp),a2
	move.l #___memset64,d5
	move.l #_fflush,d6
	move.l sp,d7
	add.l #860,d7
.L141:
	pea 4096.w
	clr.l -(sp)
	move.l a2,-(sp)
	move.l d5,a0
	jsr (a0)
	move.l ___sF,a0
	move.l 4(a0),-(sp)
	move.l d6,a0
	jsr (a0)
	move.l ___sF,a0
	move.l (a0),-(sp)
	pea 4096.w
	move.l a2,-(sp)
	jsr _fgets
	lea (28,sp),sp
	tst.l d0
	jeq .L141
	cmp.b #10,3932(sp)
	jeq .L141
	pea 7.w
	pea .LC28
	move.l a2,-(sp)
	jsr (a6)
	lea (12,sp),sp
	tst.l d0
	jeq .L206
	pea 3.w
	pea .LC30
	move.l a2,-(sp)
	jsr (a6)
	lea (12,sp),sp
	tst.l d0
	jeq .L207
	pea 8.w
	pea .LC36
	move.l a2,-(sp)
	jsr (a6)
	lea (12,sp),sp
	tst.l d0
	jeq .L208
	pea 2.w
	pea .LC37
	move.l a2,-(sp)
	jsr (a6)
	lea (12,sp),sp
	tst.l d0
	jeq .L209
	pea 5.w
	pea .LC38
	move.l a2,-(sp)
	jsr (a6)
	lea (12,sp),sp
	tst.l d0
	jeq .L210
	pea 5.w
	pea .LC39
	move.l a2,-(sp)
	jsr (a6)
	move.l d0,d3
	lea (12,sp),sp
	jeq .L211
	pea 6.w
	pea .LC40
	move.l a2,-(sp)
	jsr (a6)
	lea (12,sp),sp
	tst.l d0
	jeq .L212
	pea 8.w
	pea .LC41
	move.l a2,-(sp)
	jsr (a6)
	move.l d0,d3
	lea (12,sp),sp
	jeq .L213
	pea 1.w
	pea .LC42
	move.l a2,-(sp)
	jsr (a6)
	lea (12,sp),sp
	tst.l d0
	jeq .L214
	pea 2.w
	pea .LC43
	move.l a2,-(sp)
	jsr (a6)
	move.l d0,d4
	lea (12,sp),sp
	jeq .L215
	pea 7.w
	pea .LC44
	move.l a2,-(sp)
	jsr (a6)
	lea (12,sp),sp
	tst.l d0
	jeq .L216
	pea 4.w
	pea .LC45
	move.l a2,-(sp)
	jsr (a6)
	lea (12,sp),sp
	tst.l d0
	jeq .L217
	pea 7.w
	pea .LC47
	move.l a2,-(sp)
	jsr (a6)
	lea (12,sp),sp
	tst.l d0
	jeq .L218
	pea 4.w
	pea .LC49
	move.l a2,-(sp)
	jsr (a6)
	lea (12,sp),sp
	tst.l d0
	jne .L141
	movem.l (sp)+,#31996
	lea (7984,sp),sp
	rts
.L206:
	pea .LC29
	jsr _printf
	addq.l #4,sp
	jra .L141
.L207:
	pea 10.w
	pea .LC31
	move.l a2,-(sp)
	jsr (a6)
	lea (12,sp),sp
	tst.l d0
	jne .L146
	jsr _TT_clear
	pea 8.w
	pea .LC21
	pea .LC32+9
	jsr (a6)
	lea (12,sp),sp
	tst.l d0
	jne .L147
	clr.w _board+142
	pea .LC22
	jsr _fen2board
	addq.l #4,sp
	lea _strstr,a3
.L148:
	pea .LC24
	pea .LC32+9
	jsr (a3)
	addq.l #8,sp
	tst.l d0
	jeq .L151
	move.l d0,a3
	addq.l #6,a3
	move.l d0,a0
	tst.b 6(a0)
	jeq .L151
	lea _ParseMove,a4
	lea _move_make,a5
.L156:
	move.l a3,-(sp)
	jsr (a4)
	addq.l #4,sp
	tst.l d0
	jeq .L151
	move.l d0,860(sp)
	move.l d7,-(sp)
	jsr (a5)
	move.b (a3),d0
	and.b #-33,d0
	addq.l #4,sp
	jeq .L189
.L155:
	addq.l #1,a3
	move.b (a3),d0
	and.b #-33,d0
	jne .L155
.L189:
	move.l a3,a0
	addq.l #1,a3
	tst.b 1(a0)
	jne .L156
.L151:
	jsr _printBoard
	moveq #0,d0
	move.b _board+131,d0
	move.l d0,-(sp)
	move.w _board+132,a0
	move.l a0,-(sp)
	pea .LC25
	jsr _printf
	lea (12,sp),sp
	jra .L141
.L208:
	move.l a2,-(sp)
	jsr _ParsePosition
	addq.l #4,sp
	jra .L141
.L209:
	move.l 8032(sp),-(sp)
	move.l a2,-(sp)
	jsr _ParseGo
	addq.l #8,sp
	jra .L141
.L146:
	pea .LC26
	pea .LC33
	jsr _printf
	pea .LC34
	jsr _printf
	pea .LC35
	jsr _printf
	moveq #1,d0
	move.l 8048(sp),a0
	move.l d0,96(a0)
	lea (16,sp),sp
	jra .L141
.L210:
	pea 6(a2)
	jsr _atoi
	move.l d0,d4
	lea _get_ms,a3
	jsr (a3)
	move.l d0,d2
	moveq #0,d0
	not.b d0
	and.l d4,d0
	move.l d0,-(sp)
	jsr _Perft
	move.l d0,a4
	move.l d1,a5
	jsr (a3)
	addq.l #8,sp
	cmp.l d2,d0
	jeq .L219
	sub.l d2,d0
	move.l d0,-(sp)
	move.l a5,d1
	moveq #27,d2
	lsr.l d2,d1
	move.l d1,a0
	move.l a4,d1
	lsl.l #5,d1
	move.l a0,d2
	or.l d1,d2
	move.l a5,d3
	lsl.l #5,d3
	move.l a4,d1
	sub.l a5,d3
	subx.l d1,d2
	add.l d3,d3
	addx.l d2,d2
	add.l d3,d3
	addx.l d2,d2
	move.l a4,d1
	add.l a5,d3
	addx.l d1,d2
	add.l d3,d3
	addx.l d2,d2
	add.l d3,d3
	addx.l d2,d2
	add.l d3,d3
	addx.l d2,d2
	move.l d0,-(sp)
	clr.l -(sp)
	move.l d3,-(sp)
	move.l d2,-(sp)
	jsr ___udivdi3
	lea (12,sp),sp
	move.l d1,(sp)
	move.l d0,-(sp)
	move.l a5,-(sp)
	move.l a4,-(sp)
	move.l d4,-(sp)
	pea .LC3
	jsr _printf
	lea (28,sp),sp
	jra .L141
.L219:
	move.l d2,d0
	addq.l #1,d0
	sub.l d2,d0
	move.l d0,-(sp)
	move.l a5,d1
	moveq #27,d2
	lsr.l d2,d1
	move.l d1,a0
	move.l a4,d1
	lsl.l #5,d1
	move.l a0,d2
	or.l d1,d2
	move.l a5,d3
	lsl.l #5,d3
	move.l a4,d1
	sub.l a5,d3
	subx.l d1,d2
	add.l d3,d3
	addx.l d2,d2
	add.l d3,d3
	addx.l d2,d2
	move.l a4,d1
	add.l a5,d3
	addx.l d1,d2
	add.l d3,d3
	addx.l d2,d2
	add.l d3,d3
	addx.l d2,d2
	add.l d3,d3
	addx.l d2,d2
	move.l d0,-(sp)
	clr.l -(sp)
	move.l d3,-(sp)
	move.l d2,-(sp)
	jsr ___udivdi3
	lea (12,sp),sp
	move.l d1,(sp)
	move.l d0,-(sp)
	move.l a5,-(sp)
	move.l a4,-(sp)
	move.l d4,-(sp)
	pea .LC3
	jsr _printf
	lea (28,sp),sp
	jra .L141
.L211:
	pea 6(a2)
	jsr _atoi
	move.l d0,56(sp)
	move.l d7,-(sp)
	jsr _generateMoves
	addq.l #8,sp
	tst.l d0
	jle .L141
	move.l #_move_make,d1
	lea _kingLoc,a5
	lea _isAttacked,a0
	lea _move_unmake,a1
	move.l d1,48(sp)
	move.l d0,d2
	move.l a0,d0
	move.l a1,a4
	move.l d7,a3
	move.l d0,d4
	move.l a3,-(sp)
	move.l 52(sp),a0
	jsr (a0)
	move.b _board+128,d0
	lsr.b #3,d0
	and.l #255,d0
	moveq #1,d1
	sub.l d0,d1
	move.l d1,d0
	add.l d1,d0
	add.l d0,d0
	move.l (a5,d0.l),-(sp)
	moveq #0,d0
	move.b _board+128,d0
	move.l d0,-(sp)
	move.l d4,a0
	jsr (a0)
	lea (12,sp),sp
	tst.l d0
	jeq .L220
.L163:
	move.l a3,-(sp)
	jsr (a4)
	addq.l #1,d3
	lea (12,a3),a3
	addq.l #4,sp
	cmp.l d2,d3
	jeq .L141
.L204:
	move.l a3,-(sp)
	move.l 52(sp),a0
	jsr (a0)
	move.b _board+128,d0
	lsr.b #3,d0
	and.l #255,d0
	moveq #1,d1
	sub.l d0,d1
	move.l d1,d0
	add.l d1,d0
	add.l d0,d0
	move.l (a5,d0.l),-(sp)
	moveq #0,d0
	move.b _board+128,d0
	move.l d0,-(sp)
	move.l d4,a0
	jsr (a0)
	lea (12,sp),sp
	tst.l d0
	jne .L163
.L220:
	move.l d3,d0
	add.l d3,d0
	add.l d3,d0
	add.l d0,d0
	add.l d0,d0
	lea (8028,sp),a0
	add.l d0,a0
	lea (-7168,a0),a0
	move.l 8(a0),-(sp)
	move.l 4(a0),-(sp)
	move.l (a0),-(sp)
	jsr _printMove
	move.l 8044(sp),-(sp)
	pea 1.w
	pea 76(sp)
	pea 32000.w
	pea -32000.w
	move.l 84(sp),-(sp)
	jsr _AlphaBeta
	lea (36,sp),sp
	neg.l d0
	move.l d0,-(sp)
	pea .LC2
	jsr _printf
	addq.l #8,sp
	move.l a3,-(sp)
	jsr (a4)
	addq.l #1,d3
	lea (12,a3),a3
	addq.l #4,sp
	cmp.l d2,d3
	jne .L204
	jra .L141
.L147:
	pea .LC23
	pea .LC32+9
	lea _strstr,a3
	jsr (a3)
	addq.l #8,sp
	tst.l d0
	jeq .L221
	move.l d0,a0
	pea 4(a0)
	jsr _fen2board
	addq.l #4,sp
	jra .L148
.L212:
	pea 7(a2)
	jsr _atoi
	move.l d0,d4
	lea _get_ms,a4
	jsr (a4)
	move.l d0,a3
	moveq #0,d0
	not.b d0
	and.l d4,d0
	move.l d0,-(sp)
	jsr _Divide
	move.l d0,d2
	move.l d1,d3
	jsr (a4)
	addq.l #8,sp
	cmp.l a3,d0
	jeq .L222
	move.l d0,a0
	sub.l a3,a0
	move.l a0,-(sp)
	move.l d3,d1
	moveq #27,d0
	lsr.l d0,d1
	move.l d1,a1
	move.l d2,d1
	lsl.l #5,d1
	move.l a1,d0
	or.l d1,d0
	move.l d0,a4
	move.l d3,d0
	lsl.l #5,d0
	move.l d0,a5
	move.l a4,d0
	move.l a5,d1
	sub.l d3,d1
	subx.l d2,d0
	add.l d1,d1
	addx.l d0,d0
	add.l d1,d1
	addx.l d0,d0
	add.l d3,d1
	addx.l d2,d0
	add.l d1,d1
	addx.l d0,d0
	add.l d1,d1
	addx.l d0,d0
	add.l d1,d1
	addx.l d0,d0
	move.l d0,a4
	move.l d1,a5
	move.l a0,-(sp)
	smi d1
	ext.w d1
	ext.l d1
	move.l d1,-(sp)
	move.l a5,-(sp)
	move.l a4,-(sp)
	jsr ___udivdi3
	lea (12,sp),sp
	move.l d1,(sp)
	move.l d0,-(sp)
	move.l d3,-(sp)
	move.l d2,-(sp)
	move.l d4,-(sp)
	pea .LC3
	jsr _printf
	lea (28,sp),sp
	jra .L141
.L222:
	addq.l #1,d0
	move.l d0,a0
	sub.l a3,a0
	move.l a0,-(sp)
	move.l d3,d1
	moveq #27,d0
	lsr.l d0,d1
	move.l d1,a1
	move.l d2,d1
	lsl.l #5,d1
	move.l a1,d0
	or.l d1,d0
	move.l d0,a4
	move.l d3,d0
	lsl.l #5,d0
	move.l d0,a5
	move.l a4,d0
	move.l a5,d1
	sub.l d3,d1
	subx.l d2,d0
	add.l d1,d1
	addx.l d0,d0
	add.l d1,d1
	addx.l d0,d0
	add.l d3,d1
	addx.l d2,d0
	add.l d1,d1
	addx.l d0,d0
	add.l d1,d1
	addx.l d0,d0
	add.l d1,d1
	addx.l d0,d0
	move.l d0,a4
	move.l d1,a5
	move.l a0,-(sp)
	smi d1
	ext.w d1
	ext.l d1
	move.l d1,-(sp)
	move.l a5,-(sp)
	move.l a4,-(sp)
	jsr ___udivdi3
	lea (12,sp),sp
	move.l d1,(sp)
	move.l d0,-(sp)
	move.l d3,-(sp)
	move.l d2,-(sp)
	move.l d4,-(sp)
	pea .LC3
	jsr _printf
	lea (28,sp),sp
	jra .L141
.L213:
	move.l d7,-(sp)
	jsr _generateMoves
	move.l d0,52(sp)
	addq.l #4,sp
	jle .L172
	move.l #_move_make,d2
	lea _kingLoc,a5
	lea _isAttacked,a0
	lea _move_unmake,a1
	move.l a0,d0
	move.l a1,a4
	move.l d7,a3
	move.l d0,d4
.L171:
	move.l a3,-(sp)
	move.l d2,a0
	jsr (a0)
	move.b _board+128,d0
	lsr.b #3,d0
	and.l #255,d0
	moveq #1,d1
	sub.l d0,d1
	move.l d1,d0
	add.l d1,d0
	add.l d0,d0
	move.l (a5,d0.l),-(sp)
	moveq #0,d0
	move.b _board+128,d0
	move.l d0,-(sp)
	move.l d4,a0
	jsr (a0)
	lea (12,sp),sp
	tst.l d0
	jeq .L223
	move.l a3,-(sp)
	jsr (a4)
	addq.l #1,d3
	lea (12,a3),a3
	addq.l #4,sp
	cmp.l 48(sp),d3
	jne .L171
.L172:
	pea .LC0
	jsr _printf
	addq.l #4,sp
	jra .L141
.L223:
	move.l d3,d0
	add.l d3,d0
	add.l d3,d0
	add.l d0,d0
	add.l d0,d0
	lea (8028,sp),a0
	add.l d0,a0
	lea (-7168,a0),a0
	move.l 8(a0),-(sp)
	move.l 4(a0),-(sp)
	move.l (a0),-(sp)
	jsr _printMove
	pea .LC1
	jsr _printf
	lea (16,sp),sp
	move.l a3,-(sp)
	jsr (a4)
	addq.l #1,d3
	lea (12,a3),a3
	addq.l #4,sp
	cmp.l 48(sp),d3
	jne .L171
	jra .L172
.L214:
	jsr _printBoard
	jra .L141
.L215:
	move.l d7,-(sp)
	jsr _generateMoves
	move.l d0,52(sp)
	addq.l #4,sp
	jle .L141
	move.l #_move_make,d1
	lea _kingLoc,a5
	lea _isAttacked,a4
	lea _move_unmake,a0
	move.l d1,d0
	move.l a0,d2
	move.l d7,a3
	move.l d0,d3
.L176:
	move.l 48(sp),-(sp)
	move.l d4,-(sp)
	move.l d7,-(sp)
	jsr _pickMove
	move.l a3,-(sp)
	move.l d3,a0
	jsr (a0)
	move.b _board+128,d0
	lsr.b #3,d0
	and.l #255,d0
	moveq #1,d1
	sub.l d0,d1
	move.l d1,d0
	add.l d1,d0
	add.l d0,d0
	move.l (a5,d0.l),-(sp)
	moveq #0,d0
	move.b _board+128,d0
	move.l d0,-(sp)
	jsr (a4)
	lea (24,sp),sp
	tst.l d0
	jeq .L177
.L224:
	move.l a3,-(sp)
	move.l d2,a0
	jsr (a0)
	addq.l #1,d4
	lea (12,a3),a3
	addq.l #4,sp
	cmp.l 48(sp),d4
	jeq .L141
	move.l 48(sp),-(sp)
	move.l d4,-(sp)
	move.l d7,-(sp)
	jsr _pickMove
	move.l a3,-(sp)
	move.l d3,a0
	jsr (a0)
	move.b _board+128,d0
	lsr.b #3,d0
	and.l #255,d0
	moveq #1,d1
	sub.l d0,d1
	move.l d1,d0
	add.l d1,d0
	add.l d0,d0
	move.l (a5,d0.l),-(sp)
	moveq #0,d0
	move.b _board+128,d0
	move.l d0,-(sp)
	jsr (a4)
	lea (24,sp),sp
	tst.l d0
	jne .L224
.L177:
	move.l (a3),d0
	move.l 8(a3),52(sp)
	move.l d0,-(sp)
	move.l d0,48(sp)
	jsr _moveToUCI
	move.l 48(sp),d1
	move.l d1,-(sp)
	move.l 60(sp),-(sp)
	move.l d0,-(sp)
	pea .LC20
	jsr _printf
	move.l a3,-(sp)
	move.l d2,a0
	jsr (a0)
	addq.l #1,d4
	lea (12,a3),a3
	lea (24,sp),sp
	cmp.l 48(sp),d4
	jne .L176
	jra .L141
.L216:
	pea .LC1
	pea 8(a2)
	jsr _strstr
	move.l d0,a1
	addq.l #8,sp
	tst.l d0
	jeq .L225
	move.l d0,d2
	addq.l #1,d2
	clr.b (a1)
	move.l d2,a0
.L183:
	tst.b (a0)+
	jne .L183
	move.l d2,d0
	sub.l a0,d0
	not.l d0
	clr.b (a1,d0.l)
	pea 7(a2)
	jsr _atoi
	move.l d0,-(sp)
	move.l d2,-(sp)
	jsr _testEPD
	lea (12,sp),sp
	jra .L141
.L221:
	pea .LC22
	jsr _fen2board
	addq.l #4,sp
	jra .L148
.L217:
	jsr _Evaluate
	move.l d0,-(sp)
	pea .LC46
	jsr _printf
	addq.l #8,sp
	jra .L141
.L218:
	clr.b _cpustr.3126
	pea _cpustr.3126
	pea .LC26
	pea .LC48
	jsr _printf
	lea (12,sp),sp
	jra .L141
.L225:
	pea 100.w
	pea .LC4
	jsr _testEPD
	pea .LC5
	jsr _printf
	lea (12,sp),sp
	jra .L141
.lcomm _cpustr.3126,160

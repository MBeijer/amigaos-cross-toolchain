#NO_APP
	.text
	.align	2
	.globl	_object_setAnim
_object_setAnim:
	moveq #0,d1
	move.w 44(a0),d1
	move.w d0,a1
	cmp.l d1,a1
	jeq .L1
	move.w d0,44(a0)
	moveq #0,d1
	move.w d0,d1
	move.l d1,d0
	add.l d1,d0
	add.l d0,d0
	add.l d1,d0
	add.l d0,d0
	move.l d0,d1
	add.l #_object_animations,d1
	move.l d1,48(a0)
	lea _object_animations,a1
	move.w (a1,d0.l),d0
	move.w d0,36(a0)
	move.w d0,a1
	move.l a1,d0
	add.l a1,d0
	add.l a1,d0
	add.l d0,d0
	add.l d0,d0
	add.l #_object_imageAtlas,d0
	move.l d0,38(a0)
	clr.w 72(a0)
.L1:
	rts
	.align	2
	.globl	_object_free
_object_free:
	move.l a2,-(sp)
	move.l a0,a2
	move.l 82(a0),a1
	cmp.w #0,a1
	jeq .L6
	move.l 4(a0),a0
	jsr (a1)
.L6:
	move.l 12(a2),a0
	cmp.w #0,a0
	jeq .L21
	move.l 8(a2),8(a0)
	move.l 8(a2),a1
	cmp.w #0,a1
	jeq .L9
	move.l a0,12(a1)
.L9:
	subq.w #1,_object_count
	move.l _object_freeList,a0
	cmp.w #0,a0
	jeq .L22
.L11:
	move.l a0,8(a2)
	move.l a2,12(a0)
	clr.l 12(a2)
	move.l a2,_object_freeList
	move.l (sp)+,a2
	rts
.L21:
	move.l 8(a2),a0
	move.l a0,_object_activeList
	jeq .L9
	clr.l 12(a0)
	subq.w #1,_object_count
	move.l _object_freeList,a0
	cmp.w #0,a0
	jne .L11
.L22:
	move.l a2,_object_freeList
	clr.l 8(a2)
	clr.l 12(a2)
	move.l (sp)+,a2
	rts
	.align	2
	.globl	_object_setAction
_object_setAction:
	move.w d0,46(a0)
	add.w 42(a0),d0
	move.w d0,a1
	moveq #0,d1
	move.w 44(a0),d1
	cmp.l a1,d1
	jeq .L23
	move.w d0,44(a0)
	and.l #65535,d0
	move.l d0,d1
	add.l d0,d1
	add.l d1,d1
	add.l d1,d0
	add.l d0,d0
	move.l d0,d1
	add.l #_object_animations,d1
	move.l d1,48(a0)
	lea _object_animations,a1
	move.w (a1,d0.l),d0
	move.w d0,36(a0)
	move.w d0,a1
	move.l a1,d0
	add.l a1,d0
	add.l a1,d0
	add.l d0,d0
	add.l d0,d0
	add.l #_object_imageAtlas,d0
	move.l d0,38(a0)
	clr.w 72(a0)
.L23:
	rts
	.align	2
	.globl	_object_updatePosition
_object_updatePosition:
	movem.l #16176,-(sp)
	move.w 26(a0),d2
	move.w 28(a0),d1
	cmp.w #2,d0
	jeq .L39
.L28:
	move.w 24(a0),d4
	move.w 22(a0),d5
	add.w d5,d2
	move.w d2,22(a0)
	move.w _game_cameraX,d3
	move.w 16(a0),d6
	sub.w d3,d6
	move.w d2,d0
	moveq #15,d7
	lsr.w d7,d0
	add.w d2,d0
	asr.w #1,d0
	move.w d0,16(a0)
	move.w d0,a1
	move.w d3,a2
	cmp.w #287,d6
	jgt .L30
	lea (32,a1),a3
	move.l a3,d0
	sub.l a2,d0
	cmp.l #319,d0
	jgt .L40
	tst.w d6
	jge .L30
.L32:
	move.w d1,d0
	add.w d4,d0
	move.w 18(a0),d3
	move.w d0,24(a0)
	move.w d0,d1
	moveq #15,d6
	lsr.w d6,d1
	add.w d0,d1
	asr.w #1,d1
	move.w d1,18(a0)
	cmp.w #207,d1
	jle .L33
.L41:
	move.w #206,18(a0)
	move.w #412,24(a0)
	move.w #412,d0
.L34:
	sub.w d5,d2
	move.w d2,30(a0)
	sub.w d4,d0
	move.w d0,32(a0)
	movem.l (sp)+,#3324
	rts
.L30:
	move.l a1,d0
	sub.l a2,d0
	jpl .L32
	move.w d3,16(a0)
	move.w d3,d2
	add.w d3,d2
	move.w d2,22(a0)
	move.w d1,d0
	add.w d4,d0
	move.w 18(a0),d3
	move.w d0,24(a0)
	move.w d0,d1
	moveq #15,d6
	lsr.w d6,d1
	add.w d0,d1
	asr.w #1,d1
	move.w d1,18(a0)
	cmp.w #207,d1
	jgt .L41
.L33:
	cmp.w #65,d3
	jle .L34
	cmp.w #65,d1
	jgt .L34
	move.w #66,18(a0)
	move.w #132,24(a0)
	move.w #132,d0
	sub.w d5,d2
	move.w d2,30(a0)
	sub.w d4,d0
	move.w d0,32(a0)
	movem.l (sp)+,#3324
	rts
.L39:
	add.w d2,d2
	add.w d1,d1
	jra .L28
.L40:
	move.w d3,d2
	add.w #287,d2
	move.w d2,16(a0)
	add.w d2,d2
	move.w d2,22(a0)
	jra .L32
	.align	2
	.globl	_object_init
_object_init:
	clr.w _object_count
	clr.l _object_activeList
	move.l #_object_buffer,_object_freeList
	lea _object_buffer+8,a0
	clr.l 4(a0)
	move.l #_object_buffer+96,(a0)
	move.l #_object_buffer,100(a0)
	move.l #_object_buffer+192,96(a0)
	move.l #_object_buffer+96,196(a0)
	move.l #_object_buffer+288,192(a0)
	move.l #_object_buffer+192,292(a0)
	move.l #_object_buffer+384,288(a0)
	move.l #_object_buffer+288,388(a0)
	move.l #_object_buffer+480,384(a0)
	move.l #_object_buffer+384,484(a0)
	move.l #_object_buffer+576,480(a0)
	move.l #_object_buffer+480,580(a0)
	move.l #_object_buffer+672,576(a0)
	move.l #_object_buffer+576,676(a0)
	move.l #_object_buffer+768,672(a0)
	move.l #_object_buffer+672,772(a0)
	move.l #_object_buffer+864,768(a0)
	move.l #_object_buffer+768,868(a0)
	move.l #_object_buffer+960,864(a0)
	move.l #_object_buffer+864,964(a0)
	move.l #_object_buffer+1056,960(a0)
	move.l #_object_buffer+960,1060(a0)
	clr.l 1056(a0)
	rts
	.align	2
	.globl	_object_clear
_object_clear:
	subq.l #4,sp
	movem.l #16190,-(sp)
	move.l a0,d7
	move.l 52(sp),a0
	move.w a1,d2
	jeq .L43
	move.w d0,d5
	asr.w #4,d5
	move.w d1,d2
	asr.w #4,d2
	move.w a1,a1
	ext.l d0
	lea (a1,d0.l),a2
	move.l a2,d0
	asr.l #4,d0
	move.l d0,a5
	move.w a0,a0
	ext.l d1
	lea (a0,d1.l),a0
	move.l a0,d4
	asr.l #4,d4
	move.w d5,d6
	ext.l d6
	cmp.l d0,d6
	jgt .L43
	move.w d2,a6
	cmp.l d4,a6
	jgt .L43
	lsl.w #4,d5
	move.l d6,d0
	lsl.l #4,d0
	lea (a6,d0.l),a3
	add.l a3,a3
	add.l #_level,a3
	lsl.w #4,d2
	move.w d2,46(sp)
	lea _gfx_quickRenderTile,a4
.L48:
	move.l a3,a2
	move.w 46(sp),d2
	move.l a6,d3
.L47:
	tst.w d2
	jlt .L49
	move.w d5,d0
	sub.w _game_cameraX,d0
	sub.w _game_screenScrollX,d0
	move.w d0,d1
	add.w #-322,d1
	cmp.w #-338,d1
	jhi .L57
.L49:
	addq.l #1,d3
	add.w #16,d2
	addq.l #2,a2
	cmp.l d4,d3
	jle .L47
.L58:
	addq.l #1,d6
	add.w #16,d5
	lea (32,a3),a3
	cmp.l a5,d6
	jle .L48
.L43:
	movem.l (sp)+,#31996
	addq.l #4,sp
	rts
.L57:
	moveq #0,d1
	move.w (a2),d1
	move.l d1,a1
	add.w #15,d0
	add.l #_level+205160,a1
	move.w d2,d1
	ext.l d1
	and.l #65535,d0
	move.l d7,a0
	jsr (a4)
	addq.l #1,d3
	add.w #16,d2
	addq.l #2,a2
	cmp.l d4,d3
	jle .L47
	jra .L58
	.align	2
	.globl	_object_renderObject
_object_renderObject:
	subq.l #8,sp
	movem.l #16190,-(sp)
	move.l a0,d6
	tst.w 86(a1)
	jeq .L59
	move.l 38(a1),a4
	move.w 4(a4),d4
	move.w 6(a4),d7
	move.w _game_cameraX,a0
	add.w _game_screenScrollX,a0
	move.w 16(a1),d0
	sub.w a0,d0
	move.w d0,a0
	add.w 8(a4),a0
	move.w a0,d3
	add.w #15,d3
	move.w 10(a4),a2
	add.w 18(a1),a2
	move.w a2,d5
	sub.w d7,d5
	move.w d5,a3
	move.w (a4),d0
	move.w 2(a4),d1
	cmp.w #-16,d3
	jge .L62
	moveq #-15,d2
	sub.w a0,d2
	and.w #-16,d2
	add.w d2,d0
	sub.w d2,d4
	add.w d2,d3
.L62:
	move.w d3,a0
	lea (a0,d4.w),a4
	cmp.w #336,a4
	jle .L63
	add.w d4,d3
	add.w #-336,d3
	and.w #-16,d3
	sub.w d3,d4
.L63:
	tst.w d5
	jlt .L79
	tst.w d4
	jle .L59
.L81:
	tst.w d7
	jle .L59
	tst.w 88(a1)
	jne .L80
	move.w d7,a1
	move.l a1,-(sp)
	move.w d4,a1
	move.l a1,-(sp)
	move.w a3,a3
	move.l a3,-(sp)
	move.l a0,a1
	ext.l d1
	ext.l d0
	move.l d6,a0
	jsr _gfx_renderSprite
	lea (12,sp),sp
.L59:
	movem.l (sp)+,#31996
	addq.l #8,sp
	rts
.L79:
	sub.w d5,d1
	move.w a2,d7
	sub.l a3,a3
	tst.w d4
	jgt .L81
	jra .L59
.L80:
	move.l a1,46(sp)
	jsr _gfx_setupRenderTile
	move.l 46(sp),a1
	move.w 18(a1),d0
	sub.w d7,d0
	move.l 38(a1),a0
	move.w 8(a0),d2
	add.w 16(a1),d2
	move.w d2,d5
	asr.w #4,d5
	move.w d0,d1
	asr.w #4,d1
	move.w d2,a0
	lea (a0,d4.w),a1
	move.l a1,d2
	asr.l #4,d2
	move.l d2,a5
	move.w d0,a0
	lea (a0,d7.w),a0
	move.l a0,d4
	asr.l #4,d4
	move.w d5,d7
	ext.l d7
	cmp.l d2,d7
	jgt .L59
	move.w d1,a6
	cmp.l d4,a6
	jgt .L59
	lsl.w #4,d5
	move.l d7,d0
	lsl.l #4,d0
	lea (a6,d0.l),a3
	add.l a3,a3
	add.l #_level,a3
	lsl.w #4,d1
	move.w d1,50(sp)
	lea _gfx_quickRenderTile,a4
	move.l a3,a2
	move.w 50(sp),d2
	move.l a6,d3
.L68:
	tst.w d2
	jlt .L70
	move.w d5,d0
	sub.w _game_cameraX,d0
	sub.w _game_screenScrollX,d0
	move.w d0,d1
	add.w #-322,d1
	cmp.w #-338,d1
	jhi .L82
.L70:
	addq.l #1,d3
	add.w #16,d2
	addq.l #2,a2
	cmp.l d4,d3
	jle .L68
.L83:
	addq.l #1,d7
	add.w #16,d5
	lea (32,a3),a3
	cmp.l a5,d7
	jgt .L59
	move.l a3,a2
	move.w 50(sp),d2
	move.l a6,d3
	jra .L68
.L82:
	moveq #0,d1
	move.w (a2),d1
	move.l d1,a1
	add.w #15,d0
	add.l #_level+205160,a1
	move.w d2,d1
	ext.l d1
	and.l #65535,d0
	move.l d6,a0
	jsr (a4)
	addq.l #1,d3
	add.w #16,d2
	addq.l #2,a2
	cmp.l d4,d3
	jle .L68
	jra .L83
	.align	2
	.globl	_object_render
_object_render:
	lea (-20,sp),sp
	movem.l #16190,-(sp)
	move.l a0,a6
	move.w d0,50(sp)
	moveq #0,d3
	move.w d0,d3
	move.l _object_activeList,a2
	cmp.w #0,a2
	jeq .L85
.L97:
	move.l 8(a2),d2
	move.l 78(a2),a1
	cmp.w #0,a1
	jeq .L86
	move.l a2,a0
	move.l d3,d0
	jsr (a1)
.L86:
	cmp.w #1,76(a2)
	jeq .L161
	move.l d2,a2
	tst.l d2
	jne .L97
.L166:
	move.l _object_activeList,a4
	move.l #_gfx_setupRenderTile,56(sp)
	lea _gfx_setupRenderTile,a2
	jsr (a2)
	lea _gfx_quickRenderTile,a5
	cmp.w #0,a4
	jeq .L99
.L139:
	tst.w 88(a4)
	jne .L103
	move.l 68(a4),a0
	move.w 4(a0),d0
	jne .L162
.L103:
	move.l 8(a4),a4
	cmp.w #0,a4
	jne .L139
.L99:
	move.l _object_activeList,a0
	cmp.w #0,a0
	jeq .L113
	clr.w d1
	lea _object_zBuffer,a3
.L112:
	move.w d1,a1
	move.l a1,d0
	add.l a1,d0
	add.l d0,d0
	move.l a0,(a3,d0.l)
	addq.w #1,d1
	move.l 68(a0),a1
	move.l 38(a0),a2
	move.w 16(a0),d0
	add.w 8(a2),d0
	move.w d0,(a1)
	move.w 6(a2),d0
	move.w 18(a0),d2
	sub.w d0,d2
	move.w d2,2(a1)
	move.w 4(a2),4(a1)
	move.w d0,6(a1)
	lea (52,a0),a2
	cmp.l a1,a2
	jeq .L163
	move.l a2,68(a0)
	move.l 8(a0),a0
	cmp.w #0,a0
	jne .L112
.L113:
	move.w _object_count,d3
	jle .L84
	clr.w d7
	lea _object_zBuffer,a0
	move.l a0,d6
.L128:
	move.w d7,a0
	move.l a0,d0
	add.l a0,d0
	add.l d0,d0
	move.l d6,a0
	move.l (a0,d0.l),a3
	cmp.w #1,76(a3)
	jeq .L114
	tst.w 86(a3)
	jne .L164
.L116:
	move.w 72(a3),d0
	move.l 48(a3),a0
	moveq #0,d1
	move.w d0,d1
	move.w 4(a0),a1
	cmp.l d1,a1
	jgt .L126
.L171:
	move.w 36(a3),d0
	addq.w #1,d0
	move.w d0,36(a3)
	clr.w 72(a3)
	cmp.w 2(a0),d0
	jle .L127
	move.w (a0),d0
	move.w d0,36(a3)
.L127:
	move.w d0,a0
	move.l a0,d0
	add.l a0,d0
	add.l a0,d0
	add.l d0,d0
	add.l d0,d0
	add.l #_object_imageAtlas,d0
	move.l d0,38(a3)
.L114:
	addq.w #1,d7
	cmp.w d3,d7
	jlt .L128
.L84:
	movem.l (sp)+,#31996
	lea (20,sp),sp
	rts
.L161:
	move.w 74(a2),d0
	cmp.w #2,d0
	jeq .L165
	addq.w #1,d0
	move.w d0,74(a2)
	move.l d2,a2
	tst.l d2
	jne .L97
	jra .L166
.L162:
	move.w 2(a0),d3
	move.w (a0),d2
	move.w d2,d5
	asr.w #4,d5
	move.w d3,d1
	asr.w #4,d1
	move.w d2,a1
	lea (a1,d0.w),a1
	move.l a1,d0
	asr.l #4,d0
	move.l d0,46(sp)
	move.w 6(a0),a0
	lea (a0,d3.w),a0
	move.l a0,d4
	asr.l #4,d4
	move.w d5,d6
	ext.l d6
	cmp.l d0,d6
	jgt .L103
	move.w d1,d7
	ext.l d7
	cmp.l d4,d7
	jgt .L103
	lsl.w #4,d5
	move.l d6,d0
	lsl.l #4,d0
	move.l d0,a3
	add.l d7,a3
	add.l a3,a3
	add.l #_level,a3
	lsl.w #4,d1
	move.l a4,52(sp)
	move.w d1,a4
.L105:
	move.l a3,a2
	move.w a4,d2
	move.l d7,d3
.L104:
	tst.w d2
	jlt .L106
	move.w d5,d0
	sub.w _game_cameraX,d0
	sub.w _game_screenScrollX,d0
	move.w d0,d1
	add.w #-322,d1
	cmp.w #-338,d1
	jhi .L167
.L106:
	addq.l #1,d3
	add.w #16,d2
	addq.l #2,a2
	cmp.l d4,d3
	jle .L104
.L168:
	addq.l #1,d6
	add.w #16,d5
	lea (32,a3),a3
	cmp.l 46(sp),d6
	jle .L105
	move.l 52(sp),a4
	move.l 8(a4),a4
	cmp.w #0,a4
	jne .L139
	jra .L99
.L167:
	moveq #0,d1
	move.w (a2),d1
	move.l d1,a1
	add.w #15,d0
	add.l #_level+205160,a1
	move.w d2,d1
	ext.l d1
	and.l #65535,d0
	move.l a6,a0
	jsr (a5)
	addq.l #1,d3
	add.w #16,d2
	addq.l #2,a2
	cmp.l d4,d3
	jle .L104
	jra .L168
.L163:
	lea (60,a0),a1
	move.l a1,68(a0)
	move.l 8(a0),a0
	cmp.w #0,a0
	jne .L112
	jra .L113
.L164:
	move.l 38(a3),a4
	move.w 4(a4),d4
	move.w 6(a4),d5
	move.w _game_cameraX,a0
	add.w _game_screenScrollX,a0
	move.w 16(a3),a2
	sub.w a0,a2
	move.w a2,a1
	add.w 8(a4),a1
	move.w a1,d2
	add.w #15,d2
	move.w 10(a4),a2
	add.w 18(a3),a2
	move.w a2,d0
	sub.w d5,d0
	move.w d0,a5
	move.w (a4),a0
	move.w 2(a4),46(sp)
	cmp.w #-16,d2
	jge .L117
	moveq #-15,d1
	sub.w a1,d1
	and.w #-16,d1
	add.w d1,a0
	sub.w d1,d4
	add.w d1,d2
.L117:
	move.w d2,a1
	lea (a1,d4.w),a4
	cmp.w #336,a4
	jle .L118
	add.w d4,d2
	add.w #-336,d2
	and.w #-16,d2
	sub.w d2,d4
.L118:
	tst.w d0
	jlt .L169
.L119:
	tst.w d4
	jle .L116
	tst.w d5
	jle .L116
	tst.w 88(a3)
	jne .L170
	move.w d5,a2
	move.l a2,-(sp)
	move.w d4,a2
	move.l a2,-(sp)
	move.w a5,a5
	move.l a5,-(sp)
	move.w 58(sp),d1
	ext.l d1
	move.w a0,d0
	ext.l d0
	move.l a6,a0
	jsr _gfx_renderSprite
	lea (12,sp),sp
.L156:
	move.w _object_count,d3
	move.w 72(a3),d0
	move.l 48(a3),a0
	moveq #0,d1
	move.w d0,d1
	move.w 4(a0),a1
	cmp.l d1,a1
	jle .L171
.L126:
	add.w 50(sp),d0
	move.w d0,72(a3)
	addq.w #1,d7
	cmp.w d3,d7
	jlt .L128
	jra .L84
.L169:
	sub.w d0,46(sp)
	move.w a2,d5
	sub.l a5,a5
	jra .L119
.L165:
	cmp.l _game_player1.l,a2
	jeq .L172
	cmp.l _game_player2.l,a2
	jeq .L173
.L90:
	move.l 82(a2),a1
	cmp.w #0,a1
	jeq .L91
	move.l 4(a2),a0
	jsr (a1)
.L91:
	move.l 12(a2),a0
	cmp.w #0,a0
	jeq .L174
	move.l 8(a2),8(a0)
	move.l 8(a2),a1
	cmp.w #0,a1
	jeq .L94
	move.l a0,12(a1)
.L94:
	subq.w #1,_object_count
	move.l _object_freeList,a0
	cmp.w #0,a0
	jeq .L175
	move.l a0,8(a2)
	move.l a2,12(a0)
	clr.l 12(a2)
	move.l a2,_object_freeList
	move.l d2,a2
	tst.l d2
	jne .L97
	jra .L166
.L170:
	move.l 56(sp),a2
	jsr (a2)
	move.w 18(a3),d0
	sub.w d5,d0
	move.l 38(a3),a0
	move.w 8(a0),d3
	add.w 16(a3),d3
	move.w d3,d2
	asr.w #4,d2
	move.w d0,d1
	asr.w #4,d1
	move.w d3,a0
	lea (a0,d4.w),a0
	move.l a0,d3
	asr.l #4,d3
	move.w d0,a0
	lea (a0,d5.w),a0
	move.l a0,d4
	asr.l #4,d4
	move.w d2,a5
	cmp.l d3,a5
	jgt .L156
	move.w d1,a0
	cmp.l d4,a0
	jgt .L156
	move.w d2,d5
	lsl.w #4,d5
	move.l a5,d0
	lsl.l #4,d0
	lea (a0,d0.l),a4
	add.l a4,a4
	add.l #_level,a4
	lsl.w #4,d1
	move.l a3,46(sp)
	move.w d7,52(sp)
	move.l a0,d7
	move.w d1,a3
	move.l d6,60(sp)
	move.l d3,d6
.L123:
	move.l a4,a2
	move.w a3,d2
	move.l d7,d3
.L122:
	tst.w d2
	jlt .L124
	move.w d5,d0
	sub.w _game_cameraX,d0
	sub.w _game_screenScrollX,d0
	move.w d0,d1
	add.w #-322,d1
	cmp.w #-338,d1
	jhi .L176
.L124:
	addq.l #1,d3
	add.w #16,d2
	addq.l #2,a2
	cmp.l d4,d3
	jle .L122
.L177:
	addq.l #1,a5
	add.w #16,d5
	lea (32,a4),a4
	cmp.l d6,a5
	jle .L123
	move.l 46(sp),a3
	move.w 52(sp),d7
	move.l 60(sp),d6
	move.w _object_count,d3
	jra .L116
.L176:
	moveq #0,d1
	move.w (a2),d1
	move.l d1,a1
	add.w #15,d0
	add.l #_level+205160,a1
	move.w d2,d1
	ext.l d1
	and.l #65535,d0
	move.l a6,a0
	jsr _gfx_quickRenderTile
	addq.l #1,d3
	add.w #16,d2
	addq.l #2,a2
	cmp.l d4,d3
	jle .L122
	jra .L177
.L173:
	clr.l _game_player2
	jra .L90
.L85:
	move.l #_gfx_setupRenderTile,56(sp)
	lea _gfx_setupRenderTile,a2
	jsr (a2)
	jra .L99
.L172:
	clr.l _game_player1
	jra .L90
.L174:
	move.l 8(a2),a0
	move.l a0,_object_activeList
	jeq .L94
	clr.l 12(a0)
	jra .L94
.L175:
	move.l a2,_object_freeList
	clr.l 8(a2)
	clr.l 12(a2)
	move.l d2,a2
	tst.l d2
	jne .L97
	jra .L166
	.align	2
	.globl	_object_restoreBackground
_object_restoreBackground:
	subq.l #8,sp
	movem.l #16190,-(sp)
	move.l a0,a5
	move.l _object_activeList,a4
	jsr _gfx_setupRenderTile
	lea _gfx_quickRenderTile,a6
	cmp.w #0,a4
	jeq .L178
.L190:
	tst.w 88(a4)
	jne .L183
	move.l 68(a4),a0
	move.w 4(a0),d0
	jne .L199
.L183:
	move.l 8(a4),a4
	cmp.w #0,a4
	jne .L190
.L178:
	movem.l (sp)+,#31996
	addq.l #8,sp
	rts
.L199:
	move.w 2(a0),d3
	move.w (a0),d2
	move.w d2,d5
	asr.w #4,d5
	move.w d3,d1
	asr.w #4,d1
	move.w d2,a1
	lea (a1,d0.w),a1
	move.l a1,d0
	asr.l #4,d0
	move.l d0,44(sp)
	move.w 6(a0),a0
	lea (a0,d3.w),a0
	move.l a0,d4
	asr.l #4,d4
	move.w d5,d6
	ext.l d6
	cmp.l d0,d6
	jgt .L183
	move.w d1,d7
	ext.l d7
	cmp.l d4,d7
	jgt .L183
	lsl.w #4,d5
	move.l d6,d0
	lsl.l #4,d0
	move.l d0,a3
	add.l d7,a3
	add.l a3,a3
	add.l #_level,a3
	lsl.w #4,d1
	move.l a4,48(sp)
	move.w d1,a4
.L185:
	move.l a3,a2
	move.w a4,d2
	move.l d7,d3
.L184:
	tst.w d2
	jlt .L186
	move.w d5,d0
	sub.w _game_cameraX,d0
	sub.w _game_screenScrollX,d0
	move.w d0,d1
	add.w #-322,d1
	cmp.w #-338,d1
	jhi .L200
.L186:
	addq.l #1,d3
	add.w #16,d2
	addq.l #2,a2
	cmp.l d4,d3
	jle .L184
.L201:
	addq.l #1,d6
	add.w #16,d5
	lea (32,a3),a3
	cmp.l 44(sp),d6
	jle .L185
	move.l 48(sp),a4
	move.l 8(a4),a4
	cmp.w #0,a4
	jne .L190
	jra .L178
.L200:
	moveq #0,d1
	move.w (a2),d1
	move.l d1,a1
	add.w #15,d0
	add.l #_level+205160,a1
	move.w d2,d1
	ext.l d1
	and.l #65535,d0
	move.l a5,a0
	jsr (a6)
	addq.l #1,d3
	add.w #16,d2
	addq.l #2,a2
	cmp.l d4,d3
	jle .L184
	jra .L201
	.align	2
	.globl	_object_collision
_object_collision:
	movem.l #16190,-(sp)
	move.l a0,a3
	move.l a1,a5
	move.w 50(sp),d4
	move.w 28(a0),a1
	move.w 26(a0),a0
	cmp.w #2,d0
	jeq .L214
.L203:
	move.l _object_activeList,a2
	clr.l 12(a5)
	clr.l 8(a5)
	clr.l 4(a5)
	clr.l (a5)
	move.w 24(a3),a4
	lea (a4,a1.w),a4
	move.l a4,d0
	jpl .L216
	addq.l #1,d0
.L216:
	asr.l #1,d0
	move.l d0,a4
	move.w d0,d5
	move.w 22(a3),a1
	lea (a1,a0.w),a0
	move.l a0,d0
	jpl .L217
	addq.l #1,d0
.L217:
	asr.l #1,d0
	move.w 90(a3),a0
	move.w a0,d6
	sub.w d1,d6
	add.w d0,d6
	move.w 92(a3),d2
	add.w d1,d2
	sub.w a0,d2
	add.w d0,d2
	clr.w d7
	cmp.w #0,a2
	jeq .L202
	lea _abs,a6
	and.l #65535,d4
.L209:
	tst.w 94(a2)
	jeq .L205
	cmp.l a3,a2
	jeq .L205
	move.w 18(a2),d3
	move.l a4,a0
	sub.w d3,a0
	move.l a0,d0
	jsr (a6)
	cmp.l d0,d4
	jlt .L205
	move.w 16(a2),d1
	move.w 90(a2),a0
	move.w d1,d0
	sub.w a0,d0
	add.w 92(a2),d0
	cmp.w d6,d0
	jle .L205
	add.w a0,d1
	cmp.w d2,d1
	jge .L205
	cmp.w d5,d3
	jlt .L206
	move.l a2,(a5)
	cmp.w d6,d1
	jlt .L208
.L215:
	move.l a2,12(a5)
	moveq #1,d7
.L205:
	move.l 8(a2),a2
	cmp.w #0,a2
	jne .L209
.L202:
	move.w d7,d0
	movem.l (sp)+,#31996
	rts
.L214:
	add.w a0,a0
	add.w a1,a1
	jra .L203
.L206:
	move.l a2,4(a5)
	cmp.w d6,d1
	jge .L215
.L208:
	move.l a2,8(a5)
	moveq #1,d7
	move.l 8(a2),a2
	cmp.w #0,a2
	jne .L209
	jra .L202
	.align	2
	.globl	_object_add
_object_add:
	movem.l #12344,-(sp)
	move.l 24(sp),d3
	move.l 28(sp),a3
	move.w d1,d2
	move.l _object_freeList,a2
	move.l 8(a2),a4
	move.l a4,_object_freeList
	jeq .L219
	clr.l 12(a4)
.L219:
	clr.w 76(a2)
	move.w d1,2(a2)
	move.w #1,86(a2)
	move.w d0,(a2)
	move.w d3,26(a2)
	clr.w 28(a2)
	lea (52,a2),a4
	move.l a4,68(a2)
	clr.w 56(a2)
	clr.w 64(a2)
	move.w a3,a4
	move.l a4,d0
	add.l a4,d0
	add.l d0,d0
	add.l a4,d0
	add.l d0,d0
	move.l d0,d1
	add.l #_object_animations,d1
	move.l d1,48(a2)
	move.w a3,44(a2)
	move.w a3,42(a2)
	lea _object_animations,a3
	move.w (a3,d0.l),d0
	move.w d0,36(a2)
	move.w d0,a3
	move.l a3,d0
	add.l a3,d0
	add.l a3,d0
	add.l d0,d0
	add.l d0,d0
	add.l #_object_imageAtlas,d0
	move.l d0,38(a2)
	move.w a0,d0
	add.w a0,d0
	move.w d0,22(a2)
	move.w a0,16(a2)
	move.w a1,d0
	add.w a1,d0
	move.w d0,24(a2)
	move.w a1,18(a2)
	move.w a1,20(a2)
	clr.w 72(a2)
	clr.w 74(a2)
	move.l 32(sp),78(a2)
	move.l 36(sp),4(a2)
	move.l 40(sp),82(a2)
	clr.w 88(a2)
	cmp.w #1,d2
	sls d0
	ext.w d0
	neg.w d0
	move.w d0,94(a2)
	addq.w #1,_object_count
	move.l _object_activeList,a0
	cmp.w #0,a0
	jeq .L227
	move.l a0,8(a2)
	move.l a2,12(a0)
	clr.l 12(a2)
	move.l a2,_object_activeList
	move.l a2,d0
	movem.l (sp)+,#7180
	rts
.L227:
	move.l a2,_object_activeList
	clr.l 8(a2)
	clr.l 12(a2)
	move.l a2,d0
	movem.l (sp)+,#7180
	rts
.comm _object_zBuffer,48
.lcomm _object_buffer,1152
.lcomm _object_freeList,4
.comm _object_activeList,4
.comm _object_count,2

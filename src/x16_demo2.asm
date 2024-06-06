
.include "x16_regs.asm"
.include "x16_vera.asm"

;---------------------------------------------------------------------
; BASIC Loader
;---------------------------------------------------------------------
*= $0801    ;start of BASIC area

.byte $0C, $08  ; pointer to next line
.byte $0A, $00  ; line number (10)
.byte $9E       ; SYS token
.text " 2062"   ; SYS address in ASCII
.byte 0, 0, 0   ; end-of-program


jmp main 

; icon table
iconTable:

; simple 64x8 image
icon1:
.byte $0a, $00, $0a, $00 ; top, left
.byte $08, $08  ; width / height
.byte %00000000 ; flags
.byte $00, $00  ; < subroutine, > subroutine
.byte %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111
.byte %10000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000001
.byte %10000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000001
.byte %10000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000001
.byte %10000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000001
.byte %10000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000001
.byte %10000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000001
.byte %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111

main:


; =============================================================
; draw_icon
; r0 = pointer to icon table icon
; =============================================================
draw_icon:
    ; set up our starting X/Y locations
    lda #icon1
    sta curY

    lda #icon1 + 1
    sta curY + 1

    lda #icon1 + 2
    sta curX

    lda #icon1 + 3
    sta curX + 1

    ; byteIdx = 0
    stx byteIdx


    rts

curX:
.byte $00, $00
curY:
.byte $00, $00
byteIdx:
.byte $00
bitnum:
.byte $00



.include "x16_hireslib.asm"
.include "x16_hires_icons.asm"
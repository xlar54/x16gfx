
.include "x16_regs.asm"
.include "x16_vera.asm"
.include "x16_macros.asm"

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

;DrawImage $5a, $00, $28, $00, $04, $16

; icon table
iconTable:
.word icon1                 ; icon image
.byte $5a, $00, $28, $00    ; top, left
.byte $04, $16              ; width / height
.word $0000                 ; subroutine
.byte %00000000             ; flags

; simple icon
icon1:
.byte $5a, $00, $28, $00 ; top, left
.byte $04, $16  ; width / height
.byte %00000000 ; flags
.byte $00, $00  ; < subroutine, > subroutine
.byte %01111111, %11111111, %11111111, %11111110
.byte %10000000, %00001000, %00000000, %00000001
.byte %10000000, %00001111, %11111111, %11111101
.byte %10000000, %00001000, %00000000, %00000101
.byte %10000000, %00001111, %11111111, %11111111
.byte %10000000, %00000000, %00000000, %00000001
.byte %10000000, %00000000, %00000000, %00000001
.byte %10000000, %00000000, %00000000, %00000001
.byte %10000000, %00000000, %00000000, %00000001
.byte %10000000, %00000000, %00000000, %00000001
.byte %10000000, %00000000, %00000000, %00000001
.byte %10000000, %00000000, %00000000, %00000001
.byte %10000000, %00000000, %00000000, %00000001
.byte %10000000, %00000000, %00000000, %00000001
.byte %10000000, %00000000, %00000000, %00000001
.byte %10000000, %00000000, %00000000, %00000001
.byte %10000000, %00000000, %00000000, %00000001
.byte %10000000, %00000000, %00000000, %00000001
.byte %10000000, %00000000, %00000000, %00000001
.byte %10000000, %00000000, %00000000, %00000001
.byte %10000000, %00000000, %00000000, %00000001
.byte %11111111, %11111111, %11111111, %11111111

main:

    ; setup hires mode and clear the screen
    jsr screen_hires

    SetColor 1
    jsr screen_clear

    SetColor 0

    ; draw the geos desktop
    DrawRect 0,0,430,20   ; x1,y1,x2,y2

    DrawRect 480,0,639,20   ; x1,y1,x2,y2

    DrawRect 20,40,500,350   ; x1,y1,x2,y2

    DrawRect 20,40,500,80   ; x1,y1,x2,y2

    DrawHLine 20,44,500
    DrawHLine 20,48,500
    DrawHLine 20,52,500
    DrawHLine 20,56,500
    DrawHLine 20,60,500
    DrawHLine 20,346,500


    lda #<icon1
    sta r0L
    lda #>icon1
    sta r0H

    jsr draw_icon

wait_key:
    jsr GETIN
    beq wait_key

exit:
    jsr CINT
    rts

    rts

.include "x16_hireslib.asm"
.include "x16_hires_icons.asm"
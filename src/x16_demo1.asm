
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


    ; setup hires mode and clear the screen
    jsr screen_hires
    jsr screen_clear


    ; draw a line from 320,0 to 320,480 using "vertical_line"

    ; x1 = 320
    lda #$40
    sta r0L
    lda #$01
    sta r0H

    ; y1 = 0
    lda #$00
    sta r1L
    lda #$00
    sta r1H

    ; y2 = 480
    lda #$e0
    sta r2L
    lda #$01
    sta r2H

    jsr vertical_line

    ; draw a line from 0,240 to 640, 240 using "horizontal_line"

    ; x1 = 0
    lda #$00
    sta r0L
    lda #$00
    sta r0H

    ; y1 = 240
    lda #$f0
    sta r1L
    lda #$00
    sta r1H

    ; x2 = 640
    lda #$80
    sta r2L
    lda #$02
    sta r2H
    
    jsr horizontal_line


    ; draw a rectangle

    ; x1 = 10
    lda #$0a
    sta r0L
    lda #$00
    sta r0H

    ; y1 = 10
    lda #$0a
    sta r1L
    lda #$00
    sta r1H

    ; x2 = 20
    lda #$14
    sta r2L
    lda #$00
    sta r2H

    ; y2 = 20
    lda #$19
    sta r3L
    lda #$00
    sta r3H
    
    jsr horizontal_line

wait_key:
    jsr CHRIN
    beq wait_key
    jsr CINT
    rts

.include "x16_font.asm"
.include "x16_hireslib.asm"

  



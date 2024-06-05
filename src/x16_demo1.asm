
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

loop:
    ; r0 = left   
    lda #$40    ; max $027f / 639
    sta r0L
    lda #$01
    sta r0H

    ; r1 = top
    lda y_loc_lo
    sta r1L
    lda y_loc_hi
    sta r1H

    jsr set_pixel

    clc
    lda y_loc_lo
    adc #$01
    sta y_loc_lo
    lda y_loc_hi
    adc #$00
    sta y_loc_hi

    ; Check if we've reached 480 ($01E0)
    lda y_loc_hi
    cmp #$01
    bne loop
    lda y_loc_lo
    cmp #$E0
    bne loop

wait_key:
    jsr CHRIN
    beq wait_key
    jsr CINT
    rts

y_loc_lo
    .byte $00
y_loc_hi
    .byte $00

.include "x16_font.asm"
.include "x16_hireslib.asm"

  



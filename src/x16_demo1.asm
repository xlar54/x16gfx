
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


    ; setup hires mode and clear the screen
    jsr screen_hires
    jsr screen_clear

    ; draw a line from 320,0 to 320,480 using "vertical_line" and the LoadW macro

    LoadW $140, r0      ; x1 = 320
    LoadW $0, r1        ; y1 = 0
    LoadW $1e0, r2      ; y2 = 480
    jsr vertical_line

    ; draw a line from 0,240 to 640, 240 using "horizontal_line"

    LoadW $0, r0        ; x1 = 0
    LoadW $f0, r1       ; y1 = 240
    LoadW $280, r2      ; y2 = 640
    jsr horizontal_line

    jsr wait_key

    jsr screen_clear

    ; draw the geos desktop
    LoadRect 0,0,430,20   ; x1,y1,x2,y2
    jsr rectangle

    LoadRect 480,0,639,20   ; x1,y1,x2,y2
    jsr rectangle

    LoadRect 20,40,500,350   ; x1,y1,x2,y2
    jsr rectangle

    LoadRect 20,40,500,80   ; x1,y1,x2,y2
    jsr rectangle

    LoadHLine 20,44,500
    jsr horizontal_line

    LoadHLine 20,48,500
    jsr horizontal_line

    LoadHLine 20,52,500
    jsr horizontal_line

    LoadHLine 20,56,500
    jsr horizontal_line

    LoadHLine 20,60,500
    jsr horizontal_line

    LoadHLine 20,346,500
    jsr horizontal_line

    jsr wait_key

    jmp exit

wait_key:
    jsr GETIN
    beq wait_key
    rts
    

exit:
    jsr CINT
    rts

.include "x16_font.asm"
.include "x16_hireslib.asm"

  



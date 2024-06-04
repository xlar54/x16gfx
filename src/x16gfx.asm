
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

    ; r1 = top
    lda y_loc_lo
    sta r1L
    lda y_loc_hi
    sta r1H

    ; r0 = right   
    lda #$40    ; max $027f / 639
    sta r0L
    lda #$01
    sta r0H

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

; =============================================================
; screen_hires
; set up the screen mode
; 640x480 1bpp
; =============================================================
screen_hires:

    ; * set Display Composer
    ; * set the layers visibility
    ; * Configure your layer
    ; * load your resource, preferably directly in VRAM
    ; * "write" something on screen

    ; Set the display composer to 0

        ; +------Reset
        ; |++++++------- DCSEL (Display Composer Selection)
        ; |||||||+----------ADDRSEL
        ; ||||||||
    lda #%00000000      ; DCSEL = 0, VRAM port 1
    sta VERA_CTRL

    ; for DC=0, enable layer 1 only, on VGA

        ; +--------Current field 
        ; |        (read only bit which reflects active interlaced field in composite and RGB modes. 
        ; |          In non interlace modes, this reflects if current line is even or odd)
        ; |+---------Sprites Enable
        ; ||+----------Layer 1 Enable
        ; |||+------------Layer 0 Enable
        ; ||||+--------------NTSC/RGB 240p
        ; |||||+----------------NTSC: Chroma Disable
        ; ||||||++------------------Ouput mode (0 = disabled, 1=VGA, 2=NTSC Composite, 3=RGB)
        ; ||||||||
    lda #%00100001
    sta VERA_DC_VIDEO

    ; set the mode to hires

         ;++--------- map height (0=32, 1=64, 2=128, 3=256)
         ;||++---------map width
         ;||||+---------- T256C
         ;|||||+------------ Mode (0=tile, 1=bitmap)
         ;||||||++-------------Color depth (0=1bpp, 1=2bpp, 2=4bpp, 3=8bpp)
         ;||||||||
    lda #%00000100
    ; 32 height (0), 128 width (2), T256C (1), no bitmap(0), 1bpp (0)
    ; lda #( 0<<6 + 2<<4 + 1<<3 + 0<<2 + 0)
    sta VERA_L1_CONFIG

    ; set the tile width
    ; VERA_L1_TILE_BASE points to the bitmap data
        ; ++++++---------Tile base address
        ; ||||||         (specifies the base address of the tile data. Note that the register 
        ; ||||||          only specifies bits 16:11 of the address, so the address is always aligned to a multiple of 2048 bytes.)
        ; ||||||+-----------Tile height 
        ; |||||||+------------Tile width (0=320, 1=640)
        ; ||||||||
    lda #%00000001
    sta VERA_L1_TILEBASE

    rts

; =============================================================
; screen_clear
; clears screen VRAM
; =============================================================
screen_clear:   
    .block
    ; set up DCSEL=2
    lda #(2 << 1)
    sta VERA_CTRL

    ; set cache writes
    lda #$40
    tsb VERA_FX_CTRL

    ; set FX cache to all zeroes
    lda #(6 << 1)
    sta VERA_CTRL
    stz $9f29
    stz $9f2a
    stz $9f2b
    stz $9f2c    

    stz VERA_CTRL
    ; set address and increment for bitmap area
    stz VERA_ADDRx_L
    stz VERA_ADDRx_M
    lda #$30  ; increment +4
    sta VERA_ADDRx_H

    ldy #240 ; number of rows
blank_outer:
    ldx #10 ; 10 iterations of 32 = one line of 320 at 8bpp
blank_loop:

    .rept 8    
    stz VERA_DATA0 ; $9f23 each `stz` writes four zeroes to VRAM (cache contents) for a total of 32 pixels when repeated 8x
    .next
    
    dex
    bne blank_loop
    dey
    bne blank_outer

    ; set up DCSEL=2
    lda #(2 << 1)
    sta VERA_CTRL ; $9f25

    ; set FX off (cache write bit 1 -> 0)
    stz VERA_FX_CTRL
    stz VERA_CTRL
    
    rts
    .bend

; =============================================================
; set_pixel
; r0 = x
; r1 = y
; =============================================================
set_pixel:
    .block
    pha
    tya
    pha
    txa
    pha

    ; Calculate Row Address
    lda r1L             ; Load y low byte
    sta r3L
    lda r1H
    sta r3H
    lda #$50            ; x 80
    sta r4L
    lda #$00
    sta r4H
    jsr mult_16x16      ; Multiply by 80

    lda r4L
    sta rowAddrL        ; Store row address low byte
    lda r4H
    sta rowAddrM
    lda r3L             ; Load high byte result
    sta rowAddrH        ; Store row address high byte

    jsr div_16bit_by_8
    lda r5L
    sta colAddrL

    ; Calculate Bit Position in Byte: x % 8
    lda r0L             ; Load x low byte
    and #7              ; x % 8 (AND with 7)
    tax                 ; Transfer to X for index

    ; Combine row address and column address
    clc
    lda rowAddrL
    adc colAddrL
    sta VERA_ADDRx_L
    lda rowAddrM
    adc #$00
    sta VERA_ADDRx_M
    lda rowAddrH
    sta VERA_ADDRx_H
    
    ; Set the bit in the byte at VERA_DATA0
    lda VERA_DATA0      ; Load the byte at memory address
    ora bitMasks,X      ; OR with the bit mask
    sta VERA_DATA0      ; Store back the modified byte
    
    pla
    tax
    pla
    tay
    pla

    rts

; Bit masks for setting pixels
bitMasks:
    .byte %10000000, %01000000, %00100000, %00010000
    .byte %00001000, %00000100, %00000010, %00000001

rowAddrL: 
    .byte 0
rowAddrM: 
    .byte 0
rowAddrH: 
    .byte 0
colAddrL: 
    .byte 0
    .bend


; =============================================================
;  div_16bit_by_8
;  Inputs:
;   r0L - low byte
;   r0H - high byte
; Outputs:
;   r5 - result
; Trashes:
;   A,X,Y, r5
; =============================================================

div_16bit_by_8:
    .block
    lda r0l             ; load x low byte
    sta r5l             ; store low byte in templ
    lda r0h             ; load x high byte
    sta r5h             ; store high byte in temph

    ; shift the entire 16-bit value right 3 times
    ldx #3              ; set loop counter to 3
shift_loop:
    lda r5h             ; load high byte
    lsr a               ; logical shift right
    sta r5h             ; store shifted high byte

    lda r5l             ; load low byte
    ror a               ; rotate right through carry (bringing in bit from high byte)
    sta r5l             ; store shifted low byte

    dex                 ; decrement loop counter
    bne shift_loop      ; repeat 3 times

    rts                 ; return from subroutine
    .bend

; =============================================================
;  mult_16x16
;  Inputs:
;   r3 - 16 bit value 1
;   r4 - 16 bit value 2
; Outputs:
;   r3/r4 - result
; Trashes:
;   A,X,Y, r5
; =============================================================

mult_16x16:
    .block
    stz r5l
    stz r5h

    lda r4l    ; get the multiplicand and
    sta r5l    ; put it in the scratchpad.
    lda r4h
    sta r5h
    lda #$00
    sta r4l    ; zero-out the original multiplicand area.
    sta r4h

    ldy #$10   ; we'll loop 16 times.
lp1:    
    asl r4l    ; shift the entire 32 bits over one bit position.
    rol r4h
    rol r3l
    rol r3h
    bcc lp2    ; skip the adding-in to the result if
                ; the high bit shifted out was 0.
    clc        ; else, add multiplier to intermediate result.
    lda r5l
    adc r4l
    sta r4l
    lda r5h
    adc r4h
    sta r4h

    lda #$00   ; if c=1, incr lo byte of hi cell.
    adc r3l
    sta r3l
    
lp2:    
    dey        ; if we haven't done 16 iterations yet,
    bne lp1    ; then go around again.

    rts
    .bend


  


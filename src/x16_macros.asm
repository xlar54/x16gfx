vLoadFile .macro  FileName, NameLen, Address
    LDA #(\NameLen)
    LDX #<\FileName
    LDY #>\FileName
    JSR SETNAM

    LDA #1
    LDX #HOST_DEVICE
    LDY #0
    JSR SETLFS

    LDA #(^(\Address) + 2)
    LDX #<\Address
    LDY #>\Address
    JSR LOAD
.endm

MoveW .macro  RegA, RegB
    lda \RegA
    sta \RegB
    lda \RegA+1
    sta \RegB+1
.endm

LoadW .macro Val, Reg
    lda #<(\Val)
    sta \Reg
    lda #>\Val
    sta \Reg + 1
.endm

LoadRect .macro X1, Y1, X2, Y2
    lda #<\X1
    sta r0L
    lda #>\X1
    sta r0H

    lda #<\Y1
    sta r1L
    lda #>\Y1
    sta r1H

    lda #<\X2
    sta r2L
    lda #>\X2
    sta r2H

    lda #<\Y2
    sta r3L
    lda #>\Y2
    sta r3H
.endm

LoadHLine .macro X1, Y1, X2
    lda #<\X1
    sta r0L
    lda #>\X1
    sta r0H

    lda #<\Y1
    sta r1L
    lda #>\Y1
    sta r1H

    lda #<\X2
    sta r2L
    lda #>\X2
    sta r2H
.endm
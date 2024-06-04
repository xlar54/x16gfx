.macro vLoadFile FileName, NameLen, Address
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
.endmacro
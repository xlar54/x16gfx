vwfont:
.byte $04, $07, $00, $00, $00, $00, $00, $00, $00, $00, $00       ; // space
.byte $01, $07, $00, $80, $80, $80, $80, $00, $80, $80, $00       ; // !
.byte $03, $02, $00, $A0, $A0, $00, $00, $00, $00, $00, $00       ; // "
.byte $05, $07, $00, $50, $50, $F8, $50, $F8, $50, $50, $00       ; // #
.byte $05, $08, $00, $78, $A0, $60, $20, $30, $28, $F0, $20       ; // $
.byte $05, $07, $00, $C0, $C8, $10, $20, $40, $98, $18, $00       ; // %
.byte $05, $07, $00, $60, $80, $90, $78, $90, $90, $70, $00       ; // &
.byte $02, $07, $00, $40, $40, $80, $00, $00, $00, $00, $00       ; // '
.byte $03, $08, $01, $20, $40, $80, $80, $80, $80, $40, $20       ; // (
.byte $03, $08, $01, $80, $40, $20, $20, $20, $20, $40, $80       ; // )
.byte $05, $07, $00, $20, $A8, $70, $F8, $70, $A8, $20, $00       ; // *
.byte $05, $07, $00, $00, $20, $20, $F8, $20, $20, $00, $00       ; // +
.byte $02, $02, $01, $40, $80, $00, $00, $00, $00, $00, $00       ; // ,
.byte $04, $07, $00, $00, $00, $00, $F0, $00, $00, $00, $00       ; // -
.byte $01, $01, $00, $80, $00, $00, $00, $00, $00, $00, $00       ; // .
.byte $06, $07, $00, $00, $04, $08, $10, $20, $40, $80, $00       ; // /
.byte $04, $07, $00, $60, $90, $B0, $D0, $90, $90, $60, $00       ; // 0
.byte $02, $07, $00, $40, $C0, $40, $40, $40, $40, $40, $00       ; // 1
.byte $03, $07, $00, $C0, $20, $20, $40, $80, $80, $E0, $00       ; // 2
.byte $03, $07, $00, $C0, $20, $20, $40, $20, $20, $C0, $00       ; // 3
.byte $04, $07, $00, $10, $30, $50, $90, $F0, $10, $10, $00       ; // 4
.byte $03, $07, $00, $E0, $80, $C0, $20, $20, $20, $C0, $00       ; // 5
.byte $04, $07, $00, $20, $40, $80, $E0, $90, $90, $60, $00       ; // 6
.byte $04, $07, $00, $F0, $10, $20, $40, $40, $40, $40, $00       ; // 7
.byte $04, $07, $00, $60, $90, $90, $60, $90, $90, $60, $00       ; // 8
.byte $04, $07, $00, $60, $90, $90, $70, $10, $20, $40, $00       ; // 9
.byte $01, $04, $00, $80, $00, $00, $80, $00, $00, $00, $00       ; // :
.byte $02, $05, $01, $40, $00, $00, $40, $80, $00, $00, $00       ; // ;
.byte $03, $06, $00, $00, $20, $40, $80, $40, $20, $00, $00       ; // <
.byte $04, $06, $00, $00, $F0, $00, $F0, $00, $00, $00, $00       ; // =
.byte $03, $06, $00, $00, $80, $40, $20, $40, $80, $00, $00       ; // >
.byte $05, $07, $00, $70, $88, $10, $20, $20, $00, $20, $00       ; // ?
.byte $05, $07, $00, $70, $88, $B8, $A8, $B8, $80, $70, $00       ; // @
.byte $04, $05, $00, $70, $90, $90, $90, $50, $00, $00, $00       ; // a
.byte $04, $07, $00, $80, $80, $E0, $90, $90, $90, $E0, $00       ; // b
.byte $04, $05, $00, $60, $90, $80, $80, $70, $00, $00, $00       ; // c
.byte $04, $07, $00, $10, $10, $70, $90, $90, $90, $70, $00       ; // d
.byte $04, $05, $00, $60, $90, $F0, $80, $70, $00, $00, $00       ; // e
.byte $02, $07, $00, $40, $80, $C0, $80, $80, $80, $80, $00       ; // f
.byte $04, $07, $02, $70, $90, $90, $90, $70, $10, $20, $00       ; // g
.byte $04, $07, $00, $80, $80, $E0, $90, $90, $90, $90, $00       ; // h
.byte $01, $07, $00, $80, $00, $80, $80, $80, $80, $80, $00       ; // i
.byte $02, $07, $02, $40, $00, $40, $40, $40, $40, $80, $00       ; // j
.byte $04, $07, $00, $80, $80, $90, $A0, $C0, $A0, $90, $00       ; // k
.byte $01, $07, $00, $80, $80, $80, $80, $80, $80, $80, $00       ; // l
.byte $07, $05, $00, $EC, $92, $92, $92, $92, $00, $00, $00       ; // m
.byte $04, $05, $00, $E0, $90, $90, $90, $90, $00, $00, $00       ; // n
.byte $05, $05, $00, $70, $88, $88, $88, $70, $00, $00, $00       ; // o
.byte $04, $07, $02, $E0, $90, $90, $90, $E0, $80, $80, $00       ; // p
.byte $04, $07, $02, $70, $90, $90, $90, $70, $10, $10, $00       ; // q
.byte $02, $05, $00, $40, $80, $80, $80, $80, $00, $00, $00       ; // r
.byte $03, $05, $00, $60, $80, $40, $20, $C0, $00, $00, $00       ; // s
.byte $02, $07, $00, $80, $C0, $80, $80, $80, $80, $40, $00       ; // t
.byte $04, $05, $00, $90, $90, $90, $90, $70, $00, $00, $00       ; // u
.byte $05, $05, $00, $88, $88, $88, $50, $20, $00, $00, $00       ; // v
.byte $07, $05, $00, $92, $92, $92, $92, $6C, $00, $00, $00       ; // w
.byte $05, $05, $00, $88, $50, $20, $50, $88, $00, $00, $00       ; // x
.byte $04, $07, $02, $90, $90, $90, $90, $70, $10, $20, $00       ; // y
.byte $04, $05, $00, $F0, $20, $40, $80, $F0, $00, $00, $00       ; // z
.byte $02, $07, $00, $C0, $80, $80, $80, $80, $80, $C0, $00       ; // [
.byte $07, $07, $00, $80, $40, $20, $10, $08, $04, $02, $00       ; // slash
.byte $02, $07, $00, $C0, $40, $40, $40, $40, $40, $C0, $00       ; // ]
.byte $05, $07, $00, $20, $50, $88, $00, $00, $00, $00, $00       ; // ^
.byte $05, $01, $00, $F8, $00, $00, $00, $00, $00, $00, $00       ; // _
.byte $02, $07, $00, $80, $80, $40, $00, $00, $00, $00, $00       ; // `
.byte $05, $07, $00, $20, $50, $88, $88, $F8, $88, $88, $00       ; // A
.byte $04, $07, $00, $E0, $90, $90, $E0, $90, $90, $E0, $00       ; // B
.byte $04, $07, $00, $60, $90, $80, $80, $80, $80, $70, $00       ; // C
.byte $04, $07, $00, $E0, $90, $90, $90, $90, $90, $E0, $00       ; // D
.byte $03, $07, $00, $E0, $80, $80, $E0, $80, $80, $E0, $00       ; // E
.byte $03, $07, $00, $E0, $80, $80, $E0, $80, $80, $80, $00       ; // F
.byte $04, $07, $00, $60, $90, $80, $80, $B0, $90, $70, $00       ; // G
.byte $05, $07, $00, $88, $88, $88, $F8, $88, $88, $88, $00       ; // H
.byte $01, $07, $00, $80, $80, $80, $80, $80, $80, $80, $00       ; // I
.byte $03, $07, $00, $20, $20, $20, $20, $20, $20, $C0, $00       ; // J
.byte $05, $07, $00, $88, $90, $A0, $C0, $A0, $90, $88, $00       ; // K
.byte $03, $07, $00, $80, $80, $80, $80, $80, $80, $E0, $00       ; // L
.byte $07, $07, $00, $82, $C6, $AA, $92, $82, $82, $82, $00       ; // M
.byte $05, $07, $00, $88, $C8, $A8, $98, $88, $88, $88, $00       ; // N
.byte $05, $07, $00, $70, $88, $88, $88, $88, $88, $70, $00       ; // O
.byte $04, $07, $00, $E0, $90, $90, $90, $E0, $80, $80, $00       ; // P
.byte $05, $08, $01, $70, $88, $88, $88, $88, $98, $78, $04       ; // Q
.byte $04, $07, $00, $E0, $90, $90, $90, $E0, $A0, $90, $00       ; // R
.byte $04, $07, $00, $70, $80, $C0, $20, $10, $10, $E0, $00       ; // S
.byte $03, $07, $00, $E0, $40, $40, $40, $40, $40, $40, $00       ; // T
.byte $04, $07, $00, $90, $90, $90, $90, $90, $90, $70, $00       ; // U
.byte $05, $07, $00, $88, $88, $88, $88, $88, $50, $20, $00       ; // V
.byte $07, $07, $00, $82, $82, $82, $92, $AA, $C6, $82, $00       ; // W
.byte $05, $07, $00, $88, $88, $50, $20, $50, $88, $88, $00       ; // X
.byte $05, $07, $00, $88, $88, $88, $50, $20, $20, $20, $00       ; // Y
.byte $07, $07, $00, $F8, $08, $10, $20, $40, $80, $F8, $00       ; // Z
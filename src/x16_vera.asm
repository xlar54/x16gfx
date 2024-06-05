
; VERA

VERA_BASE           = $9f20
VERA_ADDRx_L        = $9f20
VERA_ADDRx_M        = $9f21
VERA_ADDRx_H        = $9f22
VERA_DATA0          = $9f23
VERA_DATA1          = $9f24
VERA_CTRL           = $9f25
VERA_IEN            = $9f26
VERA_ISR            = $9f27
VERA_IRQLINE_L      = $9f28 ; write only
VERA_SCANLINE_L     = $9f28 ; read only

; $9F29-$9F2C are multi-purpose registers, and the DCSEL bits in the 
; control register VERA_CTRL ($9F25) determines which "page" of registers are active
; set back to DCSEL = 0 as Kernal expects it and does not check!

; DCSEL = 0

VERA_DC_VIDEO       = $9f29     ; Active Display Control
VERA_DC_HSCALE      = $9f2a     ; Active Display H-Scale
VERA_DC_VSCALE      = $9f2b     ; Active Display V-Scale
VERA_DC_BORDER      = $9f2c     ; Border Color

; DCSEL = 1

VERA_DC_HSTART      = $9f29     ; Active Display H-Start
VERA_DC_HSTOP       = $9f2a     ; Active Display H-Stop
VERA_DC_VSTART      = $9f2b     ; Active Display V-Start
VERA_DC_VSTOP       = $9f2c     ; Active Display V-Stop

; DCSEL = 2

VERA_FX_CTRL        = $9f29     ; ADDR1 Update Mode / VRAM Data Port Write Mode
VERA_FX_TILEBASE    = $9f2a     ; Affine Transformation Tile Base (write only)
VERA_FX_MAPBASE     = $9f2b     ; Affine Transformation Map Base (write only)
VERA_FX_MULT        = $9f2c     ; Write Cache Index / Multiply-accumulate Mode (write only)

; DCSEL = 3

VERA_FX_X_INCR_L    = $9f29     ; X Position Increment (lower 8 bits) (write only)
VERA_FX_X_INCR_H    = $9f2a     ; X Position Increment (upper 8 bits) (write only)
VERA_FX_Y_INCR_L    = $9f2b     ; Y Position Increment (lower 8 bits) (write only)
VERA_FX_Y_INCR_H    = $9f2c     ; Y Position Increment (upper 8 bits) (write only)

; DCSEL = 4

VERA_FX_X_POS_L     = $9f29     ; Pixel X Position (lower 8 bits) (write only)
VERA_FX_X_POS_H     = $9f2a     ; Pixel X Position (upper 3 bits) (write only)
VERA_FX_Y_POS_L     = $9f2b     ; Pixel Y Position (lower 8 bits) (write only)
VERA_FX_Y_POS_H     = $9f2c     ; Pixel Y Position (upper 3 bits) (write only)

; DCSEL = 5

VERA_FX_X_POS_S     = $9f29     ; Pixel X Fractional Position (upper 8 bits) (write only)
VERA_FX_Y_POS_S     = $9f2a     ; Pixel Y Fractional Position (upper 8 bits) (write only)
VERA_FX_POLY_FILL_L = $9f2b     ; Fill Length (lower 3 bits) (read only)
VERA_FX_POLY_FILL_H = $9f2c     ; Fill Length (upper 7 bits) (read only)


; DCSEL = 6

VERA_FX_CACHE_L     = $9f29     ; 32-bit Write Cache Data  (write only)
VERA_FX_ACCUM_RESET = $9f29     ; (read only)
VERA_FX_CACHE_M     = $9f2a     ; (write only)
VERA_FX_ACCUM       = $9f2a     ; (read only)
VERAFX_CACHE_H      = $9f2b     ; (write only)
VERA_FX_CACHE_U     = $9f2c     ; (write only)

; DCSEL = 63

VERA_DC_VER0        = $9f29      ; Version Number (read only)
VERA_DC_VER1        = $9f2a
VERA_DC_VER2        = $9f2b
VERA_DC_VER3        = $9f2c


VERA_L0_CONFIG      = $9f2d
VERA_L0_MAPBASE     = $9f2e
VERA_L0_TILEBASE    = $9f2f
VERA_L0_HSCROLL_L   = $9f30
VERA_L0_HSCROLL_H   = $9f31
VERA_L0_VSCROLL_L   = $9f32
VERA_L0_VSCROLL_H   = $9f33
VERA_L1_CONFIG      = $9f34
VERA_L1_MAPBASE     = $9f35
VERA_L1_TILEBASE    = $9f36
VERA_L1_HSCROLL_L   = $9f37
VERA_L1_HSCROLL_H   = $9f38
VERA_L1_VSCROLL_L   = $9f39
VERA_L1_VSCROLL_H   = $9f3a

VERA_AUDIO_CTRL     = $9f3b
VERA_AUDIO_RATE     = $9f3c
VERA_AUDIO_DATA     = $9f3d

VERA_SPI_DATA       = $9f3e
VERA_SPI_CTRL       = $9f3f


; kernal


CINT        = $ff81
READST      = $ffb7
SETLFS      = $ffba
SETNAM      = $ffbd
OPEN        = $ffc0
CLOSE       = $ffc3
CHKIN       = $ffc6
CHKOUT      = $ffc9
CHRIN       = $FFCF
CHROUT      = $ffd2
LOAD        = $ffd5
SAVE        = $ffd8
CLALL       = $ffe7
SETMSG      = $ff90
ACPTR       = $ffa5
CIOUT       = $ffa8
UNTALK      = $ffab
UNLSN       = $ffae
LISTEN      = $ffb1
TALK        = $ffb4
SECOND      = $ff93
TALKSA      = $ff96
CLRCHN      = $ffcc
GETIN       = $ffe4
SCREEN_MODE = $ff5f
STATUS      = $0287
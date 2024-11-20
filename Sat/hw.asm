;-------------------------
; 68K Assembly Language
;-------------------------

; Clear screen and set title
    LDX #$FF
    TXS
    LDX #$00
TXS

; Print "Hello"
    LDA #<HELLO
    STA $0200,X
    LDA #>HELLO
    STA $0201,X

HELLO:
    .byte 'H', 'e', 'l', 'l', 'o'

; Wait for user input (just to pretend like this is a real program)
    LDX #$00
Loop:
    INX
    BEQ Exit
    JMP Loop

Exit:
    ; Don't even bother trying to clear the screen now, just leave it alone
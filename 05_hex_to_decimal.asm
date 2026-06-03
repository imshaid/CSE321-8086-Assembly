; ─────────────────────────────────────────────
; Program : Hex Digit (A-F) to Decimal Converter
; Author  : ~surjo (Md. Shaid Hasan)
; Input   : One hex digit A-F (e.g. C)
; Output  : ENTER A HEX DIGIT: C
;           IN DECIMAL IT IS: 12
; ─────────────────────────────────────────────

.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB 'ENTER A HEX DIGIT: $'             ; input prompt
    MSG2 DB 0DH, 0AH, 'IN DECIMAL IT IS: $'    ; result label with newline
    DEC1 DB ?, '$'                             ; stores tens digit (ASCII)
    DEC2 DB ?, '$'                             ; stores units digit (ASCII)

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; display prompt
    LEA DX, MSG1               ; load address of MSG1
    MOV AH, 9                  ; INT 21H function 9 = display string
    INT 21H

    ; read hex digit A-F
    MOV AH, 1                  ; INT 21H function 1 = single key input
    INT 21H                    ; AL = ASCII of hex digit (e.g. 'C' = 43H)

    ; convert hex letter to decimal value (A=10, B=11 ... F=15)
    SUB AL, 'A'                ; AL = 0 for A, 1 for B ... 5 for F
    ADD AL, 10                 ; AL = 10 for A, 11 for B ... 15 for F

    ; split into tens and units digits
    MOV AH, 0                  ; clear AH for division
    MOV BL, 10                 ; divisor = 10
    DIV BL                     ; AL = quotient (tens), AH = remainder (units)

    ; convert tens digit to ASCII and store
    ADD AL, 30H                ; convert tens to ASCII
    MOV DEC1, AL

    ; convert units digit to ASCII and store
    ADD AH, 30H                ; convert units to ASCII
    MOV DEC2, AH

    ; display result label
    LEA DX, MSG2               ; load address of MSG2
    MOV AH, 9
    INT 21H

    ; display tens digit
    LEA DX, DEC1
    MOV AH, 9
    INT 21H

    ; display units digit
    LEA DX, DEC2
    MOV AH, 9
    INT 21H

    ; exit program
    MOV AH, 4CH                ; INT 21H function 4CH = exit to DOS
    INT 21H

MAIN ENDP
END MAIN
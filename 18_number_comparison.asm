; ─────────────────────────────────────────────
; Program : Compare Two Numbers
; Author  : ~surjo (Md. Shaid Hasan)
; Input   : Two single digits (e.g. 3, 7)
; Output  : ENTER FIRST NUMBER : 3
;           ENTER SECOND NUMBER: 7
;           FIRST IS SMALLER
;           or
;           FIRST IS GREATER
;           or
;           BOTH ARE EQUAL
; ─────────────────────────────────────────────

.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB 'ENTER FIRST NUMBER : $'           ; first input prompt
    MSG2 DB 0DH, 0AH, 'ENTER SECOND NUMBER: $' ; second input prompt
    MSG3 DB 0DH, 0AH, 'FIRST IS GREATER$'      ; greater message
    MSG4 DB 0DH, 0AH, 'FIRST IS SMALLER$'      ; smaller message
    MSG5 DB 0DH, 0AH, 'BOTH ARE EQUAL$'        ; equal message

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; read first number
    LEA DX, MSG1               ; display first prompt
    MOV AH, 9
    INT 21H
    MOV AH, 1                  ; single key input
    INT 21H
    MOV BL, AL                 ; BL = first number ASCII

    ; read second number
    LEA DX, MSG2               ; display second prompt
    MOV AH, 9
    INT 21H
    MOV AH, 1                  ; single key input
    INT 21H
    MOV BH, AL                 ; BH = second number ASCII

    ; compare first and second
    CMP BL, BH                 ; compare BL and BH
    JG  GREATER                ; if BL > BH jump to GREATER
    JL  SMALLER                ; if BL < BH jump to SMALLER

    ; else equal
    LEA DX, MSG5               ; display equal message
    MOV AH, 9
    INT 21H
    JMP EXIT

GREATER:
    LEA DX, MSG3               ; display greater message
    MOV AH, 9
    INT 21H
    JMP EXIT

SMALLER:
    LEA DX, MSG4               ; display smaller message
    MOV AH, 9
    INT 21H

EXIT:
    ; exit program
    MOV AH, 4CH                ; INT 21H function 4CH = exit to DOS
    INT 21H

MAIN ENDP
END MAIN
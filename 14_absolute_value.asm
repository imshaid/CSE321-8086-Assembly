; ─────────────────────────────────────────────
; Program : Absolute Value of a Number
; Author  : ~surjo (Md. Shaid Hasan)
; Input   : None (N predefined as -5)
; Output  : ABSOLUTE VALUE: 5
; Note    : If N is negative, negate it
; ─────────────────────────────────────────────

.MODEL SMALL
.STACK 100H

.DATA
    MSG DB 'ABSOLUTE VALUE: $' ; result label

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AL, -5                 ; AL = N (predefined as -5)

    ; check if AL is negative
    CMP AL, 0                  ; compare AL with 0
    JNL END_IF                 ; if AL >= 0, skip negation
    NEG AL                     ; if AL < 0, negate it

END_IF:
    ; AL = absolute value — save before display
    MOV BL, AL                 ; BL = absolute value

    ; display result label
    LEA DX, MSG
    MOV AH, 9
    INT 21H

    ; display result (single digit)
    MOV DL, BL                 ; load absolute value
    ADD DL, 30H                ; convert to ASCII
    MOV AH, 2
    INT 21H

    ; exit program
    MOV AH, 4CH                ; INT 21H function 4CH = exit to DOS
    INT 21H

MAIN ENDP
END MAIN
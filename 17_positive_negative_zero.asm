; ─────────────────────────────────────────────
; Program : Check if Number is Positive, Negative or Zero
; Author  : ~surjo (Md. Shaid Hasan)
; Input   : None (N predefined as -3)
; Output  : IT IS NEGATIVE
; ─────────────────────────────────────────────

.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB 'IT IS POSITIVE$'  ; positive message
    MSG2 DB 'IT IS NEGATIVE$'  ; negative message
    MSG3 DB 'IT IS ZERO$'      ; zero message

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AL, -3                 ; AL = N (predefined value)

    ; check if zero
    CMP AL, 0                  ; compare AL with 0
    JE  IS_ZERO                ; if AL = 0 jump to IS_ZERO

    ; check if negative
    JL  IS_NEGATIVE            ; if AL < 0 jump to IS_NEGATIVE

    ; else positive
    LEA DX, MSG1               ; display positive message
    MOV AH, 9
    INT 21H
    JMP EXIT

IS_NEGATIVE:
    LEA DX, MSG2               ; display negative message
    MOV AH, 9
    INT 21H
    JMP EXIT

IS_ZERO:
    LEA DX, MSG3               ; display zero message
    MOV AH, 9
    INT 21H

EXIT:
    ; exit program
    MOV AH, 4CH                ; INT 21H function 4CH = exit to DOS
    INT 21H

MAIN ENDP
END MAIN
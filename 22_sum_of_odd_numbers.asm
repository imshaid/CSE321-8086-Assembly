; ─────────────────────────────────────────────
; Program : Sum of Odd Numbers Between 1 and 10
; Author  : ~surjo (Md. Shaid Hasan)
; Input   : None
; Output  : SUM OF ODD NUMBERS: 25
; Note    : Odd numbers: 1+3+5+7+9 = 25
; ─────────────────────────────────────────────

.MODEL SMALL
.STACK 100H

.DATA
    MSG DB 'SUM OF ODD NUMBERS: $'        ; result label

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV CX, 5                  ; CX = loop counter (5 odd numbers)
    MOV AL, 0                  ; AL = accumulator
    MOV BL, 1                  ; BL = first odd number

LOOP_START:
    ADD AL, BL                 ; AL = AL + current odd number
    ADD BL, 2                  ; move to next odd number (1→3→5→7→9)
    LOOP LOOP_START            ; decrement CX, jump back if CX ≠ 0

    ; AL = 25 — save before display
    MOV BH, AL                 ; BH = sum

    ; display result label
    LEA DX, MSG
    MOV AH, 9
    INT 21H

    ; display sum — split into tens and units
    MOV AL, BH                 ; AL = sum (25)
    MOV AH, 0
    MOV BL, 10
    DIV BL                     ; AL = tens, AH = units
    MOV CL, AH                 ; save units in CL

    ; print tens digit
    ADD AL, 30H
    MOV DL, AL
    MOV AH, 2
    INT 21H

    ; print units digit
    MOV DL, CL
    ADD DL, 30H
    MOV AH, 2
    INT 21H

    ; exit program
    MOV AH, 4CH                ; INT 21H function 4CH = exit to DOS
    INT 21H

MAIN ENDP
END MAIN
; ─────────────────────────────────────────────
; Program : Sum of Even Numbers Between 0 and 10
; Author  : ~surjo (Md. Shaid Hasan)
; Input   : None
; Output  : SUM OF EVEN NUMBERS: 30
; Note    : Even numbers: 0+2+4+6+8+10 = 30
; ─────────────────────────────────────────────

.MODEL SMALL
.STACK 100H

.DATA
    MSG DB 'SUM OF EVEN NUMBERS: $'       ; result label

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV CX, 6                  ; CX = loop counter (6 even numbers)
    MOV AL, 0                  ; AL = accumulator
    MOV BL, 0                  ; BL = first even number

LOOP_START:
    ADD AL, BL                 ; AL = AL + current even number
    ADD BL, 2                  ; move to next even number (0→2→4→6→8→10)
    LOOP LOOP_START            ; decrement CX, jump back if CX ≠ 0

    ; AL = 30 — save before display
    MOV BH, AL                 ; BH = sum

    ; display result label
    LEA DX, MSG
    MOV AH, 9
    INT 21H

    ; display sum — split into tens and units
    MOV AL, BH                 ; AL = sum (30)
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
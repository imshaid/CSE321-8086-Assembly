; ─────────────────────────────────────────────
; Program : Factorial of N
; Author  : ~surjo (Md. Shaid Hasan)
; Input   : None (N predefined as 5)
; Output  : FACTORIAL: 120
; ─────────────────────────────────────────────

.MODEL SMALL
.STACK 100H

.DATA
    MSG DB 'FACTORIAL: $'      ; result label

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV CX, 5                  ; CX = loop counter (N = 5)
    MOV AX, 1                  ; AX = result accumulator (start from 1)
    MOV BL, 1                  ; BL = current multiplier (start from 1)

LOOP_START:
    MUL BL                     ; AX = AX * BL
    INC BL                     ; move to next multiplier
    LOOP LOOP_START            ; decrement CX, jump back if CX ≠ 0

    ; AX = 120 here
    ; save result before display
    MOV BX, AX                 ; BX = 120 (preserve result)

    ; display result label
    LEA DX, MSG
    MOV AH, 9
    INT 21H

    ; display result — split into hundreds, tens, units
    MOV AX, BX                 ; AX = 120
    MOV AH, 0                  ; clear AH (AL = 120 = 78H)

    ; hundreds digit
    MOV BL, 100
    DIV BL                     ; AL = hundreds, AH = remainder
    MOV CL, AH                 ; save remainder in CL
    ADD AL, 30H
    MOV DL, AL
    MOV AH, 2
    INT 21H                    ; print hundreds digit

    ; tens and units
    MOV AL, CL                 ; AL = remainder
    MOV AH, 0
    MOV BL, 10
    DIV BL                     ; AL = tens, AH = units
    MOV CL, AH                 ; save units in CL

    ADD AL, 30H
    MOV DL, AL
    MOV AH, 2
    INT 21H                    ; print tens digit

    MOV DL, CL
    ADD DL, 30H
    MOV AH, 2
    INT 21H                    ; print units digit

    ; exit program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
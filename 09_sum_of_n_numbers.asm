; ─────────────────────────────────────────────
; Program : Sum of N Numbers (1 to N)
; Author  : ~surjo (Md. Shaid Hasan)
; Input   : None (N predefined as 5)
; Output  : SUM: 15
; ─────────────────────────────────────────────

.MODEL SMALL
.STACK 100H

.DATA
    MSG DB 'SUM: $'            ; result label

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV CX, 5                  ; CX = loop counter (N = 5)
    MOV AX, 0                  ; AX = 0 (clear both AH and AL)
    MOV BL, 1                  ; BL = current number (start from 1)

LOOP_START:
    ADD AL, BL                 ; AL = AL + current number
    INC BL                     ; move to next number
    LOOP LOOP_START            ; decrement CX, jump back if CX ≠ 0

    ; AL = 15 here — save it before anything overwrites
    MOV BH, AL                 ; BH = sum (save here safely)

    ; display result label
    LEA DX, MSG
    MOV AH, 9
    INT 21H

    ; display sum — split into tens and units
    MOV AL, BH                 ; AL = sum (restore from BH)
    MOV AH, 0                  ; clear AH
    MOV BL, 10                 ; BL = divisor
    DIV BL                     ; AL = tens, AH = units

    ; save units before AH gets overwritten
    MOV CL, AH                 ; CL = units digit

    ; print tens digit
    ADD AL, 30H
    MOV DL, AL
    MOV AH, 2
    INT 21H

    ; print units digit
    MOV DL, CL                 ; restore units
    ADD DL, 30H
    MOV AH, 2
    INT 21H

    ; exit program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
; ─────────────────────────────────────────────
; Program : Multiplication Using Repeated Addition
; Author  : ~surjo (Md. Shaid Hasan)
; Input   : None (A=6, B=4 predefined)
; Output  : RESULT: 24
; Note    : Computes A x B by adding A, B times
; ─────────────────────────────────────────────

.MODEL SMALL
.STACK 100H

.DATA
    MSG DB 'RESULT: $'         ; result label

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV BL, 6                  ; BL = A (multiplicand)
    MOV CX, 4                  ; CX = B (multiplier = loop counter)
    MOV AL, 0                  ; AL = accumulator

LOOP_START:
    ADD AL, BL                 ; AL = AL + A (add A, B times)
    LOOP LOOP_START            ; decrement CX, jump back if CX ≠ 0

    ; AL = 24 here — save before display
    MOV BH, AL                 ; BH = result

    ; display result label
    LEA DX, MSG
    MOV AH, 9
    INT 21H

    ; display result — split into tens and units
    MOV AL, BH                 ; AL = result
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
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
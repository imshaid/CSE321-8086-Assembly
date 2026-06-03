; ─────────────────────────────────────────────
; Program : Sum of Digits of a 3-Digit Number
; Author  : ~surjo (Md. Shaid Hasan)
; Input   : A 3-digit number (e.g. 199)
; Output  : ENTER A 3-DIGIT NUMBER: 199
;           SUM OF DIGITS: 19
; ─────────────────────────────────────────────

.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB 'ENTER A 3-DIGIT NUMBER: $'    ; input prompt
    MSG2 DB 0DH, 0AH, 'SUM OF DIGITS: $'   ; result label

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; display prompt
    LEA DX, MSG1
    MOV AH, 9
    INT 21H

    ; read first digit
    MOV AH, 1
    INT 21H
    SUB AL, 30H                ; convert to numeric
    MOV BL, AL                 ; BL = first digit

    ; read second digit
    MOV AH, 1
    INT 21H
    SUB AL, 30H                ; convert to numeric
    MOV BH, AL                 ; BH = second digit

    ; read third digit
    MOV AH, 1
    INT 21H
    SUB AL, 30H                ; convert to numeric
    MOV CL, AL                 ; CL = third digit

    ; calculate sum of digits
    MOV AL, 0                  ; AL = accumulator
    ADD AL, BL                 ; AL = AL + first digit
    ADD AL, BH                 ; AL = AL + second digit
    ADD AL, CL                 ; AL = AL + third digit

    ; save sum before display
    MOV BH, AL                 ; BH = sum (max = 9+9+9 = 27)

    ; display result label
    LEA DX, MSG2
    MOV AH, 9
    INT 21H

    ; display sum — split into tens and units
    MOV AL, BH                 ; AL = sum
    MOV AH, 0
    MOV BL, 10
    DIV BL                     ; AL = tens, AH = units
    MOV CL, AH                 ; save units in CL

    ; print tens digit (only if > 0)
    CMP AL, 0                  ; check if tens digit exists
    JE  UNITS_ONLY             ; if tens = 0 skip it
    ADD AL, 30H
    MOV DL, AL
    MOV AH, 2
    INT 21H

UNITS_ONLY:
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
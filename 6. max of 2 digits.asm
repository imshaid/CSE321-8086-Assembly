; Program: Find maximum of two digits
; Course : CSE321 - Microprocessors and Microcontrollers
; Author : ~surjo (Md. Shaid Hasan)
; Input  : Two single digits (e.g. 39)
; Output : ENTER TWO DIGITS: 39
;          THE MAXIMUM IS: 9

.MODEL  SMALL
.STACK  100H

.DATA
    MSG1  DB  'ENTER TWO DIGITS: $'
    MSG2  DB  0DH, 0AH, 'THE MAXIMUM IS: '
    MAX   DB  ?, '$'

.CODE
MAIN  PROC
    ; initialize DS
    MOV  AX, @DATA
    MOV  DS, AX

    ; display prompt
    LEA  DX, MSG1
    MOV  AH, 9
    INT  21H

    ; read first digit
    MOV  AH, 1
    INT  21H
    MOV  BL, AL            ; BL = first digit ASCII

    ; read second digit
    MOV  AH, 1
    INT  21H
    MOV  BH, AL            ; BH = second digit ASCII

    ; compare and find maximum
    CMP  BL, BH            ; compare first and second
    JG   FIRST_MAX         ; if BL > BH jump to FIRST_MAX
    MOV  MAX, BH           ; else MAX = second digit
    JMP  DISPLAY

FIRST_MAX:
    MOV  MAX, BL           ; MAX = first digit

DISPLAY:
    ; display result
    LEA  DX, MSG2
    MOV  AH, 9
    INT  21H

    ; exit
    MOV  AH, 4CH
    INT  21H
MAIN  ENDP
END   MAIN
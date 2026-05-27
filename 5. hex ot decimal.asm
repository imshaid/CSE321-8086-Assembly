; Program: Read hex digit A-F and display in decimal
; Course : CSE321 - Microprocessors and Microcontrollers
; Author : ~surjo (Md. Shaid Hasan)
; Input  : One hex digit A-F (e.g. C)
; Output : ENTER A HEX DIGIT: C
;          IN DECIMAL IT IS 12

.MODEL  SMALL
.STACK  100H

.DATA
    MSG1  DB  'ENTER A HEX DIGIT: $'
    MSG2  DB  0DH, 0AH, 'IN DECIMAL IT IS $'
    DEC1  DB  ?, '$'
    DEC2  DB  ?, '$'

.CODE
MAIN  PROC
    ; initialize DS
    MOV  AX, @DATA
    MOV  DS, AX

    ; display prompt
    LEA  DX, MSG1
    MOV  AH, 9
    INT  21H

    ; read hex digit A-F
    MOV  AH, 1
    INT  21H

    ; convert to decimal value (10 to 15)
    SUB  AL, 'A'
    ADD  AL, 10

    ; split into tens and units
    MOV  AH, 0
    MOV  BL, 10
    DIV  BL

    ; convert to ASCII and store
    ADD  AL, 30H
    MOV  DEC1, AL

    ADD  AH, 30H
    MOV  DEC2, AH

    ; display message
    LEA  DX, MSG2
    MOV  AH, 9
    INT  21H

    ; display tens digit
    LEA  DX, DEC1
    MOV  AH, 9
    INT  21H

    ; display units digit
    LEA  DX, DEC2
    MOV  AH, 9
    INT  21H

    ; exit
    MOV  AH, 4CH
    INT  21H
MAIN  ENDP
END   MAIN
; Program: Read two digits and display their sum
; Course : CSE321 - Microprocessors and Microcontrollers
; Author : ~surjo (Md. Shaid Hasan)
; Input  : Two decimal digits whose sum < 10 (e.g. 27)
; Output : ?27
;          THE SUM OF 2 AND 7 IS 9

.MODEL  SMALL
.STACK  100H

.DATA
    MSG1  DB  '?$'
    MSG2  DB  0DH, 0AH, 'THE SUM OF $'
    MSG3  DB  ' AND $'
    MSG4  DB  ' IS $'
    DIG1  DB  ?, '$'
    DIG2  DB  ?, '$'
    SUM   DB  ?, '$'

.CODE
MAIN  PROC
    ; initialize DS
    MOV  AX, @DATA
    MOV  DS, AX

    ; display "?"
    LEA  DX, MSG1
    MOV  AH, 9
    INT  21H

    ; read first digit
    MOV  AH, 1
    INT  21H
    MOV  DIG1, AL
    SUB  AL, 30H
    MOV  BL, AL

    ; read second digit
    MOV  AH, 1
    INT  21H
    MOV  DIG2, AL
    SUB  AL, 30H
    MOV  BH, AL

    ; calculate sum
    ADD  BL, BH
    ADD  BL, 30H
    MOV  SUM, BL

    ; display "THE SUM OF "
    LEA  DX, MSG2
    MOV  AH, 9
    INT  21H

    ; display first digit
    LEA  DX, DIG1
    MOV  AH, 9
    INT  21H

    ; display " AND "
    LEA  DX, MSG3
    MOV  AH, 9
    INT  21H

    ; display second digit
    LEA  DX, DIG2
    MOV  AH, 9
    INT  21H

    ; display " IS "
    LEA  DX, MSG4
    MOV  AH, 9
    INT  21H

    ; display sum
    LEA  DX, SUM
    MOV  AH, 9
    INT  21H

    ; exit
    MOV  AH, 4CH
    INT  21H
MAIN  ENDP
END   MAIN
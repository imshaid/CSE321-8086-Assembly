; Program: Read two digits and display their sum
; Course : CSE321 - Microprocessors and Microcontrollers
; Author : ~surjo (Md. Shaid Hasan)

; 

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
    MOV  DIG1, AL          ; save ASCII of first digit
    SUB  AL, 30H           ; convert to number
    MOV  BL, AL            ; BL = first digit value

    ; read second digit
    MOV  AH, 1
    INT  21H
    MOV  DIG2, AL          ; save ASCII of second digit
    SUB  AL, 30H           ; convert to number
    MOV  BH, AL            ; BH = second digit value

    ; calculate sum
    ADD  BL, BH            ; BL = sum
    ADD  BL, 30H           ; convert sum to ASCII
    MOV  SUM, BL           ; store sum ASCII

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
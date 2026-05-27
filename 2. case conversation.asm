; Program: Lowercase to Uppercase Case Conversion
; Course : CSE321 - Microprocessors and Microcontrollers
; Author : ~surjo (Md. Shaid Hasan)
; Input  : a lowercase letter (e.g. a)
; Output : ENTER A LOWER CASE LETTER: a
;          IN UPPER CASE IT IS: A

.MODEL  SMALL
.STACK  100H

.DATA
    MSG1  DB  'ENTER A LOWER CASE LETTER: $'
    MSG2  DB  0DH, 0AH, 'IN UPPER CASE IT IS: '
    CHAR  DB  ?, '$'

.CODE
MAIN  PROC
    ; initialize DS
    MOV  AX, @DATA
    MOV  DS, AX

    ; display prompt
    LEA  DX, MSG1
    MOV  AH, 9
    INT  21H

    ; read lowercase letter
    MOV  AH, 1
    INT  21H

    ; convert to uppercase
    SUB  AL, 20H
    MOV  CHAR, AL

    ; display result
    LEA  DX, MSG2
    MOV  AH, 9
    INT  21H

    ; exit
    MOV  AH, 4CH
    INT  21H
MAIN  ENDP
END   MAIN
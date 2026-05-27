; Program: Read 3 initials and display each on new line
; Course : CSE321 - Microprocessors and Microcontrollers
; Author : ~surjo (Md. Shaid Hasan)
; Input  : Three initials (e.g. JFK)
; Output : ENTER THREE INITIALS: JFK
;          J
;          F
;          K

.MODEL  SMALL
.STACK  100H

.DATA
    MSG1  DB  'ENTER THREE INITIALS: $'
    CRLF  DB  0DH, 0AH, '$'
    IN1   DB  ?, '$'
    IN2   DB  ?, '$'
    IN3   DB  ?, '$'

.CODE
MAIN  PROC
    ; initialize DS
    MOV  AX, @DATA
    MOV  DS, AX

    ; display prompt
    LEA  DX, MSG1
    MOV  AH, 9
    INT  21H

    ; read first initial
    MOV  AH, 1
    INT  21H
    MOV  IN1, AL

    ; read second initial
    MOV  AH, 1
    INT  21H
    MOV  IN2, AL

    ; read third initial
    MOV  AH, 1
    INT  21H
    MOV  IN3, AL

    ; newline
    LEA  DX, CRLF
    MOV  AH, 9
    INT  21H

    ; display first initial
    LEA  DX, IN1
    MOV  AH, 9
    INT  21H

    ; newline
    LEA  DX, CRLF
    MOV  AH, 9
    INT  21H

    ; display second initial
    LEA  DX, IN2
    MOV  AH, 9
    INT  21H

    ; newline
    LEA  DX, CRLF
    MOV  AH, 9
    INT  21H

    ; display third initial
    LEA  DX, IN3
    MOV  AH, 9
    INT  21H

    ; exit
    MOV  AH, 4CH
    INT  21H
MAIN  ENDP
END   MAIN
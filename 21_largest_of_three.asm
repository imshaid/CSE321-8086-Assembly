; ─────────────────────────────────────────────
; Program : Find Largest of Three Single Digits
; Author  : ~surjo (Md. Shaid Hasan)
; Input   : Three single digits (e.g. 3, 7, 5)
; Output  : ENTER FIRST NUMBER : 3
;           ENTER SECOND NUMBER: 7
;           ENTER THIRD NUMBER : 5
;           THE LARGEST IS: 7
; ─────────────────────────────────────────────

.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB 'ENTER FIRST NUMBER : $'           ; first input prompt
    MSG2 DB 0DH, 0AH, 'ENTER SECOND NUMBER: $' ; second input prompt
    MSG3 DB 0DH, 0AH, 'ENTER THIRD NUMBER : $' ; third input prompt
    MSG4 DB 0DH, 0AH, 'THE LARGEST IS: $'      ; result label
    MAX  DB ?, '$'                             ; stores largest digit

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; read first number
    LEA DX, MSG1
    MOV AH, 9
    INT 21H
    MOV AH, 1
    INT 21H
    MOV BL, AL                 ; BL = first number ASCII

    ; read second number
    LEA DX, MSG2
    MOV AH, 9
    INT 21H
    MOV AH, 1
    INT 21H
    MOV BH, AL                 ; BH = second number ASCII

    ; read third number
    LEA DX, MSG3
    MOV AH, 9
    INT 21H
    MOV AH, 1
    INT 21H
    MOV CL, AL                 ; CL = third number ASCII

    ; find largest — compare first and second
    CMP BL, BH                 ; compare first and second
    JGE FIRST_GE               ; if BL >= BH jump
    MOV BL, BH                 ; else BL = second (BL holds current max)

FIRST_GE:
    ; now compare current max (BL) with third
    CMP BL, CL                 ; compare current max with third
    JGE STORE_MAX              ; if BL >= CL jump
    MOV BL, CL                 ; else BL = third

STORE_MAX:
    MOV MAX, BL                ; store largest in MAX

    ; display result
    LEA DX, MSG4
    MOV AH, 9
    INT 21H

    LEA DX, MAX
    MOV AH, 9
    INT 21H

    ; exit program
    MOV AH, 4CH                ; INT 21H function 4CH = exit to DOS
    INT 21H

MAIN ENDP
END MAIN
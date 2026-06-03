; ─────────────────────────────────────────────
; Program : Print Three Initials
; Author  : ~surjo (Md. Shaid Hasan)
; Input   : Three initials (e.g. J, F, K)
; Output  : ENTER THREE INITIALS: JFK
;           J
;           F
;           K
; ─────────────────────────────────────────────

.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB 'ENTER THREE INITIALS: $'          ; input prompt
    CRLF DB 0DH, 0AH, '$'                      ; newline
    IN1  DB ?, '$'                             ; stores first initial
    IN2  DB ?, '$'                             ; stores second initial
    IN3  DB ?, '$'                             ; stores third initial

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; display prompt
    LEA DX, MSG1               ; load address of MSG1
    MOV AH, 9                  ; INT 21H function 9 = display string
    INT 21H

    ; read three initials
    MOV AH, 1                  ; INT 21H function 1 = single key input
    INT 21H
    MOV IN1, AL                ; save first initial

    MOV AH, 1
    INT 21H
    MOV IN2, AL                ; save second initial

    MOV AH, 1
    INT 21H
    MOV IN3, AL                ; save third initial

    ; print newline
    LEA DX, CRLF
    MOV AH, 9
    INT 21H

    ; display first initial
    LEA DX, IN1
    MOV AH, 9
    INT 21H

    ; newline
    LEA DX, CRLF
    MOV AH, 9
    INT 21H

    ; display second initial
    LEA DX, IN2
    MOV AH, 9
    INT 21H

    ; newline
    LEA DX, CRLF
    MOV AH, 9
    INT 21H

    ; display third initial
    LEA DX, IN3
    MOV AH, 9
    INT 21H

    ; exit program
    MOV AH, 4CH                ; INT 21H function 4CH = exit to DOS
    INT 21H

MAIN ENDP
END MAIN
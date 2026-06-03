; ─────────────────────────────────────────────
; Program : Countdown from 9 to 0
; Author  : ~surjo (Md. Shaid Hasan)
; Input   : None
; Output  : 9
;           8
;           7
;           ...
;           0
; ─────────────────────────────────────────────

.MODEL SMALL
.STACK 100H

.DATA
    CRLF DB 0DH, 0AH, '$'                     ; newline

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV CX, 10                 ; loop counter — 10 numbers (9 to 0)
    MOV BL, '9'                ; start from ASCII '9' (39H)

LOOP_START:
    ; display current number
    MOV AH, 2                  ; INT 21H function 2 = single character output
    MOV DL, BL                 ; load current character into DL
    INT 21H                    ; print character

    ; print newline
    LEA DX, CRLF               ; load address of CRLF
    MOV AH, 9                  ; INT 21H function 9 = display string
    INT 21H

    SUB BL, 1                  ; move to next number ('9'→'8'→...→'0')
    LOOP LOOP_START            ; decrement CX, jump back if CX ≠ 0

    ; exit program
    MOV AH, 4CH                ; INT 21H function 4CH = exit to DOS
    INT 21H

MAIN ENDP
END MAIN
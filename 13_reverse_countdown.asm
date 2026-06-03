; ─────────────────────────────────────────────
; Program : Reverse Countdown (0 to 9)
; Author  : ~surjo (Md. Shaid Hasan)
; Input   : None
; Output  : 0
;           1
;           2
;           ...
;           9
; ─────────────────────────────────────────────

.MODEL SMALL
.STACK 100H

.DATA
    CRLF DB 0DH, 0AH, '$'     ; newline

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV CX, 10                 ; CX = loop counter (10 numbers)
    MOV BL, '0'                ; BL = start from ASCII '0' (30H)

LOOP_START:
    ; display current number
    MOV AH, 2                  ; INT 21H function 2 = single character output
    MOV DL, BL                 ; load current character into DL
    INT 21H                    ; print character

    ; print newline
    LEA DX, CRLF               ; load address of CRLF
    MOV AH, 9                  ; INT 21H function 9 = display string
    INT 21H

    INC BL                     ; move to next number ('0'→'1'→...→'9')
    LOOP LOOP_START            ; decrement CX, jump back if CX ≠ 0

    ; exit program
    MOV AH, 4CH                ; INT 21H function 4CH = exit to DOS
    INT 21H

MAIN ENDP
END MAIN
; ─────────────────────────────────────────────
; Program : Print Odd Numbers Between 0 and 10
; Author  : ~surjo (Md. Shaid Hasan)
; Input   : None
; Output  : 1
;           3
;           5
;           7
;           9
; ─────────────────────────────────────────────

.MODEL SMALL
.STACK 100H

.DATA
    CRLF DB 0DH, 0AH, '$'                     ; newline

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV CX, 5                  ; loop counter — 5 odd numbers (1,3,5,7,9)
    MOV BL, '1'                ; start from ASCII '1' (31H)

LOOP_START:
    ; display current odd number
    MOV AH, 2                  ; INT 21H function 2 = single character output
    MOV DL, BL                 ; load current character into DL
    INT 21H                    ; print character

    ; print newline
    LEA DX, CRLF               ; load address of CRLF
    MOV AH, 9                  ; INT 21H function 9 = display string
    INT 21H

    ADD BL, 2                  ; move to next odd number ('1'→'3'→'5'→'7'→'9')
    LOOP LOOP_START            ; decrement CX, jump back if CX ≠ 0

    ; exit program
    MOV AH, 4CH                ; INT 21H function 4CH = exit to DOS
    INT 21H

MAIN ENDP
END MAIN
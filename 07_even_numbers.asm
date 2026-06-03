; ─────────────────────────────────────────────
; Program : Print Even Numbers Between 0 and 10
; Author  : ~surjo (Md. Shaid Hasan)
; Input   : None
; Output  : 0
;           2
;           4
;           6
;           8
; ─────────────────────────────────────────────

.MODEL SMALL
.STACK 100H

.DATA
    CRLF DB 0DH, 0AH, '$'                     ; newline

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV CX, 5                  ; loop counter — 5 even numbers (0,2,4,6,8)
    MOV BL, '0'                ; start from ASCII '0' (30H)

LOOP_START:
    ; display current even number
    MOV AH, 2                  ; INT 21H function 2 = single character output
    MOV DL, BL                 ; load current character into DL
    INT 21H                    ; print character

    ; print newline
    LEA DX, CRLF               ; load address of CRLF
    MOV AH, 9                  ; INT 21H function 9 = display string
    INT 21H

    ADD BL, 2                  ; move to next even number ('0'→'2'→'4'→'6'→'8')
    LOOP LOOP_START            ; decrement CX, jump back if CX ≠ 0

    ; exit program
    MOV AH, 4CH                ; INT 21H function 4CH = exit to DOS
    INT 21H

MAIN ENDP
END MAIN
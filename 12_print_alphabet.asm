; ─────────────────────────────────────────────
; Program : Print All Uppercase Alphabets
; Author  : ~surjo (Md. Shaid Hasan)
; Input   : None
; Output  : A B C D E ... Z
; ─────────────────────────────────────────────

.MODEL SMALL
.STACK 100H

.DATA
    SPACE DB ' $'              ; space separator

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV CX, 26                 ; CX = loop counter (26 alphabets)
    MOV BL, 'A'                ; BL = start from ASCII 'A' (41H)

LOOP_START:
    ; display current alphabet
    MOV AH, 2                  ; INT 21H function 2 = single character output
    MOV DL, BL                 ; load current character into DL
    INT 21H                    ; print character

    ; display space
    LEA DX, SPACE              ; load address of SPACE
    MOV AH, 9                  ; INT 21H function 9 = display string
    INT 21H

    INC BL                     ; move to next alphabet ('A'→'B'→...→'Z')
    LOOP LOOP_START            ; decrement CX, jump back if CX ≠ 0

    ; exit program
    MOV AH, 4CH                ; INT 21H function 4CH = exit to DOS
    INT 21H

MAIN ENDP
END MAIN
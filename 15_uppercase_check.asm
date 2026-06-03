; ─────────────────────────────────────────────
; Program : Check if Input Character is Uppercase
; Author  : ~surjo (Md. Shaid Hasan)
; Input   : A single character (e.g. A)
; Output  : ENTER A CHARACTER: A
;           IT IS UPPERCASE
;           or
;           IT IS NOT UPPERCASE
; ─────────────────────────────────────────────

.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB 'ENTER A CHARACTER: $'           ; input prompt
    MSG2 DB 0DH, 0AH, 'IT IS UPPERCASE$'     ; uppercase message
    MSG3 DB 0DH, 0AH, 'IT IS NOT UPPERCASE$' ; not uppercase message

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; display prompt
    LEA DX, MSG1
    MOV AH, 9
    INT 21H

    ; read character
    MOV AH, 1                  ; INT 21H function 1 = single key input
    INT 21H                    ; AL = ASCII of input character

    ; check if uppercase (A=41H to Z=5AH)
    CMP AL, 'A'                ; compare with 'A'
    JL  NOT_UPPER              ; if AL < 'A' → not uppercase
    CMP AL, 'Z'                ; compare with 'Z'
    JG  NOT_UPPER              ; if AL > 'Z' → not uppercase

    ; display uppercase message
    LEA DX, MSG2
    MOV AH, 9
    INT 21H
    JMP EXIT

NOT_UPPER:
    ; display not uppercase message
    LEA DX, MSG3
    MOV AH, 9
    INT 21H

EXIT:
    ; exit program
    MOV AH, 4CH                ; INT 21H function 4CH = exit to DOS
    INT 21H

MAIN ENDP
END MAIN
; ─────────────────────────────────────────────
; Program : Hello World
; Author  : ~surjo (Md. Shaid Hasan)
; Input   : None
; Output  : HELLO!
; ─────────────────────────────────────────────

.MODEL SMALL
.STACK 100H

.DATA
    MSG DB 'HELLO!$'           ; message string ending with '$'

.CODE
MAIN PROC

    ; initialize data segment
    MOV AX, @DATA              ; load data segment address into AX
    MOV DS, AX                 ; move to DS (cannot load DS directly)

    ; display message
    LEA DX, MSG                ; load address of MSG into DX
    MOV AH, 9                  ; INT 21H function 9 = display string
    INT 21H                    ; call DOS interrupt to print

    ; exit program
    MOV AH, 4CH                ; INT 21H function 4CH = exit to DOS
    INT 21H

MAIN ENDP
END MAIN
; ─────────────────────────────────────────────
; Program : Lowercase to Uppercase Conversion
; Author  : ~surjo (Md. Shaid Hasan)
; Input   : A lowercase letter (e.g. a)
; Output  : ENTER A LOWER CASE LETTER: a
;           IN UPPER CASE IT IS: A
; ─────────────────────────────────────────────

.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB 'ENTER A LOWER CASE LETTER: $'     ; input prompt
    MSG2 DB 0DH, 0AH, 'IN UPPER CASE IT IS: '  ; result label with newline
    CHAR DB ?, '$'                             ; stores converted character

.CODE
MAIN PROC

    ; initialize data segment
    MOV AX, @DATA              ; load data segment address into AX
    MOV DS, AX                 ; move to DS (cannot load DS directly)

    ; display input prompt
    LEA DX, MSG1               ; load address of MSG1
    MOV AH, 9                  ; INT 21H function 9 = display string
    INT 21H                    ; print prompt

    ; read lowercase letter from keyboard
    MOV AH, 1                  ; INT 21H function 1 = single key input
    INT 21H                    ; AL = ASCII code of key pressed

    ; convert lowercase to uppercase
    SUB AL, 20H                ; subtract 20H to convert (e.g. 'a'=61H -> 'A'=41H)
    MOV CHAR, AL               ; store converted character in CHAR

    ; display result label
    LEA DX, MSG2               ; load address of MSG2
    MOV AH, 9                  ; INT 21H function 9 = display string
    INT 21H                    ; print result label + converted character

    ; exit program
    MOV AH, 4CH                ; INT 21H function 4CH = exit to DOS
    INT 21H

MAIN ENDP
END MAIN
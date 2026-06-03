; ─────────────────────────────────────────────
; Program : Maximum of Two Single Digits
; Author  : ~surjo (Md. Shaid Hasan)
; Input   : Two single digits (e.g. 3, 9)
; Output  : ENTER FIRST DIGIT : 3
;           ENTER SECOND DIGIT: 9
;           THE MAXIMUM IS: 9
; ─────────────────────────────────────────────

.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB 'ENTER FIRST DIGIT : $'            ; first input prompt
    MSG2 DB 0DH, 0AH, 'ENTER SECOND DIGIT: $'  ; second input prompt
    MSG3 DB 0DH, 0AH, 'THE MAXIMUM IS: $'      ; result label
    MAX  DB ?, '$'                             ; stores maximum digit

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; read first digit
    LEA DX, MSG1               ; display first prompt
    MOV AH, 9
    INT 21H
    MOV AH, 1                  ; single key input
    INT 21H
    MOV BL, AL                 ; BL = first digit ASCII

    ; read second digit
    LEA DX, MSG2               ; display second prompt
    MOV AH, 9
    INT 21H
    MOV AH, 1                  ; single key input
    INT 21H
    MOV BH, AL                 ; BH = second digit ASCII

    ; compare and find maximum
    CMP BL, BH                 ; compare first and second
    JG  FIRST_MAX              ; if BL > BH jump to FIRST_MAX
    MOV MAX, BH                ; else MAX = second digit
    JMP DISPLAY

FIRST_MAX:
    MOV MAX, BL                ; MAX = first digit

DISPLAY:
    ; display result
    LEA DX, MSG3
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
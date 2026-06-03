; ─────────────────────────────────────────────
; Program : Sum of Two Single Digits
; Author  : ~surjo (Md. Shaid Hasan)
; Input   : Two single digits whose sum < 10 (e.g. 2, 7)
; Output  : ENTER FIRST DIGIT : 2
;           ENTER SECOND DIGIT: 7
;           THE SUM OF 2 AND 7 IS 9
; ─────────────────────────────────────────────

.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB 'ENTER FIRST DIGIT : $'             ; first input prompt
    MSG2 DB 0DH, 0AH, 'ENTER SECOND DIGIT: $'   ; second input prompt with newline
    MSG3 DB 0DH, 0AH, 'THE SUM OF $'            ; result label with newline
    MSG4 DB ' AND $'                            ; separator
    MSG5 DB ' IS $'                             ; result indicator
    DIG1 DB ?, '$'                              ; stores first digit (ASCII)
    DIG2 DB ?, '$'                              ; stores second digit (ASCII)
    SUM  DB ?, '$'                              ; stores sum (ASCII)

.CODE
MAIN PROC

    ; initialize data segment
    MOV AX, @DATA              ; load data segment address into AX
    MOV DS, AX                 ; move to DS (cannot load DS directly)

    ; display first digit prompt
    LEA DX, MSG1               ; load address of MSG1
    MOV AH, 9                  ; INT 21H function 9 = display string
    INT 21H                    ; print prompt

    ; read first digit
    MOV AH, 1                  ; INT 21H function 1 = single key input
    INT 21H                    ; AL = ASCII code of first digit
    MOV DIG1, AL               ; save ASCII value for display
    MOV BL, AL                 ; store numeric value in BL

    ; display second digit prompt
    LEA DX, MSG2               ; load address of MSG2
    MOV AH, 9                  ; INT 21H function 9 = display string
    INT 21H                    ; print prompt

    ; read second digit
    MOV AH, 1                  ; INT 21H function 1 = single key input
    INT 21H                    ; AL = ASCII code of second digit
    MOV DIG2, AL               ; save ASCII value for display
    MOV BH, AL                 ; store numeric value in BH

    ; calculate sum
    ADD BL, BH                 ; BL = first digit + second digit (numeric)
    SUB BL, 30H                ; convert result back to ASCII
    MOV SUM, BL                ; store ASCII sum for display

    ; display "THE SUM OF "
    LEA DX, MSG3               ; load address of MSG3
    MOV AH, 9
    INT 21H

    ; display first digit
    LEA DX, DIG1               ; load address of DIG1
    MOV AH, 9
    INT 21H

    ; display " AND "
    LEA DX, MSG4               ; load address of MSG4
    MOV AH, 9
    INT 21H

    ; display second digit
    LEA DX, DIG2               ; load address of DIG2
    MOV AH, 9
    INT 21H

    ; display " IS "
    LEA DX, MSG5               ; load address of MSG5
    MOV AH, 9
    INT 21H

    ; display sum
    LEA DX, SUM                ; load address of SUM
    MOV AH, 9
    INT 21H

    ; exit program
    MOV AH, 4CH                ; INT 21H function 4CH = exit to DOS
    INT 21H

MAIN ENDP
END MAIN
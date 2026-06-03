; ─────────────────────────────────────────────
; Program : Total Quantity Sold Over 5 Days with Flag
; Author  : ~surjo (Md. Shaid Hasan)
; Input   : None (quantities predefined in memory)
; Output  : TOTAL: 108
;           FLAG : 1
; ─────────────────────────────────────────────

.MODEL SMALL
.STACK 100H

.DATA
    DAY1  DB 25                    ; quantity sold on day 1
    DAY2  DB 30                    ; quantity sold on day 2
    DAY3  DB 20                    ; quantity sold on day 3
    DAY4  DB 15                    ; quantity sold on day 4
    DAY5  DB 18                    ; quantity sold on day 5
    TOTAL DB 0                     ; stores total quantity
    FLAG  DB 0                     ; stores 1 if total > 100, else 0
    MSG1  DB 'TOTAL: $'            ; total label
    MSG2  DB 0DH, 0AH, 'FLAG : $'  ; flag label with newline

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; calculate total of 5 days
    MOV AL, 0
    ADD AL, DAY1
    ADD AL, DAY2
    ADD AL, DAY3
    ADD AL, DAY4
    ADD AL, DAY5
    MOV TOTAL, AL              ; store total in memory

    ; display TOTAL label
    LEA DX, MSG1
    MOV AH, 9
    INT 21H

    ; display total value — split into hundreds, tens, units
    MOV BL, TOTAL              ; BL = total (preserve for flag check)

    ; hundreds digit
    MOV AL, BL
    MOV AH, 0
    MOV CL, 100
    DIV CL                     ; AL = hundreds, AH = remainder
    MOV BH, AH                 ; save remainder before AH is overwritten
    ADD AL, 30H                ; convert to ASCII
    MOV DL, AL
    MOV AH, 2
    INT 21H                    ; print hundreds digit

    ; tens digit
    MOV AL, BH                 ; restore remainder
    MOV AH, 0
    MOV CL, 10
    DIV CL                     ; AL = tens, AH = units
    MOV BH, AH                 ; save units before AH is overwritten
    ADD AL, 30H                ; convert to ASCII
    MOV DL, AL
    MOV AH, 2
    INT 21H                    ; print tens digit

    ; units digit
    MOV DL, BH                 ; restore units
    ADD DL, 30H                ; convert to ASCII
    MOV AH, 2
    INT 21H                    ; print units digit

    ; check if total > 100
    CMP BL, 100                ; compare saved total with 100
    JG  SET_FLAG
    MOV FLAG, 0                ; FLAG = 0
    JMP SHOW_FLAG

SET_FLAG:
    MOV FLAG, 1                ; FLAG = 1

SHOW_FLAG:
    ; display FLAG label
    LEA DX, MSG2
    MOV AH, 9
    INT 21H

    ; display flag value
    MOV AL, FLAG
    ADD AL, 30H                ; convert to ASCII
    MOV DL, AL
    MOV AH, 2
    INT 21H

    ; exit program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
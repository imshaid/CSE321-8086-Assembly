; ─────────────────────────────────────────────
; Program : Grade Checker (Grading System)
; Author  : ~surjo (Md. Shaid Hasan)
; Input   : Marks as 2 or 3 digits (e.g. 75)
; Output  : ENTER MARKS: 75
;           GRADE: A
; Note    : Grading Scale:
;           80-100 → A+
;           75-79  → A
;           70-74  → A-
;           65-69  → B+
;           60-64  → B
;           55-59  → B-
;           50-54  → C+
;           45-49  → C
;           40-44  → D
;           00-39  → F
; ─────────────────────────────────────────────

.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB 'ENTER MARKS: $'       ; input prompt
    MSG2 DB 0DH, 0AH, 'GRADE: $'   ; result label
    GRD  DB ?, ?, '$'              ; stores grade (2 chars max)
    D1   DB 0                      ; stores first digit
    D2   DB 0                      ; stores second digit
    D3   DB 0                      ; stores third digit

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; display prompt
    LEA DX, MSG1
    MOV AH, 9
    INT 21H

    ; read first digit
    MOV AH, 1
    INT 21H
    SUB AL, 30H                ; convert to numeric
    MOV D1, AL                 ; save in memory

    ; read second digit
    MOV AH, 1
    INT 21H
    SUB AL, 30H
    MOV D2, AL                 ; save in memory

    ; read third digit
    MOV AH, 1
    INT 21H
    SUB AL, 30H
    MOV D3, AL                 ; save in memory

    ; combine: marks = D1*100 + D2*10 + D3
    ; hundreds
    MOV AL, D1
    MOV AH, 0
    MOV CX, 100
    MUL CX                     ; DX:AX = AL * 100
    MOV SI, AX                 ; SI = hundreds part

    ; tens
    MOV AL, D2
    MOV AH, 0
    MOV CX, 10
    MUL CX                     ; DX:AX = AL * 10
    ADD SI, AX                 ; SI = hundreds + tens

    ; units
    MOV AL, D3
    MOV AH, 0
    ADD SI, AX                 ; SI = total marks

    ; SI = total marks — now check grade
    MOV GRD, ' '
    MOV GRD+1, ' '

    CMP SI, 80
    JGE G_APLUS

    CMP SI, 75
    JGE G_A

    CMP SI, 70
    JGE G_AMINUS

    CMP SI, 65
    JGE G_BPLUS

    CMP SI, 60
    JGE G_B

    CMP SI, 55
    JGE G_BMINUS

    CMP SI, 50
    JGE G_CPLUS

    CMP SI, 45
    JGE G_C

    CMP SI, 40
    JGE G_D

    MOV GRD, 'F'
    MOV GRD+1, ' '
    JMP SHOW

G_APLUS:
    MOV GRD, 'A'
    MOV GRD+1, '+'
    JMP SHOW

G_A:
    MOV GRD, 'A'
    MOV GRD+1, ' '
    JMP SHOW

G_AMINUS:
    MOV GRD, 'A'
    MOV GRD+1, '-'
    JMP SHOW

G_BPLUS:
    MOV GRD, 'B'
    MOV GRD+1, '+'
    JMP SHOW

G_B:
    MOV GRD, 'B'
    MOV GRD+1, ' '
    JMP SHOW

G_BMINUS:
    MOV GRD, 'B'
    MOV GRD+1, '-'
    JMP SHOW

G_CPLUS:
    MOV GRD, 'C'
    MOV GRD+1, '+'
    JMP SHOW

G_C:
    MOV GRD, 'C'
    MOV GRD+1, ' '
    JMP SHOW

G_D:
    MOV GRD, 'D'
    MOV GRD+1, ' '

SHOW:
    LEA DX, MSG2
    MOV AH, 9
    INT 21H

    LEA DX, GRD
    MOV AH, 9
    INT 21H

    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
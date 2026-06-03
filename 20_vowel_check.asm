; ─────────────────────────────────────────────
; Program : Vowel or Consonant Checker
; Author  : ~surjo (Md. Shaid Hasan)
; Input   : A single letter uppercase or lowercase (e.g. A or a)
; Output  : ENTER A LETTER: A
;           IT IS A VOWEL
;           or
;           IT IS A CONSONANT
; ─────────────────────────────────────────────

.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB 'ENTER A LETTER: $'             ; input prompt
    MSG2 DB 0DH, 0AH, 'IT IS A VOWEL$'      ; vowel message
    MSG3 DB 0DH, 0AH, 'IT IS A CONSONANT$'  ; consonant message

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

    ; convert to uppercase if lowercase (subtract 20H)
    CMP AL, 'a'                ; check if >= 'a'
    JL  CHECK                  ; if not lowercase skip conversion
    CMP AL, 'z'                ; check if <= 'z'
    JG  CHECK                  ; if not lowercase skip conversion
    SUB AL, 20H                ; convert lowercase to uppercase

CHECK:
    ; check each vowel (uppercase only now)
    CMP AL, 'A'
    JE  IS_VOWEL

    CMP AL, 'E'
    JE  IS_VOWEL

    CMP AL, 'I'
    JE  IS_VOWEL

    CMP AL, 'O'
    JE  IS_VOWEL

    CMP AL, 'U'
    JE  IS_VOWEL

    ; else consonant
    LEA DX, MSG3
    MOV AH, 9
    INT 21H
    JMP EXIT

IS_VOWEL:
    LEA DX, MSG2
    MOV AH, 9
    INT 21H

EXIT:
    ; exit program
    MOV AH, 4CH                ; INT 21H function 4CH = exit to DOS
    INT 21H

MAIN ENDP
END MAIN
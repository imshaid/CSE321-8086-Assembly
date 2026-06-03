```nasm
; ═══════════════════════════════════════════════════════
; PROGRAM : 8086 Assembly Programs
; AUTHOR  : ~surjo (Md. Shaid Hasan)
; SYNTAX  : TASM (Turbo Assembler)
; STATUS  : RUNNING
; ═══════════════════════════════════════════════════════

MOV AX, KNOWLEDGE
ADD AX, PRACTICE
; AX = MASTERY
```

---

```nasm
; ─────────────────────────────────────────────────────
; DEPENDENCIES
; ─────────────────────────────────────────────────────
```

- [Visual Studio Code](https://code.visualstudio.com/)
- [MASM/TASM Extension](https://marketplace.visualstudio.com/items?itemName=xsro.masm-tasm) by clcxsrolau
- DOSBox — bundled with the extension, no separate installation needed

---

```nasm
; ─────────────────────────────────────────────────────
; HOW TO RUN
; ─────────────────────────────────────────────────────

STEP_1: Install MASM/TASM extension in VS Code
STEP_2: Open any .asm file
STEP_3: Right-click inside the editor
STEP_4: Click "Run ASM code"
        ; DOSBox launches automatically
        ; No manual setup needed
```

---

```nasm
; ─────────────────────────────────────────────────────
; PROGRAM INDEX
; ─────────────────────────────────────────────────────
```

| Category | Programs | Description |
|----------|----------|-------------|
| [Basic I/O](#basic-io) | 01 – 05 | Input and output operations |
| [Loop](#loop) | 06 – 13 | Programs using LOOP instruction |
| [Jump / Branching](#jump--branching) | 14 – 20 | Programs using conditional and unconditional jumps |
| [Loop + Jump Combined](#loop--jump-combined) | 21 – 25 | Programs combining loop and branching |

---

## Basic I/O

```nasm
; Programs that demonstrate input and output operations using INT 21H
```

| # | Program | Input | Output |
|---|---------|-------|--------|
| 01 | `01_hello.asm` | None | `HELLO!` |
| 02 | `02_case_conversion.asm` | A lowercase letter | Uppercase version |
| 03 | `03_sum_of_two_digits.asm` | Two single digits | Sum of the two digits |
| 04 | `04_three_initials.asm` | Three initials | Each initial on a new line |
| 05 | `05_hex_to_decimal.asm` | A hex digit (A–F) | Decimal equivalent |

---

## Loop

```nasm
; Programs that use the LOOP instruction for repeated execution
```

| # | Program | Input | Output |
|---|---------|-------|--------|
| 06 | `06_odd_numbers.asm` | None | Odd numbers 1 to 9 |
| 07 | `07_even_numbers.asm` | None | Even numbers 0 to 8 |
| 08 | `08_countdown.asm` | None | Numbers 9 down to 0 |
| 09 | `09_sum_of_n_numbers.asm` | None (N=5 predefined) | Sum of 1 to 5 = 15 |
| 10 | `10_factorial.asm` | None (N=5 predefined) | 5! = 120 |
| 11 | `11_multiplication_by_addition.asm` | None (A=6, B=4 predefined) | 6 × 4 = 24 |
| 12 | `12_print_alphabet.asm` | None | A to Z with spaces |
| 13 | `13_reverse_countdown.asm` | None | Numbers 0 to 9 |

---

## Jump / Branching

```nasm
; Programs that use conditional and unconditional jump instructions
```

| # | Program | Input | Output |
|---|---------|-------|--------|
| 14 | `14_absolute_value.asm` | None (N=-5 predefined) | Absolute value = 5 |
| 15 | `15_uppercase_check.asm` | A single character | UPPERCASE or NOT UPPERCASE |
| 16 | `16_max_of_two_digits.asm` | Two single digits | The larger digit |
| 17 | `17_positive_negative_zero.asm` | None (N=-3 predefined) | POSITIVE, NEGATIVE, or ZERO |
| 18 | `18_number_comparison.asm` | Two single digits | GREATER, SMALLER, or EQUAL |
| 19 | `19_grade_checker.asm` | 3-digit marks (e.g. 075) | Grade (A+, A, A-, B+, B, B-, C+, C, D, F) |
| 20 | `20_vowel_check.asm` | A single letter | VOWEL or CONSONANT |

---

## Loop + Jump Combined

```nasm
; Programs that combine loop and branching instructions
```

| # | Program | Input | Output |
|---|---------|-------|--------|
| 21 | `21_largest_of_three.asm` | Three single digits | The largest digit |
| 22 | `22_sum_of_odd_numbers.asm` | None | Sum of odd numbers 1–9 = 25 |
| 23 | `23_sum_of_even_numbers.asm` | None | Sum of even numbers 0–10 = 30 |
| 24 | `24_digit_sum_loop.asm` | A 3-digit number | Sum of its digits |
| 25 | `25_total_quantity_flag.asm` | None (predefined values) | Total quantity + FLAG (0 or 1) |

---

```nasm
; ─────────────────────────────────────────────────────
; IMPORTANT NOTES
; ─────────────────────────────────────────────────────
; [!] Factorial (10)      → N <= 5 only (8-bit register limit: max 255)
; [!] Grade Checker (19)  → Input must be exactly 3 digits
;                           e.g. enter 075 for 75, 098 for 98
; [!] Vowel Check (20)    → Supports both uppercase and lowercase input
; [!] Predefined values   → Edit the .DATA section to change input values
; [!] All programs        → TASM syntax only, will not work with Win32 assembly
```

---

```nasm
; ─────────────────────────────────────────────────────
; INT 21H QUICK REFERENCE
; ─────────────────────────────────────────────────────
; Function | Input        | Output       | Description
; ─────────────────────────────────────────────────────
; AH = 1   | —            | AL = char    | Single key input
; AH = 2   | DL = char    | —            | Single character output
; AH = 9   | DX = address | —            | String output (ends with $)
; AH = 4CH | —            | —            | Exit to DOS
```

---

```nasm
; ─────────────────────────────────────────────────────
; END PROGRAM
; HLT                     ; processor halted
; ─────────────────────────────────────────────────────
```
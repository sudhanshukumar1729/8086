.MODEL SMALL
.STACK 100H

.DATA
    num1 DW 1234h    ; First 16-bit number (example: 1234h)
    num2 DW 5678h    ; Second 16-bit number (example: 5678h)
    result DW ?      ; Variable to store the result 
    carry DW 0       ; Variable to store carry flag

.CODE
MAIN PROC
    MOV AX, @DATA    ; Initialize data segment
    MOV DS, AX

    MOV AX, num1     ; Load num1 into AX
    ADD AX, num2     ; Add num2 to AX

    JC CARRY_STORE   ; Jump if carry flag (CF) is set

    ; No carry, store the result directly
    MOV result, AX   ; Store the result in 'result'
    JMP END_PROGRAM  ; Jump to end the program

CARRY_STORE:
    INC carry        ; Increment carry to indicate a carry occurred

    ; Store the result including carry (if needed)
    MOV result, AX   ; Store the result in 'result'

END_PROGRAM:
    ; Display or use the result and carry flag as needed

    ; Exit program
    MOV AH, 4CH      ; Set AH to 4CH (DOS function for program termination)
    INT 21H          ; Call DOS interrupt to terminate program

MAIN ENDP
END MAIN

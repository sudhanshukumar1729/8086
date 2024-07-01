
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

;.MODEL SMALL
;.STACK 100H
.DATA
    num DW 5        ; Number to calculate the factorial of (example: 5)
    result DW 1     ; To store the result of the factorial

.CODE
MAIN PROC
    MOV AX, @DATA   ; Initialize data segment
    MOV DS, AX
   ; MOV ES, AX
;
    ; Initialize variables
    MOV CX, num     ; Move the number into CX (counter)
    MOV AX, 1       ; AX will hold the result, initialize to 1

FACTORIAL_LOOP:
    MUL CX          ; AX = AX * CX
    LOOP FACTORIAL_LOOP  ; Decrement CX and repeat loop if CX != 0

    ; Store result
    MOV result, AX  ; Move the result into memory

    ; Exit program
    MOV AX, 4C00H
    INT 21H

;MAIN ENDP
END MAIN


ret





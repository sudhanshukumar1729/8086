
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.MODEL SMALL
.STACK 100H

.DATA
    num1 DB 25     ; First 8-bit number (example: 25)
    num2 DB 55     ; Second 8-bit number (example: 15)
    result DB ?    ; Variable to store the result

.CODE
MAIN PROC
    MOV AX, @DATA   ; Initialize data segment
    MOV DS, AX
    
    MOV AL, num1    ; Load num1 into AL (first operand)
    ADD AL, num2    ; Add num2 to AL (second operand)
    MOV result, AL  ; Store the result in 'result'

    ; Display or use the result as needed

    ; Exit program
    MOV AH, 4CH     ; Set AH to 4CH (DOS function for program termination)
    INT 21H         ; Call DOS interrupt to terminate program

MAIN ENDP
END MAIN


ret





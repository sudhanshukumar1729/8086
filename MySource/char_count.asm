
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.MODEL SMALL
.STACK 100H

.DATA
    string DB 'Hello, World!', 0  ; String terminated with null character   
    count dw 0

.CODE
MAIN PROC
    MOV AX, @DATA     ; Initialize data segment
    MOV DS, AX

    MOV SI, OFFSET string  ; Load address of string into SI (source index)
    MOV CX, 0           ; Initialize character count to zero

COUNT_LOOP:
    MOV AL, [SI]         ; Load byte from DS:SI into AL
    CMP AL, 0            ; Compare AL (current character) with null terminator
    JE END_COUNT_LOOP    ; If null terminator found, exit loop
    INC CX               ; Increment character count
    INC SI               ; Move to next character in string
    JMP COUNT_LOOP       ; Repeat loop
    

END_COUNT_LOOP:   
    mov count, cx
    ; CX now contains the count of characters in the string (excluding the null terminator)

    ; Display or use CX as needed for further processing

    ; Exit program
    MOV AX, 4C00H       ; Set AX to 4C00H (DOS function for program termination)
    INT 21H             ; Call DOS interrupt to terminate program

MAIN ENDP
END MAIN


ret





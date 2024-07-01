; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h  

index dw ?

mov si, 1100h          ; SI points to the start of the array
mov cl, [si]           ; Load number of elements into CL
inc si                 ; Point SI to the first element of the array

mov al, 8              ; Value to search for (target)
mov di, -1             ; Initialize index to -1 (not found)

SEARCH_LOOP:
    cmp cl, 0          ; Check if CL (number of elements) is 0
    je NOT_FOUND       ; If 0, jump to NOT_FOUND
    mov bl, [si]       ; Load current element into BL
    cmp bl, al         ; Compare current element with target
    je FOUND           ; If equal, jump to FOUND
    inc si             ; Increment SI to point to the next element
    dec cl             ; Decrement CL (number of elements left)
    jmp SEARCH_LOOP    ; Repeat the loop

FOUND:
    mov di, si         ; Store the index of the found element in DI 
    sub di, 1100h      ; Calculate the zero-based index             
    mov index, di
    jmp END_SEARCH     ; Jump to END_SEARCH

NOT_FOUND:
    mov di, -1         ; If not found, DI remains -1

END_SEARCH:  
    
    ; DI now contains the index of the found element or -1 if not found
    hlt                ; Halt the program

ret                    ; Return

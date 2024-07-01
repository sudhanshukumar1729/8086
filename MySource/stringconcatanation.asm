
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

org 100h

.data
str1 db 'Hello, ', 0  ; First string with null terminator
str2 db 'World!', 0   ; Second string with null terminator
result db 50 dup('$')   ; Result buffer with sufficient space
.code
start:
    ; Initialize data segment
    mov ax, @data
    mov ds, ax
    mov es, ax
    
    ; Set SI to point to the beginning of str1
    mov si, offset str1
    ; Set DI to point to the beginning of the result buffer
    mov di, offset result

copy_str1:
    mov al, [si]       ; Load byte from str1
    mov [di], al       ; Store byte into result
    inc si             ; Increment SI
    inc di             ; Increment DI
    cmp al, 0          ; Check for null terminator
    jne copy_str1      ; Repeat until null terminator

   ; dec di             ; Point DI back to overwrite the null terminator

    ; Set SI to point to the beginning of str2
    mov si, offset str2

copy_str2:
    mov al, [si]       ; Load byte from str2
    mov [di], al       ; Store byte into result
    inc si             ; Increment SI
    inc di             ; Increment DI
    cmp al, 0          ; Check for null terminator
    jne copy_str2      ; Repeat until null terminator  
    
    mov dx, offset result
    mov ah, 09h        ; Function to display string
    int 21h            ; DOS interrupt

    ; Terminate program
    mov ah, 4ch
    int 21h


ret





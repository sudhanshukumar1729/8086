
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

mov si, 1100h
mov cl, [si]
dec cl
REPEAT:
mov si, 1100h
mov ch, [si]
dec ch
inc si
REPCOM:
mov al, [si]
inc si
cmp al, [si]
jc AHEAD
xchg al, [si]
xchg al,[si-1]
AHEAD:
dec ch
jnz REPCOM
dec cl
jnz REPEAT
hlt

ret





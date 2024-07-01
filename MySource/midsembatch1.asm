
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h


x dw 2     ; Value of x
y dw 3     ; Value of y
z dw 4     ; Value of z 


result dw ?


    mov ax, x
    mul x   
    mov result, ax  
    mov ax, result
    mul x
    mov result, ax
    
    mov ax, y
    mul y
    add ax, result
    mov result, ax    
      
    
    mov ax,z
    add ax,result 
    
    mov result, ax
     
    mov ax, 4c00h       ; DOS function: Exit program
    int 21h


ret





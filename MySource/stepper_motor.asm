; this is an example of out instruction.
; it writes values to virtual i/o port
; that controls the stepper-motor.
; c:\emu8086\devices\stepper_motor.exe is on port 7

#start=stepper_motor.exe#

name "stepper"

#make_bin#

jmp start

; ========= data ===============

; bin data for clock-wise half-step rotation:
datcw    db 0000_0110b
         db 0000_0100b    
         db 0000_0011b
         db 0000_0010b

; bin data for counter-clock-wise half-step rotation:
datccw   db 0000_0011b
         db 0000_0001b    
         db 0000_0110b
         db 0000_0010b

; bin data for clock-wise full-step rotation:
datcw_fs db 0000_0001b
         db 0000_0011b    
         db 0000_0110b
         db 0000_0000b

; bin data for counter-clock-wise full-step rotation:
datccw_fs db 0000_0100b
          db 0000_0110b    
          db 0000_0011b
          db 0000_0000b

start:
mov bx, offset datcw ; start from clock-wise half-step.
mov si, 0
mov cx, 4 ; number of steps in each sequence

next_step:
; motor sets top bit when it's ready to accept new command
wait:   in al, 7     
        test al, 10000000b
        jz wait

mov al, [bx][si]
out 7, al

inc si

cmp si, 4
jb next_step
mov si, 0

dec cx
jnz next_step

; Switch direction between clockwise and anticlockwise
cmp bx, offset datcw
je switch_to_ccw

cmp bx, offset datccw
je switch_to_cw

switch_to_ccw:
mov bx, offset datccw
mov cx, 4
jmp next_step

switch_to_cw:
mov bx, offset datcw
mov cx, 4
jmp next_step

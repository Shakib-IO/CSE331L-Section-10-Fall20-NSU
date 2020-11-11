
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

MOV AX, 1
MOV BX, 5
MOV CX, 5


ADD BX, CX
ADD AX ,BX



ret





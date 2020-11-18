
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; add your code here


SK1 EQU 1
SK2 EQU 2
SK3 EQU 3

MOV AX, SK1
ADD AX, SK2
ADD AX, SK3
        
MOV BX, AX

ret





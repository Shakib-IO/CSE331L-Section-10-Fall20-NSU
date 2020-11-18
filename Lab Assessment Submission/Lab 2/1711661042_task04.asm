
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt


;3. Define an array of 5 numbers using DUP
org 100h

; add your code here




A DB 5 DUP(1,2) 

MOV AL , A 

ret

              
              
;4. Define an array with occuring 1 and 2 value
;(e.g- 1,2,1,2...)  





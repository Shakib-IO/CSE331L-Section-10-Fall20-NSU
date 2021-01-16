
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

.MODEL SMALL
.STACK 100H

.DATA
    PROMPT_1 DB "Enter HEX no from A to F : $"
    PROMPT_2 DB 0DH,0AH , "HEX converted to Decimal : $"
    
    
.CODE
    MAIN PROC
        MOV AX , @DATA
        MOV DS , AX
        
        LEA DX , PROMPT_1
        MOV Ah , 9
        INT 21H
        
        MOV AH , 1
        INT 21H
        
        MOV BL , AL
        
        LEA DX , PROMPT_2
        MOV Ah, 9
        INt 21H
        
        MOV AH , 2
        MOV DL , 31H
        INT 21H
        
        SUB BL , 11H
        
        MOV DL , BL
        INT 21H
        
        MOV AH , 4CH
        INT 21H
       MAIN ENDP
    END MAIN
        




; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

.MODEL SMALL
.STACK 100H

.DATA
    PROMPT_1 DB "Enter a Number 1: $"
    PROMPT_2 DB "Enter a Number 2: $"
    PROMPT_3 DB "Largest one is : $"
    
    
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
        
        MOV AH , 2
        MOV DL , 0DH
        INT 21H
        
        
        MOV DL , 0AH
        INT 21H
        
        LEA DX , PROMPT_2
        MOV Ah, 9
        INT 21H
        
        
        MOV AH, 1
        INT 21H
   
        MOV BH, AL
        MOV AH,2
        MOV DL,0DH
        INT 21H
        MOV DL,0AH
        INT 21H  
        
        
        
        LEA DX, PROMPT_3
        MOV AH, 9
        INT 21H
   
        
        CMP BL,BH
   
   
        JNBE @ELSE                   
          MOV DL, BH                  
         JMP @DISPLAY                

         @ELSE:                    
            MOV DL, BL               

        @DISPLAY:                 
            MOV AH, 2                 
            INT 21H
   
        MOV AH, 4CH                 
        INT 21H
   MAIN ENDP
 END MAIN



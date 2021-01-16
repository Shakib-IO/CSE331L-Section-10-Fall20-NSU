 .MODEL SMALL
 .STACK 100H

 .DATA
    PROMPT_1  DB  'AL : $\'
    PROMPT_2  DB  0DH,0AH, 'Divide SHR by 4: $'

 .CODE
   MAIN PROC
     MOV AX, @DATA                
     MOV DS, AX

     LEA DX, PROMPT_1             
     MOV AH, 9
     INT 21H

     MOV AL, 38H                  ; place 8 in the AL
     MOV BL, AL                    

     MOV AH, 2                    
     MOV DL, AL
     INT 21H

     LEA DX, PROMPT_2             
     MOV AH, 9
     INT 21H

     AND BL, 0FH                 

     MOV CL, 2                    ; divide AL by 4  
     SHR BL, CL                    
                                 
                                  
     OR BL, 30H                  

     MOV AH, 2                    
     MOV DL, BL
     INT 21H

     MOV AH, 4CH                  
     INT 21H
   MAIN ENDP 
 END MAIN
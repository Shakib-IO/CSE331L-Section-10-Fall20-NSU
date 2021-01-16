.MODEL SMALL
.STACK 100H

.DATA 

    MSG1 DB 'Please Enter a string: $'
    
    VALUE_STR1 DB 50 DUP('$')
    VALUE_STR2 DB 50 DUP('$')
    
    MSG2 DB 0DH , 0AH , 'Print the String in Forward Way: $'
    MSG3 DB 0DH, 0AH , 'Print the String in Backward Way:: $'
    
    
    MSG4 DB 0DH , 0AH , 'Conclusion: So the String is Palindrome$'
    MSG5 DB 0DH , 0AH , 'Conclusion: So the String Not Palindrome$'

.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG1      ;Display Message 1
    MOV AH,9
    INT 21H
    
    LEA SI, VALUE_STR1 
    LEA DI, VALUE_STR2
    
    
STRING_INPUT:
    MOV AH,1
    INT 21H
                     ;Taking User input
    CMP AL,13
    JE  PRINT_STRING
    MOV [SI],AL
    INC SI
    
    LOOP STRING_INPUT

PRINT_STRING:
    LEA DX,MSG2      ; Print it in forward string
    MOV AH,9
    INT 21H
    
    MOV DL,OFFSET VALUE_STR1
    MOV AH,9
    INT 21H  
    
    
    lEA DX,MSG3       ;Print it in backward string
    MOV AH,9
    INT 21H
    
    DEC SI
     
REVERSE_STRING:
  
    
    MOV AL,[SI]        ; Reverse the input String
    MOV [DI],AL
    
    INC DI 
    DEC SI
    CMP [SI],'$'
    JNZ REVERSE_STRING
    
    MOV AL,'$'
    MOV [DI],AL 
   
    MOV DL,OFFSET VALUE_STR2
    MOV AH,9
    INT 21H 
    
    LEA SI,VALUE_STR1
    LEA DI,VALUE_STR2
                       ;Check the string palindrom
PALINDROME:
    MOV AL,[SI]
    CMP AL,'$'
    
    JZ P_PALIN
    
    MOV BL,[DI]
    CMP AL,BL
    
    JNZ N_PALIN
    
    INC DI
    INC SI
    
    JMP PALINDROME
       

P_PALIN:           ;Print if Palindrom
   
    LEA DX,MSG4
    MOV AH,9
    INT 21H
    JMP EXIT

N_PALIN:
    LEA DX,MSG5    ;Print if Not Palindrom
    MOV AH,9
    INT 21H
    JMP EXIT    
    
EXIT:    
    MOV AH,4CH
    INT 21H
        
MAIN ENDP
END MAIN
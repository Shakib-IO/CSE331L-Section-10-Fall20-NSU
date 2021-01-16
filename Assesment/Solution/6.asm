.MODEL SMALL
.STACK 100H
.DATA 
    NUM_A DB 'Enter first number: $'
    NUM_B DB 0DH,0AH,'Enter second number: $'
    RES DB 0DH,0AH,'LCM is : $'  


.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,NUM_A
    MOV AH,9
    INT 21H
    
INPUT_1:
    MOV AH,1      
    INT 21H
    MOV CL,AL
    
    LEA DX,NUM_B
    MOV AH,9
    INT 21H 
    
INPUT_2:
    MOV AH,1
    INT 21H
    
    MOV BL,AL 
    

    CMP CL,BL
    JB EXCHANGE
     
    

      
L4: MOV AL,CL
    MOV CL,1  
    SUB AL,30H
    SUB BL,30H

LCM:
   MOV BH,AL                          
   MUL CL           ;multiplies the value in AL with CL here CL is set as a counter register         
   AAM
   MOV DX,AX        ;stores the product in a register DX
   DIV BL           ;divides the product with the second number
   CMP AH,00
   JZ RESULT_PRINT  ;if the remainder is zero then prints the product      
   INC CL           ;if the remainder is not zero then increments CL and loops the same process
   MOV AL,BH
   JMP LCM
   
RESULT_PRINT:
   MOV CX,DX
   
   LEA DX,RES
   MOV AH,9
   INT 21H
   
   MOV DX,CX
   ADD DX,30H
   MOV AH,2
   INT 21H
   JMP EXIT   
EXCHANGE:
      XCHG CL,BL
      JMP L4            
  
EXIT: 
  MOV AH,4CH
  INT 21H
MAIN ENDP
END MAIN
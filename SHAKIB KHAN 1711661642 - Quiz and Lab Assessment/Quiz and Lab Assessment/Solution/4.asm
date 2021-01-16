.MODEL SMALL
.STACK 100H
.DATA
    PRMPT_MSG_1 DB 0AH,0DH ,'ENTER A HEX DIGIT "0"..."9"  OR "A".."F": $'
    OUTPUT_PRMPT DB 0AH,0DH,'In Decimal it is: $'
    PROMPT_TRY_MSG DB 0AH,0DH,'Invalid Character.$'
.CODE
MAIN PROC
 
    MOV AX,@DATA
    MOV DS,AX
 
    TOP:
        MOV AH,9
        LEA DX,PRMPT_MSG_1
        INT 21H
     
        MOV AH,1
        INT 21H
        MOV BL,AL
     
        CMP BL,30H
        JL  TRY_MSG
     
        CMP BL,46H
        JG  TRY_MSG
     
        CMP BL,39H
        JLE DIGIT
     
        MOV AH,9
        LEA DX,OUTPUT_PRMPT
        INT 21H
     
        SUB BL,11H
     
        MOV AH,2
        MOV DL,31H
        INT 21H
        MOV DL,BL
        INT 21H      
    DIGIT:
        MOV AH,9
        LEA DX,OUTPUT_PRMPT
        INT 21H
     
        MOV AH,2
        MOV DL,BL
        INT 21H
     
    TRY_MSG:
        MOV AH,9
        LEA DX,PROMPT_TRY_MSG
        INT 21H
        JMP TOP      
    END_:
 
    MOV AH,4CH
    INT 21H
     
    MAIN ENDP
END MAIN
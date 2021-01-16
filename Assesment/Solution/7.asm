.MODEL SMALL
.STACK 100H
.DATA
    PROMPT_1 DB 'Enter the 1st Number : $'
    PROMPT_2 DB 'Enter the 2nd Number : $'
    PROMPT_3 DB  'Multiplication of 1st & 2nd Number is : $'

    VALUE_1 DB ?
    VALUE_2 DB ?
 

.CODE
  MAIN PROC
    MOV AX, @DATA   ; initialize DS
    MOV DS, AX

    
    LEA DX, PROMPT_1    ; load and display the PROMPT_1
    MOV AH, 9
    INT 21H

    MOV AH, 1   ; read a character
    INT 21H

    SUB AL, 30H     ; Convert in ASCII code and save 1st digit in VALUE_1
    MOV VALUE_1,AL

    MOV AH, 2
     
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH     ; New Line
    INT 21H 

    
    LEA DX, PROMPT_2    ; load and display the PROMPT_2
    MOV AH, 9
    INT 21H

    MOV AH, 1   ; read a character
    INT 21H

    SUB AL, 30H     ;  Convert in ASCII code and save 2nd digit in VALUE_2
    MOV VALUE_2,AL

    MOV AH, 2 ; carriage return
    
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH ; New Line
    INT 21H
    
    
    
    MOV AL, VALUE_1
    MUL VALUE_2     ; MULTIPLY Destination


    AAM    ;https://sites.google.com/site/microprocessorsbits/arithmetic-instructions/aam
        
        MOV CH , AH
        MOV CL , AL
        
        LEA DX, PROMPT_3    ; load and display the PROMPT_3
        MOV AH, 9
        INT 21H
        
        MOV DL , CH
        ADD DL , 48
        MOV AH , 2
        INT 21H
        
        MOV DL , CL
        ADD DL , 48
        MOV AH , 2
        INT 21H



    ADD AL,30H
    

    CMP AL, 3FH  ; Compair the result if it is greater than 15 = 3FH


    JG @GREATER

        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH ; New Line
        INT 21H
        
        
        MOV AH,2
        MOV DL, "0"
        INT 21H

    JMP @EXIT

    @GREATER:  
    
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH ; New Line
        INT 21H
    
        
        MOV AH, 2
        MOV DL, "1"
        INT 21H

    @EXIT:
        MOV AH,4CH
        INT 21H

  MAIN ENDP
END MAIN
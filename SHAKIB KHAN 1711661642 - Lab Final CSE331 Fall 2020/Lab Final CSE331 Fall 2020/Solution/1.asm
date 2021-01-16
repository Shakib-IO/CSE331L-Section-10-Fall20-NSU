.MODEL SMALL
.STACK 100H
.DATA
    PROMPT_1 DB 'Enter the First digit : $'
    PROMPT_2 DB 'Enter the Second digit : $'
    PROMPT_3 DB 'GCF : $'
    VALUE_1 DB ?
    VALUE_2 DB ? 
    TEMP DB 0
    GCD DB 0

.CODE
MAIN PROC
    MOV AX, @DATA 
    MOV DS, AX
    LEA DX, PROMPT_1 
    MOV AH, 9
    INT 21H
    MOV AH, 1 
    INT 21H

    SUB AL, 30H

    MOV VALUE_1,AL
    MOV BL,AL
    MOV AH, 2 
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH 
    INT 21H
    LEA DX, PROMPT_2 ;
    MOV AH, 9
    INT 21H
    MOV AH, 1 
    INT 21H

    SUB AL, 30H
    MOV VALUE_2,AL
    MOV AH, 2 
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH 
    INT 21H
    LEA DX, PROMPT_3 
    MOV AH, 9
    INT 21H 

    MOV CX, 1
    MOV AH, 2 
    CMP VALUE_2, 30H
    JE @LOOP

    @LOOP:
        MOV TEMP, AL 
        MOV BH, VALUE_1
        XOR CL, BH
        XOR WORD PTR [BX], 00FFH 
        MOV VALUE_1, BL 

    ADD AL, 30H

    MOV AH, 2 
    MOV DL, AL
    INT 21H
    MOV AH, 4CH 
    INT 21H
    
    MAIN ENDP
END MAIN
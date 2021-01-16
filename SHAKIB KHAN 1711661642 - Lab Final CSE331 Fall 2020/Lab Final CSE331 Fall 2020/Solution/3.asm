.MODEL SMALL
.STACK 100H
.DATA
   
    VALUE_1 DB ?
    VALUE_2 DB ? 
    TEMP DB 0

.CODE
MAIN PROC
    MOV AX, @DATA 
    MOV DS, AX
    
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


    ADD AL, 30H

    MOV AH, 2 
    MOV DL, AL
    INT 21H
    MOV AH, 4CH 
    INT 21H
    
    MAIN ENDP
END MAIN
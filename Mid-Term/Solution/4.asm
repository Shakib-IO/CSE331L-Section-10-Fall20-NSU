
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

.MODEL SMALL
.CODE

org 100h

START:
    MOV CX, 5

L1:
    POP CX

L2:
    
    
    MOV AH,2H
    MOV DL,2AH
    INT 21H
    LOOP L2
    MOV DL,0Ah
    INT 21H
    MOV DL,0Dh
    INT 21H
    POP CX
    LOOP L1
    MOV CX,5
    



L3:
    PUSH CX

    LOOP L3

EXIT: INT 20H
END START
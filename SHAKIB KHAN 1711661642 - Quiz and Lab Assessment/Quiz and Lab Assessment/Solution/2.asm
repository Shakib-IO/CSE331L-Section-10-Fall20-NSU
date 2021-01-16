.MODEL SMALL

.DATA
.CODE
 MAIN PROC
                MOV AX,@DATA
                MOV DX,AX

                MOV AL,20
                MOV CL,15
                MOV AH,00
                DIV CL
                MOV DX,AX
                ADD DX,3030h
                MOV AH,02H
                INT 21H

                MOV DL,DH
                INT 21H




                MOV AX,4C00H
                INT 21H

MAIN ENDP
END MAIN
.MODEL SMALL

.DATA
        PROMPT_1 DB 'Enter the First digit : $'
        NUM_1  DB ?
        NUM_2  DB ?
        NUM_3  DB ?
        V1     DB ?
        V2     DB  ?
        NL     DB  '  ', 0DH,0AH,'$'
        VALUE_1 DB ?

.CODE
       MAIN PROC
                MOV AX,@DATA
                MOV DX,AX
             

                MOV CX,6
                MOV CH,0

                MOV NUM_1,0
                MOV NUM_2,1

                MOV DL,NUM_1

                OR  DL,30H
                MOV AH,02H
                INT  21H

                MOV DL,NUM_2
                OR DL,30H

                MOV AH,02H
                INT 21H


               L1:

                        MOV AL,NUM_1
                        ADD AL,NUM_2
                        MOV AH,0
                        MOV BL,AL
                        MOV DL,10
                        DIV DL
                        ADD AX,3030H

                        MOV V1,AL
                        MOV V2,AH

                        MOV DL,V1
                        MOV AH,02H
                        INT 21H

                        MOV DL,V2
                        MOV AH,02H
                        INT 21H



                SHIFT:
                        MOV AL,NUM_2
                        MOV NUM_1,AL
                        MOV NUM_2,BL
                        LOOP L1

                MOV AX,4C00H
                INT 21H

        MAIN ENDP
       END MAIN
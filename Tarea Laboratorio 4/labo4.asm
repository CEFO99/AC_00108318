org     100h

section .text
        MOV     BP, arrByte
        XOR     AX,AX
        XOR     SI, SI
        CALL    StoreArrPI

        int     20h

        section .data

arrByte db      80, 91, 22, 45, 21, 10, 35, 66, 53, 72 

StoreArrPI:

while:
        MOV BL, 0d
        MOV CL, 2d
        MOV AL, [BP+SI]
        DIV CL
        CMP AH, BL
        JA nImpar
        JZ nPar

; NUMEROS IMPARES
nImpar: 
        MOV     BX, 320h
        MOV     AL, [BP+SI]
        MOV     [BX+SI], AL
        INC     SI
        JMP     StoreArrPI

; NUMEROS PARES
nPar:
        MOV     BX, 300h 
        MOV     AL, [BP+SI]
        CMP     AL, 10d
        MOV     [BX+SI], AL
        INC     SI
        JE      end
        JMP     StoreArrPI

end:    
        ret
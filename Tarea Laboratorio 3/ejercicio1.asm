org     100h

section .text
        
    XOR AX, AX
    XOR BX, BX
    XOR SI, SI 
    MOV word CX, 8d 
    MOV BX, 8d
    MOV byte [200h], 0d
    MOV byte [201h], 0d
    MOV byte [202h], 1d
    MOV byte [203h], 0d
    MOV byte [204h], 8d
    MOV byte [205h], 3d
    MOV byte [206h], 1d
    MOV byte [207h], 8d
    jmp iteracion

iteracion:
    ADD AL, [200h+SI]
    INC SI
    LOOP iteracion

    DIV BL

    MOV [20Ah], AX

exit: 
    int 20h 

; César Figueroa 00108318
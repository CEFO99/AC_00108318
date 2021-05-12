org     100h

section .text

    XOR AX, AX
    XOR BX, BX
    XOR SI, SI
    MOV AH, 1d
    MOV word CX, 5d
    jmp iteracion
        
iteracion:
    MUL CX         
    LOOP iteracion

    MOV [20Bh], AL 

exit: 
    int 20h

; César Figueroa 00108318
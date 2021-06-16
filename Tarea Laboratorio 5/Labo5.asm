org 100h

    section .text
    MOV SI, 0
    MOV DI, 0d

    MOV DL, 29

    MOV byte[200h], 7
    MOV byte[201h], 9
    MOV byte[202h], 11
    MOV byte[203h], 13

    call modotexto

    iteracion:
    MOV DH, [200h+DI]
    CALL movercursor 
    MOV CL, [caracter+SI] 
    CALL escribircaracter
    XOR CL, CL
    INC DL 
    INC SI

    CMP SI, 6
    JE space

    CMP SI, 13
    JE space

    CMP SI, 22
    JE space

    CMP SI, 30
    JE esperartecla

    jmp iteracion

    exit:
    int 20h

    modotexto: 
    MOV AH, 0h
    MOV AL, 03h
    INT 10h
    RET

    movercursor:
    MOV AH, 02h
    MOV BH, 0h 
    INT 10h
    RET

    escribircaracter:
    MOV AH, 0Ah 
    MOV AL, CL 
    MOV BH, 0h
    MOV CX, 1h 
    INT 10h
    RET

    esperartecla:
    MOV AH, 00h 
    INT 16h
    jmp exit

    space:
    INC DI
    MOV DL, 28
    jmp iteracion

    section .data

    caracter DB 'Cesar Edgardo Figueroa Orellana'
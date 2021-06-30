; Hacer un programa que permita utilizar una clave de acceso
; MAIN
    org 	100h

    section	.text

    MOV 	DX, msg1
    CALL  	EscribirCadena

    MOV 	BP, clave
    CALL  	LeerCadena

    CALL	EsperarTecla

    int 	20h

    section	.data

msg1		db	"Ingresa la clave: ", "$"
msg2 		db 	"BIENVENIDO", "$"				
msg3 	    db 	"INCORRECTO", "$"				
claveCOMP	db 'cefo7', "$"						
clave 	times 	5  	db	" " 					

EscribirCadena:
	MOV 	AH, 09h
	int 	21h
	ret

EsperarTecla:
        MOV     AH, 01h
        int     21h
        ret

LeerCadena:
        XOR     SI, SI
while:  
        CALL    EsperarTecla
        CMP     AL, 0x0D
        JE      compare
        MOV     [BP+SI], AL
        INC     SI
        JMP     while

compare:
	XOR SI, SI
loop:
	MOV AL, [BP+SI]
	CMP AL, [claveCOMP+SI]
	JNE incorrect

	CMP si, 4
	JE correct
	
	INC SI
	JMP loop

correct:
	MOV 	DX, msg2
	CALL 	EscribirCadena
	JMP exit

incorrect:				
	MOV 	DX, msg3
	CALL 	EscribirCadena
	JMP exit

exit:
	MOV 	byte [BP+SI], "$"
	ret
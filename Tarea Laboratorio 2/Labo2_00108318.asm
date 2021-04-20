        org 100h
        section .text

        mov	AL, "C"
	    mov	CL, "E"
	    mov	DH, "F"
        mov DL, "O"

        mov	[200h], AL
	    mov	[201h], CL
	    mov	[202h], DH
        mov [203h], DL

        mov SI, 2h
        mov BX, 200h

    ; Direccionamiento directo o absoluto 
	    mov 	AX, [200h]

    ; Direccionamiento indirecto por registro
    ; Usamos el registro base como puntero para acceder a la memoria
	    mov	CX, [BX]

    ; Direccionamiento indirecto base mas indice 
    ; Usamos el registro base junto con un registro apuntador
	    mov 	DX, [BX+SI]
    
    ; Direccionamiento relativo por registro
	    mov	DI, [BX+3h]

        int 20h
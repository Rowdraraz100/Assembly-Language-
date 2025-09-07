.MODEL SMALL
.STACK 100H
.DATA
    msgA DB 'Enter value of A (0-9): $'
    msgB DB 0DH,0AH,'Enter value of B (0-9): $'
    msgR DB 0DH,0AH,'Result = $'
    result DB ?       ; Store only one byte (single digit result)

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; --- Input A ---
    LEA DX, msgA
    MOV AH, 09H
    INT 21H

    MOV AH, 01H      ; Read char from keyboard
    INT 21H
    SUB AL, 30H      ; Convert ASCII ? number
    MOV BL, AL       ; Store A in BL

    ; --- Input B ---
    LEA DX, msgB
    MOV AH, 09H
    INT 21H

    MOV AH, 01H      ; Read char from keyboard
    INT 21H
    SUB AL, 30H      ; Convert ASCII ? number
    MOV BH, AL       ; Store B in BH

    ; --- Calculate: 5 - 3*A + B ---
    MOV AL, BL       ; AL = A
    MOV CL, 3
    MUL CL           ; AX = AL * CL ? result in AX, low byte in AL
    MOV CL, AL       ; CL = 3*A

    MOV AL, 5        ; AL = 5
    SUB AL, CL       ; AL = 5 - (3*A)
    ADD AL, BH       ; AL = 5 - 3*A + B

    MOV result, AL   ; Save result (one byte)

    ; --- Print Result ---
    LEA DX, msgR
    MOV AH, 09H
    INT 21H

    MOV DL, result   ; Load result
    ADD DL, 30H      ; Convert to ASCII
    MOV AH, 02H
    INT 21H

    ; --- Exit program ---
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN

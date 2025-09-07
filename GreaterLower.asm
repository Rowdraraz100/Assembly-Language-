.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB 'Enter first number: $'
    MSG2 DB 0DH,0AH,'Enter second number: $'
    GREATER DB 0DH,0AH,'First is Greater$'
    LOWER   DB 0DH,0AH,'Second is Greater$'
    NUM1 DB ?
    NUM2 DB ?

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ; Input first number
    LEA DX,MSG1
    MOV AH,09H
    INT 21H
    MOV AH,01H
    INT 21H
    SUB AL,30H
    MOV NUM1,AL

    ; Input second number
    LEA DX,MSG2
    MOV AH,09H
    INT 21H
    MOV AH,01H
    INT 21H
    SUB AL,30H
    MOV NUM2,AL

    ; Compare
    MOV AL,NUM1
    CMP AL,NUM2
    JG FIRST_GREATER
    JL SECOND_GREATER
    ; If equal, treat as second greater
    JMP SECOND_GREATER

FIRST_GREATER:
    LEA DX,GREATER
    MOV AH,09H
    INT 21H
    JMP END

SECOND_GREATER:
    LEA DX,LOWER
    MOV AH,09H
    INT 21H

END:
    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN

.MODEL SMALL
.STACK 100H
.DATA
    MSG DB 'Enter a number: $'
    YES DB 0DH,0AH,'Y$'
    NO  DB 0DH,0AH,'N$'
    NUM DB ?

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ; Input number
    LEA DX,MSG
    MOV AH,09H
    INT 21H
    MOV AH,01H
    INT 21H
    SUB AL,30H
    MOV NUM,AL

    ; Check if 2 or 4
    MOV AL,NUM
    CMP AL,2
    JE IS_Y
    CMP AL,4
    JE IS_Y
    JMP IS_N

IS_Y:
    LEA DX,YES
    MOV AH,09H
    INT 21H
    JMP END

IS_N:
    LEA DX,NO
    MOV AH,09H
    INT 21H

END:
    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN

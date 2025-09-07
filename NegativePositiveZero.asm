.MODEL SMALL
.STACK 100H
.DATA
    MSG DB 'Enter a number (-9 to 9): $'
    POS DB 0DH,0AH,'Positive$'
    NE DB 0DH,0AH,'Negative$'
    ZERO DB 0DH,0AH,'Zero$'
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
    CMP AL,'-'        ; Check if negative
    JE IS_NEG_INPUT

    ; Positive or zero input
    SUB AL,30H        ; ASCII to number
    MOV NUM,AL
    CMP NUM,0
    JE IS_ZERO
    JMP IS_POS

IS_NEG_INPUT:
    ; Negative number input
    MOV AH,01H
    INT 21H
    SUB AL,30H
    MOV NUM,AL
    NEG NUM           ; Make it negative
    JMP IS_NEG

IS_POS:
    LEA DX,POS
    MOV AH,09H
    INT 21H
    JMP END

IS_NEG:
    LEA DX,NE
    MOV AH,09H
    INT 21H
    JMP END

IS_ZERO:
    LEA DX,ZERO
    MOV AH,09H
    INT 21H

END:
    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN

.MODEL SMALL
.STACK 100H
.DATA
    MSG       DB 'Enter a number: $'
    EVEN_MSG  DB 0DH,0AH,'Number is EVEN$'
    ODD_MSG   DB 0DH,0AH,'Number is ODD$'
    NEG_MSG   DB 0DH,0AH,'(Negative input detected)$'
    NUM       DB ?
    SIGN      DB 0     

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    
    LEA DX, MSG
    MOV AH, 09H
    INT 21H

    ; --- Read first char (could be '-' or digit) ---
    MOV AH, 01H
    INT 21H

    CMP AL, '-'       ; Check minus sign
    JNE NOT_NEG
    MOV SIGN, 1       ; Set negative flag

    ; Read actual digit
    MOV AH, 01H
    INT 21H

NOT_NEG:
    SUB AL, 30H       ; Convert ASCII -> number
    MOV NUM, AL

    ; --- Check EVEN/ODD ---
    MOV AL, NUM
    AND AL, 1
    CMP AL, 0
    JE EVEN
    JMP ODD

EVEN:
    LEA DX, EVEN_MSG
    MOV AH, 09H
    INT 21H
    JMP SHOW_NEG

ODD:
    LEA DX, ODD_MSG
    MOV AH, 09H
    INT 21H

SHOW_NEG:
    CMP SIGN, 1
    JNE EXIT
    LEA DX, NEG_MSG
    MOV AH, 09H
    INT 21H

EXIT:
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN

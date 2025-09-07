.MODEL SMALL
.STACK 100H
.DATA
    MSG DB 'Enter a character: $'
    UPPER DB 0DH,0AH,'Uppercase$'
    LOWER DB 0DH,0AH,'Lowercase$'
    OTHER DB 0DH,0AH,'Not a letter$'
    CH DB ?

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ; Input character
    LEA DX,MSG
    MOV AH,09H
    INT 21H
    MOV AH,01H
    INT 21H
    MOV CH,AL

    ; Check uppercase A-Z
    MOV AL,CH
    CMP AL,'A'
    JB NOT_LETTER
    CMP AL,'Z'
    JA CHECK_LOWER
    LEA DX,UPPER
    MOV AH,09H
    INT 21H
    JMP END

CHECK_LOWER:
    CMP AL,'a'
    JB NOT_LETTER
    CMP AL,'z'
    JA NOT_LETTER
    LEA DX,LOWER
    MOV AH,09H
    INT 21H
    JMP END

NOT_LETTER:
    LEA DX,OTHER
    MOV AH,09H
    INT 21H

END:
    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN

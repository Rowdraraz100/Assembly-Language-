.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB 'Enter first number: $'
    MSG2 DB 0DH,0AH,'Enter second number: $'
    MSG3 DB 0DH,0AH,'Enter third number: $'
    MSGS DB 0DH,0AH,'Smallest number is: $'

    NUM1 DB ?
    NUM2 DB ?
    NUM3 DB ?
    MIN  DB ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; -------- Input First Number --------
    LEA DX, MSG1
    MOV AH, 09H
    INT 21H

    MOV AH, 01H
    INT 21H
    SUB AL, '0'       ; Convert ASCII -> number
    MOV NUM1, AL

    ; -------- Input Second Number --------
    LEA DX, MSG2
    MOV AH, 09H
    INT 21H

    MOV AH, 01H
    INT 21H
    SUB AL, '0'
    MOV NUM2, AL

    ; -------- Input Third Number --------
    LEA DX, MSG3
    MOV AH, 09H
    INT 21H

    MOV AH, 01H
    INT 21H
    SUB AL, '0'
    MOV NUM3, AL

    ; -------- Find Smallest --------
    MOV AL, NUM1       ; Assume NUM1 is smallest
    MOV BL, NUM2
    CMP BL, AL
    JAE SKIP1
    MOV AL, BL
SKIP1:
    MOV BL, NUM3
    CMP BL, AL
    JAE SKIP2
    MOV AL, BL
SKIP2:
    MOV MIN, AL        ; Store smallest number

    ; -------- Print Result --------
    LEA DX, MSGS
    MOV AH, 09H
    INT 21H

    MOV DL, MIN
    ADD DL, '0'        ; Convert number -> ASCII
    MOV AH, 02H
    INT 21H

    ; Exit program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN

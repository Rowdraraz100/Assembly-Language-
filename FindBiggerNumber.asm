.MODEL SMALL
.STACK 100H
.DATA
    msg1 DB 'Enter first number: $'
    msg2 DB 0DH,0AH,'Enter second number: $'
    msg3 DB 0DH,0AH,'Enter third number: $'
    msgR DB 0DH,0AH,'Biggest number = $'
    A DB ?
    B DB ?
    C DB ?
    MAX DB ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; --- Input A ---
    LEA DX, msg1
    MOV AH, 09H
    INT 21H

    MOV AH, 01H
    INT 21H
    SUB AL, 30H   ; ASCII ? number
    MOV A, AL

    ; --- Input B ---
    LEA DX, msg2
    MOV AH, 09H
    INT 21H

    MOV AH, 01H
    INT 21H
    SUB AL, 30H
    MOV B, AL

    ; --- Input C ---
    LEA DX, msg3
    MOV AH, 09H
    INT 21H

    MOV AH, 01H
    INT 21H
    SUB AL, 30H
    MOV C, AL

    ; --- Find Biggest ---
    MOV AL, A      ; Assume A is max
    MOV MAX, AL

    MOV AL, B
    CMP AL, MAX
    JLE SKIP1
    MOV MAX, AL
SKIP1:

    MOV AL, C
    CMP AL, MAX
    JLE SKIP2
    MOV MAX, AL
SKIP2:

    ; --- Print Result ---
    LEA DX, msgR
    MOV AH, 09H
    INT 21H

    MOV DL, MAX
    ADD DL, 30H   ; Number ? ASCII
    MOV AH, 02H
    INT 21H

    ; --- Exit ---
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN

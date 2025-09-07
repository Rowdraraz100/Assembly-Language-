.model small
.stack 100h  
.code

main PROC
    mov ah,1           ;input
    int 21h
    mov bl,al
    
    mov ah,1
    int 21h
    mov bh,al
    
    
    mov ah,2       ;output
    mov dl,bl
    int 21h
    
    mov ah,2
    mov dl,bh
    int 21h
    
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main
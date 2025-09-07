.model small
.stack 100h

.data
msg1 db 'Do something bold$'
msg2 db 'Do something unique$'
newline db 0dh,0ah,'$'

.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg1
    int 21h
    
    mov ah,9
    lea dx,newline
    int 21h
    
    mov ah,9
    lea dx,msg2
    int 21h
    
exit:           
mov ah,4ch
int 21h
main endp
end main

.model small
.stack 100h
.data
.code
main proc
    mov dl,90
    mov ah,2
    int 21h
    mov dl,65
    mov ah,2
    int 21h
    mov dl,73
    mov ah,2
    int 21h
    mov dl,78
    mov ah,2
    int 21h
    mov dl,65
    mov ah,2
    int 21h 
    mov dl,66
    mov ah,2
    int 21h
    
    main endp
end main
ret
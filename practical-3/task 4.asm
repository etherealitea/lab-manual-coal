.model small
.stack 100
.data
    string db 'Zainab Ehsan$'
.code
Main Proc
    mov ax, @data
    mov ds, ax
    
    lea dx, string
    mov ah, 9
    int 21h
    Main endp
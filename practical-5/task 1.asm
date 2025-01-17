.model small
.stack 100h
.data
    prompt db 'enter a character: ', '$'
    message db 10,13,'you entered: ', '$' 
    input db ?
.code 
main proc
    mov ax, @data
    mov ds, ax
    
    lea dx, prompt
    mov ah, 9
    int 21h
    
    mov ah, 1
    int 21h
    mov input, al
    
    lea dx, message
    mov ah, 9
    int 21h
    
    mov dl, input
    mov ah, 2
    int 21h
    
    mov ah, 4ch
    int 21h
    
    end main
        
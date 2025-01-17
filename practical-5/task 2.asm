.model small
.stack 100h
.data  
prompt db 'enter a uppercase alphabet:', '$'
message db 10, 13, 'result in lowercase: $'
input db ?
.code
main proc 
    mov ax, @data
    mov ds, ax
      
    ; display prompt
    lea dx, prompt
    mov ah, 09h
    int 21h
    
    ; take input and store in variable input
    mov ah, 01h          
    int 21h
    mov input,al 
    
    ; display the after conversion message
    lea dx, message
    mov ah,9
    int 21h

    add al, 20h                  
    mov dl, input 
    
    ; convert to lowercase by adding 32
    add dl,32          
    mov ah, 02h          
    int 21h 
     
    mov ah, 4Ch          
    int 21h
main endp
end main

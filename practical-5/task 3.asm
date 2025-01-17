.model small
.stack 100h
.data  
prompt db 'enter a lowercase character: ', '$'
message db 10, 13, 'converted to uppercase: $'
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

                  
    mov dl, input 
    
    ; convert to uppercase by subtracting 32
    sub dl,32          
    mov ah, 02h          
    int 21h 
     
    mov ah, 4Ch          
    int 21h
main endp
end main

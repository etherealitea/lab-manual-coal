.model small
.stack 100h
.data
var1 db 50    ;string 1 declaration, value is 2 
var2 db 55    ;string 2 declaration, value is 7
message db 'copied integer: $'
.code
Main Proc
    mov ax, @data
    mov ds, ax
    
    ; swapping variables
    mov al, var1
    mov var2, al
    
    ; printing message 
    lea dx, message
    mov ah, 9
    int 21h
    
    ; printing variable 2 but with value of variable 1 copied in it 
    mov dl, var2
    mov ah, 2
    int 21h
    
Main endp 
End Main
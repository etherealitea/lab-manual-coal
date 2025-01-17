.model small 
.stack 100h 
.data
prompt1 db 'enter first number: $'   ;declaration of prompt string to enter first number
prompt2 db 10, 13, 'enter second number: $'   ;declaration of prompt string to enter second number
var1 db ?    ;variable 1 declaration of value 2
var2 db  ?   ;variable 2 declaration of value 5 
result db 10, 13, 'multiplication result: $' ;string to display result 
product db ?   ;variable to store result
.code 
Main Proc 
    mov ax,@data
    mov ds,ax  
    
    ; input first variable 
    lea dx, prompt1 
    mov ah, 9
    int 21h
    mov ah, 1
    int 21h
    sub al, 48
    mov var1, al
    
    ; input second variable  
    lea dx, prompt2 
    mov ah, 9
    int 21h
    mov ah, 1
    int 21h
    sub al, 48
     mov var2, al
    
    ; printing string to display result 
    lea dx, result
    mov ah, 9
    int 21h
    
    ; multiplying 
    mov al,var1
    mul var2

    ; store al in product
    mov product, al

    ; display result
    mov dl, product
    add dl, 48
    mov ah, 2
    int 21h

    ; Terminate program
    mov ah, 4Ch
    int 21h
    
Main endp 
End Main
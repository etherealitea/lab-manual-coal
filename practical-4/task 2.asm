.model small 
.stack 100h 
.data
var1 db 'i like roses$'         ;string 1 declaration
var2 db 10, 13, '& tulips $'    ;string 2 declaration
.code 
Main Proc 
    mov ax,@data
    mov ds,ax  
    
    lea dx, var1 
    mov ah, 9
    int 21h 
    
    lea dx, var2
    mov ah, 9
    int 21h
      
    ; terminating program
    mov ah, 4Ch
    int 21h
   
Main endp 
End Main 
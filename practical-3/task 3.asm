.model small 
.stack 100h 
.data  
    string1 db 'i love...$'
    string2 db 10,13,'cats and tulips$'
.code 
Main Proc 
    mov ax, @data
    mov ds, ax 
    
    lea dx, string1
    mov ah,9
    int 21h
      
    lea dx, string2
    mov ah,9
    int 21h
    Main endp 

End Main 
ret
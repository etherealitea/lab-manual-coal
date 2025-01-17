.model small 
.stack 100h 
.data  
s1 db '* * * * * * *$'
s2 db 10,13,'* * * * * * $'
s3 db 10,13,'* * * * *  $'  
s4 db 10,13,'* * * *  $'
s5 db 10,13,'* * *  $'  
s6 db 10,13,'* *  $'
s7 db 10,13,'* $'
.code 
Main Proc 
    mov ax, @data
    mov ds, ax
    lea dx, s1
    mov ah,9
    int 21h
     
    lea dx, s2
    mov ah,9
    int 21h 
     
    lea dx, s3
    mov ah,9
    int 21h 
    lea dx, s4
    mov ah,9
    int 21h 
    
    lea dx, s5
    mov ah,9
    int 21h
     
    lea dx, s6
    mov ah,9
    int 21h 
     
    lea dx, s7
    mov ah,9
    int 21h
Main endp 
End Main 
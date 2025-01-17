.model small
.stack 100h
.data   
prompt1 db 'enter first number: $'
prompt2 db 10, 13,'enter second number: $'
input1 db ? 
input2 db ?
result_msg db 10, 13, 'result: $'  
result db ?
.code 
 main proc
    mov ax, @data
    mov ds, ax
      
    ; display prompt
    lea dx, prompt1
    mov ah, 09h
    int 21h
    
    ; input first variable 
    mov ah, 1
    int 21h
     sub al,30h 
    mov input1, al
    
    ; display prompt
    lea dx, prompt2
    mov ah, 09h
    int 21h
 
    ; input second variable 
    mov ah, 1
    int 21h
    sub al,30h 
    mov input2, al
    
    ; display the after conversion message
    lea dx, result_msg
    mov ah,9
    int 21h
    
    
    mov al,input1 
    sub al,input2 
    mov dl, al 
    mov result, dl
    add dl,48
    mov ah,2
    int 21h    
 main endp           
 end main
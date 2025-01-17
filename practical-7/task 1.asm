.model small
.stack 100h
.data
    prompt1 db 'enter first value:$'
    prompt2 db 10, 13,'enter second value:$'
    prompt3 db 10, 13,'enter third value:$'
    prompt4 db 10, 13,'enter fourth value:$'
    prompt5 db 10, 13,'enter fifth value:$'
    
    message db 10,13,10, 13,'printing values$'
    result1 db 10, 13,'first value: $'
    result2 db 10, 13,'second value: $'
    result3 db 10, 13,'third value: $'
    result4 db 10, 13,'fourth value: $'
    result5 db 10, 13,'fifth value: $'
    value1 db ?
    value2 db ?
    value3 db ?
    value4 db ?
    value5 db ?

.code
main proc
    mov ax, @data
    mov ds, ax

    lea dx, prompt1
    mov ah, 9
    int 21h 
    ;input 1
    mov ah, 1
    int 21h
    mov value1, al

    lea dx, prompt2
    mov ah, 9
    int 21h 
    ;input 2
    mov ah, 1
    int 21h
    mov value2, al
    
    lea dx, prompt3
    mov ah, 9
    int 21h 
    ;input 3
    mov ah, 1
    int 21h
    mov value3, al
    
    lea dx, prompt4
    mov ah, 9
    int 21h 
    ;input 4
    mov ah, 1
    int 21h
    mov value4, al
    
    lea dx, prompt5
    mov ah, 9
    int 21h 
    ;input 5
    mov ah, 1
    int 21h
    mov value5, al
    
    ;printing values
    lea dx, message
    mov ah, 9
    int 21h
    
    ;display result 1
    lea dx, result1
    mov ah, 9
    int 21h
    mov dl, value1
    mov ah, 2
    int 21h
    
    ;display result 2
    lea dx, result2
    mov ah, 9
    int 21h
    mov dl, value2
    mov ah, 2
    int 21h
    
    ;display result 3
    lea dx, result3
    mov ah, 9
    int 21h
    mov dl, value3
    mov ah, 2
    int 21h
    
    ;display result 4
    lea dx, result4
    mov ah, 9
    int 21h
    mov dl, value4
    mov ah, 2
    int 21h
    
    ;display result 5
    lea dx, result5
    mov ah, 9
    int 21h
    mov dl, value5
    mov ah, 2
    int 21h

    mov ah, 4Ch
    int 21h
main endp
end main

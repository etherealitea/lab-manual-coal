.model small
.stack 100h
.data
prompt db 'Enter a number: $'
even_message db 10,13,'The number is even.$'
odd_message db 10,13,'The number is odd.$'
newline db 10,13, '$'

.code
main:
    mov ax, @data
    mov ds, ax

    lea dx, prompt
    mov ah, 09h
    int 21h
    
    ; Get user input and convert
    mov ah, 01h
    int 21h
    sub al, 30h     ; Convert ASCII to integer
    mov bl, al

    ; Check if even or odd
    and bl, 1       ; perform bitwise op as even have lsb 0 while odd have 
    jz even         ; If zero, the number is even

odd:
    lea dx, odd_message
    mov ah, 09h
    int 21h
    jmp done

even:
    lea dx, even_message
    mov ah, 09h
    int 21h

done:
    lea dx, newline
    mov ah, 09h
    int 21h
    mov ah, 4Ch
    int 21h
end main
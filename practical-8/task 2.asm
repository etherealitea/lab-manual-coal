.model small
.stack 100h
.data
   var1 db ?
   msg db "Enter number: $"
   msg1 db 10,13,"Number is divisible by 2.$"
   msg2 db 10,13,"Number is divisible by 3.$"
   msg3 db 10,13,"Number is not divisible by 2 or 3.$"
   newline db 13, 10, '$'
.code

main proc
    mov ax, @data
    mov ds, ax

    lea dx, msg
    mov ah, 9
    int 21h

    mov ah, 1
    int 21h
    sub al, '0'
    mov var1, al

    mov al, var1
    mov ah, 0
    mov bl, 2
    div bl
    cmp ah, 0
    je divby2

    mov al, var1
    mov ah, 0
    mov bl, 3
    div bl
    cmp ah, 0
    je divby3

notdiv:
    lea dx, msg3
    mov ah, 9
    int 21h
    jmp done

divby2:
    lea dx, msg1
    mov ah, 9
    int 21h
    jmp done

divby3:
    lea dx, msg2
    mov ah, 9
    int 21h

done:
    lea dx, newline
    mov ah, 9
    int 21h

    mov ah, 4Ch
    int 21h

main endp
end main

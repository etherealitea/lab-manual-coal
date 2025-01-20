.model small
.stack 100h
.data
    newline db 10, 13, '$'
    star db '*'
.code

main proc
    mov ax, @data
    mov ds, ax

    mov cx, 1

row_loop:
    mov bx, cx
    mov ah, 02h

char_loop:
    mov dl, star
    int 21h

    dec bx
    jnz char_loop

    mov ah, 09h
    lea dx, newline
    int 21h

    inc cx
    cmp cx, 5
    jle row_loop

    mov ah, 4Ch
    int 21h
main endp
end main

.model small
.stack 100h
.data
    newline db 0Ah, 0Dh, '$'
.code

main proc
    mov ax, @data
    mov ds, ax

    mov cx, 1

outer_loop:
    mov bx, cx
    mov dx, cx
    mov si, cx

inner_loop:
    mov ah, 02h
    add dl, '0'
    int 21h
    sub dl, '0'

    dec si
    jnz inner_loop

    mov ah, 09h
    lea dx, newline
    int 21h

    inc cx
    cmp cx, 6
    jl outer_loop

    mov ah, 4Ch
    int 21h
main endp
end main

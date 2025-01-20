.model small
.stack 100h
.data
    msg db 'Enter a sentence: $'       ; Input prompt
    result db 0Ah, 0Dh, 'Uppercase letters: $'
    input db 100 dup('$')              ; User input buffer
    count db 0                         ; Uppercase letter count

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Display input message
    mov ah, 09h
    lea dx, msg
    int 21h

    ; Read input
    mov ah, 0Ah
    lea dx, input
    int 21h

    ; Initialize
    mov si, offset input + 2   ; Start at first character
    mov cx, 0                  ; Counter for uppercase letters

check_loop:
    mov al, [si]               ; Get character
    cmp al, 0Dh                ; Check for Enter key
    je display_result          ; If Enter key, go to result

    cmp al, 'A'                
    jb next_char               ; If below 'A', skip
    cmp al, 'Z'
    ja next_char               ; If above 'Z', skip

    inc cx                     ; Count uppercase letter

next_char:
    inc si                     ; Move to next character
    jmp check_loop

display_result:
    ; Display result message
    mov ah, 09h
    lea dx, result
    int 21h

    ; Convert count to ASCII and display
    mov ax, cx
    call print_number

    ; Exit program
    mov ah, 4Ch
    int 21h
main endp

print_number proc
    mov bx, 10                ; Base 10 for division
    mov cx, 0                 ; Digit count

convert_loop:
    mov dx, 0
    div bx                    ; Divide AX by 10
    push dx                   ; Store remainder
    inc cx
    cmp ax, 0
    jne convert_loop

print_loop:
    pop dx
    add dl, '0'               ; Convert digit to ASCII
    mov ah, 02h               ; Print character
    int 21h
    loop print_loop

    ret
print_number endp
end main

.model small
.stack 100h
.data  
prompt db 'Enter a string: $'
display db 10, 13, 'Number of vowels: $'
strings db 50 dup('$')  ; Reserve space for input (max 50 characters)

.code

main proc
    mov ax, @data
    mov ds, ax  
    
    ; Display the prompt
    lea dx, prompt
    mov ah, 09h
    int 21h

    ; Read the string input
    lea dx, strings
    mov ah, 0Ah          ; Input string function
    int 21h
    
    ; Initialize pointers and counters
    mov si, offset strings + 2 ; Start of the string input (skip length and newline)
    xor cx, cx          ; Initialize vowel counter to 0  , make cx register 0
                                                         
L1: 
    mov al, [si]        ; Load character to AL
    cmp al, 0Dh         ; Check for carriage return (end of input)
    je print_count      ; If found, jump to print the count

    ; Check for vowels (both uppercase and lowercase)
    cmp al, 'a'
    je Counter  
    cmp al, 'A'
    je Counter
    cmp al, 'e'
    je Counter 
    cmp al, 'E'
    je Counter
    cmp al, 'i'
    je Counter
    cmp al, 'I'
    je Counter  
    cmp al, 'o'
    je Counter    
    cmp al, 'O'
    je Counter            
    cmp al, 'u'
    je Counter
    cmp al, 'U'
    je Counter

    ; Move to the next character
    jmp next_char  

Counter:
    inc cx              ; Increment vowel counter

next_char:
    inc si              ; Move to the next character in the string
    jmp L1

print_count:
    ; Display the message
    lea dx, display
    mov ah, 09h
    int 21h

    ; Print the vowel count
    mov ax, cx          ; Move the count to AX
    add al, '0'         ; Convert the count to ASCII
    mov dl, al          ; Move it to DL for printing
    mov ah, 02h         ; Print character function
    int 21h

    ; Exit program
    mov ah, 4Ch 
    int 21h

main endp  
end main
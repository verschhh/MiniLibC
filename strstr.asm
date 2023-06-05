section .text
global strstr

strstr:
    xor rdx, rdx ; clear rdx
    jmp .loop

.inc:
    inc rdx

.loop:
    cmp rdx, 0 ; check if we have reached the end of the string
    je .null ; if so, jump to the end
    mov r8, rdx ; save rdx into r8
    xor rcx, rcx ; clear rcx
    jmp .loop2

.inc2:
    inc rcx

.loop2:
    mov r9b , byte [rdi + rcx] ; save the current character into r9
    cmp byte [rsi], r9b ; compare the two strings
    jne .inc2 ; if they are not equal, increment rcx and try again
    inc rsi ; increment rsi
    cmp byte [rsi], 0 ; check if we have reached the end of the string
    jne .loop2 ; if not, try again

.end:
    mov rax, rdx ; return the index of the first occurence of the string
    ret

.null:
    xor rax, rax ; return 0 if the string is not found
    ret
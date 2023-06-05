section .text
global strrchr

strrchr:
    xor rax, rax ; set rax to 0
    xor rcx, rcx ; set rcx to 0
    jmp .loop

.inc:
    inc rcx ; increment counter

.loop:
    movsx edx, byte [rdi + rcx] ; move the character at rdi + rcx to edx
    cmp edx, 0 ; if the character is 0, we've reached the end of the string
    je .end ; so jump to .end
    cmp edx, esi ; if the character is the one we're looking for
    jne .inc ; jump to .next
    mov rax, rdi ; otherwise, move rdi to rax
    add rax, rcx ; and add the counter to it
    jmp .inc

.end:
    ret ; and return

.null:
    xor rax, rax ; otherwise, set rax to 0
    ret ; and return
section .text
global strchr

strchr:
    xor rcx, rcx ; set counter to 0
    jmp .loop

.inc:
    inc rcx ; increment the counter

.loop:
    movsx edx, byte [rdi + rcx] ; move the current character to edx
    cmp edx, 0 ; check if we reached the end of the string
    je .null ; and jump to .null
    cmp edx, esi ; check if the current character is the one we're looking for
    jne .inc ; if not, jump to .inc
    jmp .end ; and jump to .end

.null:
    cmp byte [rdi + rcx], sil ; check if the current character is the one we're looking for
    je .end ; if so, jump to .end
    xor rax, rax ; set the function return to 0
    ret

.end:
    mov rax, rdi ; set the function return
    add rax, rcx ; add the counter to the pointer
    ret ; and return
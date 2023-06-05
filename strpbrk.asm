section .text
global strpbrk

strpbrk:
    xor rbx, rbx
    jmp .loop

.inc:
    inc rbx ; increment rcx

.loop:
    mov al, byte [rdi + rbx] ; load rdi[rcx] into al
    cmp al, 0 ; check if al is 0
    je .null ; if it is, jump to .null
    xor rcx, rcx ; otherwise, set rcx to 0
    jmp .loop2

.inc2:
    inc rcx ; increment rcx

.loop2:
    mov dl, byte [rsi + rcx] ; load rsi[rcx] into dl
    cmp dl, 0 ; check if dl is 0
    je .inc ; if it is, jump to .end
    cmp al, dl ; check if al is equal to dl
    je .end ; if it is, jump to .end
    jmp .inc2 ; otherwise, jump to .inc2

.null:
    xor rax, rax
    ret

.end:
    mov rax, rdi
    add rax, rbx
    ret
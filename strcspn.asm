section .text
global strcspn

strcspn:
    xor rbx, rbx
    jmp .loop

.inc:
    inc rbx

.loop:
    mov al, [rdi + rbx]
    cmp al, 0
    je .null
    xor rcx, rcx
    jmp .loop2

.inc2:
    inc rcx

.loop2:
    mov dl, [rsi + rcx]
    cmp dl, 0
    je .inc
    cmp al, dl
    je .end
    jmp .inc2

.null:
    xor rcx, rcx
    mov rax, rcx
    ret

.end:
    mov rax, rbx
    ret
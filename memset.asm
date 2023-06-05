section .text
    global memset

memset:
    xor rcx, rcx ; set counter to 0
    jmp .loop

.loop:
    cmp rcx, rdx ; compare counter to size
    je .done ; if equal, we're done
    mov BYTE [rdi + rcx], sil ; set byte at base address + counter to value
    jmp .increment

.increment:
    inc rcx ; increment counter
    jmp .loop

.done:
    add rax, rdi ; add base address to return value
    ret ; return

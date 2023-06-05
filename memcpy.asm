section .text
    global memcpy

memcpy:
    xor rcx, rcx ; set counter to 0
    jmp .loop

.inc
    inc rcx ; increment counter
.loop:
    cmp rcx, rdx ; compare counter to size
    je .done ; if equal, we're done
    mov al, BYTE [rsi + rcx] ; get byte from source
    mov BYTE [rdi + rcx], al ; write byte to destination
    jmp .inc ; increment counter and loop

.done:
    mov rax, rdi ; return destination
    ret ; return

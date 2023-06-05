section .text
    global memmove

memmove:
    xor rcx, rcx ; set counter to 0
    jmp .loop

.increment:
    inc rcx ; increment counter
    jmp .loop

.loop:
    cmp rcx, rdx ; compare counter to size
    je .done ; if equal, we're done
    mov al, BYTE [rsi + rcx] ; get byte from source
    mov BYTE [rdi + rcx], al ; write byte to destination
    jmp .increment

.done:
    mov rax, rdi ; return destination
    ret ; return

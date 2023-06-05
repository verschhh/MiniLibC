section .text
global strncmp

strncmp:
    xor rcx, rcx ; set counter to 0
    xor eax, eax ; set return value to 0
    jmp .loop

.increment:
    cmp bl, 0 ; check if end of string
    je .done ; if 1, we're done
    cmp rcx, rdx ; check if we've reached the max length
    je .done ; if 1, we're done
    inc rcx ; increment counter

.loop:
    mov bl, BYTE [rdi + rcx] ; load char into 8 bits sub register bl
    mov cl, BYTE [rsi + rcx] ; load char into 8 bits sub register cl
    cmp bl, cl ; compare those byte
    je .increment ; if equal, increment counter and loop

.diff:
    movsx eax, bl ; move bl into eax    movsx is used to move a small register into a larger register (8 bites to 32 bites)
    movsx ecx, cl ; move cl into ecx    movsx is used to move a small register into a larger register (8 bites to 32 bites)
    sub eax, ecx; sub ecx from eax

.done:
    ret ; return

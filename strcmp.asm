section .text
global strcmp

strcmp:
    xor rcx, rcx ; set counter to 0
    xor eax, eax ; set return value to 0
    jmp .loop

.increment:
    cmp dl, 0 ; check if end of string
    je .done ; if 1, we're done
    inc rcx ; increment counter

.loop:
    mov dl, BYTE [rdi + rcx] ; load char into 8 bits sub register dl
    mov cl, BYTE [rsi + rcx] ; load char into 8 bits sub register cl
    cmp dl, cl ; compare those byte
    je .increment ; if not equal, increment counter and loop

.diff:
    movsx eax, dl ; move dl into eax    movsx is used to move a small register into a larger register (8 bites to 32 bites)
    movsx ecx, cl ; move cl into ecx    movsx is used to move a small register into a larger register (8 bites to 32 bites)
    sub eax, ecx; sub ecx from eax

.done:
    ret ; return

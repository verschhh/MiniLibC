section .text
global strcasecmp

strcasecmp:
    xor rcx, rcx ; set counter to 0
    xor eax, eax ; set return value to 0
    jmp .loop

.increment:
    cmp bl, 0 ; check if end of string
    je .done ; if 1, we're done
    inc rcx ; increment counter

.loop:
    mov bl, BYTE [rdi + rcx] ; load char into 8 bits sub register bl
    mov dl, BYTE [rsi + rcx] ; load char into 8 bits sub register dl
    cmp bl, 'A' ; check if char < A
    jl .lowercase ; if < A, go to .lowercase
    cmp bl, 'Z' ; check if char > Z
    jg .lowercase ; if > Z , go to .lowercase
    add bl, 32 ; if not, add 32 to bl

.lowercase:
    cmp dl, 'A' ; check if char < A
    jl .lowercase2 ; if < A, go to .lowercase2
    cmp dl, 'Z' ; check if char > Z
    jg .lowercase2 ; if > Z , go to .lowercase2
    add dl, 32 ; if not, add 32 to dl

.lowercase2:
    cmp bl, dl ; compare those byte
    je .increment ; if not equal, increment counter and loop

.diff:
    movsx eax, bl ; move bl into eax    movsx is used to move a small register into a larger register (8 bites to 32 bites)
    movsx ecx, dl ; move dl into ecx    movsx is used to move a small register into a larger register (8 bites to 32 bites)
    sub eax, ecx; sub ecx from eax

.done:
    ret ; return

section .text
global strlen

strlen: ;function to print lenght of a string
    xor rax, rax ; zero out rax

_loop: ; start the loop
    cmp byte [rdi + rax], 0 ; check if al is 0
    je _done ; if al is 0, return rax (the length of the string)
    inc rax ; increment rax
    jmp _loop ; jump back to the beginning of the loop

_done: ; end of the loop
    ret ; return rax (the length of the string)
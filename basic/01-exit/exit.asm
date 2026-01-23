; Closes the program cleanly using a System Call

section .text
    global _start

_start:
    mov rax, 60
    mov rdi, 0
    syscall

; Prints "Hello World!" in the standard output

section .data
    message: db "Hello World!", 0xa

section .text
    global _start

_start: 
    mov rax, 1
    mov rdi, 1 ; File descriptor. 1 for standard output
    mov rsi, message ; Address of the buffer
    mov rdx, 13 ; Length of the buffer
    syscall

    mov rax, 60
    mov rdi, 0
    syscall

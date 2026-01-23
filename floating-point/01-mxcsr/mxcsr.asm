; Messing around with MXCSR register

extern printf ; C function, you already know what it does
extern exit ; C function, ends process immediately 

section .data
    x: dd 0.5
    y: dd 2.0
    format: db '%f', 10, 0

section .text
    global _start

_start:
    movss xmm0, [x] ; xmm0[31...0] = x
    movss xmm1, [y] ; xmm1[31...0] = x
    divss xmm0, xmm1 ; xmm0 = xmm0 / xmm1

    cvtss2sd xmm0, xmm0 ; xmm0[63...0] = (double)xmm0[31...0]

    mov edi, format
    mov rax, 1 ; telling printf that there is 1 floating-point parameter
    call printf ; printf("%f\n", xmm0[63...0])

    mov edi, 0
    call exit ; exit(0)

; Fabian Nino
; CPSC 240
; Assignment 1
; 2021-08-22
; falenire@csu.fullerton.edu

; Greeting program using assembly

extern printf
extern scanf
extern fgets
extern stdin
extern strlen
global hello

segment .data

align 16

hello.initial_prompt db "Please enter your first and last names: ", 0
hello.title_promt db "Please enter your title (Ms, Mr, Engineer, Programmer, Mathematician, Genius, etc): ", 0
hello.greeting db "Hello %s %s. How has your day been so far? ", 0
hello.good_day db "%s is really nice.", 10, 0
hello.final_message db "This concludes the demonstration of the Hello program written in x86 assembly.", 10, 0

stringformat db "%s", 0

align 64

segment .bss

hello.name resb 32
hello.title resb 32
hello.day resb 32


segment .text

hello:

    push rbp
    mov rbp, rsp
    push rbx
    push rcx
    push rdx
    push rdi
    push rsi
    push r8
    push r9
    push r10
    push r11
    push r12
    push r13
    push r14
    push r15
    pushf

    ; mov        rbp, rsp

    ; Ask for user's name
    mov qword   rax, 0
    mov         rdi, stringformat
    mov         rsi, .initial_prompt
    call        printf

    ; Store user's name from input
    mov qword   rax, 0
    mov         rdi, hello.name
    mov         rsi, 32
    mov         rdx, [stdin]
    call        fgets

    ; get name's length
    mov qword   rax, 0
    mov         rdi, hello.name
    call        strlen
    mov         r13, rax

    ; change return character given by the user for null character
    mov qword   [hello.name + r13 - 1], 0

    ; Ask for user's title
    mov qword   rax, 0
    mov         rdi, stringformat
    mov         rsi, .title_promt
    call        printf

    ; Store user's title from input
    mov qword   rax, 0
    mov         rdi, hello.title
    mov         rsi, 32
    mov         rdx, [stdin]
    call        fgets

    ; get title's length
    mov qword   rax, 0
    mov         rdi, hello.title
    call        strlen
    mov         r13, rax

    ; change return character given by the user for null character
    mov qword   [hello.title + r13 - 1], 0

    ; Print greeting to user
    mov         rax, 0
    mov         rdi, .greeting
    mov         rsi, .name
    mov         r8, .title
    call        printf

    ; Store user's day info from input
    mov         rax, 0
    mov         rdi, hello.day
    mov         rsi, 32
    mov         rdx, [stdin]
    call        fgets

    ; get users's day length
    mov qword   rax, 0
    mov         rdi, hello.day
    call        strlen
    mov         r13, rax

    ; change return character given by the user for null character
    mov qword   [hello.day + r13 - 1], 0

    ; Print user's day info
    mov         rax, 0
    mov         rdi, .good_day
    mov         rsi, .day
    call        printf

    ; Give the user our farewell
    mov         rax, 0
    mov         rdi, stringformat
    mov         rsi, .final_message
    call        printf

    ; Return user's name to main program
    mov         rax, hello.name
    push        rax
    movsd       xmm0, [rsp]
    pop         rax

popf
pop r15
pop r14
pop r13
pop r12
pop r11
pop r10
pop r9
pop r8
pop rsi
pop rdi
pop rdx
pop rcx
pop rbx
pop rbp

ret

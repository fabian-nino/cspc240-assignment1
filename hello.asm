; Fabian Nino
; CPSC 140
; Assignment 1
; 2021-08-22
; falenire@csu.fullerton.edu

; Greeting program using assembly

extern printf
extern scanf
extern fgets
extern stdin
global hello

segment .data

align 16

hello.initial_prompt db "Please enter your first and last names: ", 0
hello.title_promt db "Please enter your title (Ms, Mr, Engineer, Programmer, Mathematician, Genius, etc): ", 0
hello.greeting db "Hello ", 0
hello.day_prompt db ". How has your day been so far? ", 0
hello.good_day db " is really nice.", 10, 0
hello.final_message db "This concludes the demonstration of the Hello program written in x86 assembly.", 10, 0

stringformat db "%s", 0

align 64

segment .bss

hello.name resb 32
hello.title resb 32
hello.day resb 32


segment .text

hello:

    push       rbp
    mov        rbp, rsp

    ; Ask for user's name
    mov qword   rax, 0
    mov         rdi, stringformat
    mov         rsi, .initial_prompt
    call        printf

    ; Store user's name from input
    mov qword rax, 0
    mov       rdi, hello.name
    mov       rsi, 32
    mov       rdx, [stdin]
    call      fgets

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

    ; Print greeting to user
    mov         rax, 0
    mov         rdi, stringformat
    mov         rsi, .greeting
    call        printf

    ; Print user's name
    mov         rax, 0
    mov         rdi, stringformat
    mov         rsi, .name
    call        printf

    ; Print user's title
    mov         rax, 0
    mov         rdi, stringformat
    mov         rsi, .title
    call        printf

    ; Ask user for his day
    mov         rax, 0
    mov         rdi, stringformat
    mov         rsi, .day_prompt
    call        printf

    ; Store user's day info from input
    mov         rax, 0
    mov         rdi, hello.day
    mov         rsi, 32
    mov         rdx, [stdin]
    call        fgets

    ; Print user's day info
    mov         rax, 0
    mov         rdi, stringformat
    mov         rsi, .day
    call        printf

    ; Let user know his day is pretty nice
    mov         rax, 0
    mov         rdi, stringformat
    mov         rsi, .good_day
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

pop        rbp
ret

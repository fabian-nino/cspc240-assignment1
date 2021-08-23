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

align 16                                                   ;Insure that the next data declaration starts on a 16-byte boundary.

hello.initial_prompt db "Please enter your first and last names: ", 0
hello.title_promt db "Please enter your title (Ms, Mr, Engineer, Programmer, Mathematician, Genius, etc): ", 0
hello.greeting db "Hello ", 0
hello.day_prompt db ". How has your day been so far? ", 0
hello.good_day db " is really nice.", 10, 0
hello.final_message db "This concludes the demonstration of the Hello program written in x86 assembly.", 10, 0

stringformat db "%s", 0                                      ;general string format
align 64                                                    ;Insure that the next data declaration starts on a 64-byte boundary.

segment .bss

hello.name resb 32                                           ;Create space of size 32 bytes
hello.title resb 32
hello.day resb 32


segment .text

hello:

;The next two instructions should be performed at the start of every assembly program.
push       rbp                                              ;This marks the start of a new stack frame belonging to this execution of this function.
mov        rbp, rsp                                         ;rbp holds the address of the start of this new stack frame.  When this function returns to its caller rbp must
                                                            ;hold the same value it holds now.

;=========== Show the initial message =====================================================================================================================================
;Note that at this point there are no vital data in registers to be saved.  Therefore, there is no back up process at this time.

;=========== Prompt for programmer's name =================================================================================================================================

mov qword   rax, 0
mov         rdi, stringformat
mov         rsi, .initial_prompt
call        printf

;===== Obtain the user's name =============================================================================================================================================

;------------Old style---------------------------------------------------------------------------------------------------------------------------------------|
;mov qword  rax, 0                                          ;SSE is not involved in this scanf operation                                                     |
;mov        rdi, stringformat                               ;"%s"                                                                                            |
;mov        rsi, hello.name               ;Give scanf a pointer to the reserved storage                                                    |
;call       scanf                                           ;Call a library function to do the input the string; however, this function stops on white space.|
;-----------End of old style---------------------------------------------------------------------------------------------------------------------------------|

mov qword rax, 0                                            ;SSE is not involved in this scanf operation
mov       rdi, hello.name                                   ;Copy to rdi the pointer to the start of the array of 32 bytes
mov       rsi, 32                                           ;Provide to fgets the size of the storage made available for input
mov       rdx, [stdin]                                      ;stdin is a pointer to the device; rdx receives the device itself
call      fgets                                             ;Call the C function to get a line of text and stop when NULL is encountered or 31 chars have been stored.

;=========== Prompt for title =================================================================================================================================

mov qword   rax, 0
mov         rdi, stringformat
mov         rsi, .title_promt
call        printf

;===== Obtain the user's name =============================================================================================================================================

mov qword   rax, 0
mov         rdi, hello.title
mov         rsi, 32
mov         rdx, [stdin]
call        fgets

;============= Print greeting

mov         rax, 0
mov         rdi, stringformat
mov         rsi, .greeting
call        printf

mov         rax, 0
mov         rdi, stringformat
mov         rsi, .name
call        printf

mov         rax, 0
mov         rdi, stringformat
mov         rsi, .title
call        printf

;============= Prompt for day going

mov         rax, 0
mov         rdi, stringformat
mov         rsi, .day_prompt
call        printf

;============= Obtain user's input

mov         rax, 0
mov         rdi, hello.day
mov         rsi, 32
mov         rdx, [stdin]
call        fgets

;============= Respond to how day is going

mov         rax, 0
mov         rdi, stringformat
mov         rsi, .day
call        printf

mov         rax, 0
mov         rdi, stringformat
mov         rsi, .good_day
call        printf

;============= Good byes

mov         rax, 0
mov         rdi, stringformat
mov         rsi, .final_message
call        printf

;============= Return user's name to program

mov         rax, hello.name
push        rax
movsd       xmm0, [rsp]
pop         rax

;===== Restore the pointer to the start of the stack frame before exiting from this function ==============================================================================

pop        rbp                                              ;Now the system stack is in the same state it was when this function began execution.

ret                                                         ;Pop a qword from the stack into rip, and continue executing.
;========== End of program hello_world.asm ================================================================================================================================
;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3=========4=========5=========6=========7**

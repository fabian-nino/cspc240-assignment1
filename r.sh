#!/bin/bash

# Fabian Nino
# CPSC 140
# Assignment 1
# 2021-08-22
# falenire@csu.fullerton.edu

# Greeting program using assembly

*.out
echo " " #Blank line

# echo "This program Array Sample Program is compiled without PIC (Position Independent Code)."
# echo "The C++ compiler command and the linker command both include switches to turn off PIC."
# echo "This program was tested successfully in a distro post-October 2017, and should operate successfully in other distros as well."

# echo "Assemble the X86 file hello.asm"
nasm -f elf64 -l hello.lis -o hello.o hello.asm

# echo "Compile the C++ file array-main.cpp"
g++ -c -m64 -Wall -std=c++14 -fno-pie -no-pie -o welcome.o welcome.cpp

# echo "Link the 'O' files welcome.o and hello.o"
g++ -m64 -std=c++14 -fno-pie -no-pie -o welcome.out welcome.o hello.o

# echo "Run the program Floating Point Input Output"
./welcome.out

# echo "This Bash script file will now terminate.  Bye."



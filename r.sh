#!/bin/bash

# Fabian Nino
# CPSC 140
# Assignment 1
# 2021-08-22
# falenire@csu.fullerton.edu

# Greeting program using assembly

rm *.lis *.o *.out

nasm -f elf64 -l hello.lis -o hello.o hello.asm

g++ -c -m64 -Wall -std=c++14 -fno-pie -no-pie -o welcome.o welcome.cpp

g++ -m64 -std=c++14 -fno-pie -no-pie -o hello.out welcome.o hello.o

./hello.out

# Author: August (Gus) Fowler
# Class ID: 520
# Assignment 2

# Adding assignment file setup

data
.word 0
.word 0
.word 0
.word 0
.globl main
.text
main:
    addi $v0, $0, 5             # Set syscall command to take integer input
    syscall                     # Execute syscall command
    
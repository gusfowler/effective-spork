# Author: August (Gus) Fowler
# Class ID: 520
# Assignment 2

# Adding assignment file setup

.data
.word 0
.word 0
.word 0
.word 0
.globl main
.text
main:
    lui $s0, 0x1001             # Set s0 to address of first word
    addi $v0, $0, 5             # Set syscall command to take integer input
    syscall                     # Execute syscall command
    sw $v0, 0($s0)              # Store first number in word at $s0
    addi $v0, $0, 5             # Set $v0 back to 5 to take int input
    syscall                     # Take integer input again
    sw $v0, 4($s0)              # Store second number in second word (0x10010004)
    jal compare                 # Jump to # compare label
    addi $v0, $0, 10            # Set program to exit
    syscall                     # Exit

compare:
    lw $t0, 0($s0)              # load first number into $t0
    lw $t1, 4($s0)              # load second number into $t1
    slt $t2, $t0, $t1           # set $t2 to 1 if $t0 is less than $t1
    beq $t2, 1, firstlessthan   # if $t0 is less than $t1 jump to firstlessthan
    bne $t2, 1, secondlessthan  # if $t0 is not less than $t1 jump to secondlessthan
    j return                    # jump to return

firstlessthan:
    sw $t1, 8($s0)              # Store larger number in 0x10010008
    sw $t0, 12($s0)             # Store smaller number in 0x1001000C
    j return                    # Jump to return

secondlessthan:
    sw $t0, 8($s0)              # Store larger number in 0x10010008
    sw $t1, 12($s0)             # Store smaller number in 0x1001000C
    j return                    # jump to return

return:
    jr $ra                      # return
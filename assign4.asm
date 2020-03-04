# Name:     August Fowler
# ASU ID:   1214774210
# Class ID: 520
# Date:     3/3/2020
# Calliss MWF 8:35a-9:25a

.data
# add any strings at this point as needed
    .ascii "Enter a positive integer (negative integer to end the program): \n"

.text
.globl main

main:
    jal getsum              # call function to print sum of input
    ori $a0, $v0, 0         # copy sum to $a0
    ori $v0, $0, 1          # set output command
    syscall

end:
    ori $v0, $0, 10         # set command to stop program,
    syscall                 # end program

isodd:
    addi $t0, $0, 2         # store 2 in $t0 for divisor (determine even / odd)
    div $a0, $t0            # do division
    mfhi $v0                # get remainder
    jr $ra                  # return to mainLoop

getsum:
    lui $s0, 0x1001         # save string address in $s0
    addi $sp, $sp, -16      # create space in the stack
    sw $ra, 0($sp)          # save return address to main in 0($sp)
    jal mainLoop            # move to mainLoop
	lw $ra, 0($sp)          # reload main return address from stack
    lw $v0, 12($sp)         # place total sum of even numbers entered in $v0
    addi $sp, $sp, 16       # remove space in stack
	j return                # jump to generic return label

mainLoop:                   # loop thru taking input and adding together even integers; $t0 is 1 if input is negative, getsum return address stored in 4($sp); current input stored in 8($sp)
    sw $ra, 4($sp)          # saves getsum return address
    jal takeInput           # jumps to takeInput
    lw $ra, 4($sp)          # loads getsum return address
    slt $t0, $v0, $0        # determines if input is less than 0
    beq $t0, 1, returnEnd   # if input less than 0 trigger exiting the loop
    sw $v0, 8($sp)          # save input into 8($sp)
    addi $a0, $v0, 0        # move input to $a0
    jal isodd               # jump to isodd
    lw $ra, 4($sp)          # reload getsum return address
    beq $v0, $0, addToSum   # if even add to sum
    bne $v0, $0, mainLoop   # if odd jump back to start of mainloop

return:                     # generic return 
    jr $ra                  # return to address

returnEnd:                  # exit loop
    j return                # exit loop to getsum, then to main
    j end                   # after main jump to end to close program

takeInput:                  # takes input; $s0 is address to string
    add $a0, $s0, $0        # set $a0 to address of prompt string
    addi $v0, $0, 4         # give command to print string at address
    syscall                 
    addi $v0, $0, 5         # give command to take integer input
    syscall
    j return                # return to mainLoop

addToSum:                   # adds input to sum if conditions are met; $t1 is new input from stack, $t2 is sum from stack
    lw $t1, 8($sp)          # loads new input
    lw $t2, 12($sp)         # loads old sum
    add $t2, $t2, $t1       # adds new input to exisiting sum
    sw $t2, 12($sp)         # replace old sum with new sum
    j mainLoop              # jump back to mainLoop
.data
# add any strings at this point as needed
prompt: .ascii "Enter a positive integer (negative integer to end the program): \n"
sum:    .word 0

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
    divi $a0, 2
    mfhi $v0
    jr $ra

getsum:
    lui $s0, 0x1001
    addi $a0, 0($s0), 0
    addi $v0, $0, 4
    syscall
    addi $v0, $0, 5
    syscall

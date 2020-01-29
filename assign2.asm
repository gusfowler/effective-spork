# Author: August (Gus) Fowler
# Class ID: 11217
# Assignment 2

.data                       # init program per assignment doc
.globl main
.text
main:
    addi $s0, $0, 15        # use add immediate to set $s0 to 15 by adding $0 (zero) to 15
    
    addi $s1, $0, -4        # did the same thing as one above, just added $0 and -4 to set $s1
    
    addi $v0, $0, 5         # set command to take integer input
    syscall                 # actually take the input
    addi $s2, $v0, 0        # copies result into $s2

    sub $t0, $s1, $s0       # subtracting $s0 from $s1 and storing in temp register $t0
    add $s3, $s2, $t0       # adding $t0 and $s2 and storing in $s3 to complete $s3 = $s1 - $s0 + $s2

    addi $t1, $s2, -7       # subtracting 7 from $s2 and storing in $t1
    add $s4, $s3, $t1       # adding $t1 and $s3 and storing in $s4 to complete $s4 = $s3 + $s2 - 7

    sub $t2, $s1, $s2       # subtracting $s2 from $s1 and storing in $t2
    add $s5, $t2, 20        # adding $t2 and 20 and storing in $s5 to complete $s5 = 20 + $s1 - $s2

    add $t3, $0, $s0        # hold $s0
    add $s0, $0, $s1        # move $s1 to $s0
    add $s1, $0, $t3        # move held $s0 to $s1 ($t3 free for use again)

    sub $s2, $0, $s2        # subtract $s2 from $0 in the hopes of achieving -$s2

    addi $v0, $0, 1         # set command to output integers
    add $a0, $0, $s0        # store $s0 for print
    syscall                 # actually print $s0
    add $a0, $0, $s1        # store $s1 for print
    syscall                 # actually print $s1
    add $a0, $0, $s2        # store $s2 for print
    syscall                 # actually print $s2
    add $a0, $0, $s3        # store $s3 for print
    syscall                 # actually print $s3
    add $a0, $0, $s4        # store $s4 for print
    syscall                 # actually print $s4
    add $a0, $0, $s5        # store $s5 for print
    syscall                 # actually print $s5
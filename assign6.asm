# Name:     August Fowler
# ASU ID:   1214774210
# Class ID: 520
# Date:     3/29/2020
# Calliss MWF 8:35a-9:25a

.data
name:       .asciiz "Gus Fowler\n"      # save name in .data
prompt:     .asciiz "Enter a number "   # store prompt .data
newLine:    .asciiz "\n"                # store newLine char .data

.text
.globl main

main:
        la $s0, prompt          # load address to prompt in $s0
        la $s1, newLine         # load address to newLine in $s1
        la $a0, name            # load pointer to name into $a0
        ori $v0, $0, 4          # give command to print string
        syscall
        jal printPrompt         # take in nums
        jal printPrompt         # loop thru again
        jal printPrompt         # loop thru for the last time
        ori $v0, $0, 10         # give command to end prog
        syscall

    printPrompt:
        or $a0, $0, $s0         # load in prompt to $a0
        syscall                 # print prompt
        ori $v0, $0, 5          # give command to read int
        syscall
        or $t0, $0, $v0         # store first num in $t0

        ori $v0, $0, 4          # give command to print str
        or $a0, $0, $s0         # load in prompt to $a0
        syscall                 # print prompt
        ori $v0, $0, 5          # give command to read int
        syscall
        or $t1, $0, $v0         # store second num in $t1

        ori $v0, $0, 4          # give command to print str
        or $a0, $0, $s0         # load in prompt to $a0
        syscall                 # print prompt
        ori $v0, $0, 5          # give command to read int
        syscall
        or $t2, $0, $v0         # store third num in $t2
        
        ori $v0, $0, 4          # give command to print str
        or $a0, $0, $s0         # load in prompt to $a0
        syscall                 # print prompt
        ori $v0, $0, 5          # give command to read int
        syscall
        or $t3, $0, $v0         # store fourth num in $t3
        
        ori $v0, $0, 4          # give command to print str
        or $a0, $0, $s0         # load in prompt to $a0
        syscall                 # print prompt
        ori $v0, $0, 5          # give command to read int
        syscall
        or $t4, $0, $v0         # store fifth num in $t4
        
        or $s2, $0, $ra         # store return addr to $s2
        jal sumOfNums           # jump and link to sumOfNums
        jal avgInt              # jump and link to avgInt
        jal avgSinglePres       # jump and link to avgSinglePres
        or $ra, $0, $s2         # reset $ra to jump back to main

        jr $ra                  # return to main

    sumOfNums:
        or $t5, $0, $t0         # add first num to $t5
        add $t5, $t5, $t1       # add second num
        add $t5, $t5, $t2       # add third num
        add $t5, $t5, $t3       # add fourth num
        add $t5, $t5, $t4       # add fifth num

        add $a0, $0, $t5        # add sum to $a0
        ori $v0, $0, 1          # give command to print int
        syscall       
        ori $v0, $0, 4          # give command to print str
        or $a0, $0, $s1         # set $a0 to newLine addr
        syscall

        jr $ra                  # return to prompt 

    avgInt:
        addi $t6, $0, 5         # add divisor to $t6
        div $t5, $t6            # compute division

        ori $v0, $0, 1          # give command to print int
        mflo $a0                # set result to $a0
        syscall

        ori $v0, $0, 4          # give command to print str
        or $a0, $0, $s1         # set newLine
        syscall

        jr $ra                  # return to prompt

    avgSinglePres:
        mtc1 $t5, $f4           # move total to coproc 1
        mtc1 $t6, $f5           # move divisor to coproc 1

        div.s $f12, $f4, $f5    # compute division at single presision and store in $f12
        ori $v0, $0, 2          # give command to print float
        syscall

        ori $v0, $0, 4          # give cmd to print string
        or $a0, $0, $s1         # set $a0 to newLine ptr
        syscall

        jr $ra                  # return to prompt


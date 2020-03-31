.data 
        .word 7, 3  
num:    .word 9  

.globl main 
.text 
main: 
    lui $t0, 0x1001 
top: 
    lw $t1, -4($t0) 
    beq $s0, $s2, end 
    jal func 
    add $s0, $s1, $t0 
    andi $s0, $0, 0xFFFF 
    j top 
    bne $s0, $0, top 
end: 
func: 
    sll $v0, $t1, 4  
    jr $ra 
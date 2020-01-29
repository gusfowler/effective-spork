; Author: August (Gus) Fowler
; Class ID: 11217
; Assignment 2

.data                       ; init program per assignment doc
.globl main
.text
main:
    addi $s0, $0, 15        ; use add immediate to set $s0 to 15 by adding $0 (zero) to 15
    addi $s0, $0, -4        ; did the same thing as one above, just added $0 and -4 to set $s1
    
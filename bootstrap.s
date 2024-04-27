	.global _start
	.section .text.bootstrap


_start: 
# for now we just set the stack pointer to the end of RAM
    la sp, _reset_stack_pointer 
    j main

.extern _reset_stack_pointer
.extern main

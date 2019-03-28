# Anja Sheppard AMS180001
# CS 3340.003
	
	.data
string: 	.asciiz "The difference between X and Y (X - Y) is  " # null-terminating string var
X:	.word 0
Y:	.word 0
D:	.word 0

	.text
main:  	li $v0, 5 # service code 5: read an int into $v0
	syscall

	sw $v0, X # move inputted data to memory location
			
	li $v0, 5 # service code 5: read an int into $v0
	syscall
	
	sw $v0, Y # move inputted data to memory location

	la $a0, string # get the previously defined string into the proper register for printing
			
	li $v0, 4 # print the string
	syscall
	
	lw $t0, X # load X into usable register
	lw $t1, Y # load Y into usable register
	sub $t2, $t0, $t1 # $t2 = $t0 - $t1

	sw $t2, D # move difference into memory spot D

	li $v0, 1 # service code 1: print integer
	lw $a0, D # load D
	syscall
	
	li $v0, 10 # service code to end the program
	syscall

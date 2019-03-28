# Anja Sheppard AMS180001
# CS 3340.003

	.data
string: .asciiz "Enter an integer between 0 and 100: "
ans1:	.asciiz "The sum of odd integers from 0 to "
ans2:	.asciiz " is "
ans3:	.asciiz "."
input: 	.word 0
list: 	.space 404 # 4 bytes * 101 int possibilities
i:	.word 1
odds:	.word 0

	.text
	
main:  	la $a0, string # get the previously defined string into the proper register for printing
			
	li $v0, 4 # print the string
	syscall

	li $v0, 5 # service code 5: read an int into $v0
	syscall

	sw $v0, input # move inputted data to memory location
	
	lw $t0, input # move memory location to usable temp
	
	beq $t0, $zero, exit # go to exit and end program if input is 0
	
	lw $t1, i # move iterator to temp
	la $s0, list # get initial position of list
	lw $s1, odds # load oddsSum
	
loop1:	# main loop to put the integers in the array, load them, and use them
	bgt $t1, $t0, printSum # if the iterator has reached the size of the array, go sum the odds
	mul $t2, $t1, 4 # multiply offset (i) by 4
	add $t2, $t2, $s0 # add offset to inital list position
	sw $t1, ($t2) # put the contents of the iterator into the list at the proper location
	lw $t4, ($t2)
	andi $t3, $t4, 0x0001 # if bitwise and with 0x0001 produces 0, it's even, and 1 it's odd
	bne $t3, $zero, addToSum # if it's 1, then add to sum
back:	addi $t1, $t1, 1 # increment i
	j loop1 # go back to top of loop
	j printSum
	
addToSum:
	add $s1, $s1, $t1 # oddsSum += value in array (odd)
	j back
	
printSum:
	sw $s1, odds
	
	la $a0, ans1 # get the previously defined string into the proper register for printing		
	li $v0, 4 # print the string
	syscall
	
	li $v0, 1 # service code 1: print integer
	lw $a0, input # load D
	syscall
	
	la $a0, ans2 # get the previously defined string into the proper register for printing		
	li $v0, 4 # print the string
	syscall
	
	li $v0, 1 # service code 1: print integer
	lw $a0, odds # load D
	syscall
	
	la $a0, ans3 # get the previously defined string into the proper register for printing		
	li $v0, 4 # print the string
	syscall
	
exit: 	li $v0, 10 # service code to end the program
	syscall

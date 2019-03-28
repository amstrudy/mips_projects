# Homework 4
# Anja Sheppard AMS180001

	.data
	
prompt:	.asciiz "Give me your zip code (0 to stop): "
inputs:	.space 20
out:	.asciiz "\nThe sum of all digits in your zip code is "
outi:	.asciiz "\n\nITERATIVE: "
outr: 	.asciiz "\n\nRECURSIVE: "
nl:	.asciiz "\n\n"
sumi:	.word 0
sumr:	.word 0

	.text
main:	
	la 	$t0, sumi		# restore the sums to zero to erase previous runs
	la 	$t1, sumr
	sw 	$zero, ($t0)
	sw 	$zero, ($t1)
	la 	$a0, prompt 		# print the prompt string	
	li 	$v0, 4
	syscall
        
        li 	$v0, 5 			# receive input from user
	syscall
	add 	$s1, $v0, $zero
	
	beq 	$v0, $zero, exit 	# jump to end if 0
	
	# loop to get all 5 zip code digits
	li 	$t0, 0			# iterative variable goes by 4 to make array access easier
	li 	$t1, 20			# length of zip code = 5, so go to 5 * 4 = 20
	li	$t5, 10
	la 	$s0, inputs 		# initial position of list
l1:	beq 	$t0, $t1, exit1
	add 	$t3, $s0, $t0 		# add iterator value to inital list position to get dynamic offset
	div 	$s1, $t5	       	# input mod 10
        mfhi 	$t6			# remainder
        mflo	$s1
        li	$v0, 1
        add	$a0, $t6, $zero
        syscall
	sw 	$t6, ($t3) 		# move inputted data to array[i]
	addi 	$t0, $t0, 4 		# increment iterator by 4 so we can index the array easily
	j 	l1
exit1:	la 	$a0, inputs 		# list is parameter of the function
	jal 	int_digits_sum		# run increment count
	
	li 	$a0, 0			# set the iterator ($a0) to 0 before recursing
	jal 	rec_digits_sum		# run recursive count
	
	lw 	$a1, sumi		# set parameters for print function
	lw	$a2, sumr
	jal 	print
	
	j 	main			# keep running main until user enters 0

int_digits_sum:
	lw 	$t2, sumi		# save value of sumi
	li 	$t0, 0			# iterative variable goes by 4 to make array access easier
	li 	$t1, 20			# length of zip code = 5, so go to 5 * 4 = 20
l2:	beq 	$t0, $t1, exit2
	add 	$t3, $a0, $t0 		# add iterator value to inital list position to get dynamic offset
	lw 	$t4, ($t3) 		# move inputted data to array location in memory
	add 	$t2, $t2, $t4		# sum += array[i]
	addi 	$t0, $t0, 4 		# $t0 += 4		increment counter by 4 to go to next array slot
	j 	l2
exit2:	add 	$v0, $t2, $zero		# set return register $v0 to the sum
	sw 	$t2, sumi
	jr 	$ra
	
rec_digits_sum:
	addi 	$sp, $sp, -4		# save space for return address on the stack
	sw 	$ra, ($sp)		# put the return address on the stack
	
	li 	$t1, 20			# iterator is $a0 going to 20 max (5 * 4)
	blt 	$a0, $t1, rec_digits_sum_call
	li 	$v0, 1
	lw 	$ra, ($sp)		# restore return address from stack
	addi 	$sp, $sp, 4
	jr 	$ra
	
rec_digits_sum_call:
	la 	$t5, inputs
	add 	$t2, $a0, $t5
	lw 	$t4, ($t2)
	lw 	$t3, sumr
	add 	$t3, $t3, $t4		# sum += array[i]
	sw 	$t3, sumr
	addi 	$a0, $a0, 4		# increment the counter by 1
	jal 	rec_digits_sum
	lw 	$ra, 0($sp)		# restore return address from stack
	addi 	$sp, $sp, 4
	jr 	$ra
	
# print: function that prints the results of the iterative and recursive functions
# parameters: 	$a1 = sumi
#		$a2 = sumr
# returns:	nothing
print:
	li 	$v0, 4			# print string
	la 	$a0, out
	syscall
	
	li 	$v0, 4 			# print string
	la	$a0, outi
	syscall
	
	li 	$v0, 1 			# print iterative sum sumi
	move	$a0, $a1
	syscall
	
	li 	$v0, 4 			# print string
	la	$a0, outr
	syscall
	
	li 	$v0, 1 			# print recursive sum sumr
	move 	$a0, $a2
	syscall
	
	li 	$v0, 4 			# print new lines
	la	$a0, nl
	syscall
	
	jr	$ra

exit:	li 	$v0, 10 # service code to end the program
	syscall
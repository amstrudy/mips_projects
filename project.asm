	.data 
l1:	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
l2:	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
l3:	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
l4:	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
l5:	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
l6:	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
a1:	.word 0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1
a2:	.word 0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1
a3:	.word 0,0,0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0,0,0,1,1,1,1
a4:	.word 0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1
a5:	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
a6:	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
final:	.word 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
f_int:	.word 
p1:	.asciiz "Think of a number between 0 and 63 (inclusive).\n\n"
p2:	.asciiz "\nIs your number shown below (enter y or n)?\n"
p3:	.asciiz "\nYour number is: "
p4:	.asciiz "You didn't enter a valid option."
n:	.asciiz "\n"
space:	.asciiz " "
								
	.text 
main:
	la	$a0, p1			# print prompt
	li	$v0, 4
	syscall

# CARD 1	
RETRY1:	la	$a0, p2			# print prompt
	li	$v0, 4
	syscall
	la	$a0, a1			# print card 1 (a1) followed by a new line
	jal	PRINT
	la	$a0, n
	li	$v0, 4
	syscall
	li 	$v0, 12			# get input (char)
	syscall
	add	$t0, $v0, $zero		# store input in $t0
	
	li	$t1, 121		# ASCII for "y"
	li	$t2, 110		# ASCII for "n"
	beq	$t0, $t1, YES1		# if the user entered yes
	beq	$t0, $t2, NO1		# if the user entered no
	j 	ELSE1			# otherwise invalid input
YES1:	li	$t0, 1			# replace char ASCII value 121 with 1 for "yes"
	j	E1A
NO1:	li	$t0, 0			# replace char ASCII value 110 with 0 for "no"
	j 	E1A
ELSE1:	la	$a0, p4			# invalid input - retry prompt
	syscall
	j 	RETRY1
E1A:	

	la 	$s1, l1
	la 	$s7, a1
	bne	$zero, $t0, OR1		# if answer given was yes (1)
	j	NOR1
OR1:	#or	$s1, $s7, $s1		# enter 1's for the possible values
	move	$a0, $s1
	move	$a1, $s7
	jal	OR_TWO_ARRAYS
	j	E1B
NOR1:	#nor	$s1, $s7, $s1		# enter 1's for the possible values (opposite than what's in a1)
	move	$a0, $s1
	move	$a1, $s7
	jal	NOR_TWO_ARRAYS
	j	E1B
E1B:	#sw	$a0, l1


# CARD 2
RETRY2:	la	$a0, p2			# print prompt and store answer in $t0
	li	$v0, 4
	syscall
	la	$a0, a2
	jal	PRINT
	la	$a0, n
	li	$v0, 4
	syscall
	li 	$v0, 12
	syscall
	add	$t0, $v0, $zero
	
	li	$t1, 121		# ASCII for "y"
	li	$t2, 110		# ASCII for "n"
	beq	$t0, $t1, YES2
	beq	$t0, $t2, NO2
	j 	ELSE2
YES2:	li	$t0, 1
	j	E2A
NO2:	li	$t0, 0
	j 	E2A
ELSE2:	la	$a0, p4
	syscall
	j 	RETRY2
E2A:	

	la 	$s1, l2
	la 	$s7, a2
	bne	$zero, $t0, OR2		# if answer given was yes (1)
	j	NOR2
OR2:	#or	$s1, $s7, $s1		# enter 1's for the possible values
	move	$a0, $s1
	move	$a1, $s7
	jal	OR_TWO_ARRAYS
	j	E2B
NOR2:	#nor	$s1, $s7, $s1		# enter 1's for the possible values (opposite than what's in a1)
	move	$a0, $s1
	move	$a1, $s7
	jal	NOR_TWO_ARRAYS
	j	E2B
E2B:	#sw	$a0, l2


# CARD 3
RETRY3:	la	$a0, p2			# print prompt and store answer in $t0
	li	$v0, 4
	syscall
	la	$a0, a3
	jal	PRINT
	la	$a0, n
	li	$v0, 4
	syscall
	li 	$v0, 12
	syscall
	add	$t0, $v0, $zero
	
	li	$t1, 121		# ASCII for "y"
	li	$t2, 110		# ASCII for "n"
	beq	$t0, $t1, YES3
	beq	$t0, $t2, NO3
	j 	ELSE3
YES3:	li	$t0, 1
	j	E3A
NO3:	li	$t0, 0
	j 	E3A
ELSE3:	la	$a0, p4
	syscall
	j 	RETRY3
E3A:

	la 	$s1, l3
	la 	$s7, a3
	bne	$zero, $t0, OR3		# if answer given was yes (1)
	j	NOR3
OR3:	#or	$s1, $s7, $s1		# enter 1's for the possible values
	move	$a0, $s1
	move	$a1, $s7
	jal	OR_TWO_ARRAYS
	j	E3B
NOR3:	#nor	$s1, $s7, $s1		# enter 1's for the possible values (opposite than what's in a1)
	move	$a0, $s1
	move	$a1, $s7
	jal	NOR_TWO_ARRAYS
	j	E3B
E3B:	#sw	$a0, l3


# CARD 4
RETRY4:	la	$a0, p2			# print prompt and store answer in $t0
	li	$v0, 4
	syscall
	la	$a0, a4
	jal	PRINT
	la	$a0, n
	li	$v0, 4
	syscall
	li 	$v0, 12
	syscall
	add	$t0, $v0, $zero
	
	li	$t1, 121		# ASCII for "y"
	li	$t2, 110		# ASCII for "n"
	beq	$t0, $t1, YES4
	beq	$t0, $t2, NO4
	j 	ELSE4
YES4:	li	$t0, 1
	j	E4A
NO4:	li	$t0, 0
	j 	E4A
ELSE4:	la	$a0, p4
	syscall
	j 	RETRY4
E4A:	

	la 	$s1, l4
	la 	$s7, a4
	bne	$zero, $t0, OR4		# if answer given was yes (1)
	j	NOR4
OR4:	#or	$s1, $s7, $s1		# enter 1's for the possible values
	move	$a0, $s1
	move	$a1, $s7
	jal	OR_TWO_ARRAYS
	j	E4B
NOR4:	#nor	$s1, $s7, $s1		# enter 1's for the possible values (opposite than what's in a1)
	move	$a0, $s1
	move	$a1, $s7
	jal	NOR_TWO_ARRAYS
	j	E4B
E4B:	#sw	$a0, l4

# CARD 5
RETRY5:	la	$a0, p2			# print prompt and store answer in $t0
	li	$v0, 4
	syscall
	la	$a0, a5
	jal	PRINT
	la	$a0, n
	li	$v0, 4
	syscall
	li 	$v0, 12
	syscall
	add	$t0, $v0, $zero
	
	li	$t1, 121		# ASCII for "y"
	li	$t2, 110		# ASCII for "n"
	beq	$t0, $t1, YES5
	beq	$t0, $t2, NO5
	j 	ELSE5
YES5:	li	$t0, 1
	j	E5A
NO5:	li	$t0, 0
	j 	E5A
ELSE5:	la	$a0, p4
	syscall
	j 	RETRY5
E5A:	

	la 	$s1, l5
	la 	$s7, a5
	bne	$zero, $t0, OR5		# if answer given was yes (1)
	j	NOR5
OR5:	#or	$s1, $s7, $s1		# enter 1's for the possible values
	move	$a0, $s1
	move	$a1, $s7
	jal	OR_TWO_ARRAYS
	j	E5B
NOR5:	#nor	$s1, $s7, $s1		# enter 1's for the possible values (opposite than what's in a1)
	move	$a0, $s1
	move	$a1, $s7
	jal	NOR_TWO_ARRAYS
	j	E5B
E5B:	#sw	$a0, l5

# CARD 6
RETRY6:	la	$a0, p2			# print prompt and store answer in $t0
	li	$v0, 4
	syscall
	la	$a0, a6
	jal	PRINT
	la	$a0, n
	li	$v0, 4
	syscall
	li 	$v0, 12
	syscall
	add	$t0, $v0, $zero
	
	li	$t1, 121		# ASCII for "y"
	li	$t2, 110		# ASCII for "n"
	beq	$t0, $t1, YES6
	beq	$t0, $t2, NO6
	j 	ELSE6
YES6:	li	$t0, 1
	j	E6A
NO6:	li	$t0, 0
	j 	E6A
ELSE6:	la	$a0, p4
	syscall
	j 	RETRY6
E6A:	

	la 	$s1, l6
	la 	$s7, a6
	bne	$zero, $t0, OR6		# if answer given was yes (1)
	j	NOR6
OR6:	#or	$s1, $s7, $s1		# enter 1's for the possible values
	move	$a0, $s1
	move	$a1, $s7
	jal	OR_TWO_ARRAYS
	j	E6B
NOR6:	#nor	$s1, $s7, $s1		# enter 1's for the possible values (opposite than what's in a1)
	move	$a0, $s1
	move	$a1, $s7
	jal	NOR_TWO_ARRAYS
	j	E6B
E6B:	#sw	$a0, l6

AND:	la	$s0, final
	la	$s1, l1
	la	$s2, l2
	la	$s3, l3
	la	$s4, l4
	la	$s5, l5
	la	$s6, l6
	move	$a0, $s0
	move	$a1, $s1
	move	$a2, $s0
	jal	AND_TWO_ARRAYS		# and	$s0, $s1, $s2
	move	$a0, $s0
	move	$a1, $s2
	move	$a2, $s0
	jal	AND_TWO_ARRAYS		# and	$s0, $s1, $s2
	move	$a0, $s0
	move	$a1, $s3
	move	$a2, $s0
	jal	AND_TWO_ARRAYS		# and	$s0, $s0, $s3
	move	$a0, $s0
	move	$a1, $s4
	move	$a2, $s0
	jal	AND_TWO_ARRAYS		# and	$s0, $s0, $s4
	move	$a0, $s0
	move	$a1, $s5
	move	$a2, $s0
	jal	AND_TWO_ARRAYS		# and	$s0, $s0, $s5
	move	$a0, $s0
	move	$a1, $s6
	move	$a2, $s0
	jal	AND_TWO_ARRAYS		# and	$s0, $s0, $s6
	#sw	$a2, final
	
	li	$t0, 0			# pull correct number from the list "final"
	li	$t1, 64
	li	$t2, 0			# array index
	move	$s0, $a2
LOOP:	beq	$t0, $t1, END
	add	$t2, $t0, $zero
	sll	$t2, $t2, 2		# multiply by 4
	add	$t2, $t2, $s0		# add array memory location offset
	lw	$t3, ($t2)
	bne	$t3, $zero, FINAL1	# if you reach something that's not 0, then that's the answer
	addi	$t0, $t0, 1
	j	LOOP
FINAL1:	sw	$t0, f_int
END:	la	$a0, p3			# print prompt
	li	$v0, 4
	syscall
	move	$a0, $t0
	li	$v0, 1
	syscall
	
EXIT:	li 	$v0, 10 		# service code to end the program
	syscall
	
# FUNCTION NAME: PRINT
# PARAMETERS: $a0 is the array to print (of size 64)
# RETURNS: nothing
# DESCRIPTION: Prints a card/array where a 1 in the array means print that index number 
PRINT:					# $a0 is the location of the array
	move	$s0, $a0
	li	$t1, 0
	li	$t2, 64
LOOP2:	beq	$t1, $t2, END2
	sll	$t3, $t1, 2
	add	$t3, $t3, $s0
	lw	$t4, ($t3)		# print array[$t0 * 4]
	bne	$t4, $zero, ONE		# if array[$t0 * 4] == 1, go print that int
	j	E
ONE:	move	$a0, $t1
	li	$v0, 1
	syscall
	la	$a0, space
	li	$v0, 4
	syscall
E:	
	addi	$t1, $t1, 1
	j	LOOP2
END2:	jr	$ra

# FUNCTION NAME: OR_TWO_ARRAYS
# PARAMETERS: $a0 is the address of first array and also the destination, $a1 is the address of second array
# RETURNS: nothing
# DESCRIPTION: If the user selects that a card does contain their number, 
#	       then or that card with an empty set of 0's and then the potential spots will be marked
OR_TWO_ARRAYS:
	move	$s0, $a0		# save array addresses
	move	$s1, $a1
	li	$t0, 0			# loop counter
	li	$t1, 64			# loop end condition (length of arrays)
	li	$t2, 0			# array indexer
LOOP3:	beq	$t0, $t1, END3
	add	$t2, $t0, $zero
	sll	$t2, $t2, 2		# multiply array index by 4
	add	$t3, $t2, $s0		# add array offset to array address
	add	$t4, $t2, $s1
	lw	$t5, ($t3)		# $t5 = $a0[i]
	lw	$t6, ($t4)		# $t6 = $a1[i]
	or	$t7, $t5, $t6		# $t7 = $t5 | $t6
	sw	$t7, ($t3)		# $a0[i] = $t7
	addi	$t0, $t0, 1
	j	LOOP3
END3:	jr	$ra

# FUNCTION NAME: NOR_TWO_ARRAYS
# PARAMETERS: $a0 is the address of first array and also the destination, $a1 is the address of second array
# RETURNS: nothing
# DESCRIPTION: If the user selects that a card does NOT contain their number, 
#	       then nor that card with an empty set of 0's and then the potential spots will be marked
NOR_TWO_ARRAYS:
	move	$s0, $a0		# save array addresses
	move	$s1, $a1
	li	$t0, 0			# loop counter
	li	$t1, 64			# loop end condition (length of arrays)
	li	$t2, 0			# array indexer
LOOP4:	beq	$t0, $t1, END4
	add	$t2, $t0, $zero
	sll	$t2, $t2, 2		# multiply array index by 4
	add	$t3, $t2, $s0		# add array offset to array address
	add	$t4, $t2, $s1
	lw	$t5, ($t3)		# $t5 = $a0[i]
	lw	$t6, ($t4)		# $t6 = $a1[i]
	beq	$t5, $t6, EQ
	li	$t7, 0
	j	STORE
EQ:	beq	$t5, $zero, EQ_0	# $t5 = $t6 = 0, so store 1
	li	$t7, 0
	j	STORE
EQ_0:	li	$t7, 1
STORE:	sw	$t7, ($t3)		# $a0[i] = $t7
	addi	$t0, $t0, 1
	j	LOOP4
END4:	jr	$ra

# FUNCTION NAME: AND_TWO_ARRAYS
# PARAMETERS: $a0 is the address of first array, $a1 is the address of second array, $a2 is the desination
# RETURNS: nothing
# DESCRIPTION: And element-wise through two arrays and put results in a third array
AND_TWO_ARRAYS:
	move	$t7, $a0		# save array addresses
	move	$t8, $a1
	move	$t9, $a2
	li	$t0, 0			# loop counter
	li	$t1, 64			# loop end condition (length of arrays)
	li	$t2, 0			# array indexer
LOOP5:	beq	$t0, $t1, END5
	add	$t2, $t0, $zero
	sll	$t2, $t2, 2		# multiply array index by 4
	add	$t3, $t2, $t7		# add array offset to array address
	add	$t4, $t2, $t8
	add	$t6, $t2, $t9
	lw	$t3, ($t3)		# $t3 = $a0[i]
	lw	$t4, ($t4)		# $t4 = $a1[i]
	and	$t5, $t3, $t4		# $t5 = $t3 & $t4
	sw	$t5, ($t6)		# $a2[i] = $t7
	addi	$t0, $t0, 1
	j	LOOP5
END5:	jr	$ra

# FUNCTION NAME: PRINT
# PARAMETERS: $a0 is the array to print (of size 64)
# RETURNS: nothing
# DESCRIPTION: Prints a card/array where a 1 in the array means print that index number 
PRINT_01:					# $a0 is the location of the array
	move	$s0, $a0
	li	$t1, 0
	li	$t2, 64
LOOP6:	beq	$t1, $t2, END6
	sll	$t3, $t1, 2
	add	$t3, $t3, $s0
	lw	$t4, ($t3)		# print array[$t0 * 4]
	move	$a0, $t4
	li	$v0, 1
	syscall
	la	$a0, space
	li	$v0, 4
	syscall
	addi	$t1, $t1, 1
	j	LOOP6
END6:	la	$a0, n
	li	$v0, 4
	syscall
	jr	$ra

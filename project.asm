	.data 
l1:	.space 8 "0000000000000000000000000000000000000000000000000000000000000000"
l2:	.space 8 "0000000000000000000000000000000000000000000000000000000000000000"
l3:	.space 8 "0000000000000000000000000000000000000000000000000000000000000000"
l4:	.space 8 "0000000000000000000000000000000000000000000000000000000000000000"
l5:	.space 8 "0000000000000000000000000000000000000000000000000000000000000000"
l6:	.space 8 "0000000000000000000000000000000000000000000000000000000000000000"
a1:	.space 8 "0101010101010101010101010101010101010101010101010101010101010101"
a2:	.space 8 "0011001100110011001100110011001100110011001100110011001100110011"
a3:	.space 8 "0000111100001111000011110000111100001111000011110000111100001111"
a4:	.space 8 "0000000011111111000000001111111100000000111111110000000011111111"
a5:	.space 8 "0000000000000000111111111111111100000000000000001111111111111111"
a6:	.space 8 "0000000000000000000000000000000011111111111111111111111111111111"
final:	.space 8
p1:	.asciiz "Think of a number between 1 and 63 (inclusive)."
p2:	.asciiz "Is your number shown below (enter y or n)?"
p3:	.asciiz "You number is: "
p4:	.asciiz "You didn't enter a valid option."
				
	.text 
main:
	la	$a0, p1			# print prompt
	li	$v0, 4
	syscall

# CARD 1	
RETRY1:	la	$a0, p2			# print prompt and store answer in $t0
	li	$v0, 4
	syscall
	li 	$v0, 5
	syscall
	addi	$t0, $v0, $zero
	
	li	$t1, 121		# ASCII for "y"
	li	$t2, 110		# ASCII for "n"
	beq	$t0, $t1, YES1
	beq	$t0, $t2, NO1
	j 	ELSE1
YES1:	li	$t0, 1
	j	E1A
NO1:	li	$t0, 0
	j 	E1A
ELSE1:	la	$a0, p4
	syscall
	j 	RETRY1
E1A:	

	lw 	$s1, l1
	lw 	$s7, a1
	bne	$zero, $t0, OR1		# if answer given was yes (1)
	j	NOR1
OR1:	or	$s1, $s7, $s1		# enter 1's for the possible values
	j	E1B
NOR1:	nor	$s1, $s7, $s1		# enter 1's for the possible values (opposite than what's in a1)
	j	E1B
E1B:	sw	$s1, l1


# CARD 2
RETRY2:	la	$a0, p2			# print prompt and store answer in $t0
	li	$v0, 4
	syscall
	li 	$v0, 5
	syscall
	addi	$t0, $v0, $zero
	
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

	lw 	$s1, l2
	lw 	$s7, a2
	bne	$zero, $t0, OR2		# if answer given was yes (1)
	j	NOR2
OR2:	or	$s1, $s7, $s1		# enter 1's for the possible values
	j	E2B
NOR2:	nor	$s1, $s7, $s1		# enter 1's for the possible values (opposite than what's in a1)
	j	E2B
E2B:	sw	$s1, l2


# CARD 3
RETRY3:	la	$a0, p2			# print prompt and store answer in $t0
	li	$v0, 4
	syscall
	li 	$v0, 5
	syscall
	addi	$t0, $v0, $zero
	
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

	lw 	$s1, l3
	lw 	$s7, a3
	bne	$zero, $t0, OR3		# if answer given was yes (1)
	j	NOR3
OR3:	or	$s1, $s7, $s1		# enter 1's for the possible values
	j	E3B
NOR3:	nor	$s1, $s7, $s1		# enter 1's for the possible values (opposite than what's in a1)
	j	E3B
E3B:	sw	$s1, l3


# CARD 4
RETRY4:	la	$a0, p2			# print prompt and store answer in $t0
	li	$v0, 4
	syscall
	li 	$v0, 5
	syscall
	addi	$t0, $v0, $zero
	
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

	lw 	$s1, l4
	lw 	$s7, a4
	bne	$zero, $t0, OR4		# if answer given was yes (1)
	j	NOR4
OR4:	or	$s1, $s7, $s1		# enter 1's for the possible values
	j	E4B
NOR4:	nor	$s1, $s7, $s1		# enter 1's for the possible values (opposite than what's in a1)
	j	E4B
E4B:	sw	$s1, l4

# CARD 5
RETRY5:	la	$a0, p2			# print prompt and store answer in $t0
	li	$v0, 4
	syscall
	li 	$v0, 5
	syscall
	addi	$t0, $v0, $zero
	
	li	$t1, 121		# ASCII for "y"
	li	$t2, 110		# ASCII for "n"
	beq	$t0, $t1, YES5
	beq	$t0, $t2, NO5
	j 	ELSE5
YES5:	li	$t0, 1
	j	E5A
NO5:	li	$t0, 0
	j 	E5A
ELSE5:	la	$a0, p5
	syscall
	j 	RETRY5
E5A:	

	lw 	$s1, l5
	lw 	$s7, a5
	bne	$zero, $t0, OR5		# if answer given was yes (1)
	j	NOR5
OR5:	or	$s1, $s7, $s1		# enter 1's for the possible values
	j	E5B
NOR5:	nor	$s1, $s7, $s1		# enter 1's for the possible values (opposite than what's in a1)
	j	E5B
E5B:	sw	$s1, l5

# CARD 6
RETRY5:	la	$a0, p2			# print prompt and store answer in $t0
	li	$v0, 4
	syscall
	li 	$v0, 5
	syscall
	addi	$t0, $v0, $zero
	
	li	$t1, 121		# ASCII for "y"
	li	$t2, 110		# ASCII for "n"
	beq	$t0, $t1, YES6
	beq	$t0, $t2, NO6
	j 	ELSE6
YES6:	li	$t0, 1
	j	E6A
NO6:	li	$t0, 0
	j 	E6A
ELSE6:	la	$a0, p6
	syscall
	j 	RETRY6
E6A:	

	lw 	$s1, l6
	lw 	$s7, a6
	bne	$zero, $t0, OR6		# if answer given was yes (1)
	j	NOR6
OR5:	or	$s1, $s7, $s1		# enter 1's for the possible values
	j	E6B
NOR6:	nor	$s1, $s7, $s1		# enter 1's for the possible values (opposite than what's in a1)
	j	E6B
E6B:	sw	$s1, l6

AND:	lw	$s1, l1
	lw	$s2, l2
	lw	$s3, l3
	lw	$s4, l4
	lw	$s5, l5
	lw	$s6, l6
	and	$s0, $s1, $s2
	and	$s0, $s0, $s3
	and	$s0, $s0, $s4
	and	$s0, $s0, $s5
	and	$s0, $s0, $s6
	sw	$s0, final
	
	li	$t1, 65
	li	$t3, 1
LOOP:	bge	$t3, $t1, END
	bne	$t3, $zero, FINAL	# if you reach something that's not 0 store that index
	addi	$t3, $t3, 1
	j	LOOP
FINAL1:	sw	$t3, final
END:	la	$a0, p3			# print prompt
	li	$v0, 4
	syscall
	la	$t0, final
	li	$v0, 1
	syscall
	
EXIT:	li 	$v0, 10 # service code to end the program
	syscall
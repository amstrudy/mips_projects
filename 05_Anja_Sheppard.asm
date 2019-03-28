# Anja Sheppard Homework 5 CS 3340.003

	.data
prompt1:.asciiz "Enter the number of circle pizzas: "
prompt2:.asciiz "Enter the number of square pizzas: "
prompt3:.asciiz "Enter the square footage estimate: "
printY:	.asciiz "\nYeah!"
printB:	.asciiz "\nBummer!"
print1:	.asciiz "\nSquare footage of circle pizzas: "
print2:	.asciiz "\nSquare footage of square pizzas: "
print3:	.asciiz "\nTotal square footage: "
radius:	.float 16.0
PI:	.float 3.1415926536
convert:.float 144.0
square:	.word 0
circle: .word 0
squareA:.float 0
circleA:.float 0
est:	.float 0
actual:	.float 0
	
	.text
main:
	la	$a0, prompt1		# print prompt and receive integer input from user for number of circle pizzas
	li	$v0, 4
	syscall
	li 	$v0, 5
	syscall
	sw	$v0, circle

	la	$a0, prompt2		# print prompt and receive integer input from user for number of square pizzas
	li	$v0, 4
	syscall
	li 	$v0, 5
	syscall
	sw	$v0, square
	
	la	$a0, prompt3		# print prompt and receive float input from user for estimate
	li	$v0, 4
	syscall
	li 	$v0, 6
	syscall
	swc1	$f0, est
	
	lw	$a0, circle		# load arguments for function call
	lw	$a1, square
	jal 	calculateArea
	jal 	print
	jal	exit

calculateArea:
	lwc1	$f9, convert		# load 100.0

	lwc1	$f0, radius		# radius squared
	lwc1	$f1, PI			# PI
	mul.s	$f3, $f0, $f1		# area of circle pizza
	mtc1	$a0, $f4
	cvt.s.w	$f4, $f4
	
	mul.s	$f5, $f4, $f3		# SQ IN: total area of circle pizzas = number of circle pizzas * area of 1 circle pizza
	div.s	$f5, $f5, $f9		# divide by 12^2 to get square feet
	swc1	$f5, circleA		# square feet

	li	$t0, 100		# SQ IN: area of square pizza (12 ^ 2) 
	mult	$a1, $t0
	mflo	$t1
	mtc1	$t1, $f6		# convert int to float
	cvt.s.w	$f6, $f6
	div.s	$f6, $f6, $f9		# convert square inches to square feet
	swc1	$f6, squareA		# square feet
	
	add.s	$f7, $f6, $f5		# sum total area
	swc1	$f7, actual
	jr	$ra
	
print:
	la	$a0, print1		# print circle area (float)
	li	$v0, 4
	syscall
	lwc1	$f12, circleA
	li	$v0, 2
	syscall
	
	la	$a0, print2		# print square area (int)
	li	$v0, 4
	syscall
	lwc1	$f12, squareA
	li	$v0, 2
	syscall
	
	la	$a0, print3		# print total area (float)
	li	$v0, 4
	syscall
	lwc1	$f12, actual
	li	$v0, 2
	syscall
	
	lwc1	$f0, actual		# print Yeah! or Bummer!
	lwc1	$f1, est
	c.le.s	$f0, $f1
	bc1f	yeah
	j	bummer
yeah:	la	$a0, printY
	li	$v0, 4
	syscall
	j 	out
bummer:	la	$a0, printB
	la	$v0, 4
	syscall
	j 	out
out:	jr $ra

exit:	li 	$v0, 10 # service code to end the program
	syscall
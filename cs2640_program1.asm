# CS2640 Program 1
#10/27/24
#Michael Kaitel

#Task 1: User Input and Output
#In this task, you will practice getting user input, moving them to registers, and printing them back to the user. 
#Below are the specific requirements for this task:
#Use "main: " label for this task
#Get 2 int values from the user
#The two user values should be held in registers $s0 and $s1, respectively
#Output the user inputs in the "Run I/O" section in MARS environment back to the user

#Task 2: Arithmetic Operation Practice
#Using the user input values in registers $s0 and $s1, write MIPS Assembly code to complete the arithmetic operations below:
#add two values (use instruction "add")
#subtract two values (use instruction "sub")
#multiply two values (use instruction "mul")
#divide two values (use instruction "div")
#Output the arithmetic results in the "Run I/O" section in MARS environment back to the user

#Task 3: Conditions
#In this final task, you will practice how to do conditions in Assembly:
#If the two user inputs from Task 1 are equal to each other, output "User inputs are the same"
#If the two user inputs from Task 1 are not equal to each other, output "User inputs are different"





.data
	task1Input: .asciiz "please input an int: "
	task1Output: .asciiz "these are your int's: "
	task1Buffer: .asciiz ", "
	task2Add: .asciiz "\nAdded user values: "
	task2Sub: .asciiz "\nSubtracted user values: "
	task2Mult: .asciiz "\nMultiplied user values: "
	task2Div: .asciiz "\nDivided user values: "
	task3equal: .asciiz "\nThe two inputs are equal"
	task3NOTequal: .asciiz "\nThe two inputs are NOT equal"


.text
main:
	li $v0, 4           	#prompt user for input
	la $a0, task1Input
	syscall
	
	li $v0, 5		#gets user intput
	syscall
	
	move $s0, $v0		#moves user input to register $s0
	
	li $v0, 4           	#prompt user for input
	la $a0, task1Input
	syscall
	
	li $v0, 5		#gets user intput
	syscall
	
	move $s1, $v0		#moves user input to register $s0
	
	li $v0, 4		#responds to user input
	la $a0, task1Output
	syscall
	
	li $v0, 1		#returns first int
	move $a0, $s0
	syscall
	
	li $v0, 4		#organizes output
	la $a0, task1Buffer
	syscall
	
	li $v0, 1		#returns second int
	move $a0, $s1
	syscall

	add $t1, $s0, $s1 	#Adds 2 ints
	
	li $v0, 4		#prints answer text
	la $a0, task2Add
	syscall
	
	li $v0, 1		#prints added number
	move $a0, $t1
	syscall
	
	
	mul $t1, $s0, $s1 	#Multiplys the 2 inputs
	
	li $v0, 4		#prompts text output
	la $a0, task2Mult
	syscall
	
	li $v0, 1		#outputs multiplyed number
	move $a0, $t1
	syscall


	blt $s0, $s1, biggerSecond	#determins if the escond or firt branch is bigger to avoid negative numbers
					#Note: Should prompt if user wants negatives but I am tired and would need more exceptions
					#if yes can make another version with updated branch
	
	sub $t1, $s0, $s1 	#subtracts the two numbers
	
	li $v0, 4		#promps the output
	la $a0, task2Sub
	syscall
	
	li $v0, 1		#outputs the number
	move $a0, $t1
	syscall

	div  $t1, $s0, $s1	#devides the 2 numbers
	
	li $v0, 4		#promps the output
	la $a0, task2Div
	syscall
	
	li $v0, 1		#outputs the number
	move $a0, $t1
	syscall

	beq $s0, $s1, equal	#branches if the 2 numbers equal eachother
	
	li $v0, 4		#If the 2 numbers don't equal respond with the not equal message
	la $a0, task3NOTequal
	syscall

li $v0, 10			#ends program
syscall

biggerSecond:			#everything done here does the same as stated above but in a diffrent order as to not get negatives
				#for further details on what each section does see above documentation

	sub $t1, $s1, $s0 
	li $v0, 4
	la $a0, task2Sub
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall

	div  $t1, $s1, $s0
	
	li $v0, 4
	la $a0, task2Div
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall

	beq $s0, $s1, equal
	
	li $v0, 4
	la $a0, task3NOTequal
	syscall

li $v0, 10			#ends program
syscall

equal:

	li $v0, 4		#If the numbers equal eachother print the equal message
	la $a0, task3equal
	syscall


li $v0, 10			#ends program
syscall
	
	

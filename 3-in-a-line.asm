# Term Project, program that emulates the 3-in-a-line game
# Zachary Baldwin
# CS2340.001 Computer Architecture F20
	
	.data
row6:		.word 0, 0, 0
row5:		.word 0, 0, 0
row4:		.word 0, 0, 0
row3:		.word 0, 0, 0
row2:		.word 0, 0, 0
row1:		.word 0, 0, 0

col1Full:	.word 0
col2Full:	.word 0
col3Full:	.word 0

borderPiece:	.asciiz "\t | "
borderPieceNL: 	.asciiz " | \n"
borderLine:	.asciiz "\t  -------  \n"
colCount:	.asciiz "\t   1 2 3   \n\n"
space:		.asciiz " "

welcomeMessage:	.asciiz "Welcome to 3-in-a-line, MIPS edition!\n"
playerMessage:	.asciiz "You are player one '1' and the computer is player two '2'\n"
chooseMessage:	.asciiz "Choose a column to occupy (1, 2, or 3): "
invalidInput:	.asciiz "The number entered is not valid!\n"
columnFull:	.asciiz "Column is already full!\n"
playAgainMsg:	.asciiz "Play again? (1 for yes, 0 for no): "

equalsOne:	.asciiz "Equals 1"
equalsTwo:	.asciiz "Equals 2"
equalsThree:	.asciiz "Equals 3"

computerChose:	.asciiz "Computer chose: "
youChose:	.asciiz "You chose: "
newline:	.asciiz "\n"

compWinMsg:	.asciiz "Computer wins!\n"
playerWinMsg:	.asciiz "Player wins!\n"
tieMsg:		.asciiz "It's a tie!\n"

	.text
	.globl main

main:
	jal	clear_game_board
	
	li	$s5, 0			# load 1 into $s5
	sw	$s5, col1Full		# store 1 in col3
	sw	$s5, col2Full		# store 1 in col3
	sw	$s5, col3Full		# store 1 in col3

	li	$v0, 4			# load for 4 print string
	la	$a0, welcomeMessage	# load string address
	syscall				# print string
	
	li	$v0, 4			# load for 4 print string
	la	$a0, playerMessage	# load string address
	syscall				# print string

loop:
	jal print_game_board		# print game board

	li	$v0, 4			# load for 4 print string
	la	$a0, chooseMessage	# load string address
	syscall				# print string
	
	li	$v0, 5			# load 5 for get integer
	syscall				# get integer
	
	move	$t0, $v0		# store keyboard in t0
	
	beq	$t0, 1, equalToOne	# jump to 'one' branch
	beq	$t0, 2, equalToTwo	# jump to 'two' branch
	beq	$t0, 3, equalToThree	# jump to 'three' branch
	
	li	$v0, 4			# load for 4 print string
	la	$a0, invalidInput	# load string address
	syscall				# print string
	
	j	loop

equalToOne:
	la	$t9, row1		# load row into $t9
	lw	$t8, 0($t9)		# load first item of row into $8
	bnez	$t8, setC1R2Player	# jump to next row if it's occupied
	li	$t7, 1			# set equal to one
	sw	$t7, 0($t9)		# store number back into array
	
	j	computer_choice		# jump to cmoputer_choice
	
setC1R2Player:
	la	$t9, row2		# load row into $t9
	lw	$t8, 0($t9)		# load first item of row into $8
	bnez	$t8, setC1R3Player	# jump to next row if it's occupied
	li	$t7, 1			# set equal to one
	sw	$t7, 0($t9)		# store number back into array

	j	computer_choice		# jump to cmoputer_choice
	
setC1R3Player:
	la	$t9, row3		# load row into $t9
	lw	$t8, 0($t9)		# load first item of row into $8
	bnez	$t8, setC1R4Player	# jump to next row if it's occupied
	li	$t7, 1			# set equal to one
	sw	$t7, 0($t9)		# store number back into array

	j	computer_choice		# jump to cmoputer_choice
	
setC1R4Player:
	la	$t9, row4		# load row into $t9
	lw	$t8, 0($t9)		# load first item of row into $8
	bnez	$t8, setC1R5Player	# jump to next row if it's occupied
	li	$t7, 1			# set equal to one
	sw	$t7, 0($t9)		# store number back into array

	j	computer_choice		# jump to cmoputer_choice

setC1R5Player:
	la	$t9, row5		# load row into $t9
	lw	$t8, 0($t9)		# load first item of row into $8
	bnez	$t8, setC1R6Player	# jump to next row if it's occupied
	li	$t7, 1			# set equal to one
	sw	$t7, 0($t9)		# store number back into array

	j	computer_choice		# jump to cmoputer_choice
	
setC1R6Player:
	la	$t9, row6		# load row into $t9
	lw	$t8, 0($t9)		# load first item of row into $8
	bnez	$t8, setC1R7Player	# jump to next row if it's occupied
	li	$t7, 1			# set equal to one
	sw	$t7, 0($t9)		# store number back into array

	li	$s5, 1			# load 1 into $s5
	sw	$s5, col1Full		# store 1 in col1Full

	j	computer_choice		# jump to cmoputer_choice

setC1R7Player:
	li	$v0, 4			# load for 4 print string
	la	$a0, columnFull		# load string address
	syscall				# print string
	
	j	loop			# jump back to main loop

equalToTwo:
	la	$t9, row1		# load row into $t9
	lw	$t8, 4($t9)		# load first item of row into $8
	bnez	$t8, setC2R2Player	# jump to next row if it's occupied
	li	$t7, 1			# set equal to one
	sw	$t7, 4($t9)		# store number back into array
	
	j	computer_choice		# jump to cmoputer_choice
	
setC2R2Player:
	la	$t9, row2		# load row into $t9
	lw	$t8, 4($t9)		# load first item of row into $8
	bnez	$t8, setC2R3Player	# jump to next row if it's occupied
	li	$t7, 1			# set equal to one
	sw	$t7, 4($t9)		# store number back into array

	j	computer_choice		# jump to cmoputer_choice
	
setC2R3Player:
	la	$t9, row3		# load row into $t9
	lw	$t8, 4($t9)		# load first item of row into $8
	bnez	$t8, setC2R4Player	# jump to next row if it's occupied
	li	$t7, 1			# set equal to one
	sw	$t7, 4($t9)		# store number back into array

	j	computer_choice		# jump to cmoputer_choice
	
setC2R4Player:
	la	$t9, row4		# load row into $t9
	lw	$t8, 4($t9)		# load first item of row into $8
	bnez	$t8, setC2R5Player	# jump to next row if it's occupied
	li	$t7, 1			# set equal to one
	sw	$t7, 4($t9)		# store number back into array

	j	computer_choice		# jump to cmoputer_choice

setC2R5Player:
	la	$t9, row5		# load row into $t9
	lw	$t8, 4($t9)		# load first item of row into $8
	bnez	$t8, setC2R6Player	# jump to next row if it's occupied
	li	$t7, 1			# set equal to one
	sw	$t7, 4($t9)		# store number back into array

	j	computer_choice		# jump to cmoputer_choice
	
setC2R6Player:
	la	$t9, row6		# load row into $t9
	lw	$t8, 4($t9)		# load first item of row into $8
	bnez	$t8, setC2R7Player	# jump to next row if it's occupied
	li	$t7, 1			# set equal to one
	sw	$t7, 4($t9)		# store number back into array

	li	$s5, 1			# load 1 into $s5
	sw	$s5, col2Full		# store 1 in col2Full

	j	computer_choice		# jump to cmoputer_choice

setC2R7Player:
	li	$v0, 4			# load for 4 print string
	la	$a0, columnFull		# load string address
	syscall				# print string
	
	j	loop			# jump back to main loop

equalToThree:
	la	$t9, row1		# load row into $t9
	lw	$t8, 8($t9)		# load first item of row into $8
	bnez	$t8, setC3R2Player	# jump to next row if it's occupied
	li	$t7, 1			# set equal to one
	sw	$t7, 8($t9)		# store number back into array
	
	j	computer_choice		# jump to cmoputer_choice
	
setC3R2Player:
	la	$t9, row2		# load row into $t9
	lw	$t8, 8($t9)		# load first item of row into $8
	bnez	$t8, setC3R3Player	# jump to next row if it's occupied
	li	$t7, 1			# set equal to one
	sw	$t7, 8($t9)		# store number back into array

	j	computer_choice		# jump to cmoputer_choice
	
setC3R3Player:
	la	$t9, row3		# load row into $t9
	lw	$t8, 8($t9)		# load first item of row into $8
	bnez	$t8, setC3R4Player	# jump to next row if it's occupied
	li	$t7, 1			# set equal to one
	sw	$t7, 8($t9)		# store number back into array

	j	computer_choice		# jump to cmoputer_choice
	
setC3R4Player:
	la	$t9, row4		# load row into $t9
	lw	$t8, 8($t9)		# load first item of row into $8
	bnez	$t8, setC3R5Player	# jump to next row if it's occupied
	li	$t7, 1			# set equal to one
	sw	$t7, 8($t9)		# store number back into array

	j	computer_choice		# jump to cmoputer_choice

setC3R5Player:
	la	$t9, row5		# load row into $t9
	lw	$t8, 8($t9)		# load first item of row into $8
	bnez	$t8, setC3R6Player	# jump to next row if it's occupied
	li	$t7, 1			# set equal to one
	sw	$t7, 8($t9)		# store number back into array

	j	computer_choice		# jump to cmoputer_choice
	
setC3R6Player:
	la	$t9, row6		# load row into $t9
	lw	$t8, 8($t9)		# load first item of row into $8
	bnez	$t8, setC3R7Player	# jump to next row if it's occupied
	li	$t7, 1			# set equal to one
	sw	$t7, 8($t9)		# store number back into array

	li	$s5, 1			# load 1 into $s5
	sw	$s5, col3Full		# store 1 in col3Full

	j	computer_choice		# jump to cmoputer_choice

setC3R7Player:
	li	$v0, 4			# load for 4 print string
	la	$a0, columnFull		# load string address
	syscall				# print string
	
	j	loop			# jump back to main loop

jal	check_for_win

computer_choice:
	li 	$a1, 3  		# load 3 to $a1 (max bound for syscall)
    	li 	$v0, 42  		# generates the random number.
    	syscall
    	
    	add 	$a0, $a0, 1  		# add to the lowest bound for syscall
    	move	$t6, $a0 
    	
    	beq	$t6, 1, equalToOneComp	# jump to 'one' branch
    	beq	$t6, 2, equalToTwoComp	# jump to 'two' branch
    	beq	$t6, 3, equalToThreeComp# jump to 'three' branch
    	
equalToOneComp:
	la	$t9, row1		# load row into $t9
	lw	$t8, 0($t9)		# load first item of row into $8
	bnez	$t8, setC1R2Comp	# jump to next row if it's occupied
	li	$t7, 2			# set equal to one
	sw	$t7, 0($t9)		# store number back into array
	
	j	computer_choice_good	# jump to cmoputer_choice
	
setC1R2Comp:
	la	$t9, row2		# load row into $t9
	lw	$t8, 0($t9)		# load first item of row into $8
	bnez	$t8, setC1R3Comp	# jump to next row if it's occupied
	li	$t7, 2			# set equal to one
	sw	$t7, 0($t9)		# store number back into array
	
	j	computer_choice_good	# jump to cmoputer_choice
	
setC1R3Comp:
	la	$t9, row3		# load row into $t9
	lw	$t8, 0($t9)		# load first item of row into $8
	bnez	$t8, setC1R4Comp	# jump to next row if it's occupied
	li	$t7, 2			# set equal to one
	sw	$t7, 0($t9)		# store number back into array
	
	j	computer_choice_good	# jump to cmoputer_choice
	
setC1R4Comp:
	la	$t9, row4		# load row into $t9
	lw	$t8, 0($t9)		# load first item of row into $8
	bnez	$t8, setC1R5Comp	# jump to next row if it's occupied
	li	$t7, 2			# set equal to one
	sw	$t7, 0($t9)		# store number back into array
	
	j	computer_choice_good	# jump to cmoputer_choice
	
setC1R5Comp:
	la	$t9, row5		# load row into $t9
	lw	$t8, 0($t9)		# load first item of row into $8
	bnez	$t8, setC1R6Comp	# jump to next row if it's occupied
	li	$t7, 2			# set equal to one
	sw	$t7, 0($t9)		# store number back into array
	
	j	computer_choice_good	# jump to cmoputer_choice
	
setC1R6Comp:
	la	$t9, row6		# load row into $t9
	lw	$t8, 0($t9)		# load first item of row into $8
	bnez	$t8, setC1R7Comp	# jump to next row if it's occupied
	li	$t7, 2			# set equal to one
	sw	$t7, 0($t9)		# store number back into array
	
	li	$s5, 1			# load 1 into $s5
	sw	$s5, col1Full		# store 1 in col1Full
	
	j	computer_choice_good	# jump to cmoputer_choice

setC1R7Comp:
	j	computer_choice

	#jal	check_for_win

equalToTwoComp:
	la	$t9, row1		# load row into $t9
	lw	$t8, 4($t9)		# load first item of row into $8
	bnez	$t8, setC2R2Comp	# jump to next row if it's occupied
	li	$t7, 2			# set equal to one
	sw	$t7, 4($t9)		# store number back into array
	
	j	computer_choice_good	# jump to cmoputer_choice
	
setC2R2Comp:
	la	$t9, row2		# load row into $t9
	lw	$t8, 4($t9)		# load first item of row into $8
	bnez	$t8, setC2R3Comp	# jump to next row if it's occupied
	li	$t7, 2			# set equal to one
	sw	$t7, 4($t9)		# store number back into array
	
	j	computer_choice_good	# jump to cmoputer_choice
	
setC2R3Comp:
	la	$t9, row3		# load row into $t9
	lw	$t8, 4($t9)		# load first item of row into $8
	bnez	$t8, setC2R4Comp	# jump to next row if it's occupied
	li	$t7, 2			# set equal to one
	sw	$t7, 4($t9)		# store number back into array
	
	j	computer_choice_good	# jump to cmoputer_choice
	
setC2R4Comp:
	la	$t9, row4		# load row into $t9
	lw	$t8, 4($t9)		# load first item of row into $8
	bnez	$t8, setC2R5Comp	# jump to next row if it's occupied
	li	$t7, 2			# set equal to one
	sw	$t7, 4($t9)		# store number back into array
	
	j	computer_choice_good	# jump to cmoputer_choice
	
setC2R5Comp:
	la	$t9, row5		# load row into $t9
	lw	$t8, 4($t9)		# load first item of row into $8
	bnez	$t8, setC2R6Comp	# jump to next row if it's occupied
	li	$t7, 2			# set equal to one
	sw	$t7, 4($t9)		# store number back into array
	
	j	computer_choice_good	# jump to cmoputer_choice
	
setC2R6Comp:
	la	$t9, row6		# load row into $t9
	lw	$t8, 4($t9)		# load first item of row into $8
	bnez	$t8, setC2R7Comp	# jump to next row if it's occupied
	li	$t7, 2			# set equal to one
	sw	$t7, 4($t9)		# store number back into array
	
	li	$s5, 1			# load 1 into $s5
	sw	$s5, col2Full		# store 1 in col2Full
	
	j	computer_choice_good	# jump to cmoputer_choice

setC2R7Comp:
	j	computer_choice

equalToThreeComp:
	la	$t9, row1		# load row into $t9
	lw	$t8, 8($t9)		# load first item of row into $8
	bnez	$t8, setC3R2Comp	# jump to next row if it's occupied
	li	$t7, 2			# set equal to one
	sw	$t7, 8($t9)		# store number back into array
	
	j	computer_choice_good	# jump to cmoputer_choice
	
setC3R2Comp:
	la	$t9, row2		# load row into $t9
	lw	$t8, 8($t9)		# load first item of row into $8
	bnez	$t8, setC3R3Comp	# jump to next row if it's occupied
	li	$t7, 2			# set equal to one
	sw	$t7, 8($t9)		# store number back into array
	
	j	computer_choice_good	# jump to cmoputer_choice
	
setC3R3Comp:
	la	$t9, row3		# load row into $t9
	lw	$t8, 8($t9)		# load first item of row into $8
	bnez	$t8, setC3R4Comp	# jump to next row if it's occupied
	li	$t7, 2			# set equal to one
	sw	$t7, 8($t9)		# store number back into array
	
	j	computer_choice_good	# jump to cmoputer_choice
	
setC3R4Comp:
	la	$t9, row4		# load row into $t9
	lw	$t8, 8($t9)		# load first item of row into $8
	bnez	$t8, setC3R5Comp	# jump to next row if it's occupied
	li	$t7, 2			# set equal to one
	sw	$t7, 8($t9)		# store number back into array
	
	j	computer_choice_good	# jump to cmoputer_choice
	
setC3R5Comp:
	la	$t9, row5		# load row into $t9
	lw	$t8, 8($t9)		# load first item of row into $8
	bnez	$t8, setC3R6Comp	# jump to next row if it's occupied
	li	$t7, 2			# set equal to one
	sw	$t7, 8($t9)		# store number back into array
	
	j	computer_choice_good	# jump to cmoputer_choice
	
setC3R6Comp:
	la	$t9, row6		# load row into $t9
	lw	$t8, 8($t9)		# load first item of row into $8
	bnez	$t8, setC3R7Comp	# jump to next row if it's occupied
	li	$t7, 2			# set equal to one
	sw	$t7, 8($t9)		# store number back into array
	
	li	$s5, 1			# load 1 into $s5
	sw	$s5, col3Full		# store 1 in col3Full
	
	j	computer_choice_good	# jump to cmoputer_choice

setC3R7Comp:
	j	computer_choice
    	
computer_choice_good:
    	
    	li	$v0, 4			# load for 4 print string
	la	$a0, youChose		# load string address
	syscall				# print string
	
	li	$v0, 1			# load 1 for print integer
	move	$a0, $t0		# load integer (user's input)
	syscall				# print integer
	
	li	$v0, 4			# load for 4 print string
	la	$a0, newline		# load string address
	syscall				# print string
    	
    	li	$v0, 4			# load for 4 print string
	la	$a0, computerChose	# load string address
	syscall				# print string
    	
    	li	$v0, 1			# load 1 for print integer
    	move	$a0, $t6		# load $t7 for computer's choice
    	syscall				# print integer
    	
    	li	$v0, 4			# load for 4 print string
	la	$a0, newline		# load string address
	syscall				# print string
    	
    	jal	check_for_win
    	
    	j	loop
    	
check_for_win:
	la	$t7, row1		# load row
	lw	$t1, 0($t7)		# load item in row
	lw	$t2, 4($t7)		# load item in row
	lw	$t3, 8($t7)		# load item in row
	
	bne 	$t1, 1, step2Player	# continue if row item is not 1
	bne	$t2, 1, step2Player	# continue if row item is not 1
	bne	$t3, 1, step2Player	# continue if row item is not 1
	
	j player_wins			# jump to player wins

step2Player:
	la	$t7, row1		# load row
	la	$t8, row2		# load row
	la	$t9, row3		# load row
	lw	$t1, 0($t7)		# load item in row
	lw	$t2, 4($t8)		# load item in row
	lw	$t3, 8($t9)		# load item in row
	
	bne 	$t1, 1, step3Player	# continue if row item is not 1
	bne	$t2, 1, step3Player	# continue if row item is not 1
	bne	$t3, 1, step3Player	# continue if row item is not 1
	
	j player_wins

step3Player:
	la	$t7, row1		# load row
	la	$t8, row2		# load row
	la	$t9, row3		# load row
	lw	$t1, 0($t7)		# load item in row
	lw	$t2, 0($t8)		# load item in row
	lw	$t3, 0($t9)		# load item in row
	
	bne 	$t1, 1, step4Player	# continue if row item is not 1
	bne	$t2, 1, step4Player	# continue if row item is not 1
	bne	$t3, 1, step4Player	# continue if row item is not 1
	
	j player_wins

step4Player:
	la	$t7, row1		# load row
	la	$t8, row2		# load row
	la	$t9, row3		# load row
	lw	$t1, 4($t7)		# load item in row
	lw	$t2, 4($t8)		# load item in row
	lw	$t3, 4($t9)		# load item in row
	
	bne 	$t1, 1, step5Player	# continue if row item is not 1
	bne	$t2, 1, step5Player	# continue if row item is not 1
	bne	$t3, 1, step5Player	# continue if row item is not 1
	
	j player_wins

step5Player:
	la	$t7, row1		# load row
	la	$t8, row2		# load row
	la	$t9, row3		# load row
	lw	$t1, 8($t7)		# load item in row
	lw	$t2, 4($t8)		# load item in row
	lw	$t3, 0($t9)		# load item in row
	
	bne 	$t1, 1, step6Player	# continue if row item is not 1
	bne	$t2, 1, step6Player	# continue if row item is not 1
	bne	$t3, 1, step6Player	# continue if row item is not 1
	
	j player_wins

step6Player:
	la	$t7, row1		# load row
	la	$t8, row2		# load row
	la	$t9, row3		# load row
	lw	$t1, 8($t7)		# load item in row
	lw	$t2, 8($t8)		# load item in row
	lw	$t3, 8($t9)		# load item in row
	
	bne 	$t1, 1, step7Player	# continue if row item is not 1
	bne	$t2, 1, step7Player	# continue if row item is not 1
	bne	$t3, 1, step7Player	# continue if row item is not 1
	
	j player_wins

step7Player:
	la	$t7, row2		# load row
	lw	$t1, 0($t7)		# load item in row
	lw	$t2, 4($t7)		# load item in row
	lw	$t3, 8($t7)		# load item in row
	
	bne 	$t1, 1, step8Player	# continue if row item is not 1
	bne	$t2, 1, step8Player	# continue if row item is not 1
	bne	$t3, 1, step8Player	# continue if row item is not 1
	
	j player_wins			# jump to player wins

step8Player:   
	la	$t7, row2		# load row
	la	$t8, row3		# load row
	la	$t9, row4		# load row
	lw	$t1, 0($t7)		# load item in row
	lw	$t2, 4($t8)		# load item in row
	lw	$t3, 8($t9)		# load item in row
	
	bne 	$t1, 1, step9Player	# continue if row item is not 1
	bne	$t2, 1, step9Player	# continue if row item is not 1
	bne	$t3, 1, step9Player	# continue if row item is not 1
	
	j player_wins

step9Player:
	la	$t7, row2		# load row
	la	$t8, row3		# load row
	la	$t9, row4		# load row
	lw	$t1, 0($t7)		# load item in row
	lw	$t2, 0($t8)		# load item in row
	lw	$t3, 0($t9)		# load item in row
	
	bne 	$t1, 1, step10Player	# continue if row item is not 1
	bne	$t2, 1, step10Player	# continue if row item is not 1
	bne	$t3, 1, step10Player	# continue if row item is not 1
	
	j player_wins

step10Player:
	la	$t7, row2		# load row
	la	$t8, row3		# load row
	la	$t9, row4		# load row
	lw	$t1, 4($t7)		# load item in row
	lw	$t2, 4($t8)		# load item in row
	lw	$t3, 4($t9)		# load item in row
	
	bne 	$t1, 1, step11Player	# continue if row item is not 1
	bne	$t2, 1, step11Player	# continue if row item is not 1
	bne	$t3, 1, step11Player	# continue if row item is not 1
	
	j player_wins
	
step11Player:
	la	$t7, row2		# load row
	la	$t8, row3		# load row
	la	$t9, row4		# load row
	lw	$t1, 8($t7)		# load item in row
	lw	$t2, 4($t8)		# load item in row
	lw	$t3, 0($t9)		# load item in row
	
	bne 	$t1, 1, step12Player	# continue if row item is not 1
	bne	$t2, 1, step12Player	# continue if row item is not 1
	bne	$t3, 1, step12Player	# continue if row item is not 1
	
	j player_wins
	
step12Player:
	la	$t7, row2		# load row
	la	$t8, row3		# load row
	la	$t9, row4		# load row
	lw	$t1, 8($t7)		# load item in row
	lw	$t2, 8($t8)		# load item in row
	lw	$t3, 8($t9)		# load item in row
	
	bne 	$t1, 1, step13Player	# continue if row item is not 1
	bne	$t2, 1, step13Player	# continue if row item is not 1
	bne	$t3, 1, step13Player	# continue if row item is not 1
	
	j player_wins
	
step13Player:
	la	$t7, row3		# load row
	lw	$t1, 0($t7)		# load item in row
	lw	$t2, 4($t7)		# load item in row
	lw	$t3, 8($t7)		# load item in row
	
	bne 	$t1, 1, step14Player	# continue if row item is not 1
	bne	$t2, 1, step14Player	# continue if row item is not 1
	bne	$t3, 1, step14Player	# continue if row item is not 1
	
	j player_wins			# jump to player wins
	
step14Player:
	la	$t7, row3		# load row
	la	$t8, row4		# load row
	la	$t9, row5		# load row
	lw	$t1, 0($t7)		# load item in row
	lw	$t2, 4($t8)		# load item in row
	lw	$t3, 8($t9)		# load item in row
	
	bne 	$t1, 1, step15Player	# continue if row item is not 1
	bne	$t2, 1, step15Player	# continue if row item is not 1
	bne	$t3, 1, step15Player	# continue if row item is not 1
	
	j player_wins			# jump to player wins
	
step15Player:
	la	$t7, row3		# load row
	la	$t8, row4		# load row
	la	$t9, row5		# load row
	lw	$t1, 0($t7)		# load item in row
	lw	$t2, 0($t8)		# load item in row
	lw	$t3, 0($t9)		# load item in row
	
	bne 	$t1, 1, step16Player	# continue if row item is not 1
	bne	$t2, 1, step16Player	# continue if row item is not 1
	bne	$t3, 1, step16Player	# continue if row item is not 1
	
	j player_wins			# jump to player wins
	
step16Player:
	la	$t7, row3		# load row
	la	$t8, row4		# load row
	la	$t9, row5		# load row
	lw	$t1, 4($t7)		# load item in row
	lw	$t2, 4($t8)		# load item in row
	lw	$t3, 4($t9)		# load item in row
	
	bne 	$t1, 1, step17Player	# continue if row item is not 1
	bne	$t2, 1, step17Player	# continue if row item is not 1
	bne	$t3, 1, step17Player	# continue if row item is not 1
	
	j player_wins			# jump to player wins
	
step17Player:
	la	$t7, row3		# load row
	la	$t8, row4		# load row
	la	$t9, row5		# load row
	lw	$t1, 8($t7)		# load item in row
	lw	$t2, 4($t8)		# load item in row
	lw	$t3, 0($t9)		# load item in row
	
	bne 	$t1, 1, step18Player	# continue if row item is not 1
	bne	$t2, 1, step18Player	# continue if row item is not 1
	bne	$t3, 1, step18Player	# continue if row item is not 1
	
	j player_wins			# jump to player wins

step18Player:
	la	$t7, row3		# load row
	la	$t8, row4		# load row
	la	$t9, row5		# load row
	lw	$t1, 8($t7)		# load item in row
	lw	$t2, 8($t8)		# load item in row
	lw	$t3, 8($t9)		# load item in row
	
	bne 	$t1, 1, step19Player	# continue if row item is not 1
	bne	$t2, 1, step19Player	# continue if row item is not 1
	bne	$t3, 1, step19Player	# continue if row item is not 1
	
	j player_wins			# jump to player wins

step19Player:
	la	$t7, row4		# load row
	lw	$t1, 0($t7)		# load item in row
	lw	$t2, 4($t7)		# load item in row
	lw	$t3, 8($t7)		# load item in row
	
	bne 	$t1, 1, step20Player	# continue if row item is not 1
	bne	$t2, 1, step20Player	# continue if row item is not 1
	bne	$t3, 1, step20Player	# continue if row item is not 1
	
	j player_wins			# jump to player wins
	
step20Player:
	la	$t7, row4		# load row
	la	$t8, row5		# load row
	la	$t9, row6		# load row
	lw	$t1, 0($t7)		# load item in row
	lw	$t2, 4($t8)		# load item in row
	lw	$t3, 8($t9)		# load item in row
	
	bne 	$t1, 1, step21Player	# continue if row item is not 1
	bne	$t2, 1, step21Player	# continue if row item is not 1
	bne	$t3, 1, step21Player	# continue if row item is not 1
	
	j player_wins			# jump to player wins
	
step21Player:
	la	$t7, row4		# load row
	la	$t8, row5		# load row
	la	$t9, row6		# load row
	lw	$t1, 0($t7)		# load item in row
	lw	$t2, 0($t8)		# load item in row
	lw	$t3, 0($t9)		# load item in row
	
	bne 	$t1, 1, step22Player	# continue if row item is not 1
	bne	$t2, 1, step22Player	# continue if row item is not 1
	bne	$t3, 1, step22Player	# continue if row item is not 1
	
	j player_wins			# jump to player wins

step22Player:
	la	$t7, row4		# load row
	la	$t8, row5		# load row
	la	$t9, row6		# load row
	lw	$t1, 4($t7)		# load item in row
	lw	$t2, 4($t8)		# load item in row
	lw	$t3, 4($t9)		# load item in row
	
	bne 	$t1, 1, step23Player	# continue if row item is not 1
	bne	$t2, 1, step23Player	# continue if row item is not 1
	bne	$t3, 1, step23Player	# continue if row item is not 1
	
	j player_wins			# jump to player wins
	
step23Player:
	la	$t7, row4		# load row
	la	$t8, row5		# load row
	la	$t9, row6		# load row
	lw	$t1, 8($t7)		# load item in row
	lw	$t2, 4($t8)		# load item in row
	lw	$t3, 0($t9)		# load item in row
	
	bne 	$t1, 1, step24Player	# continue if row item is not 1
	bne	$t2, 1, step24Player	# continue if row item is not 1
	bne	$t3, 1, step24Player	# continue if row item is not 1
	
	j player_wins			# jump to player wins
	
step24Player:
	la	$t7, row4		# load row
	la	$t8, row5		# load row
	la	$t9, row6		# load row
	lw	$t1, 8($t7)		# load item in row
	lw	$t2, 8($t8)		# load item in row
	lw	$t3, 8($t9)		# load item in row
	
	bne 	$t1, 1, step25Player	# continue if row item is not 1
	bne	$t2, 1, step25Player	# continue if row item is not 1
	bne	$t3, 1, step25Player	# continue if row item is not 1
	
	j player_wins			# jump to player wins
	
step25Player:
	la	$t7, row5		# load row
	lw	$t1, 0($t7)		# load item in row
	lw	$t2, 4($t7)		# load item in row
	lw	$t3, 8($t7)		# load item in row
	
	bne 	$t1, 1, step26Player	# continue if row item is not 1
	bne	$t2, 1, step26Player	# continue if row item is not 1
	bne	$t3, 1, step26Player	# continue if row item is not 1
	
	j player_wins			# jump to player wins

step26Player:
	la	$t7, row6		# load row
	lw	$t1, 0($t7)		# load item in row
	lw	$t2, 4($t7)		# load item in row
	lw	$t3, 8($t7)		# load item in row
	
	bne 	$t1, 1, step1Comp	# continue if row item is not 1
	bne	$t2, 1, step1Comp	# continue if row item is not 1
	bne	$t3, 1, step1Comp	# continue if row item is not 1
	
	j player_wins			# jump to player wins

step1Comp:
	la	$t7, row1		# load row
	lw	$t1, 0($t7)		# load item in row
	lw	$t2, 4($t7)		# load item in row
	lw	$t3, 8($t7)		# load item in row
	
	bne 	$t1, 2, step2Comp	# continue if row item is not 2
	bne	$t2, 2, step2Comp	# continue if row item is not 2
	bne	$t3, 2, step2Comp	# continue if row item is not 2
	
	j computer_wins			# jump to computer wins

step2Comp:
	la	$t7, row1		# load row
	la	$t8, row2		# load row
	la	$t9, row3		# load row
	lw	$t1, 0($t7)		# load item in row
	lw	$t2, 4($t8)		# load item in row
	lw	$t3, 8($t9)		# load item in row
	
	bne 	$t1, 2, step3Comp	# continue if row item is not 2
	bne	$t2, 2, step3Comp	# continue if row item is not 2
	bne	$t3, 2, step3Comp	# continue if row item is not 2
	
	j computer_wins			# jump to computer wins

step3Comp:
	la	$t7, row1		# load row
	la	$t8, row2		# load row
	la	$t9, row3		# load row
	lw	$t1, 0($t7)		# load item in row
	lw	$t2, 0($t8)		# load item in row
	lw	$t3, 0($t9)		# load item in row
	
	bne 	$t1, 2, step4Comp	# continue if row item is not 2
	bne	$t2, 2, step4Comp	# continue if row item is not 2
	bne	$t3, 2, step4Comp	# continue if row item is not 2
	
	j computer_wins			# jump to computer wins

step4Comp:
	la	$t7, row1		# load row
	la	$t8, row2		# load row
	la	$t9, row3		# load row
	lw	$t1, 4($t7)		# load item in row
	lw	$t2, 4($t8)		# load item in row
	lw	$t3, 4($t9)		# load item in row
	
	bne 	$t1, 2, step5Comp	# continue if row item is not 2
	bne	$t2, 2, step5Comp	# continue if row item is not 2
	bne	$t3, 2, step5Comp	# continue if row item is not 2
	
	j computer_wins			# jump to computer wins

step5Comp:
	la	$t7, row1		# load row
	la	$t8, row2		# load row
	la	$t9, row3		# load row
	lw	$t1, 8($t7)		# load item in row
	lw	$t2, 4($t8)		# load item in row
	lw	$t3, 0($t9)		# load item in row
	
	bne 	$t1, 2, step6Comp	# continue if row item is not 2
	bne	$t2, 2, step6Comp	# continue if row item is not 2
	bne	$t3, 2, step6Comp	# continue if row item is not 2
	
	j computer_wins			# jump to computer wins

step6Comp:
	la	$t7, row1		# load row
	la	$t8, row2		# load row
	la	$t9, row3		# load row
	lw	$t1, 8($t7)		# load item in row
	lw	$t2, 8($t8)		# load item in row
	lw	$t3, 8($t9)		# load item in row
	
	bne 	$t1, 2, step7Comp	# continue if row item is not 2
	bne	$t2, 2, step7Comp	# continue if row item is not 2
	bne	$t3, 2, step7Comp	# continue if row item is not 2
	
	j computer_wins			# jump to computer wins
	
step7Comp:
	la	$t7, row2		# load row
	lw	$t1, 0($t7)		# load item in row
	lw	$t2, 4($t7)		# load item in row
	lw	$t3, 8($t7)		# load item in row
	
	bne 	$t1, 2, step8Comp	# continue if row item is not 2
	bne	$t2, 2, step8Comp	# continue if row item is not 2
	bne	$t3, 2, step8Comp	# continue if row item is not 2
	
	j computer_wins			# jump to computer wins

step8Comp:
	la	$t7, row2		# load row
	la	$t8, row3		# load row
	la	$t9, row4		# load row
	lw	$t1, 0($t7)		# load item in row
	lw	$t2, 4($t8)		# load item in row
	lw	$t3, 8($t9)		# load item in row
	
	bne 	$t1, 2, step9Comp	# continue if row item is not 2
	bne	$t2, 2, step9Comp	# continue if row item is not 2
	bne	$t3, 2, step9Comp	# continue if row item is not 2
	
	j computer_wins			# jump to computer wins

step9Comp:
	la	$t7, row2		# load row
	la	$t8, row3		# load row
	la	$t9, row4		# load row
	lw	$t1, 0($t7)		# load item in row
	lw	$t2, 0($t8)		# load item in row
	lw	$t3, 0($t9)		# load item in row
	
	bne 	$t1, 2, step10Comp	# continue if row item is not 2
	bne	$t2, 2, step10Comp	# continue if row item is not 2
	bne	$t3, 2, step10Comp	# continue if row item is not 2
	
	j computer_wins			# jump to computer wins

step10Comp:
	la	$t7, row2		# load row
	la	$t8, row3		# load row
	la	$t9, row4		# load row
	lw	$t1, 4($t7)		# load item in row
	lw	$t2, 4($t8)		# load item in row
	lw	$t3, 4($t9)		# load item in row
	
	bne 	$t1, 2, step11Comp	# continue if row item is not 2
	bne	$t2, 2, step11Comp	# continue if row item is not 2
	bne	$t3, 2, step11Comp	# continue if row item is not 2
	
	j computer_wins			# jump to computer wins
	
step11Comp:
	la	$t7, row2		# load row
	la	$t8, row3		# load row
	la	$t9, row4		# load row
	lw	$t1, 8($t7)		# load item in row
	lw	$t2, 4($t8)		# load item in row
	lw	$t3, 0($t9)		# load item in row
	
	bne 	$t1, 2, step12Comp	# continue if row item is not 2
	bne	$t2, 2, step12Comp	# continue if row item is not 2
	bne	$t3, 2, step12Comp	# continue if row item is not 2
	
	j computer_wins			# jump to computer wins
	
step12Comp:
	la	$t7, row2		# load row
	la	$t8, row3		# load row
	la	$t9, row4		# load row
	lw	$t1, 8($t7)		# load item in row
	lw	$t2, 8($t8)		# load item in row
	lw	$t3, 8($t9)		# load item in row
	
	bne 	$t1, 2, step13Comp	# continue if row item is not 2
	bne	$t2, 2, step13Comp	# continue if row item is not 2
	bne	$t3, 2, step13Comp	# continue if row item is not 2
	
	j computer_wins			# jump to computer wins
	
step13Comp:
	la	$t7, row3		# load row
	lw	$t1, 0($t7)		# load item in row
	lw	$t2, 4($t7)		# load item in row
	lw	$t3, 8($t7)		# load item in row
	
	bne 	$t1, 2, step14Comp	# continue if row item is not 2
	bne	$t2, 2, step14Comp	# continue if row item is not 2
	bne	$t3, 2, step14Comp	# continue if row item is not 2
	
	j computer_wins			# jump to computer wins
	
step14Comp:
	la	$t7, row3		# load row
	la	$t8, row4		# load row
	la	$t9, row5		# load row
	lw	$t1, 0($t7)		# load item in row
	lw	$t2, 4($t8)		# load item in row
	lw	$t3, 8($t9)		# load item in row
	
	bne 	$t1, 2, step15Comp	# continue if row item is not 2
	bne	$t2, 2, step15Comp	# continue if row item is not 2
	bne	$t3, 2, step15Comp	# continue if row item is not 2
	
	j computer_wins			# jump to computer wins
	
step15Comp:
	la	$t7, row3		# load row
	la	$t8, row4		# load row
	la	$t9, row5		# load row
	lw	$t1, 0($t7)		# load item in row
	lw	$t2, 0($t8)		# load item in row
	lw	$t3, 0($t9)		# load item in row
	
	bne 	$t1, 2, step16Comp	# continue if row item is not 2
	bne	$t2, 2, step16Comp	# continue if row item is not 2
	bne	$t3, 2, step16Comp	# continue if row item is not 2
	
	j computer_wins			# jump to computer wins
	
step16Comp:
	la	$t7, row3		# load row
	la	$t8, row4		# load row
	la	$t9, row5		# load row
	lw	$t1, 4($t7)		# load item in row
	lw	$t2, 4($t8)		# load item in row
	lw	$t3, 4($t9)		# load item in row
	
	bne 	$t1, 2, step17Comp	# continue if row item is not 2
	bne	$t2, 2, step17Comp	# continue if row item is not 2
	bne	$t3, 2, step17Comp	# continue if row item is not 2
	
	j computer_wins			# jump to computer wins
	
step17Comp:
	la	$t7, row3		# load row
	la	$t8, row4		# load row
	la	$t9, row5		# load row
	lw	$t1, 8($t7)		# load item in row
	lw	$t2, 4($t8)		# load item in row
	lw	$t3, 0($t9)		# load item in row
	
	bne 	$t1, 2, step18Comp	# continue if row item is not 2
	bne	$t2, 2, step18Comp	# continue if row item is not 2
	bne	$t3, 2, step18Comp	# continue if row item is not 2
	
	j computer_wins			# jump to computer wins

step18Comp:
	la	$t7, row3		# load row
	la	$t8, row4		# load row
	la	$t9, row5		# load row
	lw	$t1, 8($t7)		# load item in row
	lw	$t2, 8($t8)		# load item in row
	lw	$t3, 8($t9)		# load item in row
	
	bne 	$t1, 2, step19Comp	# continue if row item is not 2
	bne	$t2, 2, step19Comp	# continue if row item is not 2
	bne	$t3, 2, step19Comp	# continue if row item is not 2
	
	j computer_wins			# jump to computer wins

step19Comp:
	la	$t7, row4		# load row
	lw	$t1, 0($t7)		# load item in row
	lw	$t2, 4($t7)		# load item in row
	lw	$t3, 8($t7)		# load item in row
	
	bne 	$t1, 2, step20Comp	# continue if row item is not 2
	bne	$t2, 2, step20Comp	# continue if row item is not 2
	bne	$t3, 2, step20Comp	# continue if row item is not 2
	
	j computer_wins			# jump to computer wins
	
step20Comp:
	la	$t7, row4		# load row
	la	$t8, row5		# load row
	la	$t9, row6		# load row
	lw	$t1, 0($t7)		# load item in row
	lw	$t2, 4($t8)		# load item in row
	lw	$t3, 8($t9)		# load item in row
	
	bne 	$t1, 2, step21Comp	# continue if row item is not 2
	bne	$t2, 2, step21Comp	# continue if row item is not 2
	bne	$t3, 2, step21Comp	# continue if row item is not 2
	
	j computer_wins			# jump to computer wins
	
step21Comp:
	la	$t7, row4		# load row
	la	$t8, row5		# load row
	la	$t9, row6		# load row
	lw	$t1, 0($t7)		# load item in row
	lw	$t2, 0($t8)		# load item in row
	lw	$t3, 0($t9)		# load item in row
	
	bne 	$t1, 2, step22Comp	# continue if row item is not 2
	bne	$t2, 2, step22Comp	# continue if row item is not 2
	bne	$t3, 2, step22Comp	# continue if row item is not 2
	
	j computer_wins			# jump to computer wins

step22Comp:
	la	$t7, row4		# load row
	la	$t8, row5		# load row
	la	$t9, row6		# load row
	lw	$t1, 4($t7)		# load item in row
	lw	$t2, 4($t8)		# load item in row
	lw	$t3, 4($t9)		# load item in row
	
	bne 	$t1, 2, step23Comp	# continue if row item is not 2
	bne	$t2, 2, step23Comp	# continue if row item is not 2
	bne	$t3, 2, step23Comp	# continue if row item is not 2
	
	j computer_wins			# jump to computer wins
	
step23Comp:
	la	$t7, row4		# load row
	la	$t8, row5		# load row
	la	$t9, row6		# load row
	lw	$t1, 8($t7)		# load item in row
	lw	$t2, 4($t8)		# load item in row
	lw	$t3, 0($t9)		# load item in row
	
	bne 	$t1, 2, step24Comp	# continue if row item is not 2
	bne	$t2, 2, step24Comp	# continue if row item is not 2
	bne	$t3, 2, step24Comp	# continue if row item is not 2
	
	j computer_wins			# jump to computer wins
	
step24Comp:
	la	$t7, row4		# load row
	la	$t8, row5		# load row
	la	$t9, row6		# load row
	lw	$t1, 8($t7)		# load item in row
	lw	$t2, 8($t8)		# load item in row
	lw	$t3, 8($t9)		# load item in row
	
	bne 	$t1, 2, step25Comp	# continue if row item is not 2
	bne	$t2, 2, step25Comp	# continue if row item is not 2
	bne	$t3, 2, step25Comp	# continue if row item is not 2
	
	j computer_wins			# jump to computer wins
	
step25Comp:
	la	$t7, row5		# load row
	lw	$t1, 0($t7)		# load item in row
	lw	$t2, 4($t7)		# load item in row
	lw	$t3, 8($t7)		# load item in row
	
	bne 	$t1, 2, step26Comp	# continue if row item is not 2
	bne	$t2, 2, step26Comp	# continue if row item is not 2
	bne	$t3, 2, step26Comp	# continue if row item is not 2
	
	j computer_wins			# jump to computer wins

step26Comp:
	la	$t7, row6		# load row
	lw	$t1, 0($t7)		# load item in row
	lw	$t2, 4($t7)		# load item in row
	lw	$t3, 8($t7)		# load item in row
	
	bne 	$t1, 2, check_for_tie	# continue if row item is not 2
	bne	$t2, 2, check_for_tie	# continue if row item is not 2
	bne	$t3, 2, check_for_tie	# continue if row item is not 2
	
	j computer_wins			# jump to computer wins
	
check_for_tie:
	lw	$s1, col1Full		# load col1Full bool
	beqz	$s1, no_tie		# check if it's still false
	
	lw	$s2, col2Full		# load col2Full bool
	beqz	$s2, no_tie		# check if it's still false
	
	lw	$s3, col3Full		# load col3Full bool
	beqz	$2, no_tie		# check if it's still false
	
	j	tie			# jump to tie: since there's a tie

no_tie:
	jr	$ra			# go back since there is no tie

player_wins:
	jal	print_game_board	# print the game board again

	li	$v0, 4			# load for 4 print string
	la	$a0, playerWinMsg	# load string address
	syscall				# print string
	
	j	ask_play_again		# jump to ask_play_again
computer_wins:
	jal	print_game_board	# print the game board again

	li	$v0, 4			# load for 4 print string
	la	$a0, compWinMsg		# load string address
	syscall				# print string
	
	j	ask_play_again		# jump to ask_play_again

tie:
	jal	print_game_board	# print the game board again
	
	li	$v0, 4			# load for 4 print string
	la	$a0, tieMsg		# load string address
	syscall				# print string
	
	li	$v0, 4			# load for 4 print string
	la	$a0, newline		# load string address
	syscall				# print string
	
	j	ask_play_again		# jump to play again? sequence
	
ask_play_again:
	li	$v0, 4			# load for 4 print string
	la	$a0, playAgainMsg	# load string address
	syscall				# print string
	
	li	$v0, 5			# load 5 for get integer
	syscall				# get integer
	
	move	$t0, $v0		# store keyboard in t0
	
	li	$v0, 4			# load for 4 print string
	la	$a0, newline		# load string address
	syscall				# print string
	
	beqz	$t0, exit		# go to exit if input is 0
	
	j	main			# jump to main if input =/= 0

clear_game_board:
	la	$t9, row6		# load row
	sw	$zero, 0($t9)		# set first item of row to 0
	sw	$zero, 4($t9)		# set second item of row to 0
	sw	$zero, 8($t9)		# set third item of row to 0
	
	la	$t9, row5		# load row
	sw	$zero, 0($t9)		# set first item of row to 0
	sw	$zero, 4($t9)		# set second item of row to 0
	sw	$zero, 8($t9)		# set third item of row to 0
	
	la	$t9, row4		# load row
	sw	$zero, 0($t9)		# set first item of row to 0
	sw	$zero, 4($t9)		# set second item of row to 0
	sw	$zero, 8($t9)		# set third item of row to 0
	
	la	$t9, row3		# load row
	sw	$zero, 0($t9)		# set first item of row to 0
	sw	$zero, 4($t9)		# set second item of row to 0
	sw	$zero, 8($t9)		# set third item of row to 0
	
	la	$t9, row2		# load row
	sw	$zero, 0($t9)		# set first item of row to 0
	sw	$zero, 4($t9)		# set second item of row to 0
	sw	$zero, 8($t9)		# set third item of row to 0
	
	la	$t9, row1		# load row
	sw	$zero, 0($t9)		# set first item of row to 0
	sw	$zero, 4($t9)		# set second item of row to 0
	sw	$zero, 8($t9)		# set third item of row to 0
		
	jr	$ra			# jump back to caller

print_game_board:

	li	$v0, 4			# load 4 for print string
	la	$a0, newline		# load string address
	syscall				# print string

	# print row 6
	li	$v0, 4			# load 4 for print string
	la	$a0, borderPiece	# load string address
	syscall				# print string
	
	la	$t9, row6		# load row into $t9
	lw	$t8, 0($t9)		# load first item of row into $8
	
	li	$v0, 1			# load 1 for print integer
	move	$a0, $t8		# move first item in row to $a0
	syscall				# print integer
	
	li	$v0, 4			# load 4 for print string
	la	$a0, space		# load string address
	syscall				# print string
	
	lw	$t8, 4($t9)		# load second item of row into $8
	
	li	$v0, 1			# load 1 for print integer
	move	$a0, $t8		# move second item in row to $a0
	syscall				# print integer
	
	li	$v0, 4			# load 4 for print string
	la	$a0, space		# load string address
	syscall				# print string
	
	lw	$t8, 8($t9)		# load third item of row into $8
	
	li	$v0, 1			# load 1 for print integer
	move	$a0, $t8		# move third item in row to $a0
	syscall				# print integer
	
	li	$v0, 4			# load 4 for print string
	la	$a0, borderPieceNL	# load string address
	syscall				# print string
	
	# print row 5
	li	$v0, 4			# load 4 for print string
	la	$a0, borderPiece	# load string address
	syscall				# print string
	
	la	$t9, row5		# load row into $t9
	lw	$t8, 0($t9)		# load first item of row into $8
	
	li	$v0, 1			# load 1 for print integer
	move	$a0, $t8		# move first item in row to $a0
	syscall				# print integer
	
	li	$v0, 4			# load 4 for print string
	la	$a0, space		# load string address
	syscall				# print string
	
	lw	$t8, 4($t9)		# load second item of row into $8
	
	li	$v0, 1			# load 1 for print integer
	move	$a0, $t8		# move second item in row to $a0
	syscall				# print integer
	
	li	$v0, 4			# load 4 for print string
	la	$a0, space		# load string address
	syscall				# print string
	
	lw	$t8, 8($t9)		# load third item of row into $8
	
	li	$v0, 1			# load 1 for print integer
	move	$a0, $t8		# move third item in row to $a0
	syscall				# print integer
	
	li	$v0, 4			# load 4 for print string
	la	$a0, borderPieceNL	# load string address
	syscall				# print string
	
	# print row 4
	li	$v0, 4			# load 4 for print string
	la	$a0, borderPiece	# load string address
	syscall				# print string
	
	la	$t9, row4		# load row into $t9
	lw	$t8, 0($t9)		# load first item of row into $8
	
	li	$v0, 1			# load 1 for print integer
	move	$a0, $t8		# move first item in row to $a0
	syscall				# print integer
	
	li	$v0, 4			# load 4 for print string
	la	$a0, space		# load string address
	syscall				# print string
	
	lw	$t8, 4($t9)		# load second item of row into $8
	
	li	$v0, 1			# load 1 for print integer
	move	$a0, $t8		# move second item in row to $a0
	syscall				# print integer
	
	li	$v0, 4			# load 4 for print string
	la	$a0, space		# load string address
	syscall				# print string
	
	lw	$t8, 8($t9)		# load third item of row into $8
	
	li	$v0, 1			# load 1 for print integer
	move	$a0, $t8		# move third item in row to $a0
	syscall				# print integer
	
	li	$v0, 4			# load 4 for print string
	la	$a0, borderPieceNL	# load string address
	syscall				# print string
	
	# print row 3
	li	$v0, 4			# load 4 for print string
	la	$a0, borderPiece	# load string address
	syscall				# print string
	
	la	$t9, row3		# load row into $t9
	lw	$t8, 0($t9)		# load first item of row into $8
	
	li	$v0, 1			# load 1 for print integer
	move	$a0, $t8		# move first item in row to $a0
	syscall				# print integer
	
	li	$v0, 4			# load 4 for print string
	la	$a0, space		# load string address
	syscall				# print string
	
	lw	$t8, 4($t9)		# load second item of row into $8
	
	li	$v0, 1			# load 1 for print integer
	move	$a0, $t8		# move second item in row to $a0
	syscall				# print integer
	
	li	$v0, 4			# load 4 for print string
	la	$a0, space		# load string address
	syscall				# print string
	
	lw	$t8, 8($t9)		# load third item of row into $8
	
	li	$v0, 1			# load 1 for print integer
	move	$a0, $t8		# move third item in row to $a0
	syscall				# print integer
	
	li	$v0, 4			# load 4 for print string
	la	$a0, borderPieceNL	# load string address
	syscall				# print string
	
	# print row 2
	li	$v0, 4			# load 4 for print string
	la	$a0, borderPiece	# load string address
	syscall				# print string
	
	la	$t9, row2		# load row into $t9
	lw	$t8, 0($t9)		# load first item of row into $8
	
	li	$v0, 1			# load 1 for print integer
	move	$a0, $t8		# move first item in row to $a0
	syscall				# print integer
	
	li	$v0, 4			# load 4 for print string
	la	$a0, space		# load string address
	syscall				# print string
	
	lw	$t8, 4($t9)		# load second item of row into $8
	
	li	$v0, 1			# load 1 for print integer
	move	$a0, $t8		# move second item in row to $a0
	syscall				# print integer
	
	li	$v0, 4			# load 4 for print string
	la	$a0, space		# load string address
	syscall				# print string
	
	lw	$t8, 8($t9)		# load third item of row into $8
	
	li	$v0, 1			# load 1 for print integer
	move	$a0, $t8		# move third item in row to $a0
	syscall				# print integer
	
	li	$v0, 4			# load 4 for print string
	la	$a0, borderPieceNL	# load string address
	syscall				# print string
	
	# print row 1
	li	$v0, 4			# load 4 for print string
	la	$a0, borderPiece	# load string address
	syscall				# print string
	
	la	$t9, row1		# load row into $t9
	lw	$t8, 0($t9)		# load first item of row into $8
	
	li	$v0, 1			# load 1 for print integer
	move	$a0, $t8		# move first item in row to $a0
	syscall				# print integer
	
	li	$v0, 4			# load 4 for print string
	la	$a0, space		# load string address
	syscall				# print string
	
	lw	$t8, 4($t9)		# load second item of row into $8
	
	li	$v0, 1			# load 1 for print integer
	move	$a0, $t8		# move second item in row to $a0
	syscall				# print integer
	
	li	$v0, 4			# load 4 for print string
	la	$a0, space		# load string address
	syscall				# print string
	
	lw	$t8, 8($t9)		# load third item of row into $8
	
	li	$v0, 1			# load 1 for print integer
	move	$a0, $t8		# move third item in row to $a0
	syscall				# print integer
	
	li	$v0, 4			# load 4 for print string
	la	$a0, borderPieceNL	# load string address
	syscall				# print string
	
	li	$v0, 4			# load 4 for print string
	la	$a0, borderLine		# load string address
	syscall				# print string
	
	li	$v0, 4			# load 4 for print string
	la	$a0, colCount		# load string address
	syscall				# print string
	
	jr	$ra			# go back
	
exit:
	li	$v0, 10			# load 10 for exit
	syscall				# exit

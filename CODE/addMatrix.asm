.data
	Mat1: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16	
	Mat2: .word 13, 14, 15, 16, 9, 10, 11, 12, 5, 6, 7, 8, 1, 2, 3, 4
	resMat: .space 64 #16 x 4
	
.text
main: 
	addi $t0,$zero,16 # Loop index
	addi $t1,$zero,0 # Mat1 index
	addi $t2,$zero,64 # Mat2 index
	addi $t3,$zero,128 # resMat index
	
addMats:
	# Load the relevant values, add them and store them in resMat
	lw,$t5,0($t1)
	lw,$t6,0($t2)
	add $t7,$t5,$t6
	sw $t7,0($t3)
	
	#update indexes
	addi $t0,$t0,-1 # Loop index
	addi $t1,$t1,4  # Mat1 index
	addi $t2,$t2,4 # Mat2 index
	addi $t3,$t3,4 # resMat index
	
	# Check if loop ended
	bne $t0,$zero, addMats
	
DONE:	nop
	j DONE
.data
	
.text
main: 
	addi $v0,$at,2
	bne $v0,$a1,NotEQ
	srl $a1,$a2,3
NotEQ:	sll $a1,$a2,3
	srl $t0,$t1,2
	mul $t2,$t3,$t4
	
DONE:	nop
	j DONE
	

.data
	
.text
main: 
	add $v0,$at,$zero
	sub $a1,$a0,$v1
	ori $t1,$s4,8
	xori $v0,$at,6
	addi $a1,$zero,4
	and $a0,$v1,$a1
	or $a2,$a3,$t0
	xor $t1,$t2,$t3
	andi $v0,$s0,7
	srl $a0,$s5,4
	
DONE:	nop
	j DONE
	

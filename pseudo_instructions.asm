.data 
msg: .asciiz "\nThe median is:\n" 
.text main:

li $t0, 1024   #Example values, should work for any combination 
li $t1, 115820    #A pseudo instruction that sets $t1 = 2179 
li $t2, 3024

# min $t0, $t1, $t2
slt		$t0, $t1, $t2		# $t0 = ($t1 < $t2) ? 1 : 0
mult	$t0, $t1			# $t0 * $t1 = Hi and Lo registers
mflo	$t1					# copy Lo to $t1
xori	$t0, $t0, 1			# $t0 = $t0 ^ 1
mult	$t0, $t2			# $t0 * $t2 = Hi and Lo registers
mflo	$t0					# copy Lo to $t0
add		$t0, $t0, $t1		# $t0 = $t0 + $t1

move $a0, $t0   #Set $a0 <- $t0 
li $v0, 1       #syscall 1 -- prints the integer $a0 
syscall

li $v0, 4       #syscall with v0=4 --> print string 
la $a0, msg     #call parameter --> pointer to the message 
syscall

li $t0, 31321   #Example values, should work for any combination 
li $t1, 3179    #A pseudo instruction that sets $t1 = 2179 


### Actual branchless code of computing $t0 <- median($t0,$t1,$t2)
slt $t3, $t0, $t1
slt $t4, $t2, $t1
slt $t5, $t2, $t0
xor $t3, $t3, $t4
movn $t0, $t1, $t3
xor $t5, $t5, $t4
movn $t0, $t2, $t5
### End of your code

move $a0, $t0   #Set $a0 <- $t0 
li $v0, 1       #syscall 1 -- prints the integer $a0 
syscall
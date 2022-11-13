.data 
dat: .word 0x48656c6c, 0x6f303030, 0x38212121 # Hello0008!!! 
len: .word 3

.text
la		$t1, dat		# 
la		$t2, len		# 
lw		$t2, 0($t2)		# 
add		$t3, $0, $0		# $t3 = $0 + $0

# while not (condition) do something
While:
    # condition
    beq		$t2, $0, ExitWhile	# if $t2 == 0 then ExitWhile
    lw		$a0, 0($t1)		# 
    jal		Parity				# jump to Parity and save position to $ra
    xor		$t3, $t3, $v0		# $t3 = $t3 ^ $v0
    addi	$t1, $t1, 4		    # $t1 = $t1 + 4
    addi	$t2, $t2, -1		# $t2 = $t2 + -1
    
    j		While				# jump to While
ExitWhile:
    li      $v0, 10
    syscall


Parity:
move 	$t8, $a0		# $t8 = $a0
srl		$t9, $t8, 1			# $t9 = $t8 >> 1
xor		$t8, $t8, $t9		# $t8 = $t8 ^ $t9
srl		$t9, $t8, 2			# $t9 = $t8 >> 2
xor		$t8, $t8, $t9		# $t8 = $t8 ^ $t9
srl		$t9, $t8, 4			# $t9 = $t8 >> 4
xor		$t8, $t8, $t9		# $t8 = $t8 ^ $t9
srl		$t9, $t8, 8			# $t9 = $t8 >> 8
xor		$t8, $t8, $t9		# $t8 = $t8 ^ $t9
srl		$t9, $t8, 16		# $t9 = $t8 >> 16
xor		$t8, $t8, $t9		# $t8 = $t8 ^ $t9
andi	$v0, $t8, 1			# $v0 = $t8 & 1
jr		$ra				    # jump to $ra

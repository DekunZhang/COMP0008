.data

    text:	.asciiz "Enter a number: "
    comma:	.asciiz ", "

.text

main:
    # Printing out the text
    li		$v0, 4
    la		$a0, text
    syscall

    # Getting user input
    li		$v0, 5
    syscall

    # Moving the integer input to another register
    move	$t0, $v0
    li		$s1, 1		# $s1 = 1
    jal		PrintNumberAndComma	# jump to PrintNumberAndComma and save position to $ra
    
If:
    # Judging the interger
    andi	$t1, $t0, 1			# $t1 = $t0 & 1
    beq		$t1, $0, Else	    # if $t1 == $zero then Else

    # $t0 = 3 * $t0 + 1
    li		$t3, 3				# $t3 = 3
    mult	$t0, $t3			# $t0 * $t3 = Hi and Lo registers
    mflo	$t4					# copy Lo to $t2
    addi	$t0, $t4, 1			# $t0 = $t4 + 1
    j		Endif				# jump to Endif
    
    # $t0 = $t0 / 2
Else:
    srl		$t0, $t0, 1			# $t0 = $t0 >> 1
Endif:
    jal		PrintNumberAndComma	# jump to PrintNumberAndComma and save position to $ra
    bne		$t0, $s1, If	    # if $t0 != $s1 then If
Exit:
    # End Program
    li		$v0, 10
    syscall

PrintNumberAndComma:
    # Printing out the number
    li		$v0, 1
    move	$a0, $t0
    syscall
    beq		$t0, $s1, Exit	# if $t0 == $s1 then Exit
    
    # Printing out the comma
    li		$v0, 4
    la		$a0, comma
    syscall
    jr		$ra					# jump to $ra
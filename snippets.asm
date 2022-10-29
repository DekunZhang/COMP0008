# If not condition do something Else condition
Ifnot:
    # Condition
    bne		$rs, $rt, Else  # if $rs != $rt then Else
    # If not
    
    # do something
    j		Endif           # jump to Endif
    
Else:
    # do something
Endif:

# Loop 1 
# do while (condition)
Do:
    # do something
    
    # Condition
    bne		$rs, $rt, Do    # if $rs != $rt then Do
    j		ExitDo          # jump to ExitDo
ExitDo:

# Loop 2
# while (True) if (condition) break
Loop:
    # do something
    
    # Condition
    bne		$rs, $rt, ExitLoop	# if $rs != $rt then ExitLoop
    j		Loop				# jump to Loop
ExitLoop:

# Loop 3
# while not (condition) do something
While:
    # condition
    bne		$t0, $t1, ExitWhile	# if $t0 != $t1 then ExitWhile
    # do something
    j		While				# jump to While
ExitWhile:

# Loop with branching
# do if not condition do something else condition while (Loop condition) 
Ifnot2:
    # Branching Condition
    bne		$rs, $rt, Else2  # if $rs != $rt then Else2
    # If not
    
    # do something

    j		Endif2           # jump to Endif2
    
Else2:
    # do something
Endif2:
    # Loop Condition
    bne		$rs, $rt, Ifnot2	# if $rs != $rt then Ifnot2

# While Loop Branching
# while not (Loop condition) if not condition do something else condition
While2:
    bne		$t0, $t1, ExitWhile2	# if $t0 != $t1 then ExitWhile2
Ifnot3:
    # branching condition
    bne		$t0, $t1, Else3	# if $t0 != $t1 then Else3
    # do something
    j		Endif3				# jump to Endif3
Else3:
    # do something
Endif3:
    j		While2				# jump to While2
ExitWhile2:

# Functions
# Arrarys



# ASCII
.data
    text:       .asciiz "Enter a number: "
.text
# Printing out the text
main:
    li          $v0, 4
    la          $a0, text
    syscall

    # Getting user input
    li          $v0, 5
    syscall

    # Moving the integer input to another register
    move        $t0, $v0
    # End Program
    li          $v0, 10
    syscall
    # Printing out the number
    li          $v0, 1
    move        $a0, $t0
    syscall
	//
	// divide an integer by an integer, and "ignore" the reminder 
	// in a logarithmic running-time
	//
	
	// Save the dividend
	@R13
	D=M
	@dividend
	M=D
	
	// Save the divisor
	@R14
	D=M
	@divisor
	M=D
	
	// Initiate denom=divisor, current=1, R15=0 (Answer)
	@denom
	M=D
	@current
	M=1
	@R15
	M=0
	
	// if (denom > dividend) then R15=0
	@denom
	D=M
	@dividend
	D=D-M
	@ANSWER0
	D;JGT
	
	// if (denom == dividend) then R15=1
	@ANSWER1
	D;JEQ

(LOOP)
	// while (denom <= dividend) then shift-left denom and current
	@denom
	M=M<<
	D=M
	@current
	M=M<<

	@dividend
	D=D-M
	@LOOP
	D;JLE
	
	// After the loop ended, shift-right one time denom and current
	@denom
	M=M>>
	@current
	M=M>>
	
(LOOPDIVIDE)
	// while (current != 0)
	
	@denom
	D=M
	@dividend
	D=D-M
	@SHIFT
	D;JGT

	// if (dividend >= denom) then dividend -= denom, and answer |= current
	@dividend
	M=-D
	@current
	D=M
	@R15
	M=D|M

(SHIFT)
	// shift-right current and denom
	@current
	M=M>>
	D=M
	@denom
	M=M>>
	@LOOPDIVIDE
	D;JNE
	
	@END
	0;JMP
	
(ANSWER0)
	@R15
	M=0
	@END
	0;JMP
	
(ANSWER1)
	@R15
	M=1
	@END
	0;JMP
	
(END)

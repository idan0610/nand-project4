	//
	// implement a bubble sort (from the largest to the smallest) 
	// the inputs are the beginning of the array and its size
	// and the sorting is in-place
	//
	
	//size of the array 
	@R15
	D=M-1
	@N
	M=D
	
	//start of the array
	@R14
	D=M
	@addr
	M=D
	
	//index for the loops
	@i
	M=0
	@j
	M=0
	
	@n1
	M=0
	@n2
	M=0
	
	@tmp
	M=0
	
(LOOP)
//for i=0 to i=N-1
	@N
	D=M
	@i
	D=D-M
	@END
	D;JEQ
	
(SUBLOOP)
//for j=0 to j=N-1
	@N
	D=M
	@j
	D=D-M
	@INC
	D;JEQ
	
	@j
	D=M
	@addr
	A=D+M
	D=A
	@n1
	M=D
	
	@j
	D=M+1
	@addr
	A=D+M
	D=A
	@n2
	M=D
	
	//if a[j] > a[j + 1] than swap
	@n1
	A=M
	D=M
	@n2
	A=M
	D=D-M
	@SWAP
	D;JLT
	
	@j
	M=M+1
	@SUBLOOP
	0;JMP
	
(SWAP)
	//swap the values of a[j] and a[j + 1]
	@n1
	A=M
	D=M
	@tmp
	M=D
	@n2
	A=M
	D=M
	@n1
	A=M
	M=D
	@tmp
	D=M
	@n2
	A=M
	M=D
	
	@j
	M=M+1
	@SUBLOOP
	0;JMP 
	
(INC)
	@j
	M=0
	
	@i
	M=M+1
	
	@LOOP
	0;JMP
	
(END)

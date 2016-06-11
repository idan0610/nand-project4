// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

	@R0 //first number to mult
	D=M
	@a
	M=D

	@R1 //second number to mult
	D=M
	@b
	M=D

	@i
	M=1
	@mult
	M=0
	
	@R2
	M=0

(LOOP)
//add R0 to itself R1 times
	@i
	D=M
	@b
	D=D-M
	@STOP
	D;JGT  //stop i > b (b=R1)
	
	@a
	D=M
	@mult
	M=D+M
	
	@i
	M=M+1
	@LOOP
	0;JMP // continue program
	
(STOP)
	@mult
	D=M
	@R2
	M=D  //assign mult to R2
	
(END)
	
	
	




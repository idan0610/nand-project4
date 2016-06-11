// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

	@8192
	D=A
	@n
	M=D

(RESET)
	@i
	M=1

	@SCREEN
	D=A
	@addr
	M=D


(LOOP)
//listen to the keyboard, if it is pressed, blacken the screen
	@KBD
	D=M
	@BLACK
	D;JGT
	@WHITE
	D;JEQ
	
(BLACK)
//blacken the screen line by line (16 bit at time)
	@addr
	A=M
	M=-1
	@INC
	0;JMP

(WHITE)
//white the screen line by line (16 bit at time)
	@addr
	A=M
	M=0
	@INC
	0;JMP
	
(INC)
//continue to the next 16 bit of screen ("pixels")
	@i
	M=M+1
	@addr
	M=M+1
	
	@i
	D=M
	@n
	D=D-M
	@RESET
	D;JGT
	
	@LOOP
	0;JMP
	

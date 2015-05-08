// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

       @R0
       D=M
       @n
       M=D  // n = R0
        
       @R1
       D=M 
       @m
       M=D  // m = R1
        
       @i
       M=0

       @m
       D=M 
       @prod 
       M=0

       @2
       M=0 
(LOOP)
       @i
       D=M
       @n 
       D=D-M
       @STOP
       D;JGE  // if i > n goto STOP

       @m
       D=M
       @prod 
       M=D+M
       @i
       M=M+1 // i = i + 1
       @LOOP
       0;JMP
       
(STOP)
       @prod
       D=M
       @R2
       M=D   
       
(END)
       @END
       0;JMP
  
        

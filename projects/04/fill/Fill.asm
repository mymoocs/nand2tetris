// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.

     @254
     D=A
     @n
     M=D //n=RAM[0]

     @31
     D=A
     @w   
     M=D

  

     

     (WHILE)

         @i
     M=0 // i = 0
          @SCREEN 
     D=A
     @address
     M=D  // address = 16384  
    
     @KBD
     D=M

     @LOOP  
     D;JGT

     @UNSETLOOP
     D;JEQ
        
     @WHILE   
     0;JMP   

        
        
    (LOOP)  
 
     @i
     D=M
     @n
     D=D-M
     @WHILE
     D;JGT // if i>n goto END

     @j
     M=0
        
    
        
     @i
     M=M+1 //i=i+1
     @32
     D=A
     @address
     M=D+M // address=address+32

     (W-LOOP)
     @j
     D=M
     @w
     D=D-M
     @LOOP
     D;JGT // if i>n goto END
     @j
     D=M   
     @address
     A=M+D
     M=-1 // RAM[address]=-1 (16 pixels)
     @j
     M=M+1   
     @W-LOOP
     0;JMP
        
     @LOOP
     0;JMP // got LOOP



     (UNSETLOOP)  
 
     @i
     D=M
     @n
     D=D-M
     @WHILE
     D;JGT // if i>n goto END

     @j
     M=0
        
    
        
     @i
     M=M+1 //i=i+1
     @32
     D=A
     @address
     M=D+M // address=address+32

     (W1-LOOP)
     @j
     D=M
     @w
     D=D-M
     @UNSETLOOP
     D;JGT // if i>n goto END
     @j
     D=M   
     @address
     A=M+D
     M=0 // RAM[address]=-1 (16 pixels)
     @j
     M=M+1   
     @W1-LOOP
     0;JMP
        
     @UNSETLOOP
     0;JMP // got LOOP   
     
        
     (END)
     @END
     0;JMP


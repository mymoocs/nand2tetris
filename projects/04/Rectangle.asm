// Program: Rectangle.asm
     // Draws a filled rectangle at the screen's top left corner.
     // The rectangle's width is 16 pixels, and its height is RAM[0].
     // Usage: put a non-negtive number (rectangle's height) in RAM[0].

     @status
    M=-1        // status=0xFFFF
    D=0         // Argument - what to set screen bits to
    @SETSCREEN
    0;JMP

(LOOP)
    @KBD
    D=M         // D = current keyboard character
    @SETSCREEN
    D;JEQ       // If no key, set screen to zeroes (white)
    D=-1        // If key pressed, set screen to all 1 bits (black)
    
(SETSCREEN)     // Set D=new status before jumping here
    @ARG
    M=D         // Save new status arg
    @status     // FFFF=black, 0=white - status of entire screen
    D=D-M       // D=newstatus-status
    @LOOP
    D;JEQ        // Do nothing if new status == old status
    
    @ARG
    D=M
    @status
    M=D         // status = ARG
    
    @SCREEN
    D=A         // D=Screen address
    @8192
    D=D+A       // D=Byte just past last screen address
    @i
    M=D         // i=SCREEN address
    
(SETLOOP)    
    @i
    D=M-1
    M=D         // i=i-1
    @LOOP
    D;JLT       // if i<0 goto LOOP
    
    @status
    D=M         // D=status
    @i
    A=M         // Indirect
    M=D         // M[current screen address]=status
    @SETLOOP
    0;JMP

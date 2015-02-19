// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

    // Initialize counter to first pixel
    @SCREEN
    D=A
    @pixel
    M=D

(LOOP)
    @KBD
    D=M
    @CLEAR
    D;JEQ
    @FILL
    D;JNE

(CLEAR)
    // Clear pixel on screen
    @pixel
    A=M
    M=0

    // Check if we are already on the first pixel
    @pixel
    D=M
    @SCREEN
    D=D-A
    @LOOP
    D;JEQ

    // Decrement pixel
    @pixel
    M=M-1
    @LOOP
    0;JMP

(FILL)
    // Fill pixel on screen
    D=-1
    @pixel
    A=M
    M=D

    // Check if we are on the last pixel
    @pixel
    D=M
    @24575
    D=D-A
    @LOOP
    D;JEQ

    // Increment pixel
    @pixel
    M=M+1
    @LOOP
    0;JMP

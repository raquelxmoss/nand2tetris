// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

@R2 // Result
M=0 // Set result to 0

@R0
D=M
@STEP
D;JGT

// If it didn't jump, go to END -- that was a guard clause
@END
0;JMP

// Adds R1 to R2 and removes 1 from R0.
// If R0 is more than 0 we step again.
(STEP)
    // Get result
    @R2
    D=M

    // Add R1 to it
    @R1
    D=D+M

    // And write the result
    @R2
    M=D

    // Reduce R0 by 1.
    @R0
    D=M-1
    M=D

    // If R0 is still > 0 then loop.
    @STEP
    D;JGT

(END)
    @END
    0;JMP

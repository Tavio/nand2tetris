// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(BEGIN)

  @KBD
  D=M
  @BLACKCOLOR
  D;JGT

  @color
  M=0
  @PAINT
  0;JMP

  (BLACKCOLOR)
    @color
    M=-1

  (PAINT)
    @SCREEN
    D=A
    @rowaddr
    M=D

    @i
    M=0

  (ROWLOOP)
    @j
    M=0

    @i
    D=M
    @255
    D=D-A
    @END
    D;JGT

    @rowaddr
    D=M
    @coladdr
    M=D

    (COLLOOP)
      @j
      D=M
      @31
      D=D-A
      @ROWLOOPCONT
      D;JGT

      @color
      D=M
      @coladdr
      A=M
      M=D

      @j
      M=M+1
      @coladdr
      M=M+1
      @COLLOOP
      0;JMP

  (ROWLOOPCONT)
    @i
    M=M+1
    @32
    D=A
    @rowaddr
    M=D+M
    @ROWLOOP
    0;JMP

(END)
  @BEGIN
  0;JMP

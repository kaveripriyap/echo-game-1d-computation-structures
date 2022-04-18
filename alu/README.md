# fpga-16-bit-alu

Programmed a 16 bit ALU on Alchitry IDE in Lucid HDL and tested the code on the Alchitry AU FPGA Development Board that contains the Xilinx Artix 7 XC7A35T-1C FPGA with over 33,000 logic cells and 256MB of DDR3 RAM. 

#### Building the Project on the Alchitry IDE:
 
  * Upon creating a new project, select "IO Shield Base" from the "From Example" dropdown.
  * Right click "Components" and select "Add Components...".
  * Under Miscellaneous, add components "Counter", "Reset Conditioner", and "Decoder" to the project.

#### I/O Configuration

* IO Buttons:

  * UP: Press to write the 16 bit input X in io_switch[15:0]. 
  * CENTER: Press to write the 16 bit input Y in io_switch[15:0].
  * DOWN: Press to write the ALUFN input and to subsequently compute the operation between X and Y according to the ALUFN code in the MANUAL mode.
  * LEFT: Press to reset the ALU.
  * RIGHT: Press to switch to AUTO mode.

* DIP Switches:
  
  * io_dip[15:0] for 16 bit inputs X and Y in the MANUAL mode.
  * io_dip[21:16] for 6 bit ALUFN input in MANUAL mode
  * Flip up io_dip[23] (leftmost dip switch) to switch to MANUAL mode. 

* IO LEDs:

  * The 16 bit outputs from ALU in MANUAL mode are displayed in io_led[15:0].
  * [21:16] display 000ZVN as an output for AUTO mode.

* Seven Seg Display
  * In the MANUAL mode, [ - Z V N ] is displayed on the seven seg display.

#### Core Modules

* ALU Module (alu_16.luc)
* Arithmetic Module (arith_16.luc)
* Boolean Module (bool_16.luc)
* Comparator Module (comp_16.luc)
* Shifter Module (shift_16.luc)

#### ALU Testing
```
fsm states = {INITIAL, 
              MANUAL,
              // AUTO
              // ARITHMETIC TEST CASES
              ADD1, ADD2, ADD3, ADD4, ADD5,
              SUB1, SUB2, SUB3, SUB4, SUB5, SUB6, SUB7,
              MUL1, MUL2, MUL3, MUL4,   
              // COMPARATOR TEST CASES
              COMPEQ1, COMPEQ2, COMPEQ3, COMPEQ4, COMPEQ5,
              COMPLT1, COMPLT2, COMPLT3,
              COMPLEQ1, COMPLEQ2, COMPLEQ3, COMPLEQ4, COMPLEQ5,
              // BOOLEAN TEST CASES
              BOOL1, BOOL2, BOOL3, BOOL4, BOOL5, BOOL6, BOOL7, BOOL8, BOOL9,
              // SHIFTER TEST CASES
              SL1, SL2, SL3, SL4,
              SR1, SR2, SR3, SR4,
              SRA1, SRA2, SRA3, SRA4
              };
```

### Manual Testing

To test our 16 bit ALU manually,
* Press the LEFT button of the Alchitry AU to switch to MANUAL mode.
* Enter the value of the 16 bit X input through the switched in io_dip[15:0] and press the TOP button to write the value of io_dip[15:0] to X.
* Enter the value of the 16 bit Y input through the switched in io_dip[15:0] and press the CENTER button to write the value of io_dip[15:0] to Y.
* Enter the ALUFN value in io_dip[21:16] and press the DOWN button to perform the appropriate computations according to the inputs X, Y and the ALUFN OPCODE (see table below).

### Automatic Testing

The video below displays the automatic testing of 50 test cases (edge cases with and without overflow) implemented in au_top.luc that fall under the four core modules — arithmetic, boolean, comparator, and shifter.

* Press the RIGHT button of the Alchitry AU to switch to AUTO mode.
* The states automatically transition from one test case to the other till they reach the end of the FSM tester states or until the mode is changed according to a button press.

   [![1D Checkoff FGPA 16-bit ALU Automated Testing](https://img.youtube.com/vi/OhLd1niKx9Q/0.jpg)](https://www.youtube.com/watch?v=OhLd1niKx9Q)

### ALUFN OPCODE:

|Operation|ALUFN[21:16]|
|---------|------------|      
| ADD     | 000000     |
| SUB     | 000001     |
| MUL     | 000010     |
| OR      | 010000     |
| AND     | 010001     |
| XOR     | 010010     |
| “A”     | 010011     |
| "B"     | 010100     |
| NOR     | 011000     |
| NAND    | 011001     |
| NOT "A" | 011011     |
| NOT "B" | 011100     |
| CMPEQ   | 110010     |
| CMPLT   | 110100     |
| CMPLE   | 110110     |
| SL      | 100000     |
| SR      | 100001     |
| SLA     | 100010     |
| SRA     | 100011     | 

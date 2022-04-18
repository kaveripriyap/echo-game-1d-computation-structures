# Echo - Test Your Memory!

Our game Echo builds upon the principles of a memory game. 2 players compete against each other to test their cognitive skills. The two players are provided with 2 buttons to choose from. The aim of the game is for the players to mimic the sequence of buttons pressed by the previous player and add 1 additional component to the progression. The player that doesn’t remember the sequence accurately loses the round. If both the players can echo each other's sequence up to length 16, a tie is called for the round and both players get a point.The game ends when the 5th round is completed and a winner or a tie is declared.

![diagram](https://user-images.githubusercontent.com/77422453/163777115-604eda8a-7236-4f41-bc1d-dc1af7cdf5e8.png)

### User Manual

#### I/O devices and their uses:

- 3 buttons 
- 2 buttons for the players to press during the game
- 1 start/stop button to control the start and the end of the game

- 2 2-digit 7 segment displays
   - To display the score for each of the players
   - To display the current round of the match between the two players

- 2 LEDs to indicate if the pattern entered so far is correct
  - Green: if sequence entered is correct
  - Red: if sequence entered is incorrect

The game begins when the start button is pressed. After the game successfully powers on, the first player has to start by inputting a sequence of length 1. The next player has to input a sequence of length 2, adding on to the previous sequence. Every consecutive event will be the players testing their memory and continuing their sequence. If the RGB button turns green, the sequence entered is correct, if it turns red, the sequence is incorrect.

### Rules to keep in mind:

- Each player can press exactly 1 extra button than the previous sequence.
- A player cannot consecutively play twice.
- A player cannot press 2 buttons at once.
- Scores are parallelly reflected in the scores display unit.
- Once the total number of rounds reaches 5, the game ends and a winner is declared.

### Sequence termination
If let's say the players keep playing their sequences till 16 becomes the length of the sequence, then the sequence terminates and both the players get a point.

### Draw scenario
There can also be a special scenario when a draw is declared. This happens if both the players together have the same score at the end of 5 rounds. This can occur when there has been a draw in any of the rounds. 

### Data Path

![image](https://user-images.githubusercontent.com/77422453/163808712-261bdf94-3985-4d3b-af02-256315bf4a77.png)

### FSM Diagram

<img width="11904" alt="FSM + Datapath (2)" src="https://user-images.githubusercontent.com/77422453/163808899-781f81d5-65da-46d7-86cd-c979f8edb012.png">

### Beta 
* Inputs to miniBeta: 
  * clk
  * rst
  * whitebutton
  * greenbutton 
  * startbutton
    
* Outputs from miniBeta:
  * p1_seg[8]
  * p2_seg[8]
  * rounds_seg[8]
  * p1_sel[2]
  * p2_sel[2]
  * rounds_sel[2]    
  * green
  * red

* miniBeta also contains the code for the asel, bsel and wdsel mux. 

### Regfile

p1seq- Player 1's sequence input
p2seq- Player 2's sequence input
sequenceCount- to keep track of the length of the sequence in that iteration
p1Score- Keeps track player 1's score
p2Score- Keeps track player 2's score
round- total number of rounds played
isP1- which player is currently inputting the sequence
tempvar1 and tempvar2- for storing arbitrary values
tempvar3- helps check if the led should turn on or not
addvalue- helps with adding a value of 1 to the sequence if 1 is inputted
winner- to store the value 1 if its a tie
loopvar- in every iteration, we check if loopvar is lesser than sequence count
seventeen- helps in masking 1 value
seventeen_subtract- for storing the value subtracted from seventeen

### ASEL mux inputs

- out_a
- addvalue

### BSEL mux inputs

- out_b
- 0
- 1
- 5
- 16
- 17

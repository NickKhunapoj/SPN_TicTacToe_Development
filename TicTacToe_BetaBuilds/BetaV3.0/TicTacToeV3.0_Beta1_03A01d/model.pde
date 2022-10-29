// variables data
PFont manrope16; // create font name manrope 16
PFont manrope18; // create font name manrope 18
PFont manrope20; // create font name manrope 20
PFont manrope35; // create font name manrope 35
PFont manrope50; // create font name manrope 50
boolean gameState = true; // game state. true is not over, false is over.
boolean gameTie = false;// game tie. true is tie false is not tie.
int ratio = 3; // ratio of the board
int[][] cellState = new int[ratio+1][ratio+1];// create cell state array (0 is unassigned, 1 is O, 2 is X)
int posX, posY, mouseCodeCheck; // variables for animation object
int turn = 1; // player turn
int clickCount = 0; // click counter
int playerHint = 0; // player hint counter to show who's going to win
int moveHint = 0; // player hint counter to show where to put the next move
int mouseCode = 0; // clicking state
int hintToggle = 0; // hint state on or off
int toggleCode = 0; // toggle state (status of each key press)
int circleRad = int((0.75)*(width/ratio)); // initialise circle radius
float lineLength = 0; // initialise line length offset
int i = 1; // initialise a hint looping variable
PrintWriter output; // use printWriter variables

class Model{
    // model class methods
    void parseGamesave() { // fuction to parse the recent gamesave
        // Open the file from the createWriter()
        String[] pieces = loadStrings("gamesave.txt");
        int count = 0; // initial counting value for pieces while loop
        for (int i = 1; i <= ratio; i++) { // save data for each cellState
            for (int j = 1; j <= ratio; j++) {
                cellState[i][j] = int(pieces[count]);
                count = count+1;
            }
        }
        gameState = boolean(pieces[count]);// recover game state
        gameTie = boolean(pieces[count+1]);// recover game tie
        turn = int(pieces[count+2]);// recover turn
        clickCount = int(pieces[count+3]);// recover click count
        playerHint = int(pieces[count+4]);// recover toggle player hint
        moveHint = int(pieces[count+5]);// recover toggle move hint
        i = int(pieces[count+6]);// recover a hint looping variable
    }
    void saveGamesave() { // fuction to save the recent gamesave
        toggleCode = 2; // toggle code to show that it's saved
        output = createWriter("gamesave.txt"); // Create a new file in the sketch directory
        for (int i = 1; i <= ratio; i++) { // save data for each cellState
            for (int j = 1; j <= ratio; j++) {
                output.println(cellState[i][j]);
            }
        }
        output.println(gameState); // print gameState
        output.println(gameTie); // print gameTie
        output.println(turn); // print turn
        output.println(clickCount); // print cilckCount
        output.println(playerHint); // print player hint counter
        output.println(moveHint); // print move hint counter
        output.println(i); // print a hint looping variable
        output.flush(); // Writes the remaining data to the file
        output.close();
    }
    void reset() {
        toggleCode = 1; // toggle code to show that it's cleared
        cellState = new int[ratio+1][ratio+1];// recreate cell state array
        gameState = true; // reset game state
        gameTie = false;// reset game tie
        turn = 1; // reset player turn
        clickCount = 0; // reset click counter
        playerHint = 0; // reset player hint
        moveHint = 0; // reset move hint
        i = 0; // reset a hint looping variable
    }
    void toggleHint() {
        if (hintToggle == 0){ // if hitToggle is off
            hintToggle = 1; // change hitToggle to on
            toggleCode = 4; // toggle code to show that hint is turned on
        }
        else{ // if hitToggle is on
            hintToggle = 0; // change hitToggle to off
            toggleCode = 5; // toggle code to show that hint is turned off
        }
    }
    void restoreGamesave() {
        toggleCode = 3; // toggle code to show that it's restored
        parseGamesave(); // call func parseGamesave
    }
    void keyPressedAction() {
        if (keyCode == BACKSPACE){
            model.reset(); // call reset method from model class
            }
        if (key == 's' || key == 'S'){ // saving a game
            model.saveGamesave(); // call saveGamesave method from model class
            }
        if (key == 'r' || key == 'R'){ // restore a game
            model.restoreGamesave(); // call restoreGamesave method from model class
            }
        // if (key == 'h' || key == 'H'){ // toggle hint on or off
            // model.toggleHint(); // call toggleHint method from model class
            // }
        if (keyCode == 48){ // change grid size to 10x10
            ratio = 10; // set ratio to 10
            model.reset(); // call reset method from model class
            println(ratio);
            }   
        for (int i = 51; i <= 57; i++){ // change grid size to 3x3-9x9
            if (keyCode == i){
                ratio = i-48; // set ratio to values on the keyboard
                model.reset(); // call reset method from model class
                println(ratio);
            }
        }
    }
}
    

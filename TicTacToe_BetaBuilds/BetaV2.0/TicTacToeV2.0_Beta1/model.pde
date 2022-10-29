class Model{
    // model class methods
    void parseGamesave() { // fuction to parse the recent gamesave
        // Open the file from the createWriter()
        String[] pieces = loadStrings("gamesave.txt");
        int i = 1; // initial counting value for each index while loop
        int j = 0; // initial counting value for pieces while loop
        while (i<=3){ // recorver data for each cellState
            cellState[i][1] = int(pieces[j]);
            cellState[i][2] = int(pieces[j+1]);
            cellState[i][3] = int(pieces[j+2]);
            i = i+1;
            j = j+3;
        }
        gameState = boolean(pieces[9]);// recover game state
        gameTie = boolean(pieces[10]);// recover game tie
        turn = int(pieces[11]);// recover turn
        clickCount = int(pieces[12]);// recover click count
        playerHint = int(pieces[13]);// recover toggle player hint
        moveHint = int(pieces[14]);// recover toggle move hint
        i = int(pieces[15]);// recover a hint looping variable
    }
    void saveGamesave() { // fuction to save the recent gamesave
        toggleCode = 2; // toggle code to show that it's saved
        output = createWriter("gamesave.txt"); // Create a new file in the sketch directory
        int i = 1; // initial counting value for cellState's indexs while loop
        while (i<=3){ // print cellState's indexs
        output.println(cellState[i][1]);
        output.println(cellState[i][2]);
        output.println(cellState[i][3]);
        i = i+1;
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
        cellState = new int[4][4];// recreate cell state array
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
}
    

class Controller{
    // controller class methods
    void swapTurns(){
    if (turn == 1){
        turn = 2;
        }
        else{
        turn = 1;
        }
    }

    void gameboardControl() {
        if (gameState == true){
            toggleCode = 0; // reset toggle code
            if (turn == 1){ // turn = 1 is O's turn, assign mouseCode for animation, append cellState list with number 1, swap turns and increase clickCount value.
                circleRad = 100; 
                if ((mouseX>0 && mouseX<200) && (mouseY>0 && mouseY<200) && cellState[1][1] == 0){ // top row
                    mouseCode = 1;
                    cellState[1][1] = 1;
                    swapTurns();
                    clickCount = clickCount + 1;}
                if ((mouseX>200 && mouseX<400) && (mouseY>0 && mouseY<200) && cellState[1][2] == 0){
                    mouseCode = 2;
                    cellState[1][2] = 1;
                    swapTurns();
                    clickCount = clickCount + 1;}
                if ((mouseX>400 && mouseX<600) && (mouseY>0 && mouseY<200) && cellState[1][3] == 0){
                    mouseCode = 3;
                    cellState[1][3] = 1;
                    swapTurns();
                    clickCount = clickCount + 1;}
                if ((mouseX>0 && mouseX<200) && (mouseY>200 && mouseY<400) && cellState[2][1] == 0){ // mid row
                    mouseCode = 4;
                    cellState[2][1] = 1;
                    swapTurns();
                    clickCount = clickCount + 1;}
                if ((mouseX>200 && mouseX<400) && (mouseY>200 && mouseY<400) && cellState[2][2] == 0){
                    mouseCode = 5;
                    cellState[2][2] = 1;
                    swapTurns();
                    clickCount = clickCount + 1;}
                if ((mouseX>400 && mouseX<600) && (mouseY>200 && mouseY<400) && cellState[2][3] == 0){
                    mouseCode = 6;
                    cellState[2][3] = 1;
                    swapTurns();
                    clickCount = clickCount + 1;}
                if ((mouseX>0 && mouseX<200) && (mouseY>400 && mouseY<600) && cellState[3][1] == 0){ // bot row
                    mouseCode = 7;
                    cellState[3][1] = 1;
                    swapTurns();
                    clickCount = clickCount + 1;}
                if ((mouseX>200 && mouseX<400) && (mouseY>400 && mouseY<600) && cellState[3][2] == 0){
                    mouseCode = 8;
                    cellState[3][2] = 1;
                    swapTurns();
                    clickCount = clickCount + 1;}
                if ((mouseX>400 && mouseX<600) && (mouseY>400 && mouseY<600) && cellState[3][3] == 0){
                    mouseCode = 9;
                    cellState[3][3] = 1;
                    swapTurns();
                    clickCount = clickCount + 1;}
                }
            if (turn == 2){ // turn = 2 is X's turn, assign mouseCode for animation, append cellState list with number 2, swap turns and increase clickCount value.
                lineLength = 0;
                if ((mouseX>0 && mouseX<200) && (mouseY>0 && mouseY<200) && cellState[1][1] == 0){ // top row
                    mouseCode = 1;
                    cellState[1][1] = 2;
                    swapTurns();
                    clickCount = clickCount + 1;}
                if ((mouseX>200 && mouseX<400) && (mouseY>0 && mouseY<200) && cellState[1][2] == 0){
                    mouseCode = 2;
                    cellState[1][2] = 2;
                    swapTurns();
                    clickCount = clickCount + 1;}
                if ((mouseX>400 && mouseX<600) && (mouseY>0 && mouseY<200) && cellState[1][3] == 0){
                    mouseCode = 3;
                    cellState[1][3] = 2;
                    swapTurns();
                    clickCount = clickCount + 1;}
                if ((mouseX>0 && mouseX<200) && (mouseY>200 && mouseY<400) && cellState[2][1] == 0){ // mid row
                    mouseCode = 4;
                    cellState[2][1] = 2;
                    swapTurns();
                    clickCount = clickCount + 1;}
                if ((mouseX>200 && mouseX<400) && (mouseY>200 && mouseY<400) && cellState[2][2] == 0){
                    mouseCode = 5;
                    cellState[2][2] = 2;
                    swapTurns();
                    clickCount = clickCount + 1;}
                if ((mouseX>400 && mouseX<600) && (mouseY>200 && mouseY<400) && cellState[2][3] == 0){
                    mouseCode = 6;
                    cellState[2][3] = 2;
                    swapTurns();
                    clickCount = clickCount + 1;}
                if ((mouseX>0 && mouseX<200) && (mouseY>400 && mouseY<600) && cellState[3][1] == 0){ // bot row
                    mouseCode = 7;
                    cellState[3][1] = 2;
                    swapTurns();
                    clickCount = clickCount + 1;}
                if ((mouseX>200 && mouseX<400) && (mouseY>400 && mouseY<600) && cellState[3][2] == 0){
                    mouseCode = 8;
                    cellState[3][2] = 2;
                    swapTurns();
                    clickCount = clickCount + 1;}
                if ((mouseX>400 && mouseX<600) && (mouseY>400 && mouseY<600) && cellState[3][3] == 0){
                    mouseCode = 9;
                    cellState[3][3] = 2;
                    swapTurns();
                    clickCount = clickCount + 1;}
                }
            println("Click Count",clickCount);
            println("turn",turn);
        }
    }

    void winCheck() {
        // check a winner 
        // horizontal win
        if (cellState[1][1] == 1 && cellState[1][2] == 1 && cellState[1][3] == 1){ // O top
            println("Player 1 wins! top row");
            gameState = false;}
        if (cellState[2][1] == 1 && cellState[2][2] == 1 && cellState[2][3] == 1){ // mid
            println("Player 1 wins! mid row");
            gameState = false;}
        if (cellState[3][1] == 1 && cellState[3][2] == 1 && cellState[3][3] == 1){ // bot
            println("Player 1 wins! bot row");
            gameState = false;}
        if (cellState[1][1] == 2 && cellState[1][2] == 2 && cellState[1][3] == 2){ // X top
            println("Player 2 wins! top row");
            gameState = false;}
        if (cellState[2][1] == 2 && cellState[2][2] == 2 && cellState[2][3] == 2){ // mid
            println("Player 2 wins! mid row");
            gameState = false;}
        if (cellState[3][1] == 2 && cellState[3][2] == 2 && cellState[3][3] == 2){ // bot
            println("Player 2 wins! bot row");
            gameState = false;}
        
        // vertical win
        if (cellState[1][1] == 1 && cellState[2][1] == 1 && cellState[3][1] == 1){ // O left
            println("Player 1 wins! left collumn");
            gameState = false;}
        if (cellState[1][2] == 1 && cellState[2][2] == 1 && cellState[3][2] == 1){ // mid
            println("Player 1 wins! mid collumn");
            gameState = false;}
        if (cellState[1][3] == 1 && cellState[2][3] == 1 && cellState[3][3] == 1){ // right
            println("Player 1 wins! right collumn");
            gameState = false;}
        if (cellState[1][1] == 2 && cellState[2][1] == 2 && cellState[3][1] == 2){ // X left
            println("Player 2 wins! left collumn");
            gameState = false;}
        if (cellState[1][2] == 2 && cellState[2][2] == 2 && cellState[3][2] == 2){ // mid
            println("Player 2 wins! mid collumn");
            gameState = false;}
        if (cellState[1][3] == 2 && cellState[2][3] == 2 && cellState[3][3] == 2){ // right
            println("Player 2 wins! right collumn");
            gameState = false;}
            
        // diagonal win
        if (cellState[1][1] == 1 && cellState[2][2] == 1 && cellState[3][3] == 1){ // left to right
            println("Player 1 wins! left to right");
            gameState = false;}
        if (cellState[1][1] == 2 && cellState[2][2] == 2 && cellState[3][3] == 2){ // left to right
            println("Player 2 wins! left to right");
            gameState = false;}
        if (cellState[3][1] == 1 && cellState[2][2] == 1 && cellState[1][3] == 1){ // right to left
            println("Player 1 wins! right to left");
            gameState = false;}
        if (cellState[3][1] == 2 && cellState[2][2] == 2 && cellState[1][3] == 2){ // right to left
            println("Player 2 wins! right to left");
            gameState = false;}
            
        //a tie
        if (clickCount == 9 && gameState == true){
            println("A tie");
            gameState = false;
            gameTie = true;}
    }

    void hintControl() {
        // a hint when player 1 or 2 is going to win
        playerHint = 0; // reset playerHint to 0
        moveHint = 1; // reset moveHint to 1
        // horizontal hint
        int j = 1;
        while (i<=3){
            if (turn == 1){ // if turn = 1
            if (cellState[i][1] == 0 && cellState[i][2] == 1 && cellState[i][3] == 1){
                playerHint = 1;
                moveHint = j;}
            if (cellState[i][1] == 1 && cellState[i][2] == 0 && cellState[i][3] == 1){
                playerHint = 1;
                moveHint = j+1;}
            if (cellState[i][1] == 1 && cellState[i][2] == 1 && cellState[i][3] == 0){ 
                playerHint = 1;
                moveHint = j+2;}
            }
            if (turn == 2){ // if turn = 2
            if (cellState[i][1] == 0 && cellState[i][2] == 2 && cellState[i][3] == 2){
                playerHint = 2;
                moveHint = j;}
            if (cellState[i][1] == 2 && cellState[i][2] == 0 && cellState[i][3] == 2){
                playerHint = 2;
                moveHint = j+1;}
            if (cellState[i][1] == 2 && cellState[i][2] == 2 && cellState[i][3] == 0){ 
                playerHint = 2;
                moveHint = j+2;}
            }
            i = i + 1;
            j = j + 3;
        }
        i = 1;
        // vertical hint
        while (i<=3){ 
            if (turn == 1){ // if turn = 1
            if (cellState[1][i] == 0 && cellState[2][i] == 1 && cellState[3][i] == 1){
                playerHint = 1;
                moveHint = j;}
            if (cellState[1][i] == 1 && cellState[2][i] == 0 && cellState[3][i] == 1){
                playerHint = 1;
                moveHint = j+1;}
            if (cellState[1][i] == 1 && cellState[2][i] == 1 && cellState[3][i] == 0){ 
                playerHint = 1;
                moveHint = j+2;}
            }
            if (turn == 2){ // if turn = 2
            if (cellState[1][i] == 0 && cellState[2][i] == 2 && cellState[3][i] == 2){
                playerHint = 2;
                moveHint = j;}
            if (cellState[1][i] == 2 && cellState[2][i] == 0 && cellState[3][i] == 2){
                playerHint = 2;
                moveHint = j+1;}
            if (cellState[1][i] == 2 && cellState[2][i] == 2 && cellState[3][i] == 0){ 
                playerHint = 2;
                moveHint = j+2;}
            }
            i = i + 1;
            j = j + 3;
        }
        i = 1;
        // diagonal hint
            if (turn == 1){ // if turn = 1
            if (cellState[1][1] == 0 && cellState[2][2] == 1 && cellState[3][3] == 1){
                playerHint = 1;
                moveHint = j;}
            if (cellState[1][1] == 1 && cellState[2][2] == 0 && cellState[3][3] == 1){
                playerHint = 1;
                moveHint = j+1;}
            if (cellState[1][1] == 1 && cellState[2][2] == 1 && cellState[3][3] == 0){ 
                playerHint = 1;
                moveHint = j+2;}
            if (cellState[3][1] == 0 && cellState[2][2] == 1 && cellState[1][3] == 1){
                playerHint = 1;
                moveHint = j+3;}
            if (cellState[3][1] == 1 && cellState[2][2] == 0 && cellState[1][3] == 1){
                playerHint = 1;
                moveHint = j+4;}
            if (cellState[3][1] == 1 && cellState[2][2] == 1 && cellState[1][3] == 0){ 
                playerHint = 1;
                moveHint = j+5;}
            }
            if (turn == 2){ // if turn = 2
            if (cellState[1][1] == 0 && cellState[2][2] == 2 && cellState[3][3] == 2){
                playerHint = 2;
                moveHint = j;}
            if (cellState[1][1] == 2 && cellState[2][2] == 0 && cellState[3][3] == 2){
            playerHint = 2;
            moveHint = j+1;}
            if (cellState[1][1] == 2 && cellState[2][2] == 2 && cellState[3][3] == 0){ 
                playerHint = 2;
                moveHint = j+2;}
            if (cellState[3][1] == 0 && cellState[2][2] == 2 && cellState[1][3] == 2){
                playerHint = 2;
                moveHint = j+3;}
            if (cellState[3][1] == 2 && cellState[2][2] == 0 && cellState[1][3] == 2){
                playerHint = 2;
                moveHint = j+4;}
            if (cellState[3][1] == 2 && cellState[2][2] == 2 && cellState[1][3] == 0){ 
                playerHint = 2;
                moveHint = j+5;}
            }
        i = 1;
        j = 1;
    }
}

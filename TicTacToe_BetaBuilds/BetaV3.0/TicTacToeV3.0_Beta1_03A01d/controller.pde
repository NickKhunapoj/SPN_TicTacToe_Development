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
                circleRad = int(0.5*(width/ratio)); 
                int count = 1;
                for (int i=0;i<ratio;i++){
                    for (int j=0;j<ratio;j++){
                        if ((mouseX>(j*width/ratio) && mouseX<((j+1)*width/ratio)) && (mouseY>((i)*(height-150)/ratio) && mouseY<((i+1)*(height-150)/ratio)) && cellState[i+1][j+1] == 0){ // top row
                            cellState[i+1][j+1] = 1;
                            swapTurns();
                            clickCount = clickCount + 1;
                            mouseCode = count;
                            println("mouseCode",mouseCode);
                        }
                        count = count+1;
                    }
                }
            }
            if (turn == 2){ // turn = 2 is X's turn, assign mouseCode for animation, append cellState list with number 2, swap turns and increase clickCount value.
                lineLength = 0;
                int count = 1;
                for (int i=0;i<ratio;i++){
                    for (int j=0;j<ratio;j++){
                        if ((mouseX>(j*width/ratio) && mouseX<((j+1)*width/ratio)) && (mouseY>((i)*(height-150)/ratio) && mouseY<((i+1)*(height-150)/ratio)) && cellState[i+1][j+1] == 0){ // top row
                            cellState[i+1][j+1] = 2;
                            swapTurns();
                            clickCount = clickCount + 1;
                            mouseCode = count;
                            println("mouseCode",mouseCode);
                        }
                        count = count+1;
                    }
                }
            } 
            println("Click Count",clickCount);
            println("turn",turn);
        }
    }

    void winCheck() {
        // check a winner 
        // horizontal win refers to the size of a grid
        int count = 0;
        for (int i=1;i<=ratio;i++){
            for (int j=1;j<=ratio;j++){
                if (cellState[i][j] == 1){
                    count = count + 1;
                }
                if (count == ratio){
                    gameState = false;
                }
            }
            count = 0;
        }
        for (int i=1;i<=ratio;i++){
            for (int j=1;j<=ratio;j++){
                if (cellState[i][j] == 2){
                    count = count + 1;
                }
                if (count == ratio){
                    gameState = false;
                }
            }
            count = 0;
        }
        // vertical win refers to the size of a grid
        count = 0;
        for (int i=1;i<=ratio;i++){
            for (int j=1;j<=ratio;j++){
                if (cellState[j][i] == 1){
                    count = count + 1;
                }
                if (count == ratio){
                    gameState = false;
                }
            }
            count = 0;
        }
        for (int i=1;i<=ratio;i++){
            for (int j=1;j<=ratio;j++){
                if (cellState[j][i] == 2){
                    count = count + 1;
                }
                if (count == ratio){
                    gameState = false;
                }
            }
            count = 0;
        }
        
        // diagonal win refers to the size of a grid
        count = 0;
        for (int i=1;i<=ratio;i++){
            if (cellState[i][i] == 1){
                count = count + 1;
            }
            if (count == ratio){
                gameState = false;
            }
        }
        count = 0;
        for (int i=1;i<=ratio;i++){
            if (cellState[i][i] == 2){
                count = count + 1;
            }
            if (count == ratio){
                gameState = false;
            }
        }
        count = 0;
        for (int i=1;i<=ratio;i++){
            if (cellState[i][ratio-i+1] == 1){
                count = count + 1;
            }
            if (count == ratio){
                gameState = false;
            }
        }
        count = 0;
        for (int i=1;i<=ratio;i++){
            if (cellState[i][ratio-i+1] == 2){
                count = count + 1;
            }
            if (count == ratio){
                gameState = false;
            }
        }
        count = 0;
        //a tie
        if (clickCount == (ratio*ratio) && gameState == true){
            println("A tie");
            gameState = false;
            gameTie = true;
        }
    }

    void hintControl(){ // a hint when player 1 or 2 is going to win
        // check a winner 
        // horizontal win refers to the size of a grid
        int count = 0;
        int moveHintCount = 0;
        int playerHint = 0;
        for (int i=1;i<=ratio;i++){
            for (int j=1;j<=ratio;j++){
                if (cellState[i][j] == 1){
                    count = count + 1;
                }
            }
        }
        count = 0;
        for (int i=1;i<=ratio;i++){
            for (int j=1;j<=ratio;j++){
                if (count == ratio-1 && cellState[i][j] == 0){
                    moveHintCount = moveHintCount+1;
                    playerHint = 1;
                }
            }
        }
        count = 0;
        for (int i=1;i<=ratio;i++){
            for (int j=1;j<=ratio;j++){
                if (cellState[i][j] == 2){
                    count = count + 1;
                }
            }
        }
        count = 0;
        for (int i=1;i<=ratio;i++){
            for (int j=1;j<=ratio;j++){
                if (count == ratio-1 && cellState[i][j] == 0){
                    moveHintCount = moveHintCount+1;
                    playerHint = 2;
                }
            }
        }
        count = ratio*ratio;
        // vertical win refers to the size of a grid
        count = 0;
        for (int i=1;i<=ratio;i++){
            for (int j=1;j<=ratio;j++){
                if (cellState[j][i] == 1){
                    count = count + 1;
                }
                if (count == ratio){
                    gameState = false;
                }
            }
            count = 0;
        }
        for (int i=1;i<=ratio;i++){
            for (int j=1;j<=ratio;j++){
                if (cellState[j][i] == 2){
                    count = count + 1;
                }
                if (count == ratio){
                    gameState = false;
                }
            }
            count = 0;
        }
        
        // diagonal win refers to the size of a grid
        count = 0;
        for (int i=1;i<=ratio;i++){
            if (cellState[i][i] == 1){
                count = count + 1;
            }
            if (count == ratio){
                gameState = false;
            }
        }
        count = 0;
        for (int i=1;i<=ratio;i++){
            if (cellState[i][i] == 2){
                count = count + 1;
            }
            if (count == ratio){
                gameState = false;
            }
        }
        count = 0;
        for (int i=1;i<=ratio;i++){
            if (cellState[i][ratio-i+1] == 1){
                count = count + 1;
            }
            if (count == ratio){
                gameState = false;
            }
        }
        count = 0;
        for (int i=1;i<=ratio;i++){
            if (cellState[i][ratio-i+1] == 2){
                count = count + 1;
            }
            if (count == ratio){
                gameState = false;
            }
        }
        count = 0;
        //a tie
        if (clickCount == (ratio*ratio) && gameState == true){
            println("A tie");
            gameState = false;
            gameTie = true;
        }
    }
}
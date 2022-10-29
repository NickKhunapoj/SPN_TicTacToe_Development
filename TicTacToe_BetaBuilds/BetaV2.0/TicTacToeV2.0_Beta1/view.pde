class View{
    // view class methods

    void makeGrid(){ //make a tic tac toe cell
    line(200,0,200,600);
    line(400,0,400,600);
    line(0,200,600,200);
    line(0,400,600,400);
    line(0,600,600,600);
    }

    void drawO(int posX,int posY){ //draw O
    ellipseMode(CENTER);
    circle(posX,posY,150);
    }

    void drawX(int posX,int posY){ //draw X
    line(posX-175,posY-175,posX-25,posY-25);
    line(posX-25,posY-175,posX-175,posY-25);
    }

    void drawAnimationO(int posX,int posY,int mouseCodeCheck){ // draw animation O (mouseCode is a specific value for each cell in which is O's turn)
    if (circleRad<=150 && mouseCodeCheck == mouseCode){
        ellipseMode(CENTER);
        circle(posX,posY,circleRad);
        circleRad = circleRad + 4;
        }
    else{
        drawO(posX,posY);
    }
    }

    void drawAnimationX(int posX, int posY, int xposX,int xposY,int yposX,int yposY,int mouseCodeCheck){ // draw animation X (mouseCode is a specific value for each cell in which is X's turn)
    if (lineLength<=25 && mouseCodeCheck == mouseCode){
        line(xposX-lineLength,xposY-lineLength,yposX+lineLength,yposY+lineLength);
        line(yposX+lineLength,xposY-lineLength,xposX-lineLength,yposY+lineLength);
        lineLength = lineLength + 4;
        }
    else{
        drawX(posX,posY);
        }
    }

    void drawShadow(int xposX,int xposY,int yposX,int yposY){ //create shape shadow outline
    stroke(200,200,200);
    strokeWeight(4);
    if (turn == 1){
        ellipseMode(CENTER);
        circle(xposX,xposY,100);
    }
    if (turn == 2){
        line(yposX-100,yposY-100,yposX,yposY);
        line(yposX,yposY-100,yposX-100,yposY);
    }
    }

    void makeShadows() {
        // draw a shape shadow outline
        if (gameState == true){
            if ((mouseX>0 && mouseX<200) && (mouseY>0 && mouseY<200) && (cellState[1][1] == 0)){
                drawShadow(100,100,150,150);}
            if ((mouseX>200 && mouseX<400) && (mouseY>0 && mouseY<200) && (cellState[1][2] == 0)){
                drawShadow(300,100,350,150);}
            if ((mouseX>400 && mouseX<600) && (mouseY>0 && mouseY<200) && (cellState[1][3] == 0)){
                drawShadow(500,100,550,150);}
            if ((mouseX>0 && mouseX<200) && (mouseY>200 && mouseY<400) && (cellState[2][1] == 0)){
                drawShadow(100,300,150,350);}
            if ((mouseX>200 && mouseX<400) && (mouseY>200 && mouseY<400) && (cellState[2][2] == 0)){
                drawShadow(300,300,350,350);}
            if ((mouseX>400 && mouseX<600) && (mouseY>200 && mouseY<400) && (cellState[2][3] == 0)){
                drawShadow(500,300,550,350);}
            if ((mouseX>0 && mouseX<200) && (mouseY>400 && mouseY<600) && (cellState[3][1] == 0)){
                drawShadow(100,500,150,550);}
            if ((mouseX>200 && mouseX<400) && (mouseY>400 && mouseY<600) && (cellState[3][2] == 0)){
                drawShadow(300,500,350,550);}
            if ((mouseX>400 && mouseX<600) && (mouseY>400 && mouseY<600) && (cellState[3][3] == 0)){
                drawShadow(500,500,550,550);}
        }
    }

    void makeOX() {
        //draw 0,X
        if (cellState[1][1] == 1){ // draw O, top row
            drawAnimationO(100,100,1);}
        if (cellState[1][2] == 1){
            drawAnimationO(300,100,2);}
        if (cellState[1][3] ==1){
            drawAnimationO(500,100,3);}
        if (cellState[2][1] == 1){ // mid row
            drawAnimationO(100,300,4);}
        if (cellState[2][2] == 1){
            drawAnimationO(300,300,5);}
        if (cellState[2][3] == 1){
            drawAnimationO(500,300,6);}
        if (cellState[3][1] == 1){ // bot row
            drawAnimationO(100,500,7);}
        if (cellState[3][2] == 1){
            drawAnimationO(300,500,8);}
        if (cellState[3][3] == 1){
            drawAnimationO(500,500,9);}
        
        if (cellState[1][1] == 2){ // draw X, top row
            drawAnimationX(200,200,50,50,150,150,1);}
        if (cellState[1][2] == 2){
            drawAnimationX(400,200,250,50,350,150,2);}
        if (cellState[1][3] == 2){
            drawAnimationX(600,200,450,50,550,150,3);}
        if (cellState[2][1] == 2){ // mid row
            drawAnimationX(200,400,50,250,150,350,4);}
        if (cellState[2][2] == 2){
            drawAnimationX(400,400,250,250,350,350,5);}
        if (cellState[2][3] == 2){
            drawAnimationX(600,400,450,250,550,350,6);}
        if (cellState[3][1] == 2){ // bot row
            drawAnimationX(200,600,50,450,150,550,7);}
        if (cellState[3][2] == 2){
            drawAnimationX(400,600,250,450,350,550,8);}
        if (cellState[3][3] == 2){
            drawAnimationX(600,600,450,450,550,550,9);}
        fill(224,224,224);
    }

    void drawHint(int posX,int posY,int moveHintCheck){ //create shape hint outline
    if (playerHint != 0 && moveHintCheck == moveHint){
        textFont(manrope50);
        textAlign(CENTER);
        fill(255,142,54);
        text("?",posX,posY);
        }
    }
    void showTurns() {
        // display turn
        if (gameState == true){
            if (turn == 1){
                textFont(manrope35);
                textAlign(CENTER);
                fill(234,24,35);
                text("Turn: Player 1 (O)",300,687);}
            if (turn == 2){
                textFont(manrope35);
                textSize(35);
                textAlign(CENTER);
                fill(234,24,35);
                text("Turn: Player 2 (X)",300,687);}
        }
    }
    void showHotkeys() {
        // display each hotkeys in the program
        textFont(manrope16);
        textAlign(CENTER);
        fill(153,76,0);
        text("Backspace: Reset | S: Save Game | R: Restore Game | H: Toggle Hint",300,725);
        fill(224,224,224);

        // check game state
        if (gameState == false && gameTie == true){ // tie scenario
            textFont(manrope35);
            textAlign(CENTER);
            fill(234,24,35);
            text("Tie!",300,680);
        }
    }
    void showWinner() {
        if (gameState == false && gameTie == false){ // untie scenario
            if (turn == 2){ // Player 1 wins
                textFont(manrope35);
                textAlign(CENTER);
                fill(234,24,35);
                text("Game Over! Player 1 Wins",300,687);}
            if (turn == 1){ // Player 2 wins
                textFont(manrope35);
                textAlign(CENTER);
                fill(234,24,35);
                text("Game Over! Player 2 Wins",300,687);}
                fill(224,224,224);
        }
    }

    void showHints() {
        // hint a player
        // hint by a text
        if (hintToggle == 1){ // if hint is turned on
            if (gameState == true){ // if game is still going
                if (playerHint == 1){ // hint player 1
                    textFont(manrope20);
                    textAlign(CENTER);
                    fill(65,105,225);
                    text("Player 1 is going to win!",300,640);}
                if (playerHint == 2){ // hint player 2
                    textFont(manrope20);
                    textAlign(CENTER);
                    fill(65,105,225);
                    text("Player 2 is going to win!",300,640);}
                else{
                    text("",300,640);} // no hint
            // hint by showing players where to put the next move
            int i = 1;
            int j = 120;
            while (j<=520){
                drawHint(100,j,i); // horizontal move hint (1-9)
                drawHint(300,j,i+1);
                drawHint(500,j,i+2);
                i = i+3;
                j = j+200;}
                i = 10;
                j = 100;
            while (j<=500){
                drawHint(j,120,i); // vertical move hint (10-18)
                drawHint(j,320,i+1);
                drawHint(j,520,i+2);
                i = i+3;
                j = j+200;}
                drawHint(100,120,19); // diagonal move hint (19-24)
                drawHint(300,320,20);
                drawHint(500,520,21);
                drawHint(100,520,22);
                drawHint(300,320,23);
                drawHint(500,120,24);
                fill(224,224,224);
            }
        }   
    }
    
    void showToggles() {
        // toggle operation
        if (toggleCode == 1){
            textFont(manrope18);
            textAlign(RIGHT);
            fill(255,0,0);
            text("Game Cleared!",580,640);}
        if (toggleCode == 2){
            textFont(manrope18);
            textAlign(RIGHT);
            fill(0,113,0);
            text("Game Saved!",580,640);}
        if (toggleCode == 3){
            textFont(manrope18);
            textAlign(RIGHT);
            fill(0,53,226);
            text("Game Restored!",580,640);}
        if (toggleCode == 4){
            textFont(manrope18);
            textAlign(RIGHT);
            fill(102,0,51);
            text("Hint is turned on",580,640);}
        if (toggleCode == 5){
            textFont(manrope18);
            textAlign(RIGHT);
            fill(102,0,51);
            text("Hint is turned off",580,640);}
        fill(224,224,224);
    }
}

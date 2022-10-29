class View{
    // view class methods
    void makeGrid(){ //make a tic tac toe cell
    for(int i=1;i<ratio;i++){ //verticle line
        line((i*width/ratio),0,(i*width/ratio),(height-150));}
    for(int j=1;j<=ratio;j++){ //landscape line
        line(0,(j*(height-150)/ratio),width,(j*(height-150)/ratio));}
    }

    void drawO(int i,int j){ //draw O
    ellipseMode(CENTER);
    circle((j*(height-150)/ratio)-(((height-150)/ratio)/2),(i*width/ratio)-((width/ratio)/2),0.8*(width/ratio));
    }

    void drawX(int i,int j){ //draw X
    line(((j-1)*(width/ratio))+(0.125*(width/ratio)),(i-1)*((height-150)/ratio)+(0.125*((height-150)/ratio)),((j-1)*(width/ratio))+(0.875*(width/ratio)),(i-1)*((height-150)/ratio)+(0.875*((height-150)/ratio)));
    line(((j-1)*(width/ratio))+(0.125*(width/ratio)),(i-1)*((height-150)/ratio)+(0.875*((height-150)/ratio)),((j-1)*(width/ratio))+(0.875*(width/ratio)),(i-1)*((height-150)/ratio)+(0.125*((height-150)/ratio)));
    }

    void drawAnimationO(int i,int j,int mouseCodeCheck){ // draw animation O (mouseCode is a specific value for each cell in which is O's turn)
        if (circleRad<=int((0.8)*(width/ratio)) && mouseCodeCheck == mouseCode){
            ellipseMode(CENTER);
            circle((j*(height-150)/ratio)-(((height-150)/ratio)/2),(i*width/ratio)-((width/ratio)/2),circleRad);
            circleRad = circleRad + 4;
            }
        else{
            drawO(i,j);
        }
    }

    void drawAnimationX(int i,int j,int mouseCodeCheck){ // draw animation X (mouseCode is a specific value for each cell in which is X's turn)
        if (lineLength<=0.125 && mouseCodeCheck == mouseCode){
            line(((j-1)*(width/ratio))+((0.250-lineLength)*(width/ratio)),(i-1)*((height-150)/ratio)+((0.250-lineLength)*((height-150)/ratio)),((j-1)*(width/ratio))+((0.750+lineLength)*(width/ratio)),(i-1)*((height-150)/ratio)+((0.750+lineLength)*((height-150)/ratio)));
            line(((j-1)*(width/ratio))+((0.250-lineLength)*(width/ratio)),(i-1)*((height-150)/ratio)+((0.750+lineLength)*((height-150)/ratio)),((j-1)*(width/ratio))+((0.750+lineLength)*(width/ratio)),(i-1)*((height-150)/ratio)+((0.250-lineLength)*((height-150)/ratio)));
            lineLength = lineLength + 0.025;
            }
        else{
            drawX(i,j);
        }
    }

    void drawShadow(int i,int j){ //create shape shadow outline
    stroke(200,200,200);
    strokeWeight(4);
    if (turn == 1){
        ellipseMode(CENTER);
        circle((j*(height-150)/ratio)-(((height-150)/ratio)/2),(i*width/ratio)-((width/ratio)/2),0.5*(width/ratio));
    }
    if (turn == 2){
        line(((j-1)*(width/ratio))+(0.250*(width/ratio)),(i-1)*((height-150)/ratio)+(0.250*((height-150)/ratio)),((j-1)*(width/ratio))+(0.750*(width/ratio)),(i-1)*((height-150)/ratio)+(0.750*((height-150)/ratio)));
        line(((j-1)*(width/ratio))+(0.250*(width/ratio)),(i-1)*((height-150)/ratio)+(0.750*((height-150)/ratio)),((j-1)*(width/ratio))+(0.750*(width/ratio)),(i-1)*((height-150)/ratio)+(0.250*((height-150)/ratio)));
    }
    }

    void makeShadows() {
    // draw a shape shadow outline
    if (gameState == true){
        for (int i=0;i<ratio;i++){
             for (int j=0;j<ratio;j++){
                if ((mouseX>(j*width/ratio) && mouseX<((j+1)*width/ratio)) && (mouseY>((i)*(height-150)/ratio) && mouseY<((i+1)*(height-150)/ratio)) && cellState[i+1][j+1] == 0){ // top row
                    drawShadow(i+1,j+1);}
                }
            }
        }
    }

    void makeOX() {
        //draw 0,X
        int count = 1;
        while (count <= ratio*ratio){
            for (int i=0;i<ratio;i++){
                for (int j=0;j<ratio;j++){
                    if (cellState[i+1][j+1] == 1){
                        drawAnimationO(i+1,j+1,count);
                    }
                    if (cellState[i+1][j+1] == 2){
                        drawAnimationX(i+1,j+1,count);
                    }
                    count++;
                }
            }
        }
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
                text("Turn: Player 1 (O)",width/2,height-67);}
            if (turn == 2){
                textFont(manrope35);
                textSize(35);
                textAlign(CENTER);
                fill(234,24,35);
                text("Turn: Player 2 (X)",width/2,height-67);}
        }
    }
    void showHotkeys() {
        // display each hotkeys in the program
        textFont(manrope16);
        textAlign(CENTER);
        fill(153,76,0);
        text("Backspace: Reset | S: Save Game | R: Restore Game | H: Toggle Hint",width/2,height-38);
        text("Press Number 3 to 0 to change the board sizes from 3x3 to 10x10",width/2,height-15);
        fill(224,224,224);

        // check game state
        if (gameState == false && gameTie == true){ // tie scenario
            textFont(manrope35);
            textAlign(CENTER);
            fill(234,24,35);
            text("Tie!",width/2,height-70);
        }
    }
    void showWinner() {
        if (gameState == false && gameTie == false){ // untie scenario
            if (turn == 2){ // Player 1 wins
                textFont(manrope35);
                textAlign(CENTER);
                fill(234,24,35);
                text("Game Over! Player 1 Wins",width/2,height-67);}
            if (turn == 1){ // Player 2 wins
                textFont(manrope35);
                textAlign(CENTER);
                fill(234,24,35);
                text("Game Over! Player 2 Wins",width/2,height-67);}
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
                    text("Player 1 is going to win!",width/2,height-110);}
                if (playerHint == 2){ // hint player 2
                    textFont(manrope20);
                    textAlign(CENTER);
                    fill(65,105,225);
                    text("Player 2 is going to win!",width/2,height-110);}
                else{
                    text("",300,640);} // no hint
            // hint by showing players where to put the next move
            int count = 1;
            // horizontal move hint
            for (int i = 1 ; i <= ratio ; i++){
                for (int j = 1 ; j <= ratio ; j++){
                    drawHint((j*(width/ratio))-((width/ratio*2)),(i*(height-150/ratio))-((height-150/ratio*2)),count);
                    count = count + 1;
                }
            }
        //    while (j<=500){
        //        drawHint(j,120,i); // vertical move hint (10-18)
        //        drawHint(j,320,i+1);
        //        drawHint(j,520,i+2);
        //        i = i+3;
        //        j = j+200;}
        //        drawHint(100,120,19); // diagonal move hint (19-24)
        //        drawHint(300,320,20);
        //        drawHint(500,520,21);
        //        drawHint(100,520,22);
        //        drawHint(300,320,23);
        //        drawHint(500,120,24);
        //        fill(224,224,224);
        //    }  
        }
    }
}

    void showToggles() {
        // toggle operation
        if (toggleCode == 1){
            textFont(manrope18);
            textAlign(RIGHT);
            fill(255,0,0);
            text("Game Cleared!",width-20,height-110);}
        if (toggleCode == 2){
            textFont(manrope18);
            textAlign(RIGHT);
            fill(0,113,0);
            text("Game Saved!",width-20,height-110);}
        if (toggleCode == 3){
            textFont(manrope18);
            textAlign(RIGHT);
            fill(0,53,226);
            text("Game Restored!",width-20,height-110);}
        if (toggleCode == 4){
            textFont(manrope18);
            textAlign(RIGHT);
            fill(102,0,51);
            text("Hint is turned on",width-20,height-110);}
        if (toggleCode == 5){
            textFont(manrope18);
            textAlign(RIGHT);
            fill(102,0,51);
            text("Hint is turned off",width-20,height-110);}
        fill(224,224,224);
    }
}

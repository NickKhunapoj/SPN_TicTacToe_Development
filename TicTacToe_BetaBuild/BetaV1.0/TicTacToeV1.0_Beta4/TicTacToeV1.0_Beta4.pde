int[][] cellState = new int[4][4];// create cell state array (0 is unassigned, 1 is O, 2 is X)
boolean gameState = true; // game state. true is not over, false is over.
boolean gameTie = false;// game tie. true is tie false is not tie.
int turn = 1; // player turn
int clickCount = 0; // click counter
int playerHint = 0; // player hint counter
int mouseCode = 0; // clicking state
int circleRad = 100; // initialise circle radius
int lineLength = 0; // initialise line length offset
int i = 1; // initialise a hint looping variable
PrintWriter output; // use printWriter variables

void drawGrid(){ //draw a tic tac toe cell
  line(200,0,200,600);
  line(400,0,400,600);
  line(0,200,600,200);
  line(0,400,600,400);
  line(0,600,600,600);
}
void drawO(int posX,int posY){ //draw O,X
  ellipseMode(CENTER);
  circle(posX,posY,150);
}
void drawX(int posX,int posY){
  line(posX-200,posY-200,posX,posY);
  line(posX,posY-200,posX-200,posY);
}
void drawAnimationO(int posX,int posY,int mouseCodeCheck){ // draw animation O (mouseCode is a specific value for each cell in which is O's turn)
  if (circleRad<=150 && mouseCodeCheck == mouseCode){
    ellipseMode(CENTER);
    circle(posX,posY,circleRad);
    circleRad = circleRad + 5;
    }
  else{
    drawO(posX,posY);
  }
}
void drawAnimationX(int posX, int posY, int xposX,int xposY,int yposX,int yposY,int mouseCodeCheck){ // draw animation X (mouseCode is a specific value for each cell in which is X's turn)
  if (lineLength<=50 && mouseCodeCheck == mouseCode){
    line(xposX-lineLength,xposY-lineLength,yposX+lineLength,yposY+lineLength);
    line(yposX+lineLength,xposY-lineLength,xposX-lineLength,yposY+lineLength);
    lineLength = lineLength + 5;
    }
  else{
    drawX(posX,posY);
  }
}
void drawShadow(int xposX,int xposY,int yposX,int yposY){ //create shape shadow outline
  if (turn == 1){
    ellipseMode(CENTER);
    circle(xposX,xposY,100);
  }
  if (turn == 2){
    line(yposX-100,yposY-100,yposX,yposY);
    line(yposX,yposY-100,yposX-100,yposY);
  }
}
void parseGamesave() {
  // Open the file from the createWriter() example
  String[] pieces = loadStrings("gamesave.txt");
  int i = 1; // initial counting value for O's indexs while loop
  int j = 0; // initial counting value for O's indexs while loop
    while (i<=3){ // recorver data for each cellState
      cellState[i][1] = int(pieces[j]);
      cellState[i][2] = int(pieces[j+1]);
      cellState[i][3] = int(pieces[j+2]);
      i = i+1;
      j = j+3;
    }
  gameState = boolean(pieces[9]);
  gameTie = boolean(pieces[10]);
  turn = int(pieces[11]);
  clickCount = int(pieces[12]);
  playerHint = int(pieces[13]);
  i = int(pieces[14]);

} 

void setup(){ // draw a screen
  size(600,750);
  background(224,224,224);
}
void draw(){ // draw game board, O's and X's, print game state.
  //initialise a tic tac toe cell
  background(224,224,224);
  drawGrid();

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
  fill(224,224,224);
  
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
  
  // display turn
  if (gameState == true){
    if (turn == 1){
      textSize(35);
      textAlign(CENTER);
      fill(234,24,35);
      text("Turn: Player 1 (O)",300,685);}
    if (turn == 2){
      textSize(35);
      textAlign(CENTER);
      fill(234,24,35);
      text("Turn: Player 2 (X)",300,685);}
  }

  // display each hotkeys in the program
  textSize(18);
  textAlign(CENTER);
  fill(234,24,35);
  text("Backspace: Reset | S: Save Game | R: Restore Game",300,725);
  fill(224,224,224);

  // check game state
  if (gameState == false && gameTie == true){ // tie scenario
    textSize(35);
    textAlign(CENTER);
    fill(234,24,35);
    text("Tie!",300,680);
  }
  if (gameState == false && gameTie == false){ // untie scenario
    if (turn == 2){ // Player 1 wins
      textSize(35);
      textAlign(CENTER);
      fill(234,24,35);
      text("Game Over! Player 1 Wins",300,680);}
    if (turn == 1){ // Player 2 wins
      textSize(35);
      textAlign(CENTER);
      fill(234,24,35);
      text("Game Over! Player 2 Wins",300,680);}
    fill(224,224,224);
  }

  // hint a player
  if (gameState == true){ // hint player 1
    if (playerHint == 1){
      textSize(20);
      textAlign(CENTER);
      fill(65,105,225);
      text("Player 1 is going to win!",300,640);}
    if (playerHint == 2){ // hint player 2
      textSize(20);
      textAlign(CENTER);
      fill(65,105,225);
      text("Player 2 is going to win!",300,640);}
    else{
      text("",300,640);} // no hint
    fill(224,224,224);
  }
}

void keyPressed(){// for resetting or saving & closing a game
  if (keyCode == BACKSPACE){
    cellState = new int[4][4];// recreate cell state array
    gameState = true; // reset game state
    gameTie = false;// reset game tie
    turn = 1; // reset player turn
    clickCount = 0; // reset click counter
    playerHint = 0; // reset player hint
    i = 0; // reset a hint looping variable
  }
  if (key == 's' || key == 'S'){ // saving a game
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
    output.println(i); // print a hint looping variable
    output.flush(); // Writes the remaining data to the file
    output.close();
  }
  if (key == 'r' || key == 'R'){ // restore a game
    parseGamesave(); // call func parseGamesave
  }
}

void swapTurns(){
  if (turn == 1){
      turn = 2;
    }
    else{
      turn = 1;
    }
}

void mousePressed(){
  fill(255);   
  if (gameState == true){
    if (turn == 1){ // turn = 1 is O's turn, assign mouseCode for animation, append cellState list with number 1, swap turns and increase clickCount value.
      circleRad = 100; 
      if ((mouseX>0 && mouseX<200) && (mouseY>0 && mouseY<200) && cellState[1][1] != 2){ // top row
        mouseCode = 1;
        cellState[1][1] = 1;
        swapTurns();
        clickCount = clickCount + 1;}
      if ((mouseX>200 && mouseX<400) && (mouseY>0 && mouseY<200) && cellState[1][2] != 2){
        mouseCode = 2;
        cellState[1][2] = 1;
        swapTurns();
        clickCount = clickCount + 1;}
      if ((mouseX>400 && mouseX<600) && (mouseY>0 && mouseY<200) && cellState[1][3] != 2){
        mouseCode = 3;
        cellState[1][3] = 1;
        swapTurns();
        clickCount = clickCount + 1;}
      if ((mouseX>0 && mouseX<200) && (mouseY>200 && mouseY<400) && cellState[2][1] != 2){ // mid row
        mouseCode = 4;
        cellState[2][1] = 1;
        swapTurns();
        clickCount = clickCount + 1;}
      if ((mouseX>200 && mouseX<400) && (mouseY>200 && mouseY<400) && cellState[2][2] != 2){
        mouseCode = 5;
        cellState[2][2] = 1;
        swapTurns();
        clickCount = clickCount + 1;}
      if ((mouseX>400 && mouseX<600) && (mouseY>200 && mouseY<400) && cellState[2][3] != 2){
        mouseCode = 6;
        cellState[2][3] = 1;
        swapTurns();
        clickCount = clickCount + 1;}
      if ((mouseX>0 && mouseX<200) && (mouseY>400 && mouseY<600) && cellState[3][1] != 2){ // bot row
        mouseCode = 7;
        cellState[3][1] = 1;
        swapTurns();
        clickCount = clickCount + 1;}
      if ((mouseX>200 && mouseX<400) && (mouseY>400 && mouseY<600) && cellState[3][2] != 2){
        mouseCode = 8;
        cellState[3][2] = 1;
        swapTurns();
        clickCount = clickCount + 1;}
      if ((mouseX>400 && mouseX<600) && (mouseY>400 && mouseY<600) && cellState[3][3] != 2){
        mouseCode = 9;
        cellState[3][3] = 1;
        swapTurns();
        clickCount = clickCount + 1;}
    }
    if (turn == 2){ // turn = 2 is X's turn, assign mouseCode for animation, append cellState list with number 2, swap turns and increase clickCount value.
      lineLength = 0;
      if ((mouseX>0 && mouseX<200) && (mouseY>0 && mouseY<200) && cellState[1][1] != 1){ // top row
        mouseCode = 1;
        cellState[1][1] = 2;
        swapTurns();
        clickCount = clickCount + 1;}
      if ((mouseX>200 && mouseX<400) && (mouseY>0 && mouseY<200) && cellState[1][2] != 1){
        mouseCode = 2;
        cellState[1][2] = 2;
        swapTurns();
        clickCount = clickCount + 1;}
      if ((mouseX>400 && mouseX<600) && (mouseY>0 && mouseY<200) && cellState[1][3] != 1){
        mouseCode = 3;
        cellState[1][3] = 2;
        swapTurns();
        clickCount = clickCount + 1;}
      if ((mouseX>0 && mouseX<200) && (mouseY>200 && mouseY<400) && cellState[2][1] != 1){ // mid row
        mouseCode = 4;
        cellState[2][1] = 2;
        swapTurns();
        clickCount = clickCount + 1;}
      if ((mouseX>200 && mouseX<400) && (mouseY>200 && mouseY<400) && cellState[2][2] != 1){
        mouseCode = 5;
        cellState[2][2] = 2;
        swapTurns();
        clickCount = clickCount + 1;}
      if ((mouseX>400 && mouseX<600) && (mouseY>200 && mouseY<400) && cellState[2][3] != 1){
        mouseCode = 6;
        cellState[2][3] = 2;
        swapTurns();
        clickCount = clickCount + 1;}
      if ((mouseX>0 && mouseX<200) && (mouseY>400 && mouseY<600) && cellState[3][1] != 1){ // bot row
        mouseCode = 7;
        cellState[3][1] = 2;
        swapTurns();
        clickCount = clickCount + 1;}
      if ((mouseX>200 && mouseX<400) && (mouseY>400 && mouseY<600) && cellState[3][2] != 1){
        mouseCode = 8;
        cellState[3][2] = 2;
        swapTurns();
        clickCount = clickCount + 1;}
      if ((mouseX>400 && mouseX<600) && (mouseY>400 && mouseY<600) && cellState[3][3] != 1){
        mouseCode = 9;
        cellState[3][3] = 2;
        swapTurns();
        clickCount = clickCount + 1;}
    }
    println("Click Count",clickCount);
    println("turn",turn);
  }

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

  // a hint when player 1 or 2 is going to win
  // horizontal hint
  playerHint = 0;
  while (i<=3){
    if (turn == 1){
      if (cellState[i][1] == 0 && cellState[i][2] == 1 && cellState[i][3] == 1){
        playerHint = 1;}
      if (cellState[i][1] == 1 && cellState[i][2] == 0 && cellState[i][3] == 1){
        playerHint = 1;}
      if (cellState[i][1] == 1 && cellState[i][2] == 1 && cellState[i][3] == 0){ 
        playerHint = 1;}
    }
    if (turn == 2){
      if (cellState[i][1] == 0 && cellState[i][2] == 2 && cellState[i][3] == 2){
        playerHint = 2;}
      if (cellState[i][1] == 2 && cellState[i][2] == 0 && cellState[i][3] == 2){
        playerHint = 2;}
      if (cellState[i][1] == 2 && cellState[i][2] == 2 && cellState[i][3] == 0){ 
        playerHint = 2;}
    }
    i = i + 1;
  }
  i = 1;
  // vertical hint
  while (i<=3){
    if (turn == 1){
      if (cellState[1][i] == 0 && cellState[2][i] == 1 && cellState[3][i] == 1){
        playerHint = 1;}
      if (cellState[1][i] == 1 && cellState[2][i] == 0 && cellState[3][i] == 1){
        playerHint = 1;}
      if (cellState[1][i] == 1 && cellState[2][i] == 1 && cellState[3][i] == 0){ 
        playerHint = 1;}
    }
    if (turn == 2){
      if (cellState[1][i] == 0 && cellState[2][i] == 2 && cellState[3][i] == 2){
        playerHint = 2;}
      if (cellState[1][i] == 2 && cellState[2][i] == 0 && cellState[3][i] == 2){
        playerHint = 2;}
      if (cellState[1][i] == 2 && cellState[2][i] == 2 && cellState[3][i] == 0){ 
        playerHint = 2;}
    }
    i = i + 1;
  }
  i = 1;
  // diagonal hint
  while (i<=2){
  if (turn == 1){
    if (cellState[1][1] == 0 && cellState[2][2] == i && cellState[3][3] == i){
      playerHint = i;}
    if (cellState[1][1] == i && cellState[2][2] == 0 && cellState[3][3] == i){
      playerHint = i;}
    if (cellState[1][1] == i && cellState[2][2] == i && cellState[3][3] == 0){ 
      playerHint = i;}
    if (cellState[3][1] == 0 && cellState[2][2] == i && cellState[1][3] == i){
      playerHint = i;}
    if (cellState[3][1] == i && cellState[2][2] == 0 && cellState[1][3] == i){
      playerHint = i;}
    if (cellState[3][1] == i && cellState[2][2] == i && cellState[1][3] == 0){ 
      playerHint = i;}
    }
    i = i + 1;
  }
  i = 1;
  
}

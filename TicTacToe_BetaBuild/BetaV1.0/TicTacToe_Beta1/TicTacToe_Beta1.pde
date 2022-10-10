int[][] cellState_O = new int[4][4];// create cell state array
int[][] cellState_X = new int[4][4];
boolean gameState = true; // game state. true is not over, false is over.
boolean gameTie = false;// game tie. true is tie false is not tie.
int turn = 1; // player turn
int clickCount = 0; // click counter

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

void setup(){ // draw a screen
  size(600,750);
  background(255);
}
void draw(){ // draw game board, O's and X's, print game state.
  //initialise a tic tac toe cell
  background(255);
  drawGrid();

  //draw 0,X
  if (cellState_O[1][1] == 1){ // draw O, top row
    drawO(100,100);}
  if (cellState_O[1][2] == 1){
    drawO(300,100);}
  if (cellState_O[1][3] ==1){
    drawO(500,100);}
  if (cellState_O[2][1] == 1){ // mid row
    drawO(100,300);}
  if (cellState_O[2][2] == 1){
    drawO(300,300);}
  if (cellState_O[2][3] == 1){
    drawO(500,300);}
  if (cellState_O[3][1] == 1){ // bot row
    drawO(100,500);}
  if (cellState_O[3][2] == 1){
    drawO(300,500);}
  if (cellState_O[3][3] == 1){
    drawO(500,500);}
  
  if (cellState_X[1][1] == 1){ // draw X, top row
    drawX(200,200);}
  if (cellState_X[1][2] == 1){
    drawX(400,200);}
  if (cellState_X[1][3] == 1){
    drawX(600,200);}
  if (cellState_X[2][1] == 1){ // mid row
    drawX(200,400);}
  if (cellState_X[2][2] == 1){
    drawX(400,400);}
  if (cellState_X[2][3] == 1){
    drawX(600,400);}
  if (cellState_X[3][1] == 1){ // bot row
    drawX(200,600);}
  if (cellState_X[3][2] == 1){
    drawX(400,600);}
  if (cellState_X[3][3] == 1){
    drawX(600,600);}

  // display turn
  if (gameState == true){
    if (turn == 1){
      textSize(35);
      textAlign(CENTER);
      fill(234,24,35);
      text("Turn: Player 1 (O)",300,680);}
    if (turn == 2){
      textSize(35);
      textAlign(CENTER);
      fill(234,24,35);
      text("Turn: Player 2 (X)",300,680);}
    fill(255);
  }

  // display "press bkspc to restart"
  textSize(18);
  textAlign(CENTER);
  fill(234,24,35);
  text("Press BACKSPACE to restart the game.",300,725);
  fill(255);

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
    fill(255);
  }
}

void keyPressed(){// for resetting a game
  if (keyCode == BACKSPACE){
    cellState_O = new int[0][0];// clear cell state array
    cellState_X = new int[0][0];
    cellState_O = new int[4][4];// recreate cell state array
    cellState_X = new int[4][4];
    gameState = true; // reset game state
    gameTie = false;// reset game tie
    turn = 1; // reset player turn
    clickCount = 0; // reset click counter
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
  println("Click Count",clickCount);
  println("turn",turn);
  fill(255);     
  if (gameState == true){
    if (turn == 1){
      if ((mouseX>0 && mouseX<200) && (mouseY>0 && mouseY<200) && cellState_X[1][1] != 1){ // top row
        cellState_O[1][1] = 1;
        swapTurns();
        clickCount = clickCount + 1;}
      if ((mouseX>200 && mouseX<400) && (mouseY>0 && mouseY<200) && cellState_X[1][2] != 1){
        cellState_O[1][2] = 1;
        swapTurns();
        clickCount = clickCount + 1;}
      if ((mouseX>400 && mouseX<600) && (mouseY>0 && mouseY<200) && cellState_X[1][3] != 1){
        cellState_O[1][3] = 1;
        swapTurns();
        clickCount = clickCount + 1;}
      if ((mouseX>0 && mouseX<200) && (mouseY>200 && mouseY<400) && cellState_X[2][1] != 1){ // mid row
        cellState_O[2][1] = 1;
        swapTurns();
        clickCount = clickCount + 1;}
      if ((mouseX>200 && mouseX<400) && (mouseY>200 && mouseY<400) && cellState_X[2][2] != 1){
        cellState_O[2][2] = 1;
        swapTurns();
        clickCount = clickCount + 1;}
      if ((mouseX>400 && mouseX<600) && (mouseY>200 && mouseY<400) && cellState_X[2][3] != 1){
        cellState_O[2][3] = 1;
        swapTurns();
        clickCount = clickCount + 1;}
      if ((mouseX>0 && mouseX<200) && (mouseY>400 && mouseY<600) && cellState_X[3][1] != 1){ // bot row
        cellState_O[3][1] = 1;
        swapTurns();
        clickCount = clickCount + 1;}
      if ((mouseX>200 && mouseX<400) && (mouseY>400 && mouseY<600) && cellState_X[3][2] != 1){
        cellState_O[3][2] = 1;
        swapTurns();
        clickCount = clickCount + 1;}
      if ((mouseX>400 && mouseX<600) && (mouseY>400 && mouseY<600) && cellState_X[3][3] != 1){
        cellState_O[3][3] = 1;
        swapTurns();
        clickCount = clickCount + 1;}
    }
    if (turn == 2){
      if ((mouseX>0 && mouseX<200) && (mouseY>0 && mouseY<200) && cellState_O[1][1] != 1){ // top row
        cellState_X[1][1] = 1;
        swapTurns();
        clickCount = clickCount + 1;}
      if ((mouseX>200 && mouseX<400) && (mouseY>0 && mouseY<200) && cellState_O[1][2] != 1){
        cellState_X[1][2] = 1;
        swapTurns();
        clickCount = clickCount + 1;}
      if ((mouseX>400 && mouseX<600) && (mouseY>0 && mouseY<200) && cellState_O[1][3] != 1){
        cellState_X[1][3] = 1;
        swapTurns();
        clickCount = clickCount + 1;}
      if ((mouseX>0 && mouseX<200) && (mouseY>200 && mouseY<400) && cellState_O[2][1] != 1){ // mid row
        cellState_X[2][1] = 1;
        swapTurns();
        clickCount = clickCount + 1;}
      if ((mouseX>200 && mouseX<400) && (mouseY>200 && mouseY<400) && cellState_O[2][2] != 1){
        cellState_X[2][2] = 1;
        swapTurns();
        clickCount = clickCount + 1;}
      if ((mouseX>400 && mouseX<600) && (mouseY>200 && mouseY<400) && cellState_O[2][3] != 1){
        cellState_X[2][3] = 1;
        swapTurns();
        clickCount = clickCount + 1;}
      if ((mouseX>0 && mouseX<200) && (mouseY>400 && mouseY<600) && cellState_O[3][1] != 1){ // bot row
        cellState_X[3][1] = 1;
        swapTurns();
        clickCount = clickCount + 1;}
      if ((mouseX>200 && mouseX<400) && (mouseY>400 && mouseY<600) && cellState_O[3][2] != 1){
        cellState_X[3][2] = 1;
        swapTurns();
        clickCount = clickCount + 1;}
      if ((mouseX>400 && mouseX<600) && (mouseY>400 && mouseY<600) && cellState_O[3][3] != 1){
        cellState_X[3][3] = 1;
        swapTurns();
        clickCount = clickCount + 1;}
    }
  }

  // check a winner 
  // horizontal win
  if (cellState_O[1][1] == 1 && cellState_O[1][2] == 1 && cellState_O[1][3] == 1){ // O top
    println("Player 1 wins! top row");
    gameState = false;}
  if (cellState_O[2][1] == 1 && cellState_O[2][2] == 1 && cellState_O[2][3] == 1){ // mid
    println("Player 1 wins! mid row");
    gameState = false;}
  if (cellState_O[3][1] == 1 && cellState_O[3][2] == 1 && cellState_O[3][3] == 1){ // bot
    println("Player 1 wins! bot row");
    gameState = false;}
  if (cellState_X[1][1] == 1 && cellState_X[1][2] == 1 && cellState_X[1][3] == 1){ // X top
    println("Player 2 wins! top row");
    gameState = false;}
  if (cellState_X[2][1] == 1 && cellState_X[2][2] == 1 && cellState_X[2][3] == 1){ // mid
    println("Player 2 wins! mid row");
    gameState = false;}
  if (cellState_X[3][1] == 1 && cellState_X[3][2] == 1 && cellState_X[3][3] == 1){ // bot
    println("Player 2 wins! bot row");
    gameState = false;}
   
  // vertical win
  if (cellState_O[1][1] == 1 && cellState_O[2][1] == 1 && cellState_O[3][1] == 1){ // O left
    println("Player 1 wins! left collumn");
    gameState = false;}
  if (cellState_O[1][2] == 1 && cellState_O[2][2] == 1 && cellState_O[3][2] == 1){ // mid
    println("Player 1 wins! mid collumn");
    gameState = false;}
  if (cellState_O[1][3] == 1 && cellState_O[2][3] == 1 && cellState_O[3][3] == 1){ // right
    println("Player 1 wins! right collumn");
    gameState = false;}
  if (cellState_X[1][1] == 1 && cellState_X[2][1] == 1 && cellState_X[3][1] == 1){ // X left
    println("Player 2 wins! left collumn");
    gameState = false;}
  if (cellState_X[1][2] == 1 && cellState_X[2][2] == 1 && cellState_X[3][2] == 1){ // mid
    println("Player 2 wins! mid collumn");
    gameState = false;}
  if (cellState_X[1][3] == 1 && cellState_X[2][3] == 1 && cellState_X[3][3] == 1){ // right
    println("Player 2 wins! right collumn");
    gameState = false;}
       
  // diagonal win
  if (cellState_O[1][1] == 1 && cellState_O[2][2] == 1 && cellState_O[3][3] == 1){ // left to right
    println("Player 1 wins! left to right");
    gameState = false;}
  if (cellState_X[1][1] == 1 && cellState_X[2][2] == 1 && cellState_X[3][3] == 1){ // left to right
    println("Player 2 wins! left to right");
    gameState = false;}
  if (cellState_O[3][1] == 1 && cellState_O[2][2] == 1 && cellState_O[1][3] == 1){ // right to left
    println("Player 1 wins! right to left");
    gameState = false;}
  if (cellState_X[3][1] == 1 && cellState_X[2][2] == 1 && cellState_X[1][3] == 1){ // right to left
    println("Player 2 wins! right to left");
    gameState = false;}
      
  //a tie
  if (clickCount == 9 && gameState == true){
    println("A tie");
    gameState = false;
    gameTie = true;}
}

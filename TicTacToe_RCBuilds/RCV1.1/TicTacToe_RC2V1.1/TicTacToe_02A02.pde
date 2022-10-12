PFont manrope16; // create font name manrope 16
PFont manrope18; // create font name manrope 18
PFont manrope20; // create font name manrope 20
PFont manrope35; // create font name manrope 35
PFont manrope50; // create font name manrope 50
int[][] cellState = new int[4][4];// create cell state array (0 is unassigned, 1 is O, 2 is X)
boolean gameState = true; // game state. true is not over, false is over.
boolean gameTie = false;// game tie. true is tie false is not tie.
int posX, posY, mouseCodeCheck; // variables for animation object
AnimateO AniO; // animation object for O
AnimateX AniX; // animation object for X
int turn = 1; // player turn
int clickCount = 0; // click counter
int playerHint = 0; // player hint counter to show who's going to win
int moveHint = 0; // player hint counter to show where to put the next move
int mouseCode = 0; // clicking state
int hintToggle = 0; // hint state on or off
int toggleCode = 0; // toggle state (status of each key press)
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
void drawO(int posX,int posY){ //draw O
  ellipseMode(CENTER);
  circle(posX,posY,150);
}
void drawX(int posX,int posY){ //draw X
  line(posX-175,posY-175,posX-25,posY-25);
  line(posX-25,posY-175,posX-175,posY-25);
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
void drawHint(int posX,int posY,int moveHintCheck){ //create shape hint outline
  if (playerHint != 0 && moveHintCheck == moveHint){
    textFont(manrope50);
    textAlign(CENTER);
    fill(255,142,54);
    text("?",posX,posY);
    }
}

void parseGamesave() {
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

void setup(){ // draw a screen
  frameRate(120); // set frame rate to 120Hz
  size(600,750); // set canvas size to 600x750
  background(224,224,224); // set background to light gray
  strokeWeight(8); // set stroke weight to 8px
  strokeCap(ROUND); // set stroke cap as round
  manrope16 = createFont("Manrope-SemiBold.ttf",16); // create variations of fonts
  manrope18 = createFont("Manrope-SemiBold.ttf",18);
  manrope20 = createFont("Manrope-SemiBold.ttf",20);
  manrope35 = createFont("Manrope-SemiBold.ttf",35);
  manrope50 = createFont("Manrope-SemiBold.ttf",50);
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
  stroke(0); // reset stroke colour
  strokeWeight(8); // reset stroke weight to 8px
  fill(224,224,224); // fill the background to its same colour
  
  //draw 0,X
  if (cellState[1][1] == 1){ // draw O, top row
    AniO = new AnimateO(100,100,1);
    AniO.animateO();}
  if (cellState[1][2] == 1){
    AniO = new AnimateO(300,100,2);
    AniO.animateO();}
  if (cellState[1][3] == 1){
    AniO = new AnimateO(500,100,3);
    AniO.animateO();}
  if (cellState[2][1] == 1){ // mid row
    AniO = new AnimateO(100,300,4);
    AniO.animateO();}
  if (cellState[2][2] == 1){
    AniO = new AnimateO(300,300,5);
    AniO.animateO();}
  if (cellState[2][3] == 1){
    AniO = new AnimateO(500,300,6);
    AniO.animateO();}
  if (cellState[3][1] == 1){ // bot row
    AniO = new AnimateO(100,500,7);
    AniO.animateO();}
  if (cellState[3][2] == 1){
    AniO = new AnimateO(300,500,8);
    AniO.animateO();}
  if (cellState[3][3] == 1){
    AniO = new AnimateO(500,500,9);
    AniO.animateO();}
  
  if (cellState[1][1] == 2){ // draw X, top row
    AniX = new AnimateX(200,200,50,50,150,150,1);
    AniX.animateX();}
  if (cellState[1][2] == 2){
    AniX = new AnimateX(400,200,250,50,350,150,2);
    AniX.animateX();}
  if (cellState[1][3] == 2){
    AniX = new AnimateX(600,200,450,50,550,150,3);
    AniX.animateX();}
  if (cellState[2][1] == 2){ // mid row
    AniX = new AnimateX(200,400,50,250,150,350,4);
    AniX.animateX();}
  if (cellState[2][2] == 2){
    AniX = new AnimateX(400,400,250,250,350,350,5);
    AniX.animateX();}
  if (cellState[2][3] == 2){
    AniX = new AnimateX(600,400,450,250,550,350,6);
    AniX.animateX();}
  if (cellState[3][1] == 2){ // bot row
    AniX = new AnimateX(200,600,50,450,150,550,7);
    AniX.animateX();}
  if (cellState[3][2] == 2){
    AniX = new AnimateX(400,600,250,450,350,550,8);
    AniX.animateX();}
  if (cellState[3][3] == 2){
    AniX = new AnimateX(600,600,450,450,550,550,9);
    AniX.animateX();}
  fill(224,224,224);
  
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

void keyPressed(){// for resetting or saving & closing a game
  if (keyCode == BACKSPACE){
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
  if (key == 's' || key == 'S'){ // saving a game
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
  if (key == 'r' || key == 'R'){ // restore a game
    toggleCode = 3; // toggle code to show that it's restored
    parseGamesave(); // call func parseGamesave
  }
  if (key == 'h' || key == 'H'){ // toggle hint on or off
    if (hintToggle == 0){ // if hitToggle is off
      hintToggle = 1; // change hitToggle to on
      toggleCode = 4; // toggle code to show that hint is turned on
    }
    else{ // if hitToggle is on
      hintToggle = 0; // change hitToggle to off
      toggleCode = 5; // toggle code to show that hint is turned off
    }
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

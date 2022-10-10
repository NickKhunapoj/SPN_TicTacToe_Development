//click counter
int clickCount = 0;
// state of each cell
int[][] cellState_X = new int[4][4];
int[][] cellState_O = new int[4][4];
// game state
boolean gameState = true; //true is not over, false is over.
boolean gameTie = false;// true is tie false is not tie.
// player turn
int turn = 1;

//initialise grid array
int cols = 3;
int rows = 3;
Cell[][] grid;

// turn switching
void switchTurns(){
    if (turn == 1){
      turn = 2;}
    else{
      turn = 1;} 
}
    
//draw X and O
void drawX(int posX,int posY){
  line(posX-200,posY-200,posX,posY);
  line(posX,posY-200,posX-200,posY);
}
void drawO(int posX,int posY){
  ellipseMode(CENTER);
  circle(posX,posY,150);
}
  
void setup(){
  // draw a screen
  size(600,750);
  background(200);
  // initialise each obj in an array
  grid = new Cell[cols][rows];
  int i = 0;
  int j = 0;
  while (j<rows){
    while (i<cols){
    grid[i][j] = new Cell(i*200,j*200,200,200);
    i = i+1; }
  i = 0;
  j = j+1;}
 j = 0;
}

void draw(){
  // draw game board
  background(200);
  // check turn
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
       text("Turn: Player 2 (X)",300,680);}}
  fill(255);
  int i = 0;
  int j = 0;
  while (j<rows){
    while (i<cols){
    grid[i][j].display();
    i = i+1; }
  i = 0;
  j = j+1;}
  j = 0;
 
   // check game state
   if (gameState == false && gameTie == true){
       textSize(35);
       textAlign(CENTER);
       fill(234,24,35);
       text("Tie!",300,680);}
   if (gameState == false && gameTie == false){
     if (turn == 1){
       textSize(35);
       textAlign(CENTER);
       fill(234,24,35);
       text("Game Over! Player 2 Wins",300,680);}
     if (turn == 2){
       textSize(35);
       textAlign(CENTER);
       fill(234,24,35);
       text("Game Over! Player 1 Wins",300,680);}
   }
}
    
void mousePressed(){
  println(mouseX,mouseY);
  fill(255); 
  while (clickCount < 9){
    if (turn == 1){ //if it's o turn (player 1)
      // top row
      if ((mouseX>0 && mouseX<200) && (mouseY>0 && mouseY<200)){
        drawO(100,100);
        cellState_O[1][1] = 1;}
      if ((mouseX>200 && mouseX<400) && (mouseY>0 && mouseY<200)){
        drawO(300,100);
        cellState_O[1][2] = 1;}
      if ((mouseX>400 && mouseX<600) && (mouseY>0 && mouseY<200)){
        drawO(500,100);
        cellState_O[1][3] = 1;}
      
      // middle row
      if ((mouseX>0 && mouseX<200) && (mouseY>200 && mouseY<400)){
        drawO(100,300);
        cellState_O[2][1] = 1;}
      if ((mouseX>200 && mouseX<400) && (mouseY>200 && mouseY<400)){
        drawO(300,300);
        cellState_O[2][2] = 1;}
      if ((mouseX>400 && mouseX<600) && (mouseY>200 && mouseY<400)){
        drawO(500,300);
        cellState_O[2][3] = 1;}
        
      // bottom row
      if ((mouseX>0 && mouseX<200) && (mouseY>400 && mouseY<600)){
        drawO(100,500);
        cellState_O[3][1] = 1;}
      if ((mouseX>200 && mouseX<400) && (mouseY>400 && mouseY<600)){
        drawO(300,500);
        cellState_O[3][2] = 1;}
      if ((mouseX>400 && mouseX<600) && (mouseY>400 && mouseY<600)){
        drawO(500,500);
        cellState_O[3][3] = 1;}
    clickCount = clickCount+1;
    switchTurns();
    }
    if (turn == 2){ //if it's x turn (player 2)
      // top row
      if ((mouseX>0 && mouseX<200) && (mouseY>0 && mouseY<200)){
        drawX(200,200);
        cellState_X[1][1] = 1;}
      if ((mouseX>200 && mouseX<400) && (mouseY>0 && mouseY<200)){
        drawX(400,200);
        cellState_X[1][2] = 1;}
      if ((mouseX>400 && mouseX<600) && (mouseY>0 && mouseY<200)){
        drawX(600,200);
        cellState_X[1][3] = 1;}
      
      // middle row
      if ((mouseX>0 && mouseX<200) && (mouseY>200 && mouseY<400)){
        drawX(200,400);
        cellState_X[2][1] = 1;}
      if ((mouseX>200 && mouseX<400) && (mouseY>200 && mouseY<400)){
        drawX(400,400);
        cellState_X[2][2] = 1;}
      if ((mouseX>400 && mouseX<600) && (mouseY>200 && mouseY<400)){
        drawX(600,400);
        cellState_X[2][3] = 1;}
        
      // bottom row
      if ((mouseX>0 && mouseX<200) && (mouseY>400 && mouseY<600)){
        drawX(200,600);
        cellState_X[3][1] = 1;}
      if ((mouseX>200 && mouseX<400) && (mouseY>400 && mouseY<600)){
        drawX(400,600);
        cellState_X[3][2] = 1;}
      if ((mouseX>400 && mouseX<600) && (mouseY>400 && mouseY<600)){
        drawX(600,600);
        cellState_X[3][3] = 1;}
    clickCount = clickCount+1;
    switchTurns();
    }
  }
}

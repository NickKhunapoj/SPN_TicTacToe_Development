// state of each cell
int topLeft,topMiddle,topRight = 0;
int midLeft,midMiddle,midRight = 0;
int botLeft,botMiddle,botRight = 0;
// game state
boolean gameState = true; //true is not over, false is over.
boolean gameTie = false;// true is tie false is not tie.
// player turn
int turn = 1;
// click counter
int clickCount = 0;

//initialise grid array
int cols = 3;
int rows = 3;
Cell[][] grid;

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
  
   // draw O/X    
   // top row
   if (topLeft == 1){
   // draw O top left
   ellipse(100,100,150,150);}
   if (topLeft == 2){
   // draw x top left
   line(0,0,200,200);
   line(200,0,0,200);}
   
   if (topMiddle == 1){
   // draw O top middle
   ellipse(300,100,150,150);}
   if (topMiddle == 2){
   // draw x top middle
   line(200,0,400,200);
   line(400,0,200,200);}
   
   if (topRight == 1){
   // draw O top right
   ellipse(500,100,150,150);}
   if (topRight == 2){
   // draw x top right
   line(400,0,600,200);
   line(600,0,400,200);}
   
   // middle row
   if (midLeft == 1){
   // draw O middle left
   ellipse(100,300,150,150);}
   if (midLeft == 2){
   // draw x middle left
   line(0,200,200,400);
   line(200,200,0,400); }
   
   if (midMiddle == 1){
   // draw O middle middle
   ellipse(300,300,150,150);}
   if (midMiddle == 2){
   // draw x middle middle
   line(200,200,400,400);
   line(400,200,200,400);}
   
   if (midRight == 1){
   // draw O middle right
   ellipse(500,300,150,150);}
   if (midRight == 2){
   // draw x middle right
   line(400,200,600,400);
   line(600,200,400,400);}
   
   // bottom row
   if (botLeft == 1){
   // draw O bottom left
   ellipse(100,500,150,150);}
   if (botLeft == 2){
   // draw x bottom left
   line(0,400,200,600);
   line(200,400,0,600);}
   
   if (botMiddle == 1){
   // draw O bottom middle
   ellipse(300,500,150,150);}
   if (botMiddle == 2){
   // draw x bottom middle
   line(200,400,400,600);
   line(400,400,200,600);}
   
   if (botRight == 1){
   // draw O bottom right
   ellipse(500,500,150,150);}
   if (botRight == 2){
   // draw x bottom right
   line(400,400,600,600);
   line(600,400,400,600);}
   
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
   
   // horizontal win line
   // top row
   if (topLeft == topMiddle && topMiddle == topRight && topLeft == topRight){
     if (topLeft == 1 || topLeft == 2){
     stroke(0);
     line(0,100,600,100);}}
   // middle row
   if (midLeft == midMiddle && midMiddle == midRight && midLeft == midRight){
     if (midLeft == 1 || midLeft == 2){
     stroke(0);
     line(0,300,600,300);}}
   // bottom row
   if (botLeft == botMiddle && botMiddle == botRight && botLeft == botRight){
     if (botLeft == 1 || botLeft == 2){
     stroke(0);
     line(0,500,600,500);}}  }
     
   // vertical win line
   // left column
   if (topLeft == midLeft && midLeft == botLeft && topLeft == botLeft){
     if (topLeft == 1 || topLeft == 2){
     stroke(0);
     line(100,0,100,600);}}
   // middle column
   if (topMiddle == midMiddle && midMiddle == botMiddle && topMiddle == botMiddle){
     if (topMiddle == 1 || topMiddle == 2){
     stroke(0);
     line(300,0,300,600);}}
   // right column
   if (topRight == midRight && midRight == botRight && topRight == botRight){
     if (topRight == 1 || topRight == 2){
     stroke(0);
     line(500,0,500,600);}} 
     
   // diagonal win line
   // right diagonal
   if (topLeft == midMiddle && midMiddle == botRight && topLeft == botRight){
     if (topLeft == 1 || topLeft == 2){
       stroke(0);
       line(0,0,600,600);}}
   // left diagonal
   if (topRight == midMiddle && midMiddle == botLeft && topRight == botLeft){
     if (topRight == 1 || topRight == 2){
       stroke(0);
       line(600,0,0,600);}}  }

void switchTurns(){
  // turn switching
    if (turn == 1){
      turn = 2;}
    else{turn = 1;} }
    
void mousePressed(){
  println(mouseX,mouseY);
  fill(255);     
  // gameplay
  if (gameState == true){
  // top row
  if ((mouseX>0 && mouseX<200) && (mouseY>0 && mouseY<200)){
    topLeft = turn;
    switchTurns();}
  if ((mouseX>200 && mouseX<400) && (mouseY>0 && mouseY<200)){
    topMiddle = turn;
    switchTurns();}
  if ((mouseX>400 && mouseX<600) && (mouseY>0 && mouseY<200)){
    topRight = turn;
    switchTurns();}
    
  // middle row
  if ((mouseX>0 && mouseX<200) && (mouseY>200 && mouseY<400)){
    midLeft = turn;
    switchTurns();}
  if ((mouseX>200 && mouseX<400) && (mouseY>200 && mouseY<400)){
    midMiddle = turn;
    switchTurns();}
  if ((mouseX>400 && mouseX<600) && (mouseY>200 && mouseY<400)){
    midRight = turn;
    switchTurns();}
    
  // bottom row
  if ((mouseX>0 && mouseX<200) && (mouseY>400 && mouseY<600)){
    botLeft = turn;
    switchTurns();}
  if ((mouseX>200 && mouseX<400) && (mouseY>400 && mouseY<600)){
    botMiddle = turn;
    switchTurns();}
  if ((mouseX>400 && mouseX<600) && (mouseY>400 && mouseY<600)){
    botRight = turn;
    switchTurns();}
  clickCount = clickCount + 1;
}

  // check a winner 
   // horizontal win
   // top row
   if (topLeft == topMiddle && topMiddle == topRight && topLeft == topRight){
     if (topLeft == 1){
       println("Player 1 wins! top row");}
     if (topLeft == 2){
       println("Player 2 wins! top row");
       gameState = false;}}
   // middle row
   if (midLeft == midMiddle && midMiddle == midRight && midLeft == midRight){
     if (midLeft == 1){
       println("Player 1 wins! middle row");
       gameState = false;}
     if (midLeft == 2){
       println("Player 2 wins! middle row");
       gameState = false;}}
   // bottom row
   if (botLeft == botMiddle && botMiddle == botRight && botLeft == botRight){
     if (botLeft == 1){
       println("Player 1 wins! bottom row");
       gameState = false;}
     if (botLeft == 2){
       println("Player 2 wins! bottom row");
       gameState = false;}}
       
   // vertical win
   // left column
   if (topLeft == midLeft && midLeft == botLeft && topLeft == botLeft){
     if (topLeft == 1){
       println("Player 1 wins! left collumn");
       gameState = false;}
     if (topLeft == 2){
       println("Player 2 wins! left collumn");
       gameState = false;}}
   // middle column
   if (topMiddle == midMiddle && midMiddle == botMiddle && topMiddle == botMiddle){
     if (topMiddle == 1){
       println("Player 1 wins! middle collumn");
       gameState = false;}
     if (topMiddle == 2){
       println("Player 2 wins! middle collumn");
       gameState = false;}}
   // right column
   if (topRight == midRight && midRight == botRight && topRight == botRight){
     if (topRight == 1){
       println("Player 1 wins! middle collumn");
       gameState = false;}
     if (topRight == 2){
       println("Player 2 wins! middle collumn");
       gameState = false;}}
       
    // diagonal win
    // right diagonal
    if (topLeft == midMiddle && midMiddle == botRight && topLeft == botRight){
     if (topLeft == 1){
       println("Player 1 wins! right diagonal");
       gameState = false;}
     if (topLeft == 2){
       println("Player 2 wins! right diagonal");
       gameState = false;}}
    // left diagonal
    if (topRight == midMiddle && midMiddle == botLeft && topRight == botLeft){
     if (topRight == 1){
       println("Player 1 wins! left diagonal");
       gameState = false;}
     if (topRight == 2){
       println("Player 2 wins! left diagonal");
       gameState = false;}}
      
      //a tie
      if (clickCount == 9 && gameState == true){
        println("A tie");
        gameState = false;
        gameTie = true;}
}

PFont manrope16; // create font name manrope 16
PFont manrope18; // create font name manrope 18
PFont manrope20; // create font name manrope 20
PFont manrope35; // create font name manrope 35
PFont manrope50; // create font name manrope 50
int[][] cellState = new int[4][4];// create cell state array (0 is unassigned, 1 is O, 2 is X)
boolean gameState = true; // game state. true is not over, false is over.
boolean gameTie = false;// game tie. true is tie false is not tie.
int posX, posY, mouseCodeCheck; // variables for animation object
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

//create objects from each class
Model model = new Model(); // object from model class
View view = new View();  // object from view class
Controller controller = new Controller();  // object from controller class

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
  view.makeGrid(); // call makeGrid method from view class
  view.makeShadows(); // call makeShadows method from view class
  stroke(0); // reset stroke colour
  strokeWeight(8); // reset stroke weight to 8px
  fill(224,224,224); // fill the background to its same colour
  view.makeOX(); // call makeOX method from view class
  
  view.showTurns(); // call showTurns method from view class
  view.showHotkeys(); // call showHotkeys method from view class
  view.showWinner(); // call showWinner method from view class
  view.showHints(); // call showHints method from view class
  view.showToggles(); // call showToggles method from view class
}

void keyPressed(){// for resetting or saving & closing a game
  if (keyCode == BACKSPACE){
    model.reset(); // call reset method from model class
  }
  if (key == 's' || key == 'S'){ // saving a game
    model.saveGamesave(); // call saveGamesave method from model class
  }
  if (key == 'r' || key == 'R'){ // restore a game
    model.restoreGamesave(); // call restoreGamesave method from model class
  }
  if (key == 'h' || key == 'H'){ // toggle hint on or off
    model.toggleHint(); // call toggleHint method from model class
  }
}

void mousePressed(){
  fill(255);   
  controller.gameboardControl(); // call gameboardControl method from controller class
  controller.winCheck(); // call winCheck method from controller class
  controller.hintControl(); // call hintControl method from controller class
}
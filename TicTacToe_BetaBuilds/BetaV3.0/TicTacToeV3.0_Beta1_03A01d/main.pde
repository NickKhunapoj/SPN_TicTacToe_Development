//create objects from each class
Model model = new Model(); // object from model class
View view = new View();  // object from view class
Controller controller = new Controller();  // object from controller class

void setup(){ // draw a screen
  frameRate(120); // set frame rate to 120Hz
  size(700,850); // set canvas size to 600x750
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
  strokeWeight(5); // reset stroke weight to 8px
  fill(224,224,224); // fill the background to its same colour
  view.makeOX(); // call makeOX method from view class
  
  view.showTurns(); // call showTurns method from view class
  view.showHotkeys(); // call showHotkeys method from view class
  view.showWinner(); // call showWinner method from view class
  // view.showHints(); // call showHints method from view class
  view.showToggles(); // call showToggles method from view class
}

void keyPressed(){// for resetting or saving & closing a game
  model.keyPressedAction(); // call keyPressedAction method from model class
}
void mousePressed(){
  fill(255);   
  controller.gameboardControl(); // call gameboardControl method from controller class
  controller.winCheck(); // call winCheck method from controller class
  // controller.hintControl(); // call hintControl method from controller class
}

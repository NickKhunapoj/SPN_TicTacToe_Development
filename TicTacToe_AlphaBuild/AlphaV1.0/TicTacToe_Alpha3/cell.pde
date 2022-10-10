// class Cell
class Cell {
  int x; //x coor
  int y; //y coor
  int w; //width
  int h; //height
  
  // Cell Constructor
  Cell(int x, int y, int w, int h){
    this.x = x; //set to x
    this.y = y; //set to y
    this.w = w; //set to w
    this.h = h; //set to h
  }
  //display cell
  void display(){
    rect(x,y,w,h);}}

class AnimateO{
    int posX;
    int posY;
    int mouseCodeCheck;

    AnimateO(int posX,int posY,int mouseCodeCheck){
        this.posX = posX;
        this.posY = posY;
        this.mouseCodeCheck = mouseCodeCheck;
    }
    void animateO(){
        if (circleRad<=150 && this.mouseCodeCheck == mouseCode){
    ellipseMode(CENTER);
    circle(this.posX,this.posY,circleRad);
    circleRad = circleRad + 5;
    }
        else{
    drawO(this.posX,this.posY);
    }
    }
}


class AnimateX{
    int posX;
    int posY;
    int xposX;
    int xposY;
    int yposX;
    int yposY;
    int mouseCodeCheck;

    AnimateX(int posX, int posY, int xposX,int xposY,int yposX,int yposY,int mouseCodeCheck){
        this.posX = posX;
        this.posY = posY;
        this.xposX = xposX;
        this.xposY = xposY;
        this.yposX = yposX;
        this.yposY = yposY;
        this.mouseCodeCheck = mouseCodeCheck;
    }
    void animateX(){
    if (lineLength<=50 && this.mouseCodeCheck == mouseCode){
        line(this.xposX-lineLength,this.xposY-lineLength,this.yposX+lineLength,this.yposY+lineLength);
        line(this.yposX+lineLength,this.xposY-lineLength,this.xposX-lineLength,this.yposY+lineLength);
        lineLength = lineLength + 5;
    }
    else{
        drawX(this.posX,this.posY);
    }
    }
}
    

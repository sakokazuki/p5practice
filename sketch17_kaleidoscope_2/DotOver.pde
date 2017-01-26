
class DotOver{
  
  int xNum;
  int yNum;
  color col;
  
  DotOver(int xNum, int yNum, color col){
    this.xNum = xNum;
    this.yNum = yNum;
    this.col = col;
  }
  
  void update(){
    noStroke();
    fill(col);
    float remainderX = width%xNum;
    float remainderY = height%yNum;
    for(int i=0; i<width; i+=width/xNum){
      for(int j=0; j<height; j+=height/yNum){
        pushMatrix();
        translate(remainderX/2, remainderY/2);
        ellipse(i, j, 1, 1);
        popMatrix();
      }
    }
  }
}
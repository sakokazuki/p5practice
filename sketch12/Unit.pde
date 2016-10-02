class Unit{
  int _x, _y, _sizeX, _sizeY;
  color _col1, _col2;
  int _type1, _type2;
  
  
  Unit(int x, int y, int sizeX, int sizeY, color c1, color c2, int type1, int type2){
    _x = x;
    _y = y;
    _sizeX = sizeX;
    _sizeY = sizeY;
    _col1 = c1;
    _col2 = c2;
    _type1 = type1;
    _type2 = type2;
    
    rectMode(CENTER);
    println(atan(10/10));
  }
  
  void update(){
    drawTri(_type1, _col1);
    drawLine(_type2, _col2);
  }
  
  void drawLine(int type, color c){
    pushMatrix();
    translate(_x+_sizeX/2, _y+_sizeY/2);
    fill(c);
    rotate(atan(_sizeX/_sizeY)+radians(90*type));
    
    int l = (int)sqrt(sq(_sizeX) + sq(_sizeY));
    rect(0, 0, l, _sizeX/10);
    popMatrix();
  }
  
  void drawTri(int type, color c){
    int centerX = _x + _sizeX/2;
    int centerY = _y + _sizeY/2;
    int cornerX = _x + _sizeX;
    int cornerY = _y + _sizeY;
    fill(c);
    noStroke();
    switch(type){
      case 0:
        triangle(centerX, centerY, cornerX, _y, cornerX, cornerY);
        break;
      case 1:
        triangle(centerX, centerY, cornerX, cornerY, _x, cornerY);
        break;
      case 2:
        triangle(centerX, centerY, _x, cornerY, _x, _y);
        break;
      case 3:
        triangle(centerX, centerY, _x, _y, cornerX, _y);
        break;
      default:
        triangle(centerX, centerY, cornerX, _y, cornerX, cornerY);
        break;
    }
  }
  
  
  
}
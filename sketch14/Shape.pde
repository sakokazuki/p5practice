class Shape{
  PShape _shape;
  int _sizeX;
  int _sizeY;
  float _rotateX;
  float _rotateY;
  float _rSpeed;
  Shape(int shapeNo, int size, float rSpeed){
    _shape = shape[shapeNo];
    _sizeX = size;
    _sizeY = size;
    if(shapeNo == 1 || shapeNo == 3){
      _sizeX = (int)(size*0.3);
    }
    
    _rotateX = random(0, 360);
    _rotateY = random(0, 360);
    _rSpeed = rSpeed;
    
  }
  
  void drawShape(float x, float y, float z){
    pushMatrix();
    translate(x, y, z);
    rotateX(radians(_rotateX));
    rotateY(radians(_rotateY));
    shape(_shape, 0, 0, _sizeX, _sizeY);
    popMatrix();
    
    _rotateX += _rSpeed;
    _rotateY += _rSpeed;
  }
}
class PutCircleBar{
  int _x, _y, _h;
  float _delay;
  float _length;
  int _maxLength;
  float _speed;
  color _col;
  
  PutCircleBar(int x, int y, int h, float delay, int maxL, float speed, color col){
    _x = x;
    _y = y;
    _h = h;
    _delay = delay;
    _col = col;
    _maxLength = maxL;
    _speed = speed;
    _length = 0;
  }
  
  void update(){
    if(_delay > 0){
      _delay -= 1/frameRate;
      return;
    }
    
    fill(_col);
    noStroke();
    rect(_x, _y-_h/2, _length, _h);
    ellipse(_x, _y, _h, _h);
    ellipse(_x+_length, _y, _h, _h);
    _length += _speed;
    
    if(_length > _maxLength){
      _speed *= -1;
    }
    
    if(_length < -1*_maxLength){
      _speed *= -1;
    }
    
  }
  
}

class PutCircleBars{
  int _num;
  PutCircleBar pcb[];
  
  PutCircleBars(int num){
    _num = num;
    pcb = new PutCircleBar[_num];
    for(int i=0; i<_num; i++){
      int h = -200 + 400/(_num+1)*(i+1) + height/2;
      pcb[i] = new PutCircleBar(width/2, h, 10, 0.2*i, 200, 2, color(40));
    }
  }
  
  void update(){
    for(PutCircleBar obj : pcb){
      obj.update();
    }
  }
}
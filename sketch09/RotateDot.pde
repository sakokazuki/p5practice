class RotateDot{
  int _clockwise = 1;
  int _dotR, _r, _interval;
  float _speed;
  color _col;
  
  RotateDot(int dotR, int r, int interval, float speed, boolean clockwise, color col){
    _dotR = dotR;
    _r = r;
    _interval = interval;
    _speed = speed;
    _col = col;
    if(clockwise == false){
      _clockwise = -1;
    }
  }
  
  void update(int x, int y){
    fill(_col);
    for(int i=0; i<360; i+=_interval){
      float a = radians(i+frameCount*_speed*_clockwise);
      float px = _r*cos(a);
      float py = _r*sin(a);
      ellipse(x+px, y+py , _dotR, _dotR);
    }
  }
}
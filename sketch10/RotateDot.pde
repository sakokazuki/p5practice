class RotateObj{
  int _clockwise = 1;
  int _r, _num;
  int _cx, _cy;
  float _speed;
  color _col;
  
  RotateObj(int cx, int cy, int r, int num, float speed, boolean clockwise, color col){
    _cx = cx;
    _cy = cy;
    _r = r;
    _num = num;
    _speed = speed;
    _col = col;
    if(clockwise == false){
      _clockwise = -1;
    }
  }
  
  void update(){
    fill(_col);
    noStroke();
    for(int i=0; i<360; i+=(int)360/_num){
      float a = radians(i+frameCount*_speed*_clockwise);
      float px = _r*cos(a);
      float py = _r*sin(a);
      ellipse(_cx+px, _cy+py , 10, 10);
    }
  }
  
  void drawCenterLine(color col, int weight){
    stroke(col);
    noFill();
    strokeWeight(weight);
    for(int i=0; i<360; i+=(int)360/_num){
      float a = radians(i+frameCount*_speed*_clockwise);
      float px = _r*cos(a);
      float py = _r*sin(a);
      line(_cx, _cy , _cx+px, _cy+py);
    }    
  }
  
  void drawDotLine(color col, int num){
    noStroke();
    fill(col);
    for(int i=0; i<360; i+=(int)360/_num){
      float a = radians(i+frameCount*_speed*_clockwise);
      float px = _r*cos(a);
      float py = _r*sin(a);
      for(int j=0; j<num; j++){
        float lx = px * j/num;
        float ly = py/px * lx;
        rectMode(CENTER);
        pushMatrix();
        translate(lx+_cx, ly+_cy);
        rotate(a);
        rect(0, 0, 2, 10);
        popMatrix();
      }
    }  
  }
  
  void drawCircle(color col, int num){
    noFill();
    stroke(col);
    strokeWeight(1);
    for(int i=0; i<360; i+=(int)360/_num){
      float a = radians(i+frameCount*_speed*_clockwise);
      float px = _r*cos(a);
      float py = _r*sin(a);
      for(int j=0; j<num; j++){
        float r = j*_r*2/num;
        ellipse(_cx, _cy , r, r);
      }
    }
  }
  
  void drawPolygonLine(color col, int num){
    noFill();
    stroke(col);
    strokeWeight(1);
    for(int i=0; i<360; i+=(int)360/_num){
      int step = (int)360/_num;
      float a = radians(i+frameCount*_speed*_clockwise);
      float na = radians((i+step)+frameCount*_speed*_clockwise);  
      float px = _r*cos(a);
      float py = _r*sin(a);
      float npx = _r*cos(na);
      float npy = _r*sin(na);
      for(int j=0; j<num; j++){
        float lx = px * j/num;
        float ly = py/px * lx;
        float nlx = npx * j/num;
        float nly = npy/npx * nlx; 
        line(_cx+lx, _cy+ly, _cx+nlx, _cy+nly);
      }
    }
  }
  
  
}
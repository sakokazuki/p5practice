class BarBg{
  Bar bar[];
  
  BarBg(int w, int h, float sp,int space){
    int hh = h+space;
    int num = height/hh + 1;
    bar = new Bar[num];
    for(int i=0; i<num; i++){
      bar[i] = new Bar(w, h, width/2, i*hh, sp);
    }
  }
  
  void update(color col){
    for(Bar b : bar){
      b.update(col);
    }
  }
}

class Bar{
  float _x, _y;
  int _w, _h;
  float _speed;
  Bar(int w, int h, float x, float y, float sp){
    _w = w;
    _h = h;
    _x = x;
    _y = y;
    _speed = sp;
  }
  
  void update(color col){
    fill(col);
    rect(_x, _y, _w, _h);  
    _y+=_speed;
    
    if(_y > height+_h/2){
      _y = -1*_h/2;
    }
  }
}
class Line{
  PVector _start;
  PVector _end;
  color _col;
  int _alpha;
  
  Line(PVector start, PVector end, color col){
    _start = start;
    _end = end;
    _col = col;
    _alpha = 255;
  }
  
  void drawLine(){
    stroke(_col, _alpha);
    line(_start.x, _start.y, _end.x, _end.y);
    _alpha -= 10;
  }
}
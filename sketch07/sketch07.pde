color black = color(10, 10, 10);
color white = color(255);
color blackGray = color(30, 30, 30);
color whiteGray = color(120, 120, 120);
color pink = color(240, 120, 120);
color blue = color(120, 120, 240);
color green = color(120, 240, 120);

ArcCircle ac;

void setup(){
  size(512, 512);
  background(255);
  smooth();
  color cols[] = new color[4];
  cols[0] = whiteGray;
  cols[1] = blue;
  cols[2] = green;
  cols[3] = pink;
  ac = new ArcCircle(100, 450, 20, cols);
  
}

void draw(){
  background(black);
  noStroke();
  ac.update(width/2, height/2);
}

void keyPressed() {
  if ( key == ' ' ) {
    println("imagesaved");
    save("image_"+month()+day()+"_"+hour()+minute()+second()+".png");
  }
}
/*-----------------------
/  ArcCircle
/----------------------*/
class ArcCircle{
  SingleArc _SAs[];
  int _inR, _outR, _num;
  color _cols[];
  
  ArcCircle(int inR, int outR, int num, color cols[]){
    _inR = inR;
    _outR = outR;
    _num = num;
    _SAs = new SingleArc[num];
    
    float w = (outR - inR)/num;
    for(int i=0; i<num; i++){
      float r = inR + i*w;
      int l = (int)random(60, 180);
      boolean bClockwise = random(0, 1)<0.5 ? true : false;
      float speed = random(0, 1);
      _SAs[i] = new SingleArc(r, w/2, l, speed, cols[i%cols.length], bClockwise);
    }
  }
  void update(float posx, float posy){
    for(SingleArc sa : _SAs){
      sa.update(posx, posy);
    }
  }

}

/*-----------------------
/  SingleArc
/----------------------*/
class SingleArc{
  float _r;
  float _w;
  int _length;
  float _speed;
  float _rotate;
  boolean _bClockwise;
  color _col;
  float _startPos;
  
  SingleArc(float r, float w, int l, float s, color col, boolean cw){
    _r = r;
    _w = w;
    _length = l;
    _speed = s;
    _col = col;
    _bClockwise = cw;
    _startPos = radians(random(0, 360));
    strokeWeight(_w);
    strokeCap(SQUARE);
  }
  
  void update(float posx, float posy){
    stroke(_col);
   
    noFill();
    pushMatrix();
    translate(posx, posy);
    rotate(radians(_rotate));
    float r = _r + _w;
    arc(0, 0, r, r, _startPos, _startPos+radians(_length));
    popMatrix();
    
    int k = _bClockwise? 1 : -1;
    //_rotate+= _speed*k;
  }
};
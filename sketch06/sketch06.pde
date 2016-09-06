import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;
import gifAnimation.*;
GifMaker gifExport;
int m_frameRate = 30;

color blue = color(12, 169, 222);
color pink = color(232, 78, 148);
color white = color(255, 255, 255);

BallSet bs;

void setup(){
  size(512, 512);
  noStroke();
  Ani.init(this);
  background(white); 
  rectMode(CENTER);
  gifSetup();
  frameRate(m_frameRate);

  float posX[] = {width/4, 3*width/4, width/4, 3*width/4};
  float posY[] = {height/4, height/4, 3*width/4, 3*width/4};
  color ballCol[] = {blue, pink, pink, blue};

  bs = new BallSet(width/2, height/2, width, white, blue, pink);
}

void draw(){
  bs.update();
  gifRecord();
}


//-------------------------------------------------------------------------------------------
class BallSet{
  float _x, _y;
  int _size;
  ArrayList<DoubleBall> _doubleBalls = new ArrayList();

  float _interval = 0.2;
  float _intervalTime;
  int _count = 0;
  color _col[] = new color[3];

  BallSet(float x, float y, int size, color col0, color col1, color col2){
    _x = x;
    _y = y;
    _size = size;
    _col[0] = col0;
    _col[1] = col1;
    _col[2] = col2;

    _intervalTime = _interval;

    drawRect();
  }

  void drawRect(){
    fill(_col[0]);
    rect(_x, _y, _size, _size);
  }

  void createBall(){
    color c[] = new color[2];
    c[0] = _col[0];
    c[1] = random(0, 1)<0.5 ? _col[1] : _col[2];
    int k = random(0, 1)<0.5 ? -1 : 1;
    int randomAngle = k*(int)random(60, 270);
    float size = random(_size-100, _size);
    DoubleBall b = new DoubleBall(_x, _y, size, 100, 90, (int)random(0, 360), randomAngle, c);
    _doubleBalls.add(b);
    _intervalTime += random(_interval-0.1, _interval+0.1);
  }

  void del(){
  for(int i=0; i<_doubleBalls.size()-3; i++){
    _doubleBalls.remove(i);
  }
}

  void update(){
    drawRect();
    for(DoubleBall b : _doubleBalls){
      b.update();
    }

    _intervalTime -= 1/frameRate;
    if(_intervalTime < 0){
      createBall();

      _count++;
      if(_count%10 == 0){
        del();
      }
    }
    fill(_col[0]);
    ellipse(_x, _y, 10, 10);
  }
}
//-------------------------------------------------------------------------------------------
class Ball{
  float _x, _y, _rx, _ry;
  color _col;
  float _size;
  float _angle;
  float _beginAngle;
  float _time;
  
  Ball(float x, float y, float size, color c, int angle, float time, int beginAngle){
    _x = x;
    _y = y;
    _rx = 0;
    _ry = 0;
    _size = size;
    _col = c;
    _time = time;
    _beginAngle = radians(float(beginAngle));
    _angle = radians(float(angle));
  }

  void set(){
    Ani.to(this, _time, "_rx", _size, Ani.EXPO_IN_OUT);
    Ani.to(this, _time, "_ry", _size, Ani.EXPO_IN_OUT);
  }

  void update(){
    fill(_col);
    arc(_x, _y, _rx, _ry, _beginAngle, _angle);
  }
};
//-------------------------------------------------------------------------------------------
class DoubleBall{

  Ball _ball[] = new Ball[2];
  boolean _b = false;
  float _delay;
  float _deltime;
  float _x, _y;
  int _beginAngle;
  int _endAngle;
  color _ballColer[];
 
  DoubleBall(float x, float y, float size, float delay, int angle, int beginAngle, int endAngle, color col[]){
    _delay = delay / 1000;
    _deltime = 1.5;
    _x = x;
    _y = y;
    _beginAngle = beginAngle;
    _endAngle = endAngle;
    _ballColer = col;
    _ball[0] = new Ball(0, 0, size, _ballColer[1], angle, _deltime, 0);
    _ball[1] = new Ball(0, 0, size+2, _ballColer[0], angle+5, _deltime, -5);
    _ball[0].set();


    aniset();
  }

  void aniset(){
    Ani.to(this, 1.5, "_beginAngle", _beginAngle+_endAngle, Ani.EXPO_IN_OUT);
  }

  void update(){
    for(Ball b: _ball){
      pushMatrix();
      translate(_x, _y);
      rotate(radians(float(_beginAngle)));
      b.update();
      popMatrix();
    }

    _delay -= 1/frameRate;
    if(_delay < 0 && _b == false){
      _b = true;
      _ball[1].set();
    }
  }
};

void gifRecord(){
  if(frameCount <= m_frameRate*5){
    gifExport.addFrame();
  } else {
    gifExport.finish();
    println("finish gif record");
  }
}
void gifSetup(){
  // GIFアニメ出力の設定
  gifExport = new GifMaker(this, "export.gif");
  gifExport.setRepeat(0);
  gifExport.setQuality(10);
  gifExport.setDelay(40); // アニメーションの間隔を20ms(50fps)に
}
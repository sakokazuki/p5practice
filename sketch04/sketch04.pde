import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;
import gifAnimation.*;
GifMaker gifExport;
int m_frameRate = 30;


color blue = color(12, 169, 222);
color pink = color(232, 78, 148);
color white = color(255, 255, 255);

ArrayList<DoubleBall> _doubleBalls = new ArrayList();

float _interval = 0.3;
float _intervalTime;
int _count = 0;
color col[] = new color[2];

void setup(){
  size(512, 512);
  col[0] = white;
  col[1] = blue;
  noStroke();
  Ani.init(this);
  background(col[0]); 
  _intervalTime = _interval;
  
  gifSetup();
  frameRate(m_frameRate);
}

void draw(){
  background(col[0]); 
  for(DoubleBall b : _doubleBalls){
    b.update();
  }

  println(frameRate);
  _intervalTime -= 1/frameRate;
  if(_intervalTime < 0){
    createBall();

    _count++;
    if(_count%10 == 0){
      del();
    }
  }

  fill(col[0]);
  ellipse(width/2, height/2, 10, 10);
  
  gifRecord();
}

void createBall(){
  int k = random(0, 1)<0.5 ? -1 : 1;
    int randomAngle = k*(int)random(60, 270);
    float size = random(400, 500);
    DoubleBall b = new DoubleBall(width/2, height/2, size, 100, 90, (int)random(0, 360), randomAngle);
    _doubleBalls.add(b);
    _intervalTime += _interval;
}

void del(){
  for(int i=0; i<_doubleBalls.size()-3; i++){
    _doubleBalls.remove(i);
  }
}

void colChange(){
  color tmp = col[0];
  col[0] = col[1];
  col[1] = tmp;
}

void mousePressed(){
  colChange();
}

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

class DoubleBall{

  Ball _ball[] = new Ball[2];
  boolean _b = false;
  float _delay;
  float _deltime;
  float _x, _y;
  int _beginAngle;
  int _endAngle;
 
  DoubleBall(float x, float y, float size, float delay, int angle, int beginAngle, int endAngle){
    _delay = delay / 1000;
    _deltime = 1.5;
    _x = x;
    _y = y;
    _beginAngle = beginAngle;
    _endAngle = endAngle;
    _ball[0] = new Ball(0, 0, size, col[1], angle, _deltime, 0);
    _ball[1] = new Ball(0, 0, size+2, col[0], angle+5, _deltime, -5);
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
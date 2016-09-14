import gifAnimation.*;
GifMaker gifExport;
int m_frameRate = 30;

color black = color(0);
color white = color(255);
color blue = color(1, 70, 255);
color yellow = color(255, 237, 19);
color gray = color(60);

color bg = blue;
Dot dots[];
int distance = 50;
int row;
int column;
boolean bMove = false;

void setup(){
  size(512, 512);
  smooth();
  strokeWeight(3);
  
  gifSetup();
  frameRate(m_frameRate);
  
  background(bg);
  row = floor(width/distance)+1;
  column = floor(height/distance)+1;
  int num = row * column;
  dots = new Dot[num];
  for(int i=0; i<width; i+=distance){
    for(int j=0; j<height; j+=distance){
      Dot d = new Dot(i, j);
      int index = (row * i/distance) + j/distance; 
      dots[index] = d;      
    }
  }
}

void draw(){
  background(bg);
  translate(width%distance/2, height%distance/2);
  
  //line
  for(int i=0; i<dots.length; i++){
    color linecol = white;
    if(i != dots.length-1 && (i+1)%row!=0){
      stroke(linecol);
      line(dots[i]._x, dots[i]._y, dots[i+1]._x, dots[i+1]._y);
    }
    if(i < dots.length-column){
      stroke(linecol);
      line(dots[i]._x, dots[i]._y, dots[i+column]._x, dots[i+column]._y);
    }
  }
  
  //dot
  for(Dot dot : dots){
    dot.update(15, yellow, bMove);
  }
  
  gifRecord();
  
}

void keyPressed() {
  if ( key == ' ' ) {
    bMove = !bMove;
  }
}

class Dot{
  float _x, _y;
  
  Dot(float x, float y){
    _x = x;
    _y = y;
  }
  
  void update(float size, color col, boolean b){
    fill(col);
    noStroke();
    if(b == true){
      _x += random(-1, 1);
      _y += random(-1, 1);
    }
    
    ellipse(_x, _y, size, size);
  }
}

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
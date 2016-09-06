//cf. https://dribbble.com/shots/2801765-Super-Mini-Market
import gifAnimation.*;
GifMaker gifExport;

color bgCol = color(65, 80, 140);
color yellow = color(255, 220, 45);
color green = color(65, 180, 100);
color gray = color(240, 240, 240);
color red = color(240,115, 75);

int m_frameRate = 30;

void setup(){
  size(512, 512);
  noStroke();
  frameRate(m_frameRate);
  gifSetup();
}

void draw(){
  background(bgCol);  
  translate(width/2, height/2);
  
  rotateDot(10, 200, 20, green, 0.5, true);
  rotateDot(10, 200, 10, yellow, 1, true);
  
  
  rotateDot(10, 50, 30, yellow, 0.5, true);
  rotateDot(10, 100, 20, green, 0.25, false);

  gifRecord();
}

void rotateDot(int dotR, int r, int interval, color col, float speed, boolean clockwise){
  int k = 1;
  if(clockwise == false){
    k = -1;
  }
  for(int i=0; i<360; i+=interval){
    float a = radians(i+frameCount*speed*k);
    fill(col);
    float px = r*cos(a);
    float py = r*sin(a);
    ellipse(px, py , dotR, dotR);
  }
}

void gifRecord(){
  if(frameCount <= m_frameRate*10){
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
  gifExport.setDelay(33); // アニメーションの間隔を20ms(50fps)に
}
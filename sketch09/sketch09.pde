color white = color(255);
color yellow = color(255, 250, 58);
color blue = color(17, 27, 125);
color red = color(255, 34, 62);
//----------------
color pyellow = color(255, 255, 178);
color pgreen = color(178, 255, 178);
color ppink = color(255, 178, 255);
color pblue = color(178, 255, 255);

color bgCol = white;
BarBg barBg;
RotateDot rotateDot[];
int rotateDotNum = 5;
color colorArr[];


void setup(){
  size(512, 512);
  background(bgCol);
  rectMode(CENTER);
  noStroke();
  
  colorArr = new color[2];
  colorArr[0] = ppink;
  colorArr[1] = pblue;
  rotateDot = new RotateDot[rotateDotNum];
  for(int i=0; i<rotateDotNum; i++){
    int dotR = (int)random(10, 30);
    int r = (int)random(100, 400);
    float speed = random(0.3, 1);
    float k = random(0, 1);
    boolean b = k<0.5 ? true : false;
    int colorNo = (int)random(0, colorArr.length);
    rotateDot[i] = new RotateDot(dotR, r, 20, speed, b, colorArr[colorNo]);
  }
  
  
  barBg = new BarBg(width, 10, 0.4, 15);
}

void draw(){
  background(bgCol);
  for(int i=0; i<rotateDotNum; i++){
    rotateDot[i].update(i*(width/rotateDotNum), height/2);
  }
  barBg.update(pgreen);
  
  gifRecord();
}
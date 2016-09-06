import gifAnimation.*;
GifMaker gifExport;


//cf. http://www.designveryeasy.com/article/geometric-15411

int m_frameRate = 30;

color bgCol = color(250, 250, 230);
color blackCol = color(0, 50, 30);
color redCol = color(232, 27, 53);

float timeDelta = 0;
float oldMillis = 0;
float timer = 0;

void setup(){
  size(512, 512);
  noStroke();
  smooth();
  background(bgCol);
  updateTri(0, 0, width, height, true);
  
  frameRate(m_frameRate);
  gifSetup();
}

void draw(){
  timeDelta = millis() - oldMillis;
  timer += timeDelta;
  if(timer>500){
    background(bgCol);
    updateTri(0, 0, width, height, true);
    timer = 0;
  }
  
  oldMillis = millis();
  gifRecord();
  
}

void updateTri(float spX, float spY, float epX, float epY, boolean loop){
  float w = epX - spX;

  for(int i=0; i<4; i++){
    for(int j=0; j<4; j++){
      float interval = w/4;
      float colRand = random(1);
      fill(blackCol);
      if(colRand<0.5){
        fill(redCol);
      }
      float angleRand = random(1);
      angleRand*= 360;
      int angle = (int)angleRand/90 * 90;

      float drawRand = random(1);
      if(drawRand < 0.7){
        if(loop == false){
          continue;
        }
        float loopRand = random(1);
        if(loopRand < 0.5) continue;
        
        updateTri(i*interval, j*interval, (i+1)*interval, (j+1)*interval, false);
        continue;
      }

      tri(spX+i*interval+interval/2, spY+j*interval+interval/2, interval, angle);
    }
  }
} 

void tri(float x, float y, float size, int angle){
  pushMatrix();
  translate(x, y);
  rotate(radians(angle));
  triangle(0-size/2, 0-size/2, size/2, size/2, 0-size/2, size/2);
  popMatrix();
}

void keyPressed(){
  if(key == 's'){
    println("saveImage");
    save("image_"+frameCount+".png");
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
  gifExport.setDelay(50); // アニメーションの間隔を20ms(50fps)に
}
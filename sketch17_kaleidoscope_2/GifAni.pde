import gifAnimation.*;
GifMaker gifExport;
boolean isStart = false;
boolean isPause = true;

void gifSetup(){
  gifExport = new GifMaker(this, "export"+year()+nf(month(), 2, 0)+nf(day(), 2, 0)+nf(hour(), 2, 0)+nf(minute(), 2, 0)+nf(second(), 2, 0)+".gif");
  gifExport.setRepeat(0);
  gifExport.setQuality(10);
  
  int delay = floor(1000/frameRate);
  println(delay);
  gifExport.setDelay(delay);
}

void gifRecord(){
  if(isPause == true){
    return;
  }
  if(isStart == true){
    gifExport.addFrame();
  } else {
    gifExport.finish();
    isPause = true;
  }
}

void mousePressed(){
  isStart = !isStart;
  isPause = false;
  if(isStart == true){
    gifSetup();
  }
}
App app;
color white = color(255, 255, 255);
color colList[] = {#FFDDF8, #AAAAAA, #DAF0FF, #FFFFFF,
                   #FF10EF, #17E818, #00D3FF, #000000,
                   #AAAAAA, #191919, #686868, #FFFFFF};
                   
PImage AImg;
PImage HappyImg;
PImage NewImg;
PImage YearImg;
PImage _2017Img;

void setup(){
  AImg = loadImage("_a.png"); 
  HappyImg = loadImage("_happy.png");
  NewImg = loadImage("_new.png");
  YearImg = loadImage("_year.png");
  _2017Img = loadImage("_2017.png");
  size(512, 512);
  app = new App();
  smooth();
 
}

void draw(){
  app.update();
  gifRecord();
}

void keyPressed(){
  app.keyPressed();
}

class App{
  int num = 200;
  Particle particle[];
  DrawLines dls[];
  float _timer;
  float _updateTime;
  int _count;
  boolean _colorful = true;
  int _colorIndex;
  color _bgCol;
  boolean _fast = false;
  
  App(){
    particle = new Particle[num];
    for(int i=0; i<particle.length;i++){
      PVector randomPos = new PVector(random(0, width), random(0, height));
      particle[i] = new Particle(randomPos);
    }
    
    dls = new DrawLines[20];
    for(int i=0; i<dls.length;i++){
      dls[i] = new DrawLines(particle);
    }
    
  }
  
  void update(){
    background(_bgCol);

    for(Particle p: particle){
      p.update();
    }
    
    for(DrawLines l: dls){
      l.update();
    }
    
    if (millis() - _timer > _updateTime) {
      timerUpdate();
    }

  }
  
  void timerUpdate(){
    int n = _count%5;
    
    switch(n){
      case 0:
        imageUpdate(_2017Img);
        break;
      case 1:
        imageUpdate(AImg);
        break;
      case 2:
        imageUpdate(HappyImg);
        break;
      case 3:
        imageUpdate(NewImg);
        break;
      case 4:
        imageUpdate(YearImg);
        break;
      default:
        break;
    }
    
    _timer = millis();
    _updateTime = 2000;
    if(_fast == true) _updateTime = 1000;
    _count++;
  }
  
  void keyPressed(){
    if(key=='u'){
      barabara();
      drawLine();
    }
    
    if(key=='r'){
      changeRadius();
    }
    
    if(key == 'l'){
       drawLine();
    }
    
    if(key == 'c'){
       _colorIndex++;
       _colorIndex%=colList.length/4;
    }
    if(key == 'f'){
      _fast = !_fast;
    }
  }
  
  void barabara(){
    for(Particle p: particle){
      p.updateTarget(); 
    }
  }
  
  void drawLine(){
    for(DrawLines l: dls){
      if(_colorful == false){
        l.check(color(random(10, 100)));
      }else{
        color col = getRandomCol();
        l.check(col);
      }
  
    }
  }
  
  void changeRadius(){
    int min = 3;
    int max = (int)random(10, 20);
    for(Particle p: particle){
      p.changeRadius(min, max); 
    }
  }
  
  void imageUpdate(PImage image){
    changeRadius();
    for(Particle p: particle){
      PVector trg = new PVector();
      color c = AImg.get((int)trg.x, (int)trg.y);
      while(red(c) > 0){
        trg = new PVector(random(width), random(height));
        c = image.get((int)trg.x, (int)trg.y);
      }
      
      drawLine();
      p.updateTarget(trg);
      
      
      if(_colorful == false){
        p.changeGrayColor();
      }else{
        color col = getRandomCol();
        p.changeColor(col);
      }
      _bgCol = colList[_colorIndex*4+3];
      
    }
  }
  
  color getRandomCol(){
    color col;
    float rand = random(0, 1);
    if(rand < 0.333){
      col = colList[4*_colorIndex+0];
    }else if(rand > 0.666){
      col = colList[4*_colorIndex+1];
    }else{
      col = colList[4*_colorIndex+2];
    }
    return col;
  }
  
  
}
color white = color(255, 255, 255);
color[] MAIN_COL = {color(255, 141, 233),
                 color(255, 238, 102),
                 color(81, 255, 102),
                 color(86, 167, 232),
                 color(255, 134, 84)};

App app;
void setup(){
  size(512, 512);
  app = new App();
}

void draw(){
  app.update();
  gifRecord();
}

void keyPressed(){
  app.keyPressed();
}

class App{
  color _bg;
  ParticleSystem[] pSys;
  
  App(){
    _bg = white;
    pSys = new ParticleSystem[4];
    for(int i=0; i<4; i++){
      pSys[i] = new ParticleSystem(new PVector(width/2, height/2));
    }
    pSys[0] = new ParticleSystem(new PVector(width/4, height/4));
    pSys[1] = new ParticleSystem(new PVector(3*width/4, height/4));
    pSys[2] = new ParticleSystem(new PVector(width/4, 3*height/4));
    pSys[3] = new ParticleSystem(new PVector(3*width/4, 3*height/4));
    
    
  }
  
  void update(){
    background(_bg);
    
    for(int i=0; i<4; i++){
      pSys[i].update();
    }
    if(frameCount%10==0){
      for(int i=0; i<4; i++){
        pSys[i].addParticle();
      }
    }
  }
  
  void keyPressed(){
    if(key == 's'){
      println("saveimage");
      save("image_"+month()+day()+"_"+hour()+minute()+second()+".png");
    }
  }
  
  
}
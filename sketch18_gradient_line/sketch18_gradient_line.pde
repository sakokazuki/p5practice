color white = color(255, 255, 255);

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
  ParticleSystem pSys;
  App(){
    _bg = white;
    pSys = new ParticleSystem(new PVector(width/2, -200));
  }
  
  void update(){
    background(_bg);
    pSys.update();
    
    if(frameCount%1==0){
      pSys.addParticle(new PVector(-width/2, width/2), new PVector(0, 0));
      pSys.addParticle(new PVector(-width/2, width/2), new PVector(0, 0));
    }
  }
  
  void keyPressed(){
    if(key == 's'){
      println("saveimage");
      save("image_"+month()+day()+"_"+hour()+minute()+second()+".png");
    }
    
    if(key == 'l'){
      pSys.addParticle(new PVector(-width/2, width/2), new PVector(0, 0));
    }
  }
}
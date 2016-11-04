color white = color(255, 255, 255);
color purple = color(144, 81, 255);
color yellow = color(255, 247, 93);

App app;
void setup(){
  size(512, 512);
  smooth();
  app = new App();
}

void draw(){
  app.update();
}

void keyPressed(){
  app.keyPressed();
}

class App{
  color _bg;
  PutCircleBars PCBSs;
  App(){
    _bg = purple;
    PCBSs = new PutCircleBars(20);
  }
  
  void update(){
    background(_bg);
    PCBSs.update();
  }
  
  void keyPressed(){
    if(key == 's'){
      println("saveimage");
      save("image_"+month()+day()+"_"+hour()+minute()+second()+".png");
    }
  }
}
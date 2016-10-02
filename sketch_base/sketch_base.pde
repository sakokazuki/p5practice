color white = color(255, 255, 255);

App app;
void setup(){
  size(512, 512);
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
  App(){
    _bg = white;
  }
  
  void update(){
    background(_bg);
  }
  
  void keyPressed(){
    if(key == 's'){
      println("saveimage");
      save("image_"+month()+day()+"_"+hour()+minute()+second()+".png");
    }
  }
}
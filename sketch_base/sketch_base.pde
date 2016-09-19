color white = color(255, 255, 255);

App app;
void setup(){
  size(512, 512);
  app = new App();
}

void draw(){
  app.update();
}

class App{
  color _bg;
  App(){
    _bg = white;
  }
  
  void update(){
    background(_bg);
  }
}
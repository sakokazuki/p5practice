color white = color(255, 255, 255);

App app;
void setup(){
  size(512, 512);
  background(white);
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
  
  int slices = 8;
  int center = width/2;
  RotateBar rotateBar;
  
  App(){
    _bg = white;
    rotateBar = new RotateBar(center, center, _bg, 1);
    
    noStroke();
  }
  
  void update(){
    //background(_bg);
    
    fill(0);
    for(int i=0; i<slices; i++){
      pushMatrix();
      translate(center, center);
      rotate((float)i/slices*PI*2);
      translate(-center, -center);
      noStroke();
      ellipse(mouseX, mouseY, 20, 20);
      rotateBar.update();
      
      popMatrix();
    }
    
    
    
    
  }
  
  void keyPressed(){
    if(key == 's'){
      println("saveimage");
      save("image_"+month()+day()+"_"+hour()+minute()+second()+".png");
    }
  }
}

class RotateBar{
  int x;
  int y;
  color col;
  float angle;
  float speed;
  int w;
  
  RotateBar(int x, int y, color col, float speed){
    this.x = x;
    this.y = y;
    this.col = col;
    this.speed = speed;
    w = 10;
  }
  
  void update(){
    stroke(col);
    
    float rad = angle * PI*2 / 360;
    int r = 800;
    float endX = r * cos(rad);
    float endY = r * sin(rad);
    
    strokeWeight(w);
    strokeCap(ROUND);
    line(x, y, endX, endY);
    
    
    angle+=speed + random(0, 0.1);
  }
  
  
}
  
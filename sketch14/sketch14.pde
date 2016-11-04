App app;
color white = color(255);
color blue = color(141, 202, 225);
color green = color(157, 198, 111);
color orange = color(231, 186, 109);
color pink = color(208, 101, 152);

PShape shape[] = new PShape[5];


void setup(){
  size(512, 512, P3D);
  smooth();
  shape[0] = loadShape("data/girl-01.svg");
  shape[1] = loadShape("data/girl-02.svg");
  shape[2] = loadShape("data/girl-03.svg");
  shape[3] = loadShape("data/girl-04.svg");
  shape[4] = loadShape("data/girl-05.svg");
  app = new App();
  
  
}

void draw(){
  //lights();
  camera(mouseX-width/2, mouseY-height/2, 500.0, // eyeX, eyeY, eyeZ
         0.0, 0.0, 0.0, // centerX, centerY, centerZ
         0.0, 1.0, 0.0); // upX, upY, upZ
  app.update();
  gifRecord();
}

void keyPressed(){
  app.keyPressed();
}

class App{
  ArrayList<ShapeParticle> particles;
  int pNum = 400;
  
  App(){
    particles = new ArrayList<ShapeParticle>();
    
    for(int i=0; i<pNum; i++){
      PVector startPos = new PVector(random(-2000, 2000), random(-2000, 2000), random(-1000, 0));
      ShapeParticle sp = new ShapeParticle(startPos);
      particles.add(sp);
    }
    
    
    
    shapeMode(CENTER);
  }
  
  void update(){
    background(white);

    for(ShapeParticle sp : particles){
      sp.update();
    }
  }
  
  void keyPressed(){
    if(key == 's'){
      println("saveimage");
      save("image_"+month()+day()+"_"+hour()+minute()+second()+".png");
    }
  }
}

class ShapeParticle{
  Shape shape;
  PVector velocity;
  PVector gravity = new PVector(0, 0.1, 0);
  PVector pos;
  
  ShapeParticle(PVector pos){
    int shapeNo = (int)random(0, 5);
    int size = (int)random(50, 100);
    float rSpeed = random(0.5, 1.5);
    shape = new Shape(shapeNo, size, rSpeed);
    this.pos = pos;
    
    gravity.y = random(1, 3);
    
  }
  
  void update(){
    
    pos.add(gravity);
    shape.drawShape(pos.x, pos.y, pos.z);
    
  }
  
}
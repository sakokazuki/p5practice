color white = color(255, 255, 255);

App app;
void setup() {
  size(512, 512);
  background(white);
  smooth();
  app = new App();
}

void draw() {
  app.update();
  gifRecord();
}

void keyPressed() {
  app.keyPressed();
}

class App {
  color _bg;

  int slices = 8;
  int center = width/2;
  RotateBar rotateBar;
  ArcCircle arcCircle;
  DotOver dotOver;
  ArcShot arcShot;
  boolean drawRotateBar;
  ArrayList<ArcShot> arcShots = new ArrayList<ArcShot>();
  ArrayList<RectShot> rectShots = new ArrayList<RectShot>();

  App() {
    _bg = white;
    rotateBar = new RotateBar(center, center, _bg, 5);
    arcCircle = new ArcCircle(center, center, _bg, 0, 360/slices);
    dotOver = new DotOver(100, 100, color(240));
    drawRotateBar = false;

    noStroke();
  }

  void update() {
    //background(_bg);

    for (int i=0; i<slices; i++) {
      pushMatrix();
      translate(center, center);
      rotate((float)i/slices*PI*2);
      translate(-center, -center);
      arcCircle.drawArc();
      for(ArcShot arcShot : arcShots){
        arcShot.drawArc();
      }
      for(RectShot rectShot : rectShots){
        rectShot.drawRect();
      }
      fill(0);
      noStroke();
      if(drawRotateBar == true){
        rotateBar.drawLine();
      }

      popMatrix();
    }
    dotOver.update();
    
    checkAndUpdateShot();
    
    arcCircle.update();
    if(drawRotateBar == true){
      rotateBar.update();
    }
    
  }
  
  void checkAndUpdateShot(){
    for(int i=0; i<arcShots.size(); i++){
      arcShots.get(i).update();
      if(arcShots.get(i).isShotting == false){
        arcShots.remove(i);
      }
    }
    
    for(int i=0; i<rectShots.size(); i++){
      rectShots.get(i).update();
      if(rectShots.get(i).isShotting == false){
        rectShots.remove(i);
      }
    }
  }

  void keyPressed() {
    if (key == 's') {
      println("saveimage");
      save("image_"+month()+day()+"_"+hour()+minute()+second()+".png");
    }

    if (key == 'v') {
      arcCircle.startAnim();
    }
    
    if(key == 'r'){
      drawRotateBar = !drawRotateBar;
    }
    
    if (key == 'a'){
      int angle = (int)random(0, 360);
      int angleL = (int)random(2, 10);
      color col = color(255, 255, 200);
      ArcShot arcShot = new ArcShot(center, center, 10, angleL, angle, col);
      arcShot.shot();
      arcShots.add(arcShot);
    }
    
    if(key == 'f'){
      PVector vec = new PVector();
      int startX, startY;
      if(random(0, 1)<0.5){
        vec.x = 1;
        vec.y = 0;
        startX = -10;
        startY = (int)random(0, height);
      }else{
        vec.x = 0;
        vec.y = 1;
        startX = (int)random(0, width);
        startY = -10;
      }
      
      color col = color(255, 200, 255);
      RectShot rectShot = new RectShot(startX, startY, vec, col);
      rectShot.shot();
      rectShots.add(rectShot);
    }
  }
}
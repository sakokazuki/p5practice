//cf. http://www.freepik.com/free-vector/abstract-background-with-rhombus_717249.htm
color col1 = color(0, 137, 124, 200); //purple
color col2 = color(239, 192, 40, 200); //light blue
color col3 = color(170, 171, 176, 50);

void setup(){
  size(512, 512);
  
  noStroke();
  rectMode(CENTER);
  
  background(230);
  
  drawRects(0, 400, col3, 8);
  drawRects(100, 150, col2, 12);
  drawRects(0, 200, col1, 11);
  
}

void drawRects(float posX, float size ,color col, int add){
  for(int i=0; i<10; i++){    
    drawRect(posX, height/2, size, col);
    size = size/1.5;
    posX += add*size/10;
  }
}

void drawRect(float x, float y, float size, color col){
  fill(col);
  pushMatrix();
  translate(x, y);
  rotate(PI/4);
  rect(0, 0, size, size);
  popMatrix();
}

void draw(){
}

void keyPressed(){
  if(key == 's'){
    println("saveImage");
    save("image.png");
  }
}
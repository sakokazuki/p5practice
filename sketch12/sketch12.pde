color white = color(255, 255, 255);
color beige = color(226, 223, 219);
color blue = color(10, 55, 115);
color red = color(231, 49, 31);

App app;
void setup() {
  size(512, 512);
  app = new App();
}

void draw() {
  app.update();
}

void keyPressed() {
  app.keyPressed();
}

class App {
  color _bg;
  Unit _unit[];
  int _row = 50;
  int _column = 50;
  int _size;
  color _colorArr[] = new color[3];
  App() {
    _bg = beige;
    _unit = new Unit[_row*_column];
    _colorArr[0] = red;
    _colorArr[1] = blue;
    _colorArr[2] = white;
    
    for(int i=0; i<_row; i++){
      for(int j=0; j<_column; j++){
        int n = i*_row+j;
        int x = i*width/_row;
        int y = j*height/_column;
        int t1 = (int)random(0, 3);
        int t2 = (int)random(0, 3);
        color c1 = _colorArr[(int)random(0, 3)];
        color c2 = _colorArr[(int)random(0, 3)];
        
        _unit[n] = new Unit(x, y, width/_row, height/_column, c1, c2, t1, t2);
      }
    }
  }

  void update() {
    background(_bg);
    for(Unit u : _unit){
      u.update();
    }
  }

  void keyPressed() {
    if (key == 's') {
      println("saveimage");
      save("image_"+month()+day()+"_"+hour()+minute()+second()+".png");
    }
  }
}
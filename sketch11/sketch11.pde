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
  PFont _f;
  int _column, _row;
  char _letters[];
  color _colors[];
  int _textSize[];
  GetHSBColor _getHSBCol = new GetHSBColor();
  App(){
    _bg = white;
    _f = createFont("Helvetica-Bold-48.vlw", 40);
    textFont(_f);
    textAlign(LEFT, CENTER);
    _column = 30;
    _row = 30;
    _letters = new char[_column*_row];
    _colors = new color[_column*_row];
    _textSize = new int[_column*_row];
    for(int i=0; i<_row; i++){
      for(int j=0; j<_column; j++){
        int n = i*_row+j;
        int charnum = (int)random('A', '[');
        _letters[n] = char(charnum);
        
        if(random(0, 1) < 0.3){
          _colors[n] = _getHSBCol.HBRandom(100);
        }else{
          _colors[n] = _getHSBCol.SRandom(195, 100);
        }
        
        _textSize[n] = (int)(noise(i, j)*48)+1;
      }
    }
  }
  
  void update(){
    translate(0, 10);
    background(_bg);
    for(int i=0; i<_row; i++){
      for(int j=0; j<_column; j++){
        int n = i*_row+j;
        fill(_colors[n]);
        int x = i*(width/_row);
        int y = j*(height/_column);
        textSize(_textSize[n]);
        text(_letters[n], x, y);
        
        if(i == 0){
          stroke(_colors[n]);
          strokeWeight(3);
          line(0, y, width, y);
        }
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
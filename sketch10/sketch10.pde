color white = color(255, 255, 255);
color black = color(0, 0, 0);
color red = color(255, 35, 0);
color orange = color(255, 138, 0);
color blackRed = color(105, 0, 12);
color blue = color(172, 235, 255);
color blue2 = color(131, 195, 255);

App app;
void setup(){
  size(420, 420);
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
  int _objNum = 4;
  RotateObj _rotateObjs[];
  color _colors[] = new color[5];
  boolean _drawMode[][];
  color _subColor[][];
  int _subNum[][];
  boolean _isBgBlack = false;
  
  App(){
    _bg = black;
    _rotateObjs = new RotateObj[_objNum];
    _colors[0] = red;
    _colors[1] = orange;
    _colors[2] = blackRed;
    _colors[3] = blue;
    _colors[4] = blue2;
    _drawMode = new boolean[_objNum][4];
    _subColor = new color[_objNum][4];
    _subNum = new int[_objNum][4];
    updateObjs();
    updateDrawMode();
  }
  
  void updateObjs(){
    for(int i=0; i<_objNum; i++){
      int px = (int)random(100, width-100);
      int py = (int)random(100, height-100);
      int r  = (int)random(100, width-200);
      int num = (int)random(3, 8);
      float speed = random(0.3, 1.5);
      boolean k = random(0, 1) < 0.5 ? true : false;
      color col = _colors[(int)random(0, _colors.length)];
      _rotateObjs[i] = new RotateObj(px, py, r, num, speed, k, col);
    }
  }
  
  void updateDrawMode(){
    for(int i=0; i<_objNum; i++){
      _drawMode[i][0] = random(0, 1) < 0.3 ? true : false;
      _drawMode[i][1] = random(0, 1) < 0.3 ? true : false;
      _drawMode[i][2] = random(0, 1) < 0.3 ? true : false;
      _drawMode[i][3] = random(0, 1) < 0.3 ? true : false;
      for(int j=0; j<4; j++){
        _subColor[i][j] = _colors[(int)random(0, _colors.length)];
        _subNum[i][j] = (int)random(3, 7);
      }
    }
  }
  
  void update(){
    drawBg(true);
    for(int i=0; i<_objNum; i++){
      if(_drawMode[i][0] == true) _rotateObjs[i].drawCenterLine(_subColor[i][0], _subNum[i][0]);
      if(_drawMode[i][1] == true) _rotateObjs[i].drawDotLine(_subColor[i][1], _subNum[i][1]);
      if(_drawMode[i][2] == true) _rotateObjs[i].drawCircle(_subColor[i][2], _subNum[i][2]);
      if(_drawMode[i][3] == true) _rotateObjs[i].drawPolygonLine(_subColor[i][3], _subNum[i][3]);
      _rotateObjs[i].update();
    }
    

  }
  
  void drawBg(boolean bFade){
    if(bFade == false){
      background(_bg);
      return;
    }
    
    fill(_bg, 50);
    rectMode(CORNER);
    rect(0, 0, width, height);
  }
  
  void keyPressed(){
    if(key == ' '){
      _isBgBlack = !_isBgBlack;
      _bg = _isBgBlack== true ? white : black;
    }
    
    if(key == 'a'){
      updateObjs();
      updateDrawMode();
    }
    
    if(key == 'l'){
      updateDrawMode();
    }
    if(key == 's'){
      println("saveimage");
      save("image_"+month()+day()+"_"+hour()+minute()+second()+".png");
    }
  }
}
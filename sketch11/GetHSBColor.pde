class GetHSBColor{
  GetHSBColor(){
    colorMode(HSB, 360, 100, 100);
  }
  
  color AllRandom(){
    colorMode(HSB, 360, 100, 100);
    int h = (int)random(0, 360);
    int s = (int)random(0, 100);
    int b = (int)random(0, 100);
    color col = color(h, s, b);
    return col;
  }
  
  color HRandom(int s, int b){
    colorMode(HSB, 360, 100, 100);
    int h = (int)random(0, 360);
    color col = color(h, s, b);
    return col;
  }
  
  color SRandom(int h, int b){
    colorMode(HSB, 360, 100, 100);
    int s = (int)random(0, 100);
    color col = color(h, s, b);
    return col;
  }
  
  color BRandom(int h, int s){
    colorMode(HSB, 360, 100, 100);
    int b = (int)random(0, 100);
    color col = color(h, s, b);
    return col;
  }
  
  color SBRandom(int h){
    colorMode(HSB, 360, 100, 100);
    int s = (int)random(0, 100);
    int b = (int)random(0, 100);
    color col = color(h, s, b);
    return col;
  }
  
  color HBRandom(int s){
    colorMode(HSB, 360, 100, 100);
    int h = (int)random(0, 360);
    int b = (int)random(0, 100);
    color col = color(h, s, b);
    return col;
  }
  
  color HSRandom(int b){
    colorMode(HSB, 360, 100, 100);
    int h = (int)random(0, 360);
    int s = (int)random(0, 100);
    color col = color(h, s, b);
    return col;
  }
}
class DrawLines{
  PVector pos = new PVector();
  ArrayList<PVector> vecs = new ArrayList<PVector>();
  ArrayList<Line> lines = new ArrayList<Line>();
  Particle[] _particle;
  float _timer;
  float _updateTime;
  
  DrawLines(Particle[] particle){
    pos = new PVector(random(0, width), random(0, height));
    _particle = particle;
    _updateTime = random(400, 500);
  }
  
  void update(){
    pos.y += 1;
    if(pos.y > height) pos.y = 0;
    
    for(Line l:lines){
      l.drawLine();
    }
  }
  
   void check(color col){
    vecs.clear();
    lines.clear();
    _timer = millis();
    _updateTime = random(400, 500);
    for(Particle p: _particle){
      float dist = PVector.dist(p._pos, pos);
      if(dist > 30){
        continue;
      }
      vecs.add(p._pos);
    }
    
    for(int i=0; i<vecs.size()-1; i++){
      PVector p = vecs.get(i);
      PVector c = vecs.get(i+1);
      Line l = new Line(p, c, col);
      lines.add(l);
    }
  }
}
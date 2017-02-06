class ParticleSystem{
  ArrayList<LineParticle> lineParticles;
  PVector origin;
  
  ParticleSystem(PVector location){
    origin = location.get();
    lineParticles = new ArrayList<LineParticle>();
  }
  
  void addParticle(PVector xrange, PVector yrange){
    PVector initPos = new PVector();
    initPos.x = origin.x + random(xrange.x, xrange.y);
    initPos.y = origin.y + random(yrange.x, yrange.y);
    lineParticles.add(new LineParticle(initPos));
  }
  
  void update(){
    for(int i = lineParticles.size()-1; i>=0; i--){
      LineParticle lp = lineParticles.get(i);
      lp.update();
      if (lp.isDead()) {
        lineParticles.remove(i);
      }
      
    }
  }
  
}
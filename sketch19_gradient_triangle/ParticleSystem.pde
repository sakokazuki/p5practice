class ParticleSystem{
  ArrayList<TriangleParticle> triParticles;
  PVector origin;
  
  ParticleSystem(PVector location){
    origin = location.copy();
    triParticles = new ArrayList<TriangleParticle>();
  }
  
  void addParticle(){
    triParticles.add(new TriangleParticle(origin));
  }
  
  void update(){
    for(int i = triParticles.size()-1; i>=0; i--){
      TriangleParticle tp = triParticles.get(i);
      tp.update();
      if (tp.isDead()) {
        triParticles.remove(i);
      }
      
    }
  }
  
}
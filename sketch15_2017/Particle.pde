class Particle {
  PVector _pos = new PVector();
  color _col = color(0);
  PVector _target = new PVector();
  float _timer;
  float _updateTime;
  float _radius;
  float _targetRadius;
  float _speed;

  Particle(PVector pos) {
    _pos = pos;
    _updateTime = 10000;
    updateTarget();
    changeRadius(3, 10);
    _timer = millis();
    _speed = 0.1 ;
  }

  void update() {
    noStroke();
    fill(_col);
    ellipse(_pos.x, _pos.y, _radius, _radius);

    PVector diff = PVector.sub(_target, _pos);
    PVector speed = PVector.mult(diff, _speed);
    _pos.add(speed);
    
    float radiusSpeed = (_targetRadius - _radius) * _speed;
    _radius += radiusSpeed;

    if (millis() - _timer > _updateTime) {
      updateTarget();
    }
  }

  void updateTarget(PVector target){
    _target = target;
    _timer = millis();
  }

  void updateTarget() {
    _target = new PVector(random(width), random(height));
    _timer = millis();
  }
  
  void changeColor(color col){
    _col = col;
  }
  
  void changeGrayColor(){
    _col = color(random(10, 200));
  }
  
  void changeRadius(int min, int max){
    _targetRadius = random(min, max);
  }
};
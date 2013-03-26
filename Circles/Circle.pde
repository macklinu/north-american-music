class Circle {
  color c;
  float x, y;
  float size;
  int numWaves;
  boolean begin;

  Circle(float x, float y, float size) {
    this.x = x;
    this.y = y;
    this.size = size;
    c = color(random(100, 200));
    numWaves = 40;
    
    begin = false;
  }
  
  Circle(float x, float y, color c) {
    colorMode(HSB);
    this.x = x;
    this.y = y;
    this.c = c;
    numWaves = 40;
    
    begin = false;
  }
  
  Circle(float x, float y, float size, boolean begin) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.begin = begin;
    c = color(0);
    numWaves = 40;
  }
  
  void update() {
    // if (size % 10 == 0) numWaves++;
  }

  void display() {
    //noFill();
    fill(c, 255, 255, 10);
    stroke(255, 100);
    strokeWeight(0.5);
    //for (int i = 1; i < numWaves; i++) {
      ellipse(x, y, size, size);
    //}
  }
}


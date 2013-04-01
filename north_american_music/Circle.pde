class Circle {
  color c;
  float x, y;
  float size;
  int numWaves;
  boolean begin;

  Circle(float x, float y, float size, color c) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.c = c;

    begin = false;
  }

  Circle(float x, float y, color c) {
    colorMode(HSB);
    this.x = x;
    this.y = y;
    this.c = c;

    begin = false;
  }

  Circle(float x, float y, float size, boolean begin) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.begin = begin;
  }

  void animate(float destX, float destY) {
    Ani.to(this, 1.5, "size", destX);
    // Ani.to(this, 1.5, "y", destY);
  }

  void display() {
    fill(c, 130);
    //stroke(255, 100);
    //strokeWeight(0.5);
    ellipse(x, y, size, size);
  }
}


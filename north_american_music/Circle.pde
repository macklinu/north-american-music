class Circle {
  color c;
  float x, y;
  float size;
  int numWaves;
  boolean begin;
  float startX, startY, firstX, firstY, secondX, secondY;
  State start, first, second;
  Ani firstAni, secondAni;
  int firstTime, secondTime;

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

  void animate(State start, State first, State second, int firstTime, int secondTime) {
    this.start = start;
    this.first = first;
    this.second = second;
    this.firstTime = firstTime;
    this.secondTime = secondTime;

    firstAni = new Ani(this, firstTime / 100000, "size", dist(start.epiX, start.epiY, first.epiX, first.epiY), Ani.LINEAR, "onEnd:nextAni");
    firstAni.start();
  }
  
  private void nextAni() {
    println(start.id + " made it to: " + first.id);
    size = dist(start.epiX, start.epiY, first.epiX, first.epiY);
    secondAni = new Ani(this, (secondTime - firstTime) / 100000, "size", dist(start.epiX, start.epiY, second.epiX, second.epiY), Ani.LINEAR, "onEnd:finishAni");
    secondAni.start();
  }
  
  private void finishAni() {
    println(first.id + " made it to: " + second.id);
  }

  void display() {
    fill(c, 50);
    //stroke(255, 100);
    //strokeWeight(0.5);
    ellipseMode(RADIUS);
    ellipse(x, y, size, size);
  }
}


class Circle {
  color c;
  float x, y;
  float radius;
  int numWaves;
  float startX, startY, firstX, firstY, secondX, secondY;
  State start, first, second;
  Ani firstAni, secondAni, ghostAni;
  float firstTime, secondTime;
  float ghost;

  Circle(float x, float y, float radius, color c) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.c = c;
  }

  Circle(float x, float y, float radius, boolean begin) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.begin = begin;
  }

  void animate(State start, State first, State second) {
    this.start = start;
    this.first = first;
    this.second = second;
    this.firstTime = start.firstTime;
    this.secondTime = start.secondTime;

    firstAni = new Ani(this, this.firstTime / 100000.0, "radius", dist(start.epiX, start.epiY, first.epiX, first.epiY), Ani.LINEAR, "onEnd:nextAni");
    // ghostAni = new Ani(this, (secondTime - firstTime) / 100000, "ghost", dist(start.epiX, start.epiY, second.epiX, second.epiY), Ani.LINEAR);
    firstAni.start();
  }
  
  private void nextAni() {
    println(start.id + " made it to: " + first.id);
    // update the circle's radius to reflect making it to the first city
    radius = dist(start.epiX, start.epiY, first.epiX, first.epiY);
    // animate the circle radius to the next city
    secondAni = new Ani(this, (secondTime - firstTime) / 100000.0, "radius", dist(start.epiX, start.epiY, second.epiX, second.epiY), Ani.LINEAR, "onEnd:finishAni");
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
    ellipse(x, y, radius, radius);
    stroke(0);
    strokeWeight(0.3);
    line(x, y, radius, radius);
    fill(0);
    textSize(6);
    text(int((firstAni.getPosition() / dist(start.epiX, start.epiY, first.epiX, first.epiY)) * 100.0) + "% to " + first.id, x, y);
    if (secondAni != null) text(int((secondAni.getPosition() / dist(start.epiX, start.epiY, second.epiX, second.epiY)) * 100.0) + "% to " + second.id, x, y + 12);
    else text(int((firstAni.getPosition() / dist(start.epiX, start.epiY, second.epiX, second.epiY)) * 100.0) + "% to " + second.id, x, y + 12);
    
  }
}


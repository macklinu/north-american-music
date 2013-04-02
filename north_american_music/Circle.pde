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

  Circle(float x, float y, float radius, color c, State start, State first, State second) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.c = c;
    this.start = start;
    this.first = first;
    this.second = second;
    this.firstTime = start.firstTime;
    this.secondTime = start.secondTime;
    
    animate();
  }

  void animate() {
    firstAni = new Ani(this, toSeconds(firstTime), "radius", dist(start.epiX, start.epiY, first.epiX, first.epiY), Ani.LINEAR, "onEnd:nextAni");
    // firstAni.start();
  }

  private void nextAni() {
    println(start.id + " made it to: " + first.id);
    // update the circle's radius to reflect making it to the first city
    radius = dist(start.epiX, start.epiY, first.epiX, first.epiY);
    // animate the circle radius to the next city
    secondAni = new Ani(this, toSeconds(secondTime - firstTime), "radius", dist(start.epiX, start.epiY, second.epiX, second.epiY), Ani.LINEAR, "onEnd:finishAni");
    secondAni.start();
  }

  private void finishAni() {
    println(first.id + " made it to: " + second.id);
  }

  private float toSeconds(float ms) {
    return ms / 1000.0;
  }

  void display() {
    //stroke(255, 100);
    //strokeWeight(0.5);
    ellipseMode(RADIUS);
    noFill();
    stroke(c, 50);
    strokeWeight(1);
    ellipse(x, y, radius, radius);
    /*
    fill(0);
     textSize(7);
     text(nf((firstAni.getPosition() / dist(start.epiX, start.epiY, first.epiX, first.epiY)) * 100.0, 0, 3) + "% to " + first.id, x, y);
     if (secondAni != null) text(nf((secondAni.getPosition() / dist(start.epiX, start.epiY, second.epiX, second.epiY)) * 100.0, 0, 3) + "% to " + second.id, x, y + 12);
     else text(nf((firstAni.getPosition() / dist(start.epiX, start.epiY, second.epiX, second.epiY)) * 100.0, 0, 3) + "% to " + second.id, x, y + 12);
     */
  }
}


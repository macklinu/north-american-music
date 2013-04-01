class State {
  State first, second;
  // Epicenter epi;
  PShape shape, star;
  String id;
  int x, y;
  float epiX, epiY;
  color c;
  float diameter;
  float starScale;

  boolean recording, listening, sending, begin, setAni;

  Circle sound;
  float firstTime, secondTime;

  State(String id, int x, int y, float epiX, float epiY, float diameter, color c) {
    this.id = id;
    this.x = x;
    this.y = y;
    this.epiX = epiX;
    this.epiY = epiY;
    this.diameter = diameter;
    this.c = c;
    begin = false;
    setAni = false;

    // epi = new Epicenter(epiX, epiY, color(random(255), random(255), 30));
    sound = new Circle(epiX, epiY, diameter, c);
    star = createShape();
    star.beginShape();
    star.noStroke();
    star.fill(40, 240, 255);
    star.vertex(0, -50);
    star.vertex(14, -20);
    star.vertex(47, -15);
    star.vertex(23, 7);
    star.vertex(29, 40);
    star.vertex(0, 25);
    star.vertex(-29, 40);
    star.vertex(-23, 7);
    star.vertex(-47, -15);
    star.vertex(-14, -20);
    star.endShape(CLOSE);
    starScale = 0.1;
  }

  void disable() {
  }

  void update() {
    // epi.update();
    if (begin) {
      if (setAni) { 
        // sound.animate(epiX, epiY, first.epiX, first.epiY, second.epiX, second.epiY, firstTime);
        sound.animate(this, first, second);
        setAni = false;
      }
    }
  }

  void display() {
    shape.disableStyle();
    noStroke();
    fill(200);
    // shape(shape, x, y); 
    pushMatrix();
    scale(starScale);
    translate(epiX/starScale, epiY/starScale);
    shape(star);
    popMatrix();
    if (begin) sound.display();
    // epi.display();
  }

  void begin(State first, State second, float firstTime, float secondTime) {
    // epi.begin();
    this.first = first;
    this.second = second;
    this.firstTime = firstTime;
    this.secondTime = secondTime;
    begin = !begin;
    setAni = true;
  }
}


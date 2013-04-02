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

  ArrayList<Circle> circles;
  Circle sound;
  float firstTime, secondTime;

  Timer timer;

  State(String id, int x, int y, float epiX, float epiY, float diameter, color c) {
    this.id = id;
    this.x = x;
    this.y = y;
    this.epiX = epiX;
    this.epiY = epiY;
    this.diameter = diameter;
    this.c = c;
    begin = false;
    recording = false;
    setAni = false;

    timer = new Timer();

    // epi = new Epicenter(epiX, epiY, color(random(255), random(255), 30));
    // sound = new Circle(epiX, epiY, diameter, c);

    circles = new ArrayList<Circle>();

    // create a star shape
    star = createShape();
    star.beginShape();
    star.noStroke();
    star.fill(c, 250);
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
  }

  void display() {
    // if (begin) {
      Iterator<Circle> it = circles.iterator();
      while (it.hasNext()) {
        // transmitting = true;
        Circle c = it.next();
        c.display();
        if (!c.isCompleted()) it.remove();
      }
    // }
    pushMatrix();
    scale(starScale);
    translate(epiX/starScale, epiY/starScale);
    shape(star);
    popMatrix();
  }

  void begin(State first, State second, float firstTime, float secondTime) {
    this.first = first;
    this.second = second;
    this.firstTime = firstTime;
    this.secondTime = secondTime;
    begin = true;
    setAni = true;

    circles.add(new Circle(epiX, epiY, diameter, c, this, first, second));
  }
}


class State {
  State first, second;
  // Epicenter epi;
  PShape shape, star, recordStar, blankStar;
  String id;
  int x, y;
  float epiX, epiY;
  color c;
  float diameter;
  float starScale;

  boolean recording, listening, sending, begin, setAni;

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
    
    recordStar = createShape();
    recordStar.beginShape();
    recordStar.noStroke();
    recordStar.fill(0, 240, 255);
    recordStar.vertex(0, -50);
    recordStar.vertex(14, -20);
    recordStar.vertex(47, -15);
    recordStar.vertex(23, 7);
    recordStar.vertex(29, 40);
    recordStar.vertex(0, 25);
    recordStar.vertex(-29, 40);
    recordStar.vertex(-23, 7);
    recordStar.vertex(-47, -15);
    recordStar.vertex(-14, -20);
    recordStar.endShape(CLOSE);
    
    blankStar = createShape();
    blankStar.beginShape();
    blankStar.noStroke();
    blankStar.fill(0, 240, 255, 50);
    blankStar.vertex(0, -50);
    blankStar.vertex(14, -20);
    blankStar.vertex(47, -15);
    blankStar.vertex(23, 7);
    blankStar.vertex(29, 40);
    blankStar.vertex(0, 25);
    blankStar.vertex(-29, 40);
    blankStar.vertex(-23, 7);
    blankStar.vertex(-47, -15);
    blankStar.vertex(-14, -20);
    blankStar.endShape(CLOSE);
    
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
    if (recording) {
      println(timer.interval);
      if (timer.interval % 1 == 0) shape(recordStar);
      else shape(blankStar);
      // shape(recordStar);
    }
    else shape(star);
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


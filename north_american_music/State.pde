class State {
  Epicenter epi;
  PShape shape;
  String id;
  int x, y;

  State(String id, int x, int y, int epiX, int epiY) {
    this.id = id;
    this.x = x;
    this.y = y;

    epi = new Epicenter(epiX/sc, epiY/sc, color(random(255), random(255), 30));
  }

  void disable() {
  }

  void update() {
    epi.update();
  }

  void display() {
    shape.disableStyle();
    noStroke();
    fill(200);
    shape(shape, x, y); 
    epi.display();
  }
  
  void begin() {
    epi.begin();
  }
}


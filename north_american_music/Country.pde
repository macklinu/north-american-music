class Country {
  String[] stateNames = {
    "IL", "MI", "NY"
  };
  int[] xLoc = {
    117, 258, 580
  };
  int[] yLoc = {
    314, 210, 128
  };
  State[] state = new State[stateNames.length];
  PShape country;
  int x, y;
  float[] travelX = new float[stateNames.length];
  float[] travelY = new float[stateNames.length];
  color[] c = {color(20, 255, 255), color(120, 255, 255), color(220, 255, 255)};
  float incX, incY;

  boolean start = false;
  boolean moving = false;

  Country(int x, int y) {
    this.x = x;
    this.y = y;
    country = loadShape("usa-wikipedia-mod3.svg");
    for (int i = 0; i < state.length; i++) {
      state[i] = new State(stateNames[i], x, y, xLoc[i]/sc, yLoc[i]/sc, 20, c[i]);
      state[i].shape = country.getChild(stateNames[i]);
    }

    travelX[0] = state[0].epiX;
    travelY[0] = state[0].epiY;
    println(dist(travelX[0], state[1].epiX, travelY[0], state[1].epiY));
    incX = ((travelX[0] - state[1].epiX) / 500);
    incY = ((travelY[0] - state[1].epiY) / 500);
  }

  void update() {
    for (int i = 0; i < state.length; i++) {
      state[i].update();
    }
    if (start) {
      if (moving) {
      travelX[0] -= incX;
      travelY[0] -= incY;
      }
      if (dist(travelX[0], travelY[0], state[1].epiX, state[1].epiY) < 0.1) moving = false;
    }
  }


  void display() {
    pushMatrix();
    scale(sc);
    country.disableStyle();
    stroke(220);
    strokeWeight(10.5);
    //noStroke();
    fill(220);
    shape(country, x, y);
    for (int i = 0; i < state.length; i++) {
      state[i].display();
    }
    /*
    line(state[0].epiX, state[0].epiY, state[1].epiX, state[1].epiY);
    line(state[1].epiX, state[1].epiY, state[2].epiX, state[2].epiY);
    line(state[2].epiX, state[2].epiY, state[0].epiX, state[0].epiY);
    */
    if (start) {
      noStroke();
      fill(127, 255, 100, 100);
      ellipse(travelX[0], travelY[0], 20, 20);
    }

    popMatrix();
  }

  void run() {
    update();
    display();
  }

  void begin(int i, int dest) {
    state[i].begin(state[dest]);
  }

  void keyPressed() {
  }
}


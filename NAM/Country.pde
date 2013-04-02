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
  color[] c = {
    color(20, 255, 255), color(120, 255, 255), color(220, 255, 255)
  };

  boolean start = false;
  boolean moving = false;

  Country(int x, int y) {
    this.x = x;
    this.y = y;
    country = loadShape("usa-wikipedia-mod3.svg");
    for (int i = 0; i < state.length; i++) {
      state[i] = new State(stateNames[i], x, y, xLoc[i]/sc, yLoc[i]/sc, 0, c[i]);
      state[i].shape = country.getChild(stateNames[i]);
    }
  }

  void update() {
    for (int i = 0; i < state.length; i++) {
      state[i].update();
    }
    if (start) {
      if (moving) {
      }
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
    }


    popMatrix();
  }

  void go() {
    update();
    display();
  }
  
  void recording(int i) {
    // state[i].recording = !state[i].recording;
  }

  void begin(int i, int first, int second, float firstTime, float secondTime) {
    state[i].begin(state[first], state[second], firstTime, secondTime);
  }

  void keyPressed() {
  }
}


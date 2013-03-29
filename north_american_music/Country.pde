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

  Country(int x, int y) {
    this.x = x;
    this.y = y;
    country = loadShape("usa-wikipedia-mod3.svg");
    for (int i = 0; i < state.length; i++) {
      state[i] = new State(stateNames[i], x, y, xLoc[i], yLoc[i]);
      state[i].shape = country.getChild(stateNames[i]);
    }
  }

  void update() {
    for (int i = 0; i < state.length; i++) {
      state[i].update();
    }
  }


  void display() {
    pushMatrix();
    scale(sc);
    country.disableStyle();
    noStroke();
    fill(220);
    shape(country, x, y);
    for (int i = 0; i < state.length; i++) {
      state[i].display();
    }
    popMatrix();
  }

  void run() {
    update();
    display();
  }


  void begin(int i) {
    state[i].begin();
  }
}


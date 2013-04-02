class Country {
  PShape country; // the background SVG of the US
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
  int x, y;
  // color of each state's circles + star
  color[] c = {
    color(40, 360*.80, 360*.93), color(213, 360*.62, 360*.87), color(0, 360*.7, 360*.97)
  };

  Country(int x, int y) {
    this.x = x;
    this.y = y;
    country = loadShape("usa-wikipedia-mod3.svg");
    for (int i = 0; i < state.length; i++) {
      state[i] = new State(stateNames[i], x, y, xLoc[i]/sc, yLoc[i]/sc, 0, c[i]);
      state[i].shape = country.getChild(stateNames[i]);
    }
  }

  void run() {
    update();
    display();
  }

  void update() {
    /*
    for (int i = 0; i < state.length; i++) {
     state[i].update();
     }
     */
  }

  void display() {
    pushMatrix();
    scale(sc);    
    shape(country, x, y);
    for (int i = 0; i < state.length; i++) state[i].display();
    popMatrix();
  }

  void create(int i, int first, int second, float firstTime, float secondTime) {
    state[i].begin(state[first], state[second], firstTime, secondTime);
  }
}


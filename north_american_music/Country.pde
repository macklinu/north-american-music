class Country {
  String[] stateNames = {
    "IL", "MI", "NY"
  };
  State[] state = new State[stateNames.length];
  PShape country;
  int x, y;

  Country(int x, int y) {
    this.x = x;
    this.y = y;
    country = loadShape("usa-wikipedia-mod3.svg");
    for (int i = 0; i < state.length; i++) {
      state[i] = new State(stateNames[i], x, y);
      state[i].shape = country.getChild(stateNames[i]);
    }
  }
  
  void update() {
    for (int i = 0; i < state.length; i++) {
      state[i].update();
    }
  }
  

  void display() {
    scale(sc);
    country.disableStyle();
    noStroke();
    fill(220);
    shape(country, x, y);
    for (int i = 0; i < state.length; i++) {
      state[i].display();
    }
  }

  void run() {
    update();
    display();
  }
  
  
 void begin(int i) {
   state[i].begin();
 }
 
}


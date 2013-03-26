class Epicenter {
  float w, h;
  Timer timer;
  ArrayList<Circle> circles;
  
  float x, y;
  color col;

  Epicenter(float x, float y, color col) {
    this.x = x;
    this.y = y;
    this.col = col;
    circles = new ArrayList<Circle>();  // Create an empty ArrayList
    circles.add(new Circle(x, y, col));
    timer = new Timer();
  }

  void update() {
    for (int i = circles.size()-1; i >= 0; i--) { 
      Circle c = (Circle) circles.get(i);
      if (c.begin) { 
        c.size+=0.8;
        if (timer.atInterval()) { 
          circles.add(new Circle(x, y, size, true));
          // println("new circle added. number of circles:\t" + circles.size());
        }
        if (c.size > width) {
          circles.remove(c);
          // println("circle killed. number of circles:\t" + circles.size());
        }
        // c.update();
      }
    }
  }

  void display() {
    for (int i = circles.size()-1; i >= 0; i--) { 
      Circle c = (Circle) circles.get(i);
      c.display();
    }
  }

  void begin() {
    for (int i = circles.size()-1; i >= 0; i--) {
      Circle c = (Circle) circles.get(i);
      c.begin = true;
      timer.start();
    }
  }

  int size() {
    return circles.size();
  }
}


Epicenter epi;

int size = 2;

void setup() {
  size(800, 500);
  smooth();
  colorMode(HSB);
  
  epi = new Epicenter(random(100, 700), random(100, 400), color(0, 120, 255));
}

void draw() {
  background(220);
  epi.update();
  epi.display();
  //println(frameRate);
  fill(50);
  text(frameRate, 10, 20);
}

void keyPressed() {
  switch(key) {
  case ' ':
    epi.begin();
    break;
  }
}


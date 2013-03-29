/**
 * North American Music
 * 2 Apr 2013
 * Digital Music Ensemble
 * University of Michigan, Ann Arbor
 * 
 * SVG files can be made of many individual shapes. 
 * Each of these shapes (called a "child") has its own name 
 * that can be used to extract it from the "parent" file.
 * This example loads a map of the United States and creates
 * two new PShape objects by extracting the data from two states.
 */

Country nam;
Epicenter epi;

int x = -587;
int y = -121;
float sc = 2.025;
boolean moving = false;
boolean shift;

int size = 2;

void setup() {
  size(640, 480);
  smooth();
  nam = new Country(x, y);
  epi = new Epicenter(random(100, 300), random(100, 300), color(0, 120, 255));
}

void draw() {
  background(255);
  nam.run();
  epi.update();
  epi.display();
  fill(50);
  text(frameRate, 10, 20);
}

void mouseDragged() {
  moving = true;
}

void mouseReleased() {
  moving = false;
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == SHIFT) {
      shift = true;
    }
  }
  if (key == ' ') epi.begin();
}



void keyReleased() {
  shift = false;
}


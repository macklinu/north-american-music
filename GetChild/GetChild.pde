/**
 * Get Child. 
 * 
 * SVG files can be made of many individual shapes. 
 * Each of these shapes (called a "child") has its own name 
 * that can be used to extract it from the "parent" file.
 * This example loads a map of the United States and creates
 * two new PShape objects by extracting the data from two states.
 */

// The next line is needed if running in JavaScript Mode with Processing.js
/* @pjs preload="usa-wikipedia.svg"; */

PShape usa;
PShape michigan;
PShape ohio;
PShape annarbor;

int x = -587;
int y = -121;
float sc = 2.025;
boolean moving = false;
boolean shift;

void setup() {
  size(640, 480, P2D); 
  usa = loadShape("usa-wikipedia-mod3.svg");
  annarbor = usa.getChild("annarbor");
}

void draw() {
  background(255);

  // Draw the full map

  scale(sc);
  usa.disableStyle();
  noStroke();
  fill(185);
  shape(usa, x, y);

  annarbor.disableStyle();
  fill(255, 0, 0);
  shape(annarbor, x, y);

  if (moving) {
    if (shift) {
      sc += (mouseY - pmouseY) * -0.025;
    }
    else {
      x += (mouseX - pmouseX);
      y += (mouseY - pmouseY);
    }
  }
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
  if (key == '=') { 
    usa.scale(1.05);
    annarbor.scale(1.05);
  }
  if (key == '-') usa.scale(0.95);
  
  if (key == 'p') {
    println("sc: " + sc + "\tx: " + x + "\ty: " + y);
  }
}



void keyReleased() {
  shift = false;
}


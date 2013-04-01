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

import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;

Country nam;

int x = -587;
int y = -121;
float sc = 2.025;
boolean moving = false;
boolean shift;

int size = 2;

void setup() {
  size(640, 480, P2D);
  smooth();
  colorMode(HSB);
  
  Ani.init(this);
  Ani.setDefaultEasing(Ani.LINEAR);
  
  nam = new Country(x, y);
}

void draw() {
  background(255);
  /*
  noStroke();
   fill(255, 50);
   rect(0, 0, width, height);
   */
  nam.run();
  fill(50);
  text(frameRate, 10, 20);
}

void mousePressed() {
  println(mouseX + ", " + mouseY);
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
  if (key == '1') nam.begin(0, 1);
  if (key == '2') nam.begin(1, 2);
  if (key == '3') nam.begin(2, 0);
  if (key == 'a') { 
    nam.start = !nam.start;
    nam.moving = !nam.moving;
    println(nam.start);
  }
}



void keyReleased() {
  shift = false;
}


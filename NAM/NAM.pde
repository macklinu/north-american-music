import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;

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
import java.util.Iterator;


Country nam;

int x = -587;
int y = -121;
float sc = 2.025;
boolean moving = false;
boolean shift;

float MI_to_IL = 1287378;
float MI_to_NY = 2408736;
float IL_to_NY = 3623298;

int size = 2;
PFont font;

void setup() {
  size(640, 480, P2D);
  smooth();
  colorMode(HSB);

  Ani.init(this);
  // Ani.setDefaultEasing(Ani.LINEAR);

  nam = new Country(x, y);
  font = loadFont("Inconsolata.vlw");
  textFont(font);
  
  for (int i = 32; i > 0; i--) println(i + "\t" + (MI_to_IL / float(i)));
}

void draw() {
  background(255);
  nam.run();

  fill(50);
  textSize(18);
  text((int) frameRate, 10, 20);
}

void mousePressed() {
  // println(mouseX + ", " + mouseY);
}

void mouseDragged() {
  // moving = true;
}

void mouseReleased() {
  // moving = false;
}

void keyPressed() {
  /*
  if (key == CODED) {
    if (keyCode == SHIFT) {
      shift = true;
    }
  }
  */
  if (key == '1') nam.begin(0, 1, 2, MI_to_IL, IL_to_NY);
  if (key == '2') nam.begin(1, 0, 2, MI_to_IL, MI_to_NY);
  if (key == '3') nam.begin(2, 1, 0, MI_to_IL, IL_to_NY);
  /*
  if (key == 'a') { 
    nam.start = !nam.start;
    nam.moving = !nam.moving;
    println(nam.start);
  }
  */
  if (key == 's') save("screenshots/" + timestamp() + ".png");
  // if (key == 'r') nam.recording(0);
}

void keyReleased() {
  // shift = false;
}

String timestamp() {
  String currentTime = str(year()) 
    + nf(month(), 2)
      + nf(day(), 2)
        + "_"
          + nf(hour(), 2)
          + nf(minute(), 2)
            + nf(second(), 2);
  return currentTime;
}


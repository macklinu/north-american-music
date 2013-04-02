/**
 * North American Music
 *
 * 2 Apr 2013
 * Digital Music Ensemble: University of Michigan, Ann Arbor
 * 
 * SVG files can be made of many individual shapes. 
 * Each of these shapes (called a "child") has its own name 
 * that can be used to extract it from the "parent" file.
 * This example loads a map of the United States and creates
 * two new PShape objects by extracting the data from two states.
 */
import java.util.Iterator;

import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;

Country nam;

int x = -587;
int y = -121;
float sc = 2.025;

// times it takes to travel from one state to another (in ms)
float MI_to_IL = 1287378.0 / 285.0;
float MI_to_NY = 2408736.0 / 285.0;
float IL_to_NY = 3623298.0 / 285.0;

// int size = 2;
PFont font;

void setup() {
  // P3D is crucial 
  // Otherwise, the framerate drops significantly over time
  size(640, 480, P3D);
  smooth();
  colorMode(HSB, 360);

  // initialize the animation library
  Ani.init(this);
  // create the United States of America
  nam = new Country(x, y);
  font = loadFont("Inconsolata.vlw");
  textFont(font);
}

void draw() {
  fill(340, 30);
  noStroke();
  rect(0, 0, width, height);
  // run the whole thing
  nam.run();

  // display the frame rate in the upper left (for debugging)
  fill(50);
  textSize(18);
  text((int) frameRate, 10, 20);
}

void keyPressed() {
  // create a new visual representation of the ensemble when they begin making sound
  // going to use SPACEBAR by default
  if (key == '1') nam.create(0, 1, 2, MI_to_IL, IL_to_NY);
  if (key == '2') nam.create(1, 0, 2, MI_to_IL, MI_to_NY);
  if (key == '3') nam.create(2, 1, 0, MI_to_IL, IL_to_NY);
  // press 's' to save a screenshot of the current frame
  if (key == 's' || key == 'S') save("screenshots/" + timestamp() + ".png");
  // if (key == 'c' || key == 'C') background(340);
}

// custom timestamp string makes saving files chronologically organized 
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


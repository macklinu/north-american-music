/**
 * North American Music
 *
 * 2 Apr 2013
 * Digital Music Ensemble: University of Michigan, Ann Arbor
 * 
 * Visualization for MICHIGAN
 *
 */

import java.util.Iterator; // for the circles ArrayList
import de.looksgood.ani.*; // animation library
import de.looksgood.ani.easing.*;
import oscP5.*; // OSC library to communicate between visual sketches
import netP5.*;

Country nam;
OscP5 fromIL, fromNY;
NetAddress toIL, toNY;

int x = -587; // adjust x position of svg
int y = -121; // adjust x position of svg
float sc = 2.025; // global scale of map

// times it takes to travel from one state to another (in ms)
float MI_to_IL = 1287378.0 / 285.0;
float MI_to_NY = 2408736.0 / 285.0;
float IL_to_NY = 3623298.0 / 285.0;

PFont font;

void setup() {
  // P3D is crucial; otherwise, the framerate drops significantly over time
  size(640, 480, P3D);
  smooth();
  colorMode(HSB, 360);

  fromIL = new OscP5(this, 7800);
  fromNY = new OscP5(this, 7801);
  toIL = new NetAddress("127.0.0.1", 7802);
  toNY = new NetAddress("127.0.0.1", 7804);
  fromIL.plug(this, "ilStart", "/ilStart");
  fromNY.plug(this, "nyStart", "/nyStart");

  Ani.init(this); // initialize the animation library
  nam = new Country(x, y); // create the United States of America
  // load a font
  font = loadFont("Inconsolata.vlw");
  textFont(font);
}

public void ilStart(int i) {
  println("### plug event method. received a message /ilStart.");
  nam.create(0, 1, 2, MI_to_IL, IL_to_NY);
}

public void nyStart(int i) {
  println("### plug event method. received a message /nyStart.");
  nam.create(2, 1, 0, MI_to_IL, IL_to_NY);
}

void draw() {
  background(200);
  nam.display(); // do everything

  // display the frame rate in the upper left (for debugging)
  /*
  fill(50);
   textSize(18);
   text((int) frameRate, 10, 20);
   */

  // for recording animation (keep this commented out)
  // saveFrame("frames/screen-######.tif");
}

void keyPressed() {
  // create a new visual representation of the ensemble when they begin making sound
  // going to use SPACEBAR by default
  if (key == '1') nam.create(0, 1, 2, MI_to_IL, IL_to_NY);
  if (key == '2') nam.create(1, 0, 2, MI_to_IL, MI_to_NY);
  if (key == '3') nam.create(2, 1, 0, MI_to_IL, IL_to_NY);
  // press 's' to save a screenshot of the current frame
  if (key == 's' || key == 'S') save("screenshots/" + timestamp() + ".png");
  if (key == ' ') {
    OscMessage m = new OscMessage("/miStart");
    m.add(1); // add an int to the osc message
    // send the message
    fromIL.send(m, toIL);
    fromNY.send(m, toNY);
    nam.create(1, 0, 2, MI_to_IL, MI_to_NY);
  }
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


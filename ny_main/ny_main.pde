/**
 * North American Music
 *
 * 2 Apr 2013
 * Digital Music Ensemble: University of Michigan, Ann Arbor
 * audio programming: Colin Fulton
 * visual programming: Macklin Underdown 
 * 
 * Visualization for NEW YORK
 *
 */

import java.util.Iterator; // for the circles ArrayList
import de.looksgood.ani.*; // animation library
import de.looksgood.ani.easing.*;
import oscP5.*; // OSC library to communicate between visual sketches
import netP5.*;

Country nam;
OscP5 fromMI, fromIL;
NetAddress toMI, toIL;

int x = -587; // adjust x position of svg
int y = -121; // adjust x position of svg
float sc = 2.025; // global scale of map

// times it takes to travel from one state to another (in ms)
float speed = 20.0; // 1 = realtime
float MI_to_IL = 1287378.0 / speed;
float MI_to_NY = 2408736.0 / speed;
float IL_to_NY = 3623298.0 / speed;

PFont font;

void setup() {
  // P3D is crucial; otherwise, the framerate drops significantly over time
  size(1280, 720, P3D);
  smooth();
  colorMode(HSB, 360);

  fromMI = new OscP5(this, 7804);
  fromIL = new OscP5(this, 7805);
  toMI = new NetAddress("127.0.0.1", 7801);
  toIL = new NetAddress("127.0.0.1", 7803);
  fromMI.plug(this, "miStart", "/miStart");
  fromIL.plug(this, "ilStart", "/ilStart");

  Ani.init(this); // initialize the animation library
  nam = new Country(x, y); // create the United States of America
  // load a font
  font = loadFont("Inconsolata.vlw");
  textFont(font);
}

void draw() {
  background(200);
  nam.display(); // do everything
}

void keyPressed() {
  // press SPACEBAR to create a new visual representation of the ensemble when they begin making sound
  if (key == ' ') {
    OscMessage m = new OscMessage("/nyStart"); // create a message that says "NY has started playing"
    m.add(1); // add an int to the osc message
    // send the message
    fromMI.send(m, toMI); // to MI
    fromIL.send(m, toIL); // to IL
    nam.create(2, 1, 0, MI_to_IL, IL_to_NY); // display the visual locally
  }
}

/////////////////
// osc methods //
/////////////////

public void miStart(int i) {
  println("MI has started playing, but you can't hear it yet.");
  nam.create(1, 0, 2, MI_to_IL, MI_to_NY);
}

public void ilStart(int i) {
  println("IL has started playing, but you can't hear it yet.");
  nam.create(0, 1, 2, MI_to_IL, IL_to_NY);
}

//////////
// misc //
//////////

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


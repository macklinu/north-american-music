// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 10-5: Object-oriented timer

class Timer {

  int savedTime; // When Timer started
  int totalTime; // How long Timer should last
  float interval = 0.;

  Timer() {
    totalTime = 3000;
    
  }

  // Starting the timer
  void start() {
    // When the timer starts it stores the current time in milliseconds.
    savedTime = millis();
  }

  float atInterval() { 
    // Check how much time has passed
    int passedTime = millis() - savedTime;
    int check = passedTime / totalTime;
    if (check > interval) {
      interval += 1.0;
      return interval;
      // return true;
    } 
    else {
      return interval;
    }
  }
}


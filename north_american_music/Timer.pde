// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 10-5: Object-oriented timer

class Timer {

  int savedTime; // When Timer started
  int totalTime; // How long Timer should last
  int interval = 0;

  Timer() {
    totalTime = 4000;
  }

  // Starting the timer
  void start() {
    // When the timer starts it stores the current time in milliseconds.
    savedTime = millis();
  }

  boolean atInterval() { 
    // Check how much time has passed
    int passedTime = millis() - savedTime;
    int check = passedTime / totalTime;
    if (check > interval) {
      interval++;
      return true;
    } 
    else {
      return false;
    }
  }
}


class State {
  PShape shape;
  String id;
  int x, y;
  
  State(String id, int x, int y) {
    this.id = id;
    this.x = x;
    this.y = y;
    
  }
  
  void disable() {
    
  }
  
  void display() {
    shape.disableStyle();
    noStroke();
    fill(200);
   shape(shape, x, y); 
  }
  
  
}

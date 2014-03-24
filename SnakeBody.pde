class SnakeBody{ //name

  // attributes
  float x,y;
  int bodyNumber;
  
  // constructor 
  SnakeBody(float a, float b, int c){
    x = a;
    y = b;
    bodyNumber = c;
  }
  
  // methods
  void display(){
    noStroke();
    fill(map(sin(bodyNumber),-1,1,0,255)); // changes the color of the snake segments
    ellipse(x,y,snakeSize,snakeSize);
    
    if(x > width+2){
      x = -2;
    }
    if(x < -snakeSize/2){
      x = width+2;
    }
    if(y > height+2){
      y = -2;
    }
    if(y < -snakeSize/2){
      y = height+2;
    }
  }
  
  void updateLocation(float a, float b){ // sets new location
    x = a;
    y = b;
  }
}

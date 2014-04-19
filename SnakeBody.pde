class SnakeBody{ //name

  // attributes
  float x,y;
  int bodyNumber;
  color bodyColor;
  
  // constructor 
  SnakeBody(float a, float b, int c){
    x = a;
    y = b;
    bodyNumber = c;
    
    // body color, based on segment number
    if((c % 8) == 1){
      bodyColor = color(255,0,0);
    }else if((c % 8) == 3){
      bodyColor = color(0);
    }else if((c % 8) == 5){
      bodyColor = color(255,255,0);
    }else if((c % 8) == 7){
      bodyColor = color(0);
    }
  }
  
  // methods
  void display(){
    noStroke();
    fill(bodyColor); // changes the color of the snake segments
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

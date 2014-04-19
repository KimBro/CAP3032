class SnakeHead{ // name

  // attributes
  int x, y; //
  int direction;
  float[] xArray, yArray; // array of locations
  SnakeBody[] segments;
  int maxSegments = 200;
  int offset = snakeSize/2; // the distance between segment centerpoints
  
  // constructor
  SnakeHead(){
    // random starting location near center
    x = (int)random(width/2-50,width/2+50);
    y = (int)random(height/2-50,height/2+50);
    
    // random starting direction
    direction = (int)random(1,4); 
    
    xArray = new float[10*maxSegments];
    yArray = new float[10*maxSegments];
    
    segments = new SnakeBody[maxSegments];
    
    segments[0] = new SnakeBody(x,y,0);
  }
  
  // methods
  void display(){  // runs methods and displays snake head
    offset = int((snakeSize)*(1/snakeSpeed)); // updates offset
    noFill();
    noStroke();
    ellipse(x,y,snakeSize,snakeSize);
    direction();
    wrap();
  }
  
  void direction(){         // code for direction, doesn't allow 180 degree turns
    if(keyCode == 37){
      if(direction != 3){
        direction = 1;
      }
    }
    else if(keyCode == 38){
      if(direction != 4){
        direction = 2;
      }
    }
    else if(keyCode == 39){
      if(direction != 1){
        direction = 3;
      }
    }
    else if(keyCode == 40){
      if(direction != 2){
        direction = 4;
      }
    }
    
    if (direction == 1){
      x -= snakeSpeed;
    }
    else if (direction == 2){
      y -= snakeSpeed;
    }
    else if (direction == 3){
      x += snakeSpeed;
    }
    else if (direction == 4){
      y += snakeSpeed;
    }
    
    xArray[0]=x;
    yArray[0]=y;
    
    // cycles through arrays, storing previous locations
    for (int i = xArray.length-1;i>0;i--){
      xArray[i]=xArray[i-1];
    }
    for (int i = yArray.length-1;i>0;i--){
      yArray[i]=yArray[i-1];
    }
    
    int i = 0;
    while (segments[i] != null) { // updates each segment of the snake and displays it
      segments[i].updateLocation(xArray[i*offset],yArray[i*offset]);
      segments[i].display();
      i++;
    }
  }
  
  void wrap(){            // sends the snake to the opposite side of the screen when it crosses a border
    if(x < -snakeSize/2){
      x = width;
    }
    if(x > width){
      x = -2;
    }
    if(y < -snakeSize/2){
      y = height;
    }
    if(y > height){
      y = -2;
    }
  }
  
  
  void addBody() // adds two segments
  {
    int i = 0;
    while (segments[i] != null)
    {
      i++;
    }
    
    segments[i] = new SnakeBody(xArray[i]*offset,yArray[i]*offset,i);
    segments[i+1] = new SnakeBody(xArray[i+1]*offset,yArray[i+1]*offset,i);
  }
  
  boolean isCollided() // checks for collision with the head against every segment
  {
    int i = 4;
    while (segments[i] != null)
    {
      if(abs(x-segments[i].x)<snakeSize && abs(y-segments[i].y)<snakeSize)
        return true;
      i++;
    }
    return false;
  }
}


class Apple{ // name

  // variables
  int fallNumber; // stores a number that checks if apple should fall
  boolean fallen; // true is apple has fallen
  int appleDiameter;
  float appleX;
  float appleY;
  
  // constructor
  Apple(){ // initialize
    fallen = false;
  }
  
  // methods
  void fallCheck(){ // updates the fallen variable
    if(!fallen){ // provided an apple is not fallen, start chance to fall
      fallNumber = (int)random(51);
      if(fallNumber == 50){ // 2% chance each frame for apple to drop, the 50 can be any number between 0 and 100
        fallen = true;
        appleX = random(width);
        appleY = random(height); // set location of apple when it falls
        appleDiameter = width/2; // starts apple at large size
        
      }
    }
  }

  
  void display(){ // draws the apple
    stroke(0);
    fill(255,0,0); // red color
    ellipse(appleX,appleY,appleDiameter,appleDiameter);
    if(appleDiameter > snakeSize){
      appleDiameter -= 5; // shrinks apple size to give falling effect
    }else{
      appleDiameter = snakeSize;
      collisionCheck();
    }
  }
  
  void collisionCheck(){
      if(dist(s.x,s.y,appleX,appleY) < snakeSize){ // collision detection to see if apple is obtained
        s.addBody();
        fallen = false;
      }
  }
  
  void run(){ // combines necessary methods into one function
    fallCheck();
    if(fallen){
      display();
    }
  }
}

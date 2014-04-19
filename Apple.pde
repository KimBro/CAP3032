class Apple{ // name

  // variables
  int fallNumber; // stores a number that checks if apple should fall
  boolean fallen; // true is apple has fallen
  int appleDiameter, appleMin;
  float appleX,appleY;
  PImage apple;
  
  // constructor
  Apple(){ // initialize
    fallen = false;
    apple = loadImage("Apple.png");
    appleMin = snakeSize + 5;
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
    image(apple,appleX,appleY,appleDiameter,appleDiameter);
    if(appleDiameter > appleMin){
      appleDiameter -= 5; // shrinks apple size to give falling effect
    }else{
      appleDiameter = appleMin;
      collisionCheck();
    }
  }
  
  void collisionCheck(){
      if(dist(s.x,s.y,appleX,appleY) < appleMin){ // collision detection to see if apple is obtained
        s.addBody();
        fallen = false;
        score += 200*multiplier;
      }
  }
  
  void run(){ // combines necessary methods into one function
    fallCheck();
    if(fallen){
      display();
    }
  }
}

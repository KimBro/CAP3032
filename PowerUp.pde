class PowerUp{ // name

  // variables
  int showNumber; // stores a number that checks if powerup should fall
  boolean shown; // true is powerup has shown
  int pUpDiameter;
  float pUpX;
  float pUpY;
  int type;
  int time1, time2;
  PImage arrowB, arrowY;
  
  // constructor
  PowerUp(){ // initialize
    shown = false;
    pUpDiameter = snakeSize + 5;
    arrowB = loadImage("ArrowB.png");
    arrowY = loadImage("ArrowY.png");
  }
  
  // methods
  void showCheck(){ // updates the fallen variable
    if(!shown && (frameCount - time2) > 300){ // if a powerup is not shown and 10 seconds have gone by, start chance to fall
      showNumber = (int)random(500);
      if(showNumber == 50){ // .2% chance each frame for powerup to appear
        shown = true;
        while(dist(s.x,s.y,pUpX,pUpY) > (snakeSize + pUpDiameter)*3){ // ensures that the powerup doesn't appear on snake head
          pUpX = random(width);
          pUpY = random(height); // set location
        }
        type = (int)random(4); // randomizes the effect
        
        if(snakeSize == 5 && type == 1){ // ensures that our snake doesn't have a size of zero
          type = 0;
        }
        if(snakeSpeed == 2 && type == 3){
          type = 2;
        }
        
        time1 = frameCount;
      }
    }
  }
  
  void display(){ // draws the powerup
    imageMode(CENTER);
    if(type == 0){
      image(arrowB,pUpX,pUpY,pUpDiameter,pUpDiameter);
    }else if(type == 1){
      pushMatrix();
      translate(pUpX,pUpY);
      rotate(radians(180));
      image(arrowB,0,0,pUpDiameter,pUpDiameter);
      popMatrix();
    }else if(type == 2){
      image(arrowY,pUpX,pUpY,pUpDiameter,pUpDiameter);
    }else{
      pushMatrix();
      translate(pUpX,pUpY);
      rotate(radians(180));
      image(arrowY,0,0,pUpDiameter,pUpDiameter);
      popMatrix();
    }
    collisionCheck();
  }
  
  void collisionCheck(){
      if(dist(s.x,s.y,pUpX,pUpY) < (snakeSize/2 + pUpDiameter/2)){ // collision detection to see if powerup is obtained
        shown = false;
        if(type == 0){ // increases size
          snakeSize += 5;
          multiplier += .25;
        }else if(type == 1){ // decreases size
          snakeSize -= 5;
          multiplier -= .25;
        }else if(type == 2){ // increases speed
          snakeSpeed += 1;
          multiplier += .25;
        }else if(type == 3){ // decreases speed
          snakeSpeed -= 1;
          multiplier -= .25;
        }
        time2 = frameCount;
      }
  }
  
  void run(){ // combines necessary methods into one function
    showCheck();
    if(shown){
      display();
      if(frameCount - time1 == 300){
        shown = false;
      }
    }
  }
}

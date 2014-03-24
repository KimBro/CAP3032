class PowerUp{ // name

  // variables
  int showNumber; // stores a number that checks if powerup should fall
  boolean shown; // true is powerup has shown
  int pUpDiameter;
  float pUpX;
  float pUpY;
  int type;
  int time1, time2;
  
  // constructor
  PowerUp(){ // initialize
    shown = false;
    pUpDiameter = snakeSize;
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
        time1 = frameCount;
      }
    }
  }
  
  void display(){ // draws the powerup
    fill(0,0,255); // blue color
    stroke(0);
    pUpDiameter = snakeSize;
    ellipse(pUpX,pUpY,pUpDiameter,pUpDiameter);
    collisionCheck();
  }
  
  void collisionCheck(){
      if(dist(s.x,s.y,pUpX,pUpY) < (snakeSize/2 + pUpDiameter/2)){ // collision detection to see if powerup is obtained
        shown = false;
        if(type == 0){ // increases size
          snakeSize += 5;
        }else if(type == 1){ // decreases size
          if(snakeSize == 5){ // ensures that our snake doesn't have a size of zero
            snakeSize += 10;
          }
          snakeSize -= 5;
        }else if(type == 2){ // increases speed
          snakeSpeed += 1;
        }else if(type == 3){ // decreases speed
          snakeSpeed -= 1;
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

class Menu{ // name

  // attributes
  boolean changeB;
  PFont f;
  int centerX,centerY, scoreCap;
  float angle,progressLength;
  int currentLevel;
  
  // constructor
  Menu(){
    currentLevel = 0;
    changeB = true;
    centerX = 300;
    centerY = 300;
    f = loadFont("BacklashBRK-48.vlw");
    scoreCap = 5400;
  }
  
  // methods
  
  void run(){ // runs one instance at a time
    if(currentLevel == 0){
      menu();
    }else{
      level(currentLevel);
    }
  }
  
  void menu(){
    if(changeB){
      background.select(int(random(2)));
      changeB = false;
    }
    background.display();
    
    
    textFont(f,map(sin(angle),-1,1,44,52));
    textAlign(CENTER);
    fill(255);
    text("Play", centerX, centerY);
      
    if(mouseX > 250 && mouseX < 350 && mouseY > 255 && mouseY < 315){
      angle += .1;
      if(mousePressed){
        currentLevel = 1;
        reset();
      }
    }
  }
  
  void level(int x){
    if(changeB){
      background.select(x-1);
      score = 0;
      multiplier = 1;
      changeB = false;
    }
    background.display();

    textAlign(LEFT);
    textFont(f);
    text(score,5,40);
    
    if(progressLength < (scoreCap/10)){
      progressLength = (score/10);
      fill(0,255,255);
    }else{
      textAlign(CENTER);
      fill(255);
      text("Press shift to advance",centerX,centerY);
      progressLength = scoreCap/10;
      fill(255,50,50);
      if(keyPressed && keyCode == 16){
        if(x < 2){
          currentLevel++;
        }else{
          currentLevel = 0;
        }
        reset();
      }
    }
    
    rectMode(CORNER);
    rect(5,50,20,progressLength);
    
    if(!s.isCollided()){ // runs until collision
      p.run();
      s.display();
      a.run();
    }else{               // resets game upon collision
      currentLevel = 0;
      reset();
    }
  }
  
  void reset(){
    changeB = true;
    score = 0;
    multiplier = 1;
    progressLength = 0;
    angle = 0;
    snakeSize = 20;
    snakeSpeed = 3;
    s = new SnakeHead();
  }
}

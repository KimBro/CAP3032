
// Global Variables
int snakeSize = 20;
float snakeSpeed = 3;
SnakeHead s;
Apple a;
PowerUp p;
BackgroundManager background;
int score;

void setup(){
  size(600,600);
  rectMode(CENTER);
  s = new SnakeHead();
  a = new Apple();
  p = new PowerUp();
  background = new BackgroundManager(0);
}

void draw(){
  background.display();
  if(!s.isCollided()){ // runs until collision
    p.run();
    s.display();
    a.run();
  }else{               // resets game upon collision
    s = new SnakeHead();
    snakeSize = 20;
    snakeSpeed = 3;
  }
}



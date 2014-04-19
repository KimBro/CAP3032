
// Global Variables
  int snakeSize = 20;
  float snakeSpeed = 3;
  Menu menu;
  int score;
  float multiplier;
  SnakeHead s;
  Apple a;
  PowerUp p;
  BackgroundManager background;
  
void setup(){
  size(600,600);
  // setup
  rectMode(CENTER);
  s = new SnakeHead();
  a = new Apple();
  p = new PowerUp();
  menu = new Menu();
  background = new BackgroundManager();
}

void draw(){
  menu.run();
}



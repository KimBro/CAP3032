class BackgroundManager{ //name

  // attriubutes
  PImage background1;
  PImage background2;
  int selection;  // checks which background we will use
  
  // constructor
  BackgroundManager(){
  }
  
  // methods
  void select(int selection){ // checks the selection variable to set background
    if(selection == 0){
      background1 = loadImage("Meadow_1.png");
      background2 = loadImage("Meadow_2.png");
    }else if(selection == 1){
      background1 = loadImage("brick_1.png");
      background2 = loadImage("brick_1.png");
    }
  }
  
  void display(){  // displays background
    imageMode(CENTER);
    if(frameCount % 40 < 20){  // this if-else cycles through the 2 backgrounds for an animated effect
      image(background1,width/2,height/2);
    }else{
      image(background2,width/2,height/2);
    }
  }
}

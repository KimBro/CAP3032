class BackgroundManager{ //name

  // attriubutes
  PImage background1;
  PImage background2;
  int selection;  // checks which background we will use
  
  // constructor
  BackgroundManager(int selection){
    this.selection = selection;
    select();
  }
  
  // methods
  void select(){ // checks the selection variable to set background
    if(selection == 0){
      background1 = loadImage("Meadow_1.png");
      background2 = loadImage("Meadow_2.png");
    }
  }
  
  void display(){  // displays background
    if(frameCount % 40 < 20){  // this if-else cycles through the 2 backgrounds for an animated effect
      image(background1,0,0);
    }else{
      image(background2,0,0);
    }
  }
}

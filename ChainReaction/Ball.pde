class Ball {
  
  color c1, c2, c3;
  int xpos, ypos, xvel, yvel, size;
  String state; //"normal", "expand", "shrink", "dead"
  
  Ball() { //assign random values to vars
    c1 = (int)(Math.random() * 255 + 1);
    c2 = (int)(Math.random() * 255 + 1);
    c3 = (int)(Math.random() * 255 + 1);
    xpos = (int)(Math.random() * 600);
    ypos = (int)(Math.random() * 600);
    xvel = (int)(Math.random() * 10 - 5);
    yvel = (int)(Math.random() * 10 - 5);
    size = 20;
    state = "normal";
  }
  
  void display() { //set up
    fill(c1,c2,c3);
    ellipse( xpos, ypos, size, size );
  }
  
  void move() {
    if( state.equals( "normal" ) ) {
      xpos += xvel;
      if( xpos >= 600 || xpos <= 0 ) { // if the ball reaches boundary
        xvel *= -1; //reflect
      }
      ypos += yvel;
      if( ypos >= 600 || ypos <= 0 ) {
        yvel *= -1;
      }
    }
    else if( state.equals( "expand" ) ) {
      size++;
      if( size >= 150 ) { //maximum size
        state = "shrink";
      }
    }
    else if( state.equals( "shrink" ) ) {
      size--;
      if( size <= 0 ) {
        state = "dead";
      }
    }
    else if( state.equals( "dead" ) ) {
    }
  }
    
     
    
}
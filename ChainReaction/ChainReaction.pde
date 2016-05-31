Ball[] balls;
boolean reactionStarted;
Ball bomb;

void setup() {
  size( 600, 600 );
  reactionStarted = false;
  balls = new Ball[25];
  for( int i = 0; i < balls.length; i++ ) {
    balls[i] = new Ball(); //randomize position and velocity
  }
}

void draw() {
  background(255);
  for( int i = 0; i < balls.length; i++ ) {
    balls[i].display(); //reset graphics or animate
    balls[i].move();
    if ( mousePressed ) {
      bomb = new Ball( mouseX, mouseY );
      reactionStarted = true; // this enables separation of movement between bomb and regular balls; see below!
    }
    if ( reactionStarted == true && balls[i].state != "dead" && balls[i].state != "shrink" ) { // this is for chain reaction
      if ( (bomb.xpos - bomb.size/2 <= balls[i].xpos) && (bomb.xpos + bomb.size/2 >= balls[i].xpos)
        && (bomb.ypos - bomb.size/2 <= balls[i].ypos) && (bomb.ypos + bomb.size/2 >= balls[i].ypos) ) {
          balls[i].state = "expand";
        }  
    }
  }
  if ( reactionStarted == true ) { // this is for bomb animation
    bomb.display();
    bomb.move();
  }
}
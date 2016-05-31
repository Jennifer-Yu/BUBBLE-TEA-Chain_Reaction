Ball[] balls;
boolean reactionStarted;

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
    if( mousePressed && balls[i].xpos == mouseX && balls[i].ypos == mouseY ) {
      balls[i].state = "expand";
    }
    balls[i].move();
  }
  
}
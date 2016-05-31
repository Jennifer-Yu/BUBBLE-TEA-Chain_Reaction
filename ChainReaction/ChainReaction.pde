Ball[] balls;
boolean reactionStarted;
Ball bomb = new Ball();  


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
      bomb();
    }
    if (bomb.size > 100) {
      bomb.state = "shrink";
      bomb.size--;
    }
    bomb.move();
    if ( reactionStarted == true ) {
      bomb.display();
    }
  }
}

void bomb() {
  reactionStarted = true;
  bomb.xpos = mouseX;
  bomb.ypos = mouseY;
  bomb.display();
  bomb.state = "expand";
}

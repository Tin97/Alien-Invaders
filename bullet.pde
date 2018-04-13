final float BULLETHEIGHT = 25;
final float BULLETWIDTH = 5;
final int MAX_NUMBER_OF_BULLETS = 10;


class Bullet
{
  float x,y;
  int dy;
  boolean clicked = false;
  
  Bullet(float posX, int speed)
  {
    dy = speed;
    x = posX;
    y = SCREENY - MARGIN - PADDLEHEIGHT;
    clicked = true;
  }
  
  void draw()
  {
    rect(x, y, BULLETWIDTH, BULLETHEIGHT);
  }
  
  void move()
  {
    y -= dy;
  }
  
  boolean collide( Alien theAlien )
  {
    boolean isCollide = false;
    
    if ( ( y <= theAlien.y + alienImage.height ) && 
             ( y + BULLETHEIGHT >= theAlien.y ) &&
             ( x <= theAlien.x + alienImage.width ) &&
             ( x + BULLETWIDTH >= theAlien.x )  && 
             !theAlien.isExploded)
             {
               theAlien.explode();
               isCollide = true;
             }
     return isCollide;
  }
}
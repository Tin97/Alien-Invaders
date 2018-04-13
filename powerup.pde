class Powerup
{
  float x;
  float y;
  PImage pImage;
  
  Powerup ( float xpos, float ypos )
  {
    x = xpos;
    y = ypos;
    pImage = loadImage("powerup.png");
  }
  
  void draw()
  {
    image(pImage, x, y);
  }
  
  boolean collide( Bullet theBullet )
  {
    boolean isCollide = false;
    
    if ( ( theBullet.y <= y + pImage.height ) && 
             ( theBullet.y + BULLETHEIGHT >= y ) &&
             ( theBullet.x <= x + pImage.width ) &&
             ( theBullet.x + BULLETWIDTH >= x ) )
             {
               isCollide = true;
             }
             
    return isCollide;
  }
}
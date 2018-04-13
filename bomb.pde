
final int MAX_NUMBER_OF_BOMBS = 10;

class Bomb
{
  float x;
  float y;
  PImage bombImage;
  
  Bomb( float xpos, float ypos )
  {
    x = xpos;
    y = ypos;
    bombImage = loadImage("bomb.png");
  }
  
  void move()
  {
    y += 3;
  }
  
  void draw()
  {
    image(bombImage, x, y);
  }
  
  boolean offScreen()
  {
    boolean isOff = false;
    
    if ( y > SCREENY )
    {
      isOff = true;
    }
    
    return isOff;
  }
  
  boolean collide(Player thePlayer)
  {
    boolean isCollide = false;
    
    if ( ( y <= thePlayer.ypos + PADDLEHEIGHT ) && 
             ( y + bombImage.height >= thePlayer.ypos ) &&
             ( x <= thePlayer.xpos + PADDLEWIDTH ) &&
             ( x + bombImage.width >= thePlayer.xpos ) )
             {
               isCollide = true;
             }
             
    return isCollide;
  }
}
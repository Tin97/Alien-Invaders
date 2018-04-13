final int SHIELDWIDTH = 100;
final int SHIELDHEIGHT = 25;
final int FIRSTX = 75;
final int SECONDX = 250;
final int THIRDX = 425;
final int YPOS = SCREENY - ( MARGIN + PADDLEHEIGHT + 50);

class Shield
{
  boolean isDestroyed;
  int count;
  int x;
  
  Shield()
  {
    isDestroyed = false;
    count = 5;
  }
  
  void draw( int xpos )
  {
    x = xpos;
    
    if ( count <= 0 )
    {
      isDestroyed = true;
    }
    
    if ( !isDestroyed )
    {
      fill(255);
      rect(xpos, YPOS, SHIELDWIDTH, SHIELDHEIGHT);
    } 
  }
  
  boolean collideBullet ( Bullet theBullet)
  {
    boolean isCollide = false;
    
    if ( ( YPOS <= theBullet.y + BULLETHEIGHT ) && 
             ( YPOS + SHIELDHEIGHT >= theBullet.y ) &&
             ( x <= theBullet.x + BULLETWIDTH ) &&
             ( x + SHIELDWIDTH >= theBullet.x )  && 
             !isDestroyed)
             {
               count--;
               isCollide = true;
             }
             
    return isCollide;
  }
  
  boolean collideBomb ( Bomb theBomb)
  {
    boolean isCollide = false;
    
    if ( ( YPOS <= theBomb.y + 15 ) && 
             ( YPOS + SHIELDHEIGHT >= theBomb.y ) &&
             ( x <= theBomb.x + 15 ) &&
             ( x + SHIELDWIDTH >= theBomb.x )  && 
             !isDestroyed)
             {
               count--;
               isCollide = true;
             }
             
    return isCollide;
  }
  
}
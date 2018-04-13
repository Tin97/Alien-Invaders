final int PADDLEWIDTH = 100;
final int PADDLEHEIGHT = 25;
final int MARGIN = 10;

class Player 
{
  int xpos;
  int ypos;
  
  Player ()
  {
    xpos = SCREENX/2;
    ypos = SCREENY - MARGIN - PADDLEHEIGHT;
  }
  
  void move( int x )
  {
    
    if ( x > SCREENX - PADDLEWIDTH )
    {
      xpos = SCREENX - PADDLEWIDTH;
    }
    
    else if ( x < 0 )
    {
      xpos = 0;
    }
    
    else
    {
      xpos = x;
    }
  }
  
  void draw()
  {
    fill(255);
    rect(xpos, ypos, PADDLEWIDTH, PADDLEHEIGHT);
  }
}
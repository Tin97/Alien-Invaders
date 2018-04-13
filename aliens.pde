final int INITIALX = 10;
final int INITIALY = 20;
final int SCREENX = 600;
final int SCREENY = 400;
final int NUMBER_OF_ALIENS = 10;

class Alien
{
  int timeExploded;
  float x;
  float y;
  float dx;
  float dy;
  boolean isExploded;
  float y1;
 
 Alien(int xpos, int ypos)
 {
   x = xpos;
   y = ypos;
   dx = 1;
   dy = 1;
   isExploded = false;
   y1 = INITIALY;
 }
  
 void move()
 {
   if ( x + 30 <= SCREENX - INITIALX && x >= INITIALX )
   {
     x += dx;
   }
   
   else
   {
     y += dy;
     if ( y % 30 == INITIALY )
     {
       dx = -dx * 1.3;
       x += dx;
     }
   }
 }
 
 void moveSin()
 {
   if ( x + 30 <= SCREENX - INITIALX && x >= INITIALX )
   {
     x += dx;
     y = y1 + 10 * sin ( x / 8 );
   }
   
   else
   {
     y1 += dy;
     y = y1;
     if ( y % 30 == INITIALY )
     {
       dx = -dx * 1.3;
       x += dx;
     }
   }
 }
 
 void explode()
 {
   isExploded = true;
 }
  
 void draw(PImage alienImage, PImage explode)
 {
   if ( !isExploded )
   {
     image(alienImage, x, y);
   }
   
   else
   {
     if ( timeExploded < 25 )
     {
       image(explode, x, y);
       timeExploded++;
     }
   }
 }
 
 void drawSin(PImage alienImage, PImage explode)
 {
   if ( !isExploded )
   {
     image(alienImage, x, y);
   }
   
   else
   {
     if ( timeExploded < 25 )
     {
       image(explode, x, y);
       timeExploded++;
     }
   }
 }
}
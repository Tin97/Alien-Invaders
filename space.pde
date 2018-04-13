Alien theAlien[];
Player thePlayer;
Bullet theBullet[];
Bomb theBomb[];
PImage alienImage;
PImage explode;
PImage alienImage1;
boolean[] bullets;
Powerup power[];
boolean[] powers;
int speed;
boolean[] bombs;
int randomNum;
boolean isBoom;
int time;
Shield firstShield;
Shield secondShield;
Shield thirdShield;

void settings()
{
  size(SCREENX, SCREENY);
}

void setup()
{
  time = 0;
  isBoom = false;
  speed = 3;
  firstShield = new Shield();
  secondShield = new Shield();
  thirdShield = new Shield();
  bombs = new boolean[MAX_NUMBER_OF_BOMBS];
  bullets = new boolean[MAX_NUMBER_OF_BULLETS];
  powers = new boolean[5];
  for ( int i = 0; i < bullets.length ; i++ )
  {
    bullets[i] = false;
    powers[i/2] = false;
    bombs[i] = false;
  }
  power = new Powerup[5];
  thePlayer = new Player();
  theBomb = new Bomb[MAX_NUMBER_OF_BOMBS];
  theAlien = new Alien[NUMBER_OF_ALIENS];
  theBullet = new Bullet[MAX_NUMBER_OF_BULLETS];
  alienImage = loadImage("spacer.GIF");
  explode = loadImage("exploding.GIF");
  alienImage1 = loadImage("spacer1.GIF");
  init_array(theAlien);
  
  fill(255);
  PFont  myFont  =  loadFont("AgencyFB-Reg-48.vlw");  
  textFont(myFont); 
}

void draw()
{
  time++;
  isBoom = false;
  background(0);
  for ( int i = 0 ; i < bullets.length ; i++ )
  {
    if ( bullets[i] == true )
    {
      for ( int j = 0; j < theAlien.length ; j++ )
      {
        if ( theBullet[i].collide(theAlien[j]) && j % 2 == 1 )
        {
          power[j/2] = new Powerup(theAlien[j].x, theAlien[j].y + 2 * alienImage.height);
          powers[j/2] = true;
        }
        
        if ( powers[j/2] == true )
        {
          if ( power[j/2].collide( theBullet[i] ) )
          {
            powers[j/2] = false;
            speed += 2;
          }
        }
      }
    }
  }
  
  if ( time % 150 == 0 )
  {
    while ( !isBoom )
    {
      randomNum = (int)random(10);
      if ( bombs[randomNum] == false && !theAlien[randomNum].isExploded )
      {
        isBoom = true;
        bombs[randomNum] = true;
        theBomb[randomNum] = new Bomb( theAlien[randomNum].x, theAlien[randomNum].y );
      }
    }
  }
  
  for ( int i = 0 ; i < bombs.length ; i++ )
  {
    if ( bombs[i] == true )
    {
      if ( theBomb[i].collide(thePlayer) )
      { 
        text("GAME OVER!!", SCREENX / 2 - 50, SCREENY / 2);
        noLoop();
      }
    }
  }
  
  firstShield.draw( FIRSTX );
  secondShield.draw( SECONDX );
  thirdShield.draw( THIRDX );
  
  for ( int i = 0 ; i < 10 ; i++ )
  {
    if ( bullets[i] )
    {
      if ( firstShield.collideBullet(theBullet[i]) || thirdShield.collideBullet(theBullet[i])
          || secondShield.collideBullet(theBullet[i]) )
          {
            bullets[i] = false;
          }
    }
    if ( bombs[i] )
    {
      if ( firstShield.collideBomb(theBomb[i]) || thirdShield.collideBomb(theBomb[i])
          || secondShield.collideBomb(theBomb[i]) )
          {
            bombs[i] = false;
          }
    }
  }
  
  
  boolean isAny = false;
  
  for ( int i = 0 ; i < theAlien.length ; i++ )
  {
    if ( !theAlien[i].isExploded )
    {
      isAny = true;
    }
  }
  
  if ( !isAny )
  {
    text("YOU WIN!!", SCREENX / 2 - 50, SCREENY / 2);
    noLoop();
  }
  
  thePlayer.move(mouseX - PADDLEWIDTH / 2);
  moveArray(theAlien, theBullet);
  drawArray(theAlien, theBullet);
  thePlayer.draw();
}

void init_array(Alien myAlien[])
{
  for ( int i = 0 ; i < myAlien.length ; i++ )
  {
    myAlien[i] = new Alien(INITIALX + i * 60, INITIALY);
  }
}

void mousePressed()
{
  for ( int i = 0 ; i < bullets.length ; i++ )
  {
    if ( bullets[i] == false )
    {
      theBullet[i] = new Bullet(thePlayer.xpos + PADDLEWIDTH / 2, speed);
      bullets[i] = true;
      break;
    }
  }
}

void drawArray(Alien myAlien[], Bullet theBullet[])
{
  for ( int i = 0 ; i < myAlien.length ; i++ )
  {
    if ( i % 2 == 0 )
    {
      myAlien[i].draw(alienImage, explode);
    }
    else
    {
      myAlien[i].drawSin(alienImage1, explode);
    }
    
    if ( bullets[i] == true )
    {
      theBullet[i].draw();
      
      if ( theBullet[i].y < 0 )
      {
        bullets[i] = false;
      }
    }
    
    if ( powers[i/2] == true )
    {
      power[i/2].draw();
    }
    
    if ( bombs[i] == true )
    {
      theBomb[i].draw();
      
      if ( theBomb[i].offScreen() )
      {
        bombs[i] = false;
      }
    }
  }
}

void moveArray(Alien myAlien[], Bullet theBullet[])
{
  for ( int i = 0 ; i < myAlien.length ; i++ )
  {
    if ( i % 2 == 0 )
    {
      myAlien[i].move();
    }
    else
    {
      myAlien[i].moveSin();
    }
    
    if ( bullets[i] == true )
    {
      theBullet[i].move();
    }
    
    if ( bombs[i] == true )
    {
      theBomb[i].move();
    }
  }
}
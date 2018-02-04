

BoxSprite box1, box2;
MovingDot dot;

int centarX, centarY;
int c = 0;

void setup() {
  size(360, 360);
  background(255, 255, 0);
  
  box1 = new BoxSprite();
  box2 = new BoxSprite();
  dot = new MovingDot(width/2, height/2);
  
  frameRate(200);
}

void draw() {
  background(255, 255, 0);
  
  /*prikazivanje brojača*/
  textSize(32);
  fill(0, 102, 153);
  text(c, 10, 30); 
  
 
  /*najbitnije update funkcije*/
  dot.dotUpdate();
  box1.boxUpdate();
  box2.boxUpdate();

  /*new Thread(new Runnable() {
    @Override
    public void run() {
       //println("run()"); //treba skuziti kako fino updejtati ekran
    }
  }).start();*/
}


/*klasa koja predstavlja točku*/
class MovingDot{
  public int x, y;
  
  /*konstruktor*/
  public MovingDot(int x, int y)
  {
    this.x = x;
    this.y = y;
  }
  
  /*ponovno crtanje točke*/
  public void dotUpdate()
  {
    fill(255, 255, 255);
    strokeWeight(1);
    ellipse(mouseX, mouseY, 10, 10);
  } 
}


/*klasa kooja presdstavlja kvadrat*/
class BoxSprite{
  private int x, y;

 /*konstruktor*/
  public BoxSprite()
  {
    this.x = (int) random(20, width - 30);
    this.y = -30;
  }
  
  /*funkcija koja svaki put nanovo crta kvadrat*/
  private void boxUpdate()
  {
    fill(255, 255, 255);
    strokeWeight(1);
    rect(this.x, this.y, 24, 24, 7); 
    
    /*provjerevanje bitnih funkcija*/
    isCollision();
    boxMoveY();
    newRandomPath();
  }
  
  /*postavlja x za +1*/
  public void boxMoveX()
  {
    this.x++;
  }
  
  /*postavlja y za +1*/
  public void boxMoveY()
  {
    this.y++;
  }
  
  /*ako je došlo do sudara*/
  private void isCollision()
  {
    /*vizualizacija if petlje*/
    fill(255, 255, 255);
    strokeWeight(1);
    ellipse(this.x, this.y, 2, 2);
    ellipse(this.x + 24, this.y, 2, 2);
    
    /*this.x je gore lijevi čošak kvadrata, this.x + 24 je desni gore čošak*/
    if((mouseX > this.x && mouseX < this.x + 24) && (mouseY > this.y && mouseY < this.y + 24))
    {   
      this.y = height + 26;
      c++;
    }
  }
  
  /*kad kvadrat izađe iz okvira, primjeni mu y koordinatu i rendom podesi x koordinatu, da se ponovno pokaze*/
  private void newRandomPath()
  {
    if(this.y > height + 25){
      this.y = -30;
      this.x = (int) random(10, width - 30);
    }
  }
}

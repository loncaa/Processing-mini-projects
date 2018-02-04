/*klasa kooja presdstavlja kvadrat*/
class BoxSprite{
  private int x, y;
  private int dx, dy; //dotx i doty koordinate
  private int windowWidth;

 /*konstruktor*/
  public BoxSprite(int windowWidth)
  {
    this.windowWidth = windowWidth;
    this.x = (int) random(20, windowWidth - 30);
    this.y = -30;
  }
  
  /*funkcija koja svaki put nanovo crta kvadrat*/
  private void boxUpdate(int dotX, int dotY)
  {
    //ako je moguce poboljšati izmjenu podataka između klasa
    dx = dotX;
    dy = dotY;
    
    /*vizualizacija if petlje iz iscollui*/
    fill(255, 255, 255);
    strokeWeight(1);
    ellipse(this.x, this.y, 2, 2);
    ellipse(this.x + 24, this.y, 2, 2);
    
    fill(255, 255, 255);
    strokeWeight(1);
    rect(this.x, this.y, 24, 24, 7); 
    
    /*provjerevanje bitnih funkcija*/
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
  private int isCollision()
  {
    
    /*this.x je gore lijevi čošak kvadrata, this.x + 24 je desni gore čošak*/
    if((this.dx > this.x && this.dx < this.x + 24) && (this.dy > this.y && this.dy < this.y + 24))
    {   
      this.y = height + 26;
      return 1;
    }
    return 0;
  }
  
  /*kad kvadrat izađe iz okvira, primjeni mu y koordinatu i rendom podesi x koordinatu, da se ponovno pokaze*/
  private void newRandomPath()
  {
    if(this.y > height + 25){
      this.y = -30;
      this.x = (int) random(10, windowWidth - 30);
    }
  }
}

/*klasa koja predstavlja točku*/
class DotSprite{
  private int x, y;
  
  /*konstruktor*/
  public DotSprite(int x, int y)
  {
    this.x = x;
    this.y = y;
  }
  
  /*ponovno crtanje točke*/
  public void dotUpdate(int x, int y)
  {
    this.x = x;
    this.y = y;
    
    fill(255, 255, 255);
    strokeWeight(1);
    ellipse(x, y, 10, 10);
  } 
  
  public int getX()
  {
    return this.x;
  }
  
  public int getY()
  {
    return this.y;
  }
}

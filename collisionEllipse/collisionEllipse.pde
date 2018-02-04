/**
 * Loop. 
 * 
 * The loop() function causes draw() to execute
 * continuously. If noLoop is called in setup()
 * the draw() is only executed once. In this example
 * click the mouse to execute loop(), which will
 * cause the draw() the execute continuously. 
 */

float y = 100;
 
// The statements in the setup() function 
// run once when the program begins
void setup() {
  size(640, 360);  // Size should be the first statement
  stroke(255);     // Set stroke color to white
  noLoop();
  
  y = height * 0.5;
}

void draw() { 
  background(0);
  line(0, y, width, y); 
  
  y = y - 1; 
  if (y < 0) { 
    y = height; 
  } 
} 

void mousePressed() {
  loop();
}

class EllipseClass
{
  private int x, y, radx, rady;
  
  EllipseClass(int x, int y, int radx, int rady)
  {
    this.x = x;
    this.y = y;
    this.radx = radx;
    this.rady = rady;
    
    ellipse(x, y, radx, rady);  
  }
  
  public void ellipseUpdate()
  {
    ellipse(this.x, this.y, this.radx, this.rady);  
  }
  
  public void moveUpdate(int x, int y)
  {
    this.x = x;
    this.y = y;
  }
  
  public void setX(int x) this.x = x;
  public void setY(int y) this.y = y;
  
  public int getX() return this.x;
  public int getY(int y) return this.y;

}

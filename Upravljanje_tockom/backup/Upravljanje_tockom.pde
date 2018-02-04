import gab.opencv.*;
import processing.video.*;
import java.awt.Rectangle;

BoxSprite box1, box2;
DotSprite dot;

OpenCV opencv;
Capture cam;

int c = 0;
int lowerb = 110, upperb = 150;
ArrayList<Contour> contours;

void setup() {
  size(640, 480);
  opencv = new OpenCV(this, 640, 480);
  cam = new Capture(this, 640, 480);
  
  /*inicializacija*/
  dot = new DotSprite(0,0);
  box1 = new BoxSprite();
  box2 = new BoxSprite();

  contours = new ArrayList<Contour>();
  cam.start();
}

void draw() {
  /*dohvačanje slike*/
  opencv.loadImage(cam);
  image(cam, 0 , 0);
  
  /*obrada slike*/
  /*potrebno je pronaci bolji nacin za pracenje objekta*/
  opencv.useColor(HSB);
  opencv.setGray(opencv.getH().clone());
  opencv.inRange(lowerb, upperb);
  image(opencv.getOutput(), 3*width/4, 3*height/4, width/4, height/4);
  
  /*ptonađi najvecu konturu*/
  contours = opencv.findContours(true, true);
  if (contours.size() > 0) {
    Contour biggestContour = contours.get(0);
    Rectangle r = biggestContour.getBoundingBox();
   
    /*uodejtaj koordinate docke objekta*/
    dot.dotUpdate(r.x + r.width/2, r.y + r.height/2);
  }
  
  /*prikazivanje brojača*/
  textSize(32);
  fill(0, 102, 153);
  text(c, 10, 30); 
  
  /*updejtaj kvadrat i pošaljji mu koordainte 
    tocke koje ce kasnije provjeriti za koliziju*/
  box1.boxUpdate(dot.getX(), dot.getY() );
  c += box1.isCollision();
  
  box2.boxUpdate(dot.getX(), dot.getY());
  c += box2.isCollision();
}

void captureEvent(Capture c) {
  c.read();
}

/*podešavanje inRange funkcije pomocu slova QWAS*/
void keyPressed() {
  if(char(keyCode) == 'Q')
    lowerb += 2;
  else if(char(keyCode) == 'W')
    lowerb -= 2;
    
 if(char(keyCode) == 'A')
    upperb += 2;
  else if(char(keyCode) == 'S')
    upperb -= 2;
}





import processing.serial.*;
import gab.opencv.*;
import processing.video.*;
import java.awt.*;

//
Capture video;
OpenCV opencv;

//arduino varijable
Serial arduinoPort;
int[] send = new int[2]; //podatak koji saljemo mikroprocesoru (2 byte -> 2 signala)

//varijabla za lica
Rectangle[] faces;

  int centerX;
  int centerY;
void setup() {
  size(640, 480);
  centerX = width/4;
  centerY = height/4;
  
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  
  println(Serial.list());
  String portName = Serial.list()[0]; 
  arduinoPort = new Serial(this, portName, 9600); 
  
  send[0] = 90;
  send[1] = 90;
  arduinoPort.write(send[0] + ":" + send[1] + ":");

  video.start();
}

int movePositionX, movePositionY;

void draw() {
  scale(2);
  opencv.loadImage(video);
  image(video, 0, 0 );
  
  noFill();
  stroke(255, 0, 0);
  strokeWeight(2);
   
  try{

    faces = opencv.detect();
    int faceX = (faces[0].x + faces[0].width/2);
    int faceY = (faces[0].y + faces[0].height/2);
    
    
    
    movePositionX = 90 * (faceX / 2 - 80) / 80;
    movePositionY = 90 * (faceY / 2 - 60) / 60;
    
    //println(faceX +" " + faceY + " " +movePositionX + " " + movePositionY);
    
    println(movePositionX + ":" + movePositionY + ":");
    
    if(isInside(faceX, faceY))
    {
      send[0] += 0;
      send[1] += 0;
      ellipse(faceX, faceY, 1, 1);
    }
    else
    {
       send[0] += (movePositionX);
       send[1] += (movePositionY);

      if(send[0] >= 180 )
      {
        send[0] = 180;
      }
      else if( send[0] <=0)
      {
        send[0] = 0;
      }
      if(send[1] >= 180)
      {
        send[1] = 180;
      }
     else if(send[1] <=0)
      {
        send[1] = 0;
      }
      
        //println(send[0] + ":"+ send[1] + ":");
        arduinoPort.write(send[0] + ":"+ send[1] + ":");
      } 
 
      delay(33);
      ellipse(faceX, faceY, 1, 1);
  }catch(Exception e)
  {
    //println("No faces found!");
  }
    
  stroke(255, 255, 255);
  strokeWeight(1);
  rect(centerX - 25, centerY - 25, 50, 50);
  ellipse(centerX, centerY, 1, 1);
}

void captureEvent(Capture c) {
  c.read();
}

boolean isInside(int mousex, int mousey)
{
  if((mousex > width/4 - 25 && mousex < width/4 + 25) && (mousey > height/4 - 25 && mousey < height/4 + 25))
  {   
    //println("Inside box.");
    return true;
  }
  else return false;
}

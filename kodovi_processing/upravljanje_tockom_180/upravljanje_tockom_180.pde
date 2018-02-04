import processing.serial.*;

Serial arduinoPort;
int[] send = new int[2];

void setup() {
  size(360, 360);
  background(255, 255, 0);
  
  mouseX = width/2;
  mouseY = height/2;

  //String portName = Serial.list()[0];
  //arduinoPort = new Serial(this,portName, 9600);
  
  send[0] = 90;
  send[1] = 90;
  //arduinoPort.write(send[0] + ":" + send[1] + ":");
}

int servoPositionX;
int servoPositionY;
boolean mouseClick = false;

void draw() {

  servoPositionX = mouseX / 2;
  servoPositionY = mouseY / 2;
  
  if(isInside(mouseX, mouseY))
  {
    send[0] = 90;
    send[1] = 90;
  }
  else
  {
    send[0] = (servoPositionX);
    send[1] = (servoPositionY);
  }
  if(mouseClick){
   // arduinoPort.write(send[0] + ":" + send[1] + ":");
    delay(33);
  }
  
  
  background(255, 255, 0);
  
  fill(255, 255, 255);
  strokeWeight(1);
  rect(width/2 - 25, height/2 - 25, 50, 50);
  
  fill(255, 0, 0);
  ellipse(mouseX, mouseY, 10, 10);
}

boolean isInside(int mousex, int mousey)
{
  if((mousex > width/2 - 25 && mousex < width/2 + 25) && (mousey > height/2 - 25 && mousey < height/2 + 25))
  {   
    return true;
  }
  else return false;
}

void mouseClicked()
{
  mouseClick = !mouseClick;
}

import controlP5.*;
import processing.serial.*;

ControlP5 motor;

// EL puerto Serial
Serial myPort;

int nif = 6;    //numero de arreglo de imagenes de fondo
PImage fondo[] = new PImage[nif];
//int myColor = color(0,0,0);

//Varaialbes de los sliders
int mano = 127;
int brazo = 127;
int antebrazo = 127;
int hombro = 127;
int giro = 127;
//Variables posición de imagen fondo brazo
int posX = 50;
int posY = 100;
//rango de valores de sliders para actvar motores
int minslide = 100;
int maxslide = 150;

//Slider abc;

void setup()
{
  size(displayWidth,displayHeight);
  noStroke();
  
  for(int i = 0; i< nif; i++)
 {
   fondo[i] = loadImage("fondo" + i + ".png");
 }
 motor = new ControlP5(this);
 
  // create another slider with tick marks, now without
  // default value, the initial value will be set according to
  // the value of variable sliderTicks2 then.
  motor.addSlider("mano")
     .setPosition(800,400)
     .setSize(30,150)
     .setRange(0,255)
     .setNumberOfTickMarks(5)
     ;
     
  motor.addSlider("brazo")
     .setPosition(875,400)
     .setSize(30,150)
     .setRange(0,255)
     .setNumberOfTickMarks(5)
     ;
     
  motor.addSlider("antebrazo")
     .setPosition(950,400)
     .setSize(30,150)
     .setRange(0,255)
     .setNumberOfTickMarks(5)
     ;
     
  motor.addSlider("hombro")
     .setPosition(1025,400)
     .setSize(30,150)
     .setRange(0,255)
     .setNumberOfTickMarks(5)
     ;
     
  motor.addSlider("giro")
     .setPosition(1100,400)
     .setSize(30,150)
     .setRange(0,255)
     .setNumberOfTickMarks(5)
     ;
     
     
  printArray(Serial.list());
// La linea siguiente se comenta para que el programa corra sin Arduino //
  myPort = new Serial(this, Serial.list()[3], 9600);     
      
 
}

void draw()
{
  background(0);
  texto();
  if(mano < minslide || mano > maxslide )
  {
    brazoimage(1,posX,posY);
    if(mano < minslide )
    {
     myPort.write('W');
     delay(500);
    }
    else
    {
      myPort.write('Q');
      delay(500);
    }
  }
  else if(brazo < minslide || brazo > maxslide )
  {
    brazoimage(2,posX,posY);
    if(brazo<minslide)
    {
     myPort.write('R');
     delay(50);
    }
    else
    {
      myPort.write('E');
      delay(50);
    }
  }
  else if(antebrazo < minslide || antebrazo > maxslide )
  {
    brazoimage(3,posX,posY);
    if(antebrazo<minslide)
    {
     myPort.write('Y');
     delay(50);
    }
    else
    {
      myPort.write('T');
      delay(50);
    }
  }
  //rutina de hombro 
  else if(hombro < minslide || hombro > maxslide )
  {
    brazoimage(4,posX,posY);
    if(hombro<minslide)
    {
      //hombro abajo 
     myPort.write('U');
     delay(50);
    }
    else
    {
      //hombro arriba
      myPort.write('I');
      delay(50);
    }
  }
  else if(giro < minslide || giro > maxslide )
  {
    brazoimage(5,posX,posY);
    if(giro<minslide)
    {
     myPort.write('P');
     delay(50);
    }
    else
    {
      myPort.write('O');
      delay(50);
    }
  }
  else{
    brazoimage(0,posX,posY);
  }
  
}

/*void slider(float theColor) {
  myColor = color(theColor);
  println("a slider event. setting background to "+theColor);
}*/

void brazoimage(int num, int brazoX, int brazoY)
{
  image(fondo[num],brazoX,brazoY);
}

void texto()
{
  textSize(40);
  fill(155, 200, 255);
  text("Control", 875,375);
  textSize(35);
  fill(155, 255, 175);
  text("Brazo", 275,630);
}
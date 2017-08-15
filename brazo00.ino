/*brazo00.ino
 * Control de motoreductores
 */

#define ENA1 13
#define D1 12
#define I1 11
#define ENA2 10
#define D2 8
#define I2 9
#define ENA3 7
#define D3 6
#define I3 5
#define ENA4 4
#define D4 2
#define I4 3
#define ENA5 17
#define D5 18
#define I5 19



int t1, t2;
char car;


void setup()
{
  for(int i=2; i < 14; i++)
  {
    pinMode(i,OUTPUT);
  }
  for(int i=17; i < 20; i++)
  {
    pinMode(i,OUTPUT);
  }
  for(int i=2; i < 14; i++)
  {
    digitalWrite(i,LOW);
  }
  for(int i=17; i < 20; i++)
  {
    digitalWrite(i,LOW);
  }
  Serial.begin(9600);
  t1=50;
  Serial.print("Control Brazo Pet");
  
}

void loop()
{
  if(Serial.available()>0)
  {
    car = Serial.read();
    ///////-- Motor 1 (Tenaza) --//////
    if(car == 'q' || car == 'Q')
    {
      derecha_on(ENA1,D1,I1);
      delay(t1);
      derecha_off(ENA1,D1,I1);
    }
    if(car == 'w' || car == 'W')
    {
      izquierda_on(ENA1,D1,I1);
      delay(t1);
      izquierda_off(ENA1,D1,I1);
    }
    ///////-- Motor 2 (Mano) --//////
    if(car == 'e' || car == 'E')
    {
      derecha_on(ENA2,D2,I2);
      delay(t1);
      derecha_off(ENA2,D2,I2);
    }
    if(car == 'r' || car == 'R')
    {
      izquierda_on(ENA2,D2,I2);
      delay(t1);
      izquierda_off(ENA2,D2,I2);
    }
    ///////-- Motor 3 (Antebrazo) --//////
    if(car == 't' || car == 'T')
    {
      derecha_on(ENA3,D3,I3);
      delay(t1);
      derecha_off(ENA3,D3,I3);
    }
    if(car == 'y' || car == 'Y')
    {
      izquierda_on(ENA3,D3,I3);
      delay(t1);
      izquierda_off(ENA3,D3,I3);
    }
    ///////-- Motor 4 (Codo) --//////
    if(car == 'u' || car == 'U')
    {
      derecha_on(ENA4,D4,I4);
      delay(t1);
      derecha_off(ENA4,D4,I4);
    }
    if(car == 'i' || car == 'I')
    {
      izquierda_on(ENA4,D4,I4);
      delay(t1);
      izquierda_off(ENA4,D4,I4);
    }
    ///////-- Motor 5 (Tenaza) --//////
    if(car == 'o' || car == 'O')
    {
      derecha_on(ENA5,D5,I5);
      delay(t1);
      derecha_off(ENA5,D5,I5);
    }
    if(car == 'p' || car == 'P')
    {
      izquierda_on(ENA5,D5,I5);
      delay(t1);
      izquierda_off(ENA5,D5,I5);
    }
    
  }
}

void derecha_on(int ENA, int D, int I)
{
  digitalWrite(ENA,HIGH);
  digitalWrite(D,HIGH);
  digitalWrite(I,LOW);
}
void derecha_off(int ENA, int D, int I)
{
  digitalWrite(ENA,LOW);
  digitalWrite(D,LOW);
  digitalWrite(I,LOW);
}
void izquierda_on(int ENA, int D, int I)
{
  digitalWrite(ENA,HIGH);
  digitalWrite(D,LOW);
  digitalWrite(I,HIGH);
}
void izquierda_off(int ENA, int D, int I)
{
  digitalWrite(ENA,LOW);
  digitalWrite(D,LOW);
  digitalWrite(I,LOW);
}

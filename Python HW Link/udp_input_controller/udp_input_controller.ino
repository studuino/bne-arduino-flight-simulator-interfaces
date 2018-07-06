/* 
Heavily based on 
https://github.com/calltherain/ArduinoUSBJoystick

Instead of sending to USB - sends over UDP

Mega2560 R3, 
digitalPin 22~ 37 used as row0 ~ row 15, 
digital pin 38~53 used as column 0 ~ 15,
it's a 16 * 16  matrix, 



row 0, 1, 2 ,3 will be used to support 32 rotary encoder
row 4, 5 will be used to support 16 On - off - On toggle switches, 
note: this application will make the On-off-on toggle switch generate a button push signal when toggle from On to off, 
but  this is not implemented yet
for normal on- on toggle switch or if you don't need this feature then just plug the switch to push button area
row 6~15 will be used to support push button or normal on-on toggle switch

If using 5100 series Ethernet Shield may need to remove C3 as per 
https://forum.arduino.cc/index.php?topic=99880.15

*/

#define NUM_BUTTONS 256
#define NUM_AXES  8        // 8 axes, X, Y, Z, etc
#define STATUS_LED_PORT 7
#define FLASH_TIME 100

// 
struct joyReport_t {
  unsigned int button[NUM_BUTTONS]; // 1 Button per byte - was originally one bit per byte - but we have plenty of storage space
};

const unsigned int ScanDelay = 40;

joyReport_t joyReport;
joyReport_t prevjoyReport;



unsigned long prevLEDTransition = millis();
int cButtonID[16];

//unsigned long loopTime;

void setup() 
{
  
  // Output Port for Status Monitoring
  pinMode(STATUS_LED_PORT, OUTPUT);
  digitalWrite(STATUS_LED_PORT, LOW);
  
  
  for( int portId = 22; portId < 38; portId ++ )
  {
    pinMode( portId, OUTPUT );
  }
  for( int portId = 38; portId < 54; portId ++ )
  {
    pinMode( portId, INPUT_PULLUP);
  }


  Serial.begin(115200);
  Serial.println("Setup");
  delay(200);



  for (unsigned int ind=0; ind < NUM_BUTTONS ; ind++) {
    joyReport.button[ind] = 0;
  }
  

}





void loop() 
{


  Serial.println("Main Loop"); 
  for (unsigned int ind=0; ind < NUM_BUTTONS ; ind++) {
    joyReport.button[ind] = 0;
  }

  
  //turn off all rows first
  for ( int rowid = 0; rowid < 16; rowid ++ )
  {
    //turn on the current row
    // why differentiate? rows
    
    if (rowid < 8)
    {
      // Shift 1c right 
      PORTA = ~(0x1 << rowid);
      PORTC =  0xFF;
    }
    else
    {
      // Port A high? Shift 1 right
      Serial.print(".");
      Serial.print(rowid);
      Serial.print("-");
      PORTA = 0xFF;
      Serial.println(15 - rowid);
      PORTC = ~(0x1 << (15 - rowid) );
    }


    
    //we must have such a delay so the digital pin output can go LOW steadily, 
    //without this delay, the row PIN will not 100% at LOW during yet,
    //so check the first column pin's value will return incorrect result.
    delayMicroseconds(ScanDelay);

    int colResult[16];
    // Reading upper pins
    //pin 38, PD7
    colResult[0] = (PIND & B10000000)== 0 ? 1 : 0;
    //pin 39, PG2
    colResult[1] = (PING & B00000100)== 0 ? 1 : 0;
    //pin 40, PG1
    colResult[2] = (PING & B00000010)== 0 ? 1 : 0;
    //pin 41, PG0
    colResult[3] = (PING & B00000001)== 0 ? 1 : 0;

    //pin 42, PL7
    colResult[4] = (PINL & B10000000)== 0 ? 1 : 0;
    //pin 43, PL6
    colResult[5] = (PINL & B01000000)== 0 ? 1 : 0;
    //pin 44, PL5
    colResult[6] = (PINL & B00100000)== 0 ? 1 : 0;
    //pin 45, PL4
    colResult[7] = (PINL & B00010000)== 0 ? 1 : 0;

    //pin 46, PL3
    colResult[8] = (PINL & B00001000)== 0 ? 1 : 0;
    //pin 47, PL2
    colResult[9] = (PINL & B00000100)== 0 ? 1 : 0;
    //pin 48, PL1
    colResult[10] =(PINL & B00000010) == 0 ? 1 : 0;
    //pin 49, PL0
    colResult[11] =(PINL & B00000001) == 0 ? 1 : 0;

    //pin 50, PB3
    colResult[12] =(PINB & B00001000) == 0 ? 1 : 0;
    //pin 51, PB2
    colResult[13] =(PINB & B00000100) == 0 ? 1 : 0;
    //pin 52, PB1
    colResult[14] =(PINB & B00000010) == 0 ? 1 : 0;
    //pin 53, PB0
    colResult[15] =(PINB & B00000001) == 0 ? 1 : 0;

    for ( int colid = 0; colid < 16; colid ++ )
    {
      if ( colResult[ colid ] == 1 )
      {
        joyReport.button[ rowid * 8 + colid ] =  1;
      }
      else
      {
        joyReport.button[ rowid * 8 + colid ] =  0;
      }
    }
  }


  




  for ( unsigned int buttonid = 0; buttonid < NUM_BUTTONS; buttonid ++ )
  {

//    if ((buttonid % 16) == 0)
//      Serial.println();
//      
//    sprintf(cButtonID, "%3d", buttonid);    
//    Serial.print(cButtonID);
//    Serial.print("-");
//    Serial.print(joyReport.button[buttonid]);
//    
//    Serial.print(" ");
    
    if (joyReport.button[buttonid] != 0)
    {
      //Serial.print(cButtonID);
      Serial.print("-");
      Serial.print("1 ");
    }
    else
    {
//      Serial.print(cButtonID);
//      Serial.print("-");
//      Serial.print("0 "); 
    }
  }

  Serial.println(""); 
  delay(1000);


  

  // Flash Led 
  if ( (millis() - prevLEDTransition) >=  FLASH_TIME)
    {
      digitalWrite(STATUS_LED_PORT, !digitalRead(STATUS_LED_PORT)); 
      prevLEDTransition = millis();

    }
  
//  delay(20);
}


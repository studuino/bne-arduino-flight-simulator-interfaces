//  Hornet UFC
//
// The project intends to drive the OLED displays on a F18C Hornet Up Front Controller
//
// To do  - grab Analog 0 use that to locally to determine brightness - no real value in getting that from the Sim
//        - develop font based on 14 segment display
//
// The UFC has a large display on the top left hand corner, five mid sized display on the right hand side, and then two smaller 
// displays at the bottom left and bottom right hand side.
//
// As a number of the same OLEDs are used, which the same target I2C addresses an I2C multiplexor is used, TCA9548A.
// The TCA9548A is an 8 Channel I2C switch.  It is possible for different devices to share a common host I2C bus.
// https://e2e.ti.com/blogs_/b/analogwire/archive/2015/10/15/how-to-simplify-i2c-tree-when-connecting-multiple-slaves-to-an-i2c-master
//
// Prototyping is being done with an Adafruit 2717 TCA9548A board.
// The 8 channels have their own SCL and SDA
// Had one weirdness I'm yet to understand - the SCL SDA appear to be reversed on the Adafruit outputs, the input pins
// is as epxected, but the outputs appeared to be swapped around.

// The initial test OLEDs have addresses of 0x3C - despite being labelled - 0x78 or 0x7A - selectable by soldering a jumper. I'm assuming these are the same SSD1306 
// used in the Hornet Altimeter.
// Can validate what addresses are on the bus by using I2C scanner

// The following OLEDs where sourced from ebay
// OLED for top  2.2" 128 * 32 SSD1305 (not 1306)
// This OLED does require resistors to be set (R3 & R5 Short)(the others open)
// Pin 16 tied to specific reset for module (ie not general Arduino reset
// It does support 3.3V, but works ok on 5V
// 1 Gnd
// 2 +5V
// 4 Gnd
// 7 SCL
// 8 & 9 SDA
// 16 Reset

// Useful reference for troubleshooting OLEDs

// OLED for 5 Right hand side digits 0.91" 128*32 SSD1306
// https://www.ebay.com/itm/0-91-Inch-128x32-IIC-I2c-White-Blue-OLED-LCD-Display-Module-3-3-5v-For-Arduino/392552169768?ssPageName=STRK%3AMEBIDX%3AIT&var=661536491479&_trksid=p2057872.m2749.l2649


//  OLED for Small Digits 0.96" SSD1306
// https://www.ebay.com/itm/0-96-White-Yellow-Blue-128X64-OLED-I2C-IIC-Serial-LCD-LED-SSD-Display-AU/302435912549?ssPageName=STRK%3AMEBIDX%3AIT&var=601268570499&_trksid=p2060353.m1438.l2649
// or may this one 0.66" 64*48 SSD1036
// I2C 0x3C - validate by running scanner

// When using U8G2 library use this constructor for 64x48 display (assuming pin is used for reset which will need to 
// change with NW shield is attached
// U8G2_SSD1306_64X48_ER_1_HW_I2C u8g2(U8G2_R0, /* reset=*/ 4); 
//
//
//The data format of U8G2 fonts is based on the BDF font format. Its glyph bitmaps are compressed with a 
//run-length-encoding algorithm and its header data are designed with variable bit field width to 
//minimize flash memory footprint.

//http://oleddisplay.squix.ch/#/home
//<3.0.0 is Thiele with packed bitmaps (and special gotcha)
//>=3.0.0 has a Jump table with aligned bitmaps (and really special gotcha)
//Adafruit_GFX has missing bitmap and glyph entry for 0x7E (tilde)

// https://rop.nl/truetype2gfx/

// FontForge
// https://learn.adafruit.com/custom-fonts-for-pyportal-circuitpython-display/conversion


// Basic logic
// Initialise I2C Bus (wire)
// Iterate through each port on the Mux and list connected devices to serial port (simple troubleshooting aid), may use UDP later
// Initialise each display
// Wait for UDP updates
// during timeout grab and smooth analo 0 and get brightness for all displays

#define Ethernet_In_Use 1
#define DCSBIOS_In_Use 1

// Port 3 is used for either a channel or Scratchpad display
//#define Opt_OLED_Port_1 6
//#define Opt_OLED_Port_2 4
//#define Opt_OLED_Port_3 5
//#define Opt_OLED_Port_4 2
//#define Opt_OLED_Port_5 7

#define Opt_OLED_Port_1 2
#define Opt_OLED_Port_2 4
#define Opt_OLED_Port_3 7
#define Opt_OLED_Port_4 6
#define Opt_OLED_Port_5 5
#define COM1_OLED_PORT 0
#define COM2_OLED_PORT 1
#define ScratchPad_OLED_PORT 3

#define ScratchPad_Vertical_Pos 30
#define ScratchPad_String1_Pos 0
#define ScratchPad_String2_Pos 35
#define ScratchPad_Number_Pos 45

#define COM1_XPOS 20
#define COM1_YPOS 33
#define COM2_XPOS 20
#define COM2_YPOS 33


#define DCSBIOS_IRQ_SERIAL
#include "DcsBios.h"

//#include <Arduino.h>
#include <U8g2lib.h>
#include "hornet_font.h"
//#include "dseg14_v3.h"

#include <SPI.h>
#include <Wire.h>
#include <Ethernet.h>
#include <EthernetUdp.h>




// These local Mac and IP Address will be reassigned early in startup based on 
// the device ID as set by address pins
byte mac[] = {0x00,0xDD,0x3E,0xCA,0x36,0x99};
IPAddress ip(172,16,1,100);
String strMyIP = "X.X.X.X";

// Raspberry Pi is Target
IPAddress targetIP(172,16,1,2);
String strTargetIP = "X.X.X.X"; 

const unsigned int localport = 7788;
const unsigned int remoteport = 26027;
const unsigned int reflectorport = 27000;

EthernetUDP udp;
char packetBuffer[1000];     //buffer to store the incoming data
char outpacketBuffer[1000];  //buffer to store the outgoing data


// Op OLEDs
U8G2_SSD1306_128X32_UNIVISION_F_HW_I2C u8g2_OPT1(U8G2_R0, /* reset=*/ U8X8_PIN_NONE);
U8G2_SSD1306_128X32_UNIVISION_F_HW_I2C u8g2_OPT2(U8G2_R0, /* reset=*/ U8X8_PIN_NONE);
U8G2_SSD1306_128X32_UNIVISION_F_HW_I2C u8g2_OPT3(U8G2_R0, /* reset=*/ U8X8_PIN_NONE);
U8G2_SSD1306_128X32_UNIVISION_F_HW_I2C u8g2_OPT4(U8G2_R0, /* reset=*/ U8X8_PIN_NONE);
U8G2_SSD1306_128X32_UNIVISION_F_HW_I2C u8g2_OPT5(U8G2_R0, /* reset=*/ U8X8_PIN_NONE);

// Com1 and Com2 OLEDs
U8G2_SSD1306_64X48_ER_1_HW_I2C u8g2_COM1(U8G2_R0, /* reset=*/ 2); 
U8G2_SSD1306_64X48_ER_1_HW_I2C u8g2_COM2(U8G2_R0, /* reset=*/ 11); 

// Scratch Pad OLED
U8G2_SSD1305_128X32_ADAFRUIT_F_HW_I2C u8g2_Scratch_Pad(U8G2_R2,12);


extern "C" { 
#include "utility/twi.h"  // from Wire library, so we can do bus scanning
}

#define TCAADDR 0x70


int CurrentDisplay = 0;
int Brightness = 0;
char buffer[20]; //plenty of space for the value of millis() plus a zero terminator
 
void tcaselect(uint8_t i) {
  if (i > 7) return;
 
  Wire.beginTransmission(TCAADDR);
  Wire.write(1 << i);
  Wire.endTransmission();  
}

void setup() {
  //Serial.begin(115200);
  Wire.begin();


  // Had to comment out these debugging messages as they created a conflict with the IRQ definition in DCS BIOS
  //Serial.println("\nScanning I2C Bus");
  
  for (uint8_t t=0; t<8; t++) {
    tcaselect(t);
    // Had to comment out these debugging messages as they created a conflict with the IRQ definition in DCS BIOS
    //Serial.print("TCA Port #"); Serial.println(t);

    for (uint8_t addr = 0; addr<=127; addr++) {
      //if (addr == TCAADDR) continue;
    
      uint8_t data;
      if (! twi_writeTo(addr, &data, 0, 1, 1)) {
        // Had to comment out these debugging messages as they created a conflict with the IRQ definition in DCS BIOS
         //Serial.print("Found I2C 0x");  Serial.println(addr,HEX);
      }
    }
  }
  // Had to comment out these debugging messages as they created a conflict with the IRQ definition in DCS BIOS
  //Serial.println("\nI2C scan complete"); 


  tcaselect(COM1_OLED_PORT); 
  u8g2_COM1.begin();
  u8g2_COM1.clearBuffer();
  u8g2_COM1.setFont(u8g2_DcsFontHornet4_BIOS_09_tf);
  u8g2_COM1.sendBuffer();
  
  tcaselect(COM2_OLED_PORT); 
  u8g2_COM2.begin();
  u8g2_COM2.clearBuffer();
  u8g2_COM2.setFont(u8g2_DcsFontHornet4_BIOS_09_tf);
  u8g2_COM2.sendBuffer();

  tcaselect(ScratchPad_OLED_PORT); 
  u8g2_Scratch_Pad.begin();
  u8g2_Scratch_Pad.clearBuffer();          
  u8g2_Scratch_Pad.setFont(u8g2_DcsFontHornet4_BIOS_09_tf); 
  u8g2_Scratch_Pad.sendBuffer();          


  tcaselect(Opt_OLED_Port_1); 
  u8g2_OPT1.begin();    
  u8g2_OPT1.clearBuffer();      
  u8g2_OPT1.setFont(u8g2_DcsFontHornet4_BIOS_09_tf); 
  u8g2_OPT1.sendBuffer();          

  tcaselect(Opt_OLED_Port_2); 
  u8g2_OPT2.begin();      
  u8g2_OPT2.clearBuffer(); 
  u8g2_OPT2.setFont(u8g2_DcsFontHornet4_BIOS_09_tf); 
  u8g2_OPT2.sendBuffer();

  tcaselect(Opt_OLED_Port_3); 
  u8g2_OPT3.begin(); 
  u8g2_OPT3.clearBuffer();      
  u8g2_OPT3.setFont(u8g2_DcsFontHornet4_BIOS_09_tf); 
  u8g2_OPT3.sendBuffer();

  tcaselect(Opt_OLED_Port_4); 
  u8g2_OPT4.begin();
  u8g2_OPT4.clearBuffer();      
  u8g2_OPT4.setFont(u8g2_DcsFontHornet4_BIOS_09_tf); 
  u8g2_OPT4.sendBuffer();

  tcaselect(Opt_OLED_Port_5); 
  u8g2_OPT5.begin();
  u8g2_OPT5.clearBuffer();          
  u8g2_OPT5.setFont(u8g2_DcsFontHornet4_BIOS_09_tf); 
  u8g2_OPT5.sendBuffer();




  if (DCSBIOS_In_Use == 1) DcsBios::setup();

  if (Ethernet_In_Use == 1) {
    Ethernet.begin( mac, ip);
    
    udp.begin( localport );
    udp.beginPacket(targetIP, reflectorport);
    udp.println("Init UDP - " + strMyIP + " " + String(millis()) + "mS since reset.");

  }

}

void setContrast(int contr){
    //From https://www.youtube.com/watch?v=hFpXfSnDNSY
    //
    // for Adafruit_SSD1306.h library
    // contr values from 1 to 411
    // for i2c and 3.3V VCC works fine

    // Sample calling code
    
    //    randomSeed(analogRead(0));
    //    Brightness = random(254);
    //    if (Brightness > 120)
    //      setContrast(411); 
    //    else
    //      setContrast(1); 


    int prech;
    int brigh; 
    switch (contr){
      case 001 ... 255: prech= 0; brigh= contr; break;
      case 256 ... 411: prech=16; brigh= contr-156; break;
      default: prech= 16; brigh= 255; break;}
      
//    display.ssd1306_command(SSD1306_SETPRECHARGE);      
//    display.ssd1306_command(prech);                            
//    display.ssd1306_command(SSD1306_SETCONTRAST);         
//    display.ssd1306_command(brigh);                           
}

void SendIPMessage(int ind, int state) {

  String outString;
  outString = String(ind) + ":" + String(state); 
  
  udp.beginPacket(targetIP, reflectorport);
  udp.print(outString);
  udp.endPacket();
    
  udp.beginPacket(targetIP, remoteport);
  udp.print(outString);
  udp.endPacket();
}

void SendIPString(String state) {

  String outString;
  outString = String(state); 
  
  udp.beginPacket(targetIP, reflectorport);
  udp.print(outString);
  udp.endPacket();
  
  
  udp.beginPacket(targetIP, remoteport);
  udp.print(outString);
  udp.endPacket();
}

void onUfcOptionDisplay1Change(char* newValue) {
  tcaselect(Opt_OLED_Port_1);
  u8g2_OPT1.setFontMode(0);
  u8g2_OPT1.setDrawColor(0);
  u8g2_OPT1.drawBox(0,0,128 ,32);
  u8g2_OPT1.setDrawColor(1);
  u8g2_OPT1.drawStr(5,32,newValue); 
  u8g2_OPT1.sendBuffer(); 
}
DcsBios::StringBuffer<4> ufcOptionDisplay1Buffer(0x7432, onUfcOptionDisplay1Change);


void onUfcOptionDisplay2Change(char* newValue) {
  tcaselect(Opt_OLED_Port_2);
  u8g2_OPT2.setFontMode(0);
  u8g2_OPT2.setDrawColor(0);
  u8g2_OPT2.drawBox(0,0,128 ,32);
  u8g2_OPT2.setDrawColor(1);
  u8g2_OPT2.drawStr(5,32,newValue); 
  u8g2_OPT2.sendBuffer(); 
}
DcsBios::StringBuffer<4> ufcOptionDisplay2Buffer(0x7436, onUfcOptionDisplay2Change);


void onUfcOptionDisplay3Change(char* newValue) {
  tcaselect(Opt_OLED_Port_3);
  u8g2_OPT3.setFontMode(0);
  u8g2_OPT3.setDrawColor(0);
  u8g2_OPT3.drawBox(0,0,128 ,32);
  u8g2_OPT3.setDrawColor(1);
  u8g2_OPT3.drawStr(5,32,newValue); 
  u8g2_OPT3.sendBuffer(); 
}
DcsBios::StringBuffer<4> ufcOptionDisplay3Buffer(0x743a, onUfcOptionDisplay3Change);

void onUfcOptionDisplay4Change(char* newValue) {
  tcaselect(Opt_OLED_Port_4);
  u8g2_OPT4.setFontMode(0);
  u8g2_OPT4.setDrawColor(0);
  u8g2_OPT4.drawBox(0,0,128 ,32);
  u8g2_OPT4.setDrawColor(1);
  u8g2_OPT4.drawStr(5,32,newValue); 
  u8g2_OPT4.sendBuffer(); 
}
DcsBios::StringBuffer<4> ufcOptionDisplay4Buffer(0x743e, onUfcOptionDisplay4Change);


void onUfcOptionDisplay5Change(char* newValue) {
  tcaselect(Opt_OLED_Port_5);
  u8g2_OPT5.setFontMode(0);
  u8g2_OPT5.setDrawColor(0);
  u8g2_OPT5.drawBox(0,0,128 ,32);
  u8g2_OPT5.setDrawColor(1);
  u8g2_OPT5.drawStr(5,32,newValue); 
  u8g2_OPT5.sendBuffer(); 
}
DcsBios::StringBuffer<4> ufcOptionDisplay5Buffer(0x7442, onUfcOptionDisplay5Change);


void onUfcComm1DisplayChange(char* newValue) {
  tcaselect(COM1_OLED_PORT);


    u8g2_COM1.firstPage();
    do {
      u8g2_COM1.setCursor(COM1_XPOS,COM1_YPOS);
      u8g2_COM1.print(newValue);  
    } while ( u8g2_COM1.nextPage() );  
}
DcsBios::StringBuffer<2> ufcComm1DisplayBuffer(0x7424, onUfcComm1DisplayChange);

void onUfcComm2DisplayChange(char* newValue) {
  tcaselect(COM2_OLED_PORT);


  u8g2_COM2.firstPage();
  do {
    u8g2_COM2.setCursor(COM2_XPOS,COM2_YPOS);
    u8g2_COM2.print(newValue);
  } while ( u8g2_COM2.nextPage() );   
}
DcsBios::StringBuffer<2> ufcComm2DisplayBuffer(0x7426, onUfcComm2DisplayChange);


void onUfcScratchpadString1DisplayChange(char* newValue) {
  tcaselect(ScratchPad_OLED_PORT);
  u8g2_Scratch_Pad.setFontMode(0);
  u8g2_Scratch_Pad.setDrawColor(0);
  u8g2_Scratch_Pad.drawBox(ScratchPad_String1_Pos,0,ScratchPad_String2_Pos ,32);
  u8g2_Scratch_Pad.setDrawColor(1);
  u8g2_Scratch_Pad.drawStr(ScratchPad_String1_Pos,ScratchPad_Vertical_Pos,newValue);  // write something to the internal memory
  u8g2_Scratch_Pad.sendBuffer();          // transfer internal memory to the display    /* your code here */
}
DcsBios::StringBuffer<2> ufcScratchpadString1DisplayBuffer(0x744e, onUfcScratchpadString1DisplayChange);


void onUfcScratchpadString2DisplayChange(char* newValue) {
  tcaselect(ScratchPad_OLED_PORT);
  u8g2_Scratch_Pad.setFontMode(0);
  u8g2_Scratch_Pad.setDrawColor(0);
  u8g2_Scratch_Pad.drawBox(ScratchPad_String2_Pos,0,ScratchPad_Number_Pos - ScratchPad_String2_Pos ,32);
  u8g2_Scratch_Pad.setDrawColor(1);
  u8g2_Scratch_Pad.drawStr(ScratchPad_String2_Pos,ScratchPad_Vertical_Pos,newValue);  // write something to the internal memory
  u8g2_Scratch_Pad.sendBuffer();          // transfer internal memory to the display    /* your code here */    /* your code here */
}
DcsBios::StringBuffer<2> ufcScratchpadString2DisplayBuffer(0x7450, onUfcScratchpadString2DisplayChange);


void onUfcScratchpadNumberDisplayChange(char* newValue) {
  tcaselect(ScratchPad_OLED_PORT);
  u8g2_Scratch_Pad.setFontMode(0);
  u8g2_Scratch_Pad.setDrawColor(0);
  u8g2_Scratch_Pad.drawBox(ScratchPad_Number_Pos,0,128 - ScratchPad_Number_Pos ,32);
  u8g2_Scratch_Pad.setDrawColor(1);
  u8g2_Scratch_Pad.drawStr(ScratchPad_Number_Pos,ScratchPad_Vertical_Pos,newValue); 
  u8g2_Scratch_Pad.sendBuffer();           
}
DcsBios::StringBuffer<8> ufcScratchpadNumberDisplayBuffer(0x7446, onUfcScratchpadNumberDisplayChange);

void loop() {

  if (DCSBIOS_In_Use == 1) DcsBios::loop();

}

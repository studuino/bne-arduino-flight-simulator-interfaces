
/*********************************************************************
This is an example for our Monochrome OLEDs based on SSD1306 drivers

  Pick one up today in the adafruit shop!
  ------> http://www.adafruit.com/category/63_98

This example is for a 128x64 size display using SPI to communicate
4 or 5 pins are required to interface

Adafruit invests time and resources providing this open source code, 
please support Adafruit and open-source hardware by purchasing 
products from Adafruit!

Written by Limor Fried/Ladyada  for Adafruit Industries.  
BSD license, check license.txt for more information
All text above, and the splash screen must be included in any redistribution
*********************************************************************/

// Need to record last thousands, ten etc and only blackout old entry if a value has changed.


#include <SPI.h>
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

// If using software SPI (the default case):
#define OLED_MOSI   9
#define OLED_CLK   10
#define OLED_DC    11
#define OLED_CS    12
#define OLED_RESET 13
Adafruit_SSD1306 display(OLED_MOSI, OLED_CLK, OLED_DC, OLED_RESET, OLED_CS);

/* Uncomment this block to use hardware SPI
#define OLED_DC     6
#define OLED_CS     7
#define OLED_RESET  8
Adafruit_SSD1306 display(OLED_DC, OLED_RESET, OLED_CS);
*/

#define NUMFLAKES 10
#define XPOS 0
#define YPOS 1
#define DELTAY 2

#define LOGO16_GLCD_HEIGHT 16 
#define LOGO16_GLCD_WIDTH  16 
static const unsigned char PROGMEM logo16_glcd_bmp[] =
{ B00000000, B11000000,
  B00000001, B11000000,
  B00000001, B11000000,
  B00000011, B11100000,
  B11110011, B11100000,
  B11111110, B11111000,
  B01111110, B11111111,
  B00110011, B10011111,
  B00011111, B11111100,
  B00001101, B01110000,
  B00011011, B10100000,
  B00111111, B11100000,
  B00111111, B11110000,
  B01111100, B11110000,
  B01110000, B01110000,
  B00000000, B00110000 };

#if (SSD1306_LCDHEIGHT != 64)
#error("Height incorrect, please fix Adafruit_SSD1306.h!");
#endif

#define cursor_multiplier 2.5

int thousandscounter = 0;
int pressure = 1013;
long startmillis = 0;
long timetaken = 0;
bool debugging = false;
void setup()   {                
  Serial.begin(115200);

  // by default, we'll generate the high voltage from the 3.3v line internally! (neat!)
  display.begin(SSD1306_SWITCHCAPVCC);
  // init done
  
  // Show image buffer on the display hardware.
  // Since the buffer is intialized with an Adafruit splashscreen
  // internally, this will display the splashscreen.
  display.setRotation(1);
  display.display();
  display.setTextSize(3);
  display.setTextColor(WHITE);

  // Clear the buffer.
  display.clearDisplay();
  startmillis = millis();
}


void loop() {

  testtext();
  thousandscounter++;
  if (thousandscounter > 999) {
    thousandscounter=0;
    timetaken =  millis() - startmillis;
    Serial.println(timetaken);
    startmillis = millis();
  }
}




void testtext(void) {

  static int last_thousands_counter = -1;
  static int last_thousands = -1;
  static int last_hundreds = -1;
  static int last_tens = -1;
  static int last_ones = -1;
  static int last_pressure = -1;

  
  // Nothing has changed since last time - get out of here
  if ((thousandscounter == last_thousands_counter) && (last_pressure == pressure))
    return;
    
  
  int ones = (thousandscounter%10);
  int tens = ((thousandscounter/10)%10);
  int hundreds = ((thousandscounter/100)%10);
  int thousands = (thousandscounter/1000);


  if (last_thousands != thousands) {
    
    last_thousands = thousands;
    display.fillRect(0, 21, 15, 21, BLACK);
    display.setCursor(0,21);
    display.println(thousands);
  }


  if (last_hundreds != hundreds) {
    last_hundreds = hundreds;
    display.fillRect(16, 21, 15, 21, BLACK);
    display.setCursor(16,21);
    display.println(hundreds);
  }


  if (last_ones != ones) {  

 

    last_ones = ones;
    int ones_converted = ones * -1;
    
    display.fillRect(35, 0, 15, 65, BLACK);
    display.setCursor(35,-5 +  ones_converted * cursor_multiplier);
    display.println((tens + 9) % 10);
  
  
    // Centre line which aligns with the hundreds and thousands
    display.setCursor(35,21 +  ones_converted * cursor_multiplier);
    display.println(tens);
  
  
    // At the bottom of the screen
    display.setCursor(35,45 +  ones_converted * cursor_multiplier);
    display.println((tens + 1) % 10);
  
  
    // At the bottom below the screen
    display.setCursor(35,69 +  ones_converted * cursor_multiplier);
    display.println((tens + 2) % 10);
  
    // Remove bottom of last character to remove distation of digit appearing and disappearing
    display.fillRect(35, 65, 15, 25, BLACK);

  }

  
  if (last_pressure != pressure) {

    last_pressure = pressure;
    display.setCursor(10,100);
    display.setTextSize(2);
    display.println(pressure);
    // Reset display font to large
    display.setTextSize(3);

  }

  display.display();  

}

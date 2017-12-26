
# Font used in Arduino build is FreeMonoBold  which is basically Courier


import time

import Adafruit_GPIO.SPI as SPI
import Adafruit_SSD1306

from PIL import Image
from PIL import ImageDraw
from PIL import ImageFont

colour_black = 0
colour_white = 255


column_Spacing = 17

ten_thousand_Column_Pos = 5
thousand_Column_Pos = ten_thousand_Column_Pos + column_Spacing
hundred_Column_Pos = thousand_Column_Pos + column_Spacing
ten_Column_Pos = hundred_Column_Pos + column_Spacing
one_Column_Pos = ten_Column_Pos + column_Spacing

hatch_width = 12
hatch_height = 20

character_width = 12

def DrawHatch():
   
    # Darw White box
    draw.rectangle((ten_thousand_Column_Pos, 20, ten_thousand_Column_Pos + hatch_width, 20 + hatch_height), outline=colour_white, fill=colour_white)

    # Add diagonal black lines to create hatch
    for i in range(5,9): 
        draw.line((ten_thousand_Column_Pos, 10 + i, ten_thousand_Column_Pos +hatch_width, i  + 10 + 10), fill=colour_black)

    for i in range(5,9):
        draw.line((ten_thousand_Column_Pos, 17 + i, ten_thousand_Column_Pos + hatch_width, i  + 17 + 10), fill=colour_black)
        
    for i in range(5,9):
        draw.line((ten_thousand_Column_Pos, 24 + i, ten_thousand_Column_Pos + hatch_width, i  + 24 + 10), fill=colour_black)       

    for i in range(5,9):
        draw.line((ten_thousand_Column_Pos, 31 + i, ten_thousand_Column_Pos + hatch_width, i  + 31 + 10), fill=colour_black)

    # end DrawHatch

def DrawThousands(alt_ThousandsValue):
    
    draw.rectangle((thousand_Column_Pos, 20, thousand_Column_Pos + column_Spacing, 20 + hatch_height), outline=colour_black, fill=colour_black)
    draw.text((thousand_Column_Pos, middle_row), str(alt_ThousandsValue), font=font, fill=colour_white)





def DrawHundreds(alt_HundredsValue, alt_TensValue):
    # Large Rectangle to cover all three rows
    draw.rectangle((hundred_Column_Pos, 0, hundred_Column_Pos + column_Spacing, 60), outline=colour_black, fill=colour_black)

    if (alt_HundredsValue != 0):
        draw.text((hundred_Column_Pos, top_row ),str(alt_HundredsValue-1),  font=font, fill=colour_white)
    else:
        draw.text((hundred_Column_Pos, top_row ),'9',  font=font, fill=colour_white)
    
    draw.text((hundred_Column_Pos, middle_row), str(alt_HundredsValue), font=font, fill=colour_white)

    if (alt_HundredsValue != 9):
        draw.text((hundred_Column_Pos, bottom_row ), str(alt_HundredsValue+1), font=font, fill=colour_white)
    else:
        draw.text((hundred_Column_Pos, bottom_row ), '0', font=font, fill=colour_white)
    

# Raspberry Pi pin configuration:
RST = 24
# Note the following are only used with SPI:
DC = 23
SPI_PORT = 0
SPI_DEVICE = 0

# 128x64 display with hardware SPI:
disp = Adafruit_SSD1306.SSD1306_128_64(rst=RST, dc=DC, spi=SPI.SpiDev(SPI_PORT, SPI_DEVICE, max_speed_hz=8000000))


# Initialize library.
disp.begin()

# Clear display.
disp.clear()
disp.display()

# Create blank image for drawing.
# Make sure to create image with mode '1' for 1-bit color.
width = disp.width
height = disp.height
image = Image.new('1', (width, height))

# Get drawing object to draw on image.
draw = ImageDraw.Draw(image)

# Draw a black filled box to clear the image.
draw.rectangle((0,0,width,height), outline=0, fill=0)


# Draw the Ten Thousands Hatch
DrawHatch()



# Load default font.
font = ImageFont.load_default()

# Alternatively load a TTF font.  Make sure the .ttf font file is in the same directory as the python script!
# Some other nice fonts to try: http://www.dafont.com/bitmap.php
font = ImageFont.truetype('monofonto.ttf', 26)

# Write two lines of text.
top = 0
x = 23
top_row = -6
middle_row = 15
bottom_row = 36
draw.text((thousand_Column_Pos, middle_row), '3', font=font, fill=colour_white)
draw.text((hundred_Column_Pos, top_row ),'6',  font=font, fill=colour_white)
draw.text((hundred_Column_Pos, middle_row),'7', font=font, fill=colour_white)
draw.text((hundred_Column_Pos, bottom_row ), '8', font=font, fill=colour_white)

draw.text((ten_Column_Pos, middle_row),'0', font=font, fill=colour_white)
draw.text((one_Column_Pos, middle_row),'0', font=font, fill=colour_white)

# Display image.
disp.image(image)
disp.display()
time.sleep(1)

# Draw Ten Thousands
draw.rectangle((ten_thousand_Column_Pos, 20, ten_thousand_Column_Pos + column_Spacing, 20 + hatch_height), outline=colour_black, fill=colour_black)

draw.text((ten_thousand_Column_Pos, middle_row), '1', font=font, fill=colour_white)



# Draw Thousands
draw.rectangle((thousand_Column_Pos, 20, thousand_Column_Pos + column_Spacing, 20 + hatch_height), outline=colour_black, fill=colour_black)
draw.text((thousand_Column_Pos, middle_row), '3', font=font, fill=colour_white)


# Draw hundreds

# Large Rectangle to cover all three rows
draw.rectangle((hundred_Column_Pos, 0, hundred_Column_Pos + column_Spacing, 60), outline=colour_black, fill=colour_black)

draw.text((hundred_Column_Pos, top_row ),'5',  font=font, fill=colour_white)
draw.text((hundred_Column_Pos, middle_row),'6', font=font, fill=colour_white)
draw.text((hundred_Column_Pos, bottom_row ), '7', font=font, fill=colour_white)

disp.image(image)
disp.display()

for i in range(0,10):
    time.sleep(0.1)
    DrawThousands(i)
    disp.image(image)
    disp.display()


for k in range(1,3):    
    for i in range(0,10):
        time.sleep(0.1)
        DrawHundreds(i,0)
        disp.image(image)
        disp.display()

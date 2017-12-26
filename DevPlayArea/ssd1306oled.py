
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

cursor_Multiplier = 2.3

top = 0
x = 23
top_hidden_row = -27
top_row = -6
middle_row = 15
bottom_row = 36
bottom_hidden_row = 57

def DrawHatch():
   
    # Draw White box
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

def DrawTenThousands(alt_TenThousandsValue):

    if (alt_TenThousandsValue == 0):
        DrawHatch()
    else:
        draw.rectangle((ten_thousand_Column_Pos, 0, ten_thousand_Column_Pos + column_Spacing, 64), outline=colour_black, fill=colour_black)
        draw.text((ten_thousand_Column_Pos, middle_row), str(alt_TenThousandsValue), font=font, fill=colour_white)
    # end DrawTenThousands


def DrawThousands(alt_ThousandsValue):



    draw.rectangle((thousand_Column_Pos, 0, thousand_Column_Pos + column_Spacing, 64), outline=colour_black, fill=colour_black)

    draw.text((thousand_Column_Pos, middle_row), str(alt_ThousandsValue), font=font, fill=colour_white)



def DrawHundreds(alt_HundredsValue, alt_TensValue):



    vertical_offset = 0
    tens_Corrected = (alt_TensValue * cursor_Multiplier * -1) + 23
    
    # Large Rectangle to cover all three rows
    draw.rectangle((hundred_Column_Pos, 0, hundred_Column_Pos + column_Spacing, 64), outline=colour_black, fill=colour_black)

    draw.text((hundred_Column_Pos, top_hidden_row + tens_Corrected ), str((alt_HundredsValue+9) % 10), font=font, fill=colour_white)

    draw.text((hundred_Column_Pos, top_row + tens_Corrected),str((alt_HundredsValue) % 10),  font=font, fill=colour_white)

    
    draw.text((hundred_Column_Pos, middle_row + tens_Corrected), str((alt_HundredsValue+1) % 10), font=font, fill=colour_white)


    draw.text((hundred_Column_Pos, bottom_row + tens_Corrected ), str((alt_HundredsValue+2) % 10), font=font, fill=colour_white)

    draw.text((hundred_Column_Pos, bottom_hidden_row + tens_Corrected ), str((alt_HundredsValue+3) % 10), font=font, fill=colour_white)

    

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
##draw.rectangle((ten_thousand_Column_Pos, 20, ten_thousand_Column_Pos + column_Spacing, 20 + hatch_height), outline=colour_black, fill=colour_black)
##
##draw.text((ten_thousand_Column_Pos, middle_row), '1', font=font, fill=colour_white)



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

for k in range(0,2110,1):
    DrawTenThousands((k/1000) % 10)
    DrawThousands((k/100) % 10)
    DrawHundreds(((k/10) % 10),k % 10)
    disp.image(image)
    disp.display()
    print(k)
    time.sleep(0.3)


for k in range(2110,0,-1):
    DrawTenThousands((k/1000) % 10)
    DrawThousands((k/100) % 10)
    DrawHundreds(((k/10) % 10),k % 10)
    disp.image(image)
    disp.display()
    print(k)
    
##for h in range(0,1):
##    for i in range(0,10):
##        for j in range(0,10):
##            for k in range(0,10):
##                DrawTenThousands(h)
##                DrawThousands(i)
##                DrawHundreds(j,k)
##                disp.image(image)
##                disp.display()
##                #print(h,i,j,k)
##
##for h in range(1,-1, -1):
##    for i in range(10,0,-1):
##        for j in range(10,0,-1):
##            for k in range(10,0,-1):
##                DrawTenThousands(h)
##                DrawThousands(i)
##                DrawHundreds(j,k)
##                disp.image(image)
##                disp.display()
##                #print(h,i,j,k)

DrawTenThousands(0)
DrawThousands(0)
DrawHundreds(0,0)
disp.image(image)
disp.display()
print("Finished")



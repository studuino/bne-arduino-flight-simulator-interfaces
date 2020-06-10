EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev "2"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Arduino_NW_Template-rescue:PT_Conn_01x06 J4
U 1 1 5E66B8DF
P 4150 5750
F 0 "J4" H 4100 6150 50  0000 L CNN
F 1 "PT_Conn_01x06" H 4230 5651 50  0001 L CNN
F 2 "PT_Library_v001:PT_PinHeader_1x06_P2.54mm_Vertical" H 4150 5750 50  0001 C CNN
F 3 "~" H 4150 5750 50  0001 C CNN
	1    4150 5750
	1    0    0    -1  
$EndComp
$Comp
L Arduino_NW_Template-rescue:PT_Ethernet_Shield U1
U 1 1 5E63623F
P 5700 2450
F 0 "U1" H 5700 2531 50  0000 C CNN
F 1 "PT_Ethernet_Shield" H 5700 2440 50  0001 C CNN
F 2 "PT_Library_v001:PT_Ethernet_Shield_v001" H 5700 2450 50  0001 C CNN
F 3 "" H 5700 2450 50  0001 C CNN
	1    5700 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 4600 5850 4800
Wire Wire Line
	5850 4800 5750 4800
Wire Wire Line
	5650 4800 5650 4600
Wire Wire Line
	5750 4600 5750 4800
Connection ~ 5750 4800
Wire Wire Line
	5750 4800 5650 4800
$Comp
L power:GND #PWR07
U 1 1 5E6376AA
P 5750 5050
F 0 "#PWR07" H 5750 4800 50  0001 C CNN
F 1 "GND" H 5755 4877 50  0000 C CNN
F 2 "" H 5750 5050 50  0001 C CNN
F 3 "" H 5750 5050 50  0001 C CNN
	1    5750 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 5050 5750 4800
$Comp
L Device:R R3
U 1 1 5E637E5E
P 6550 2850
F 0 "R3" V 6343 2850 50  0000 C CNN
F 1 "500" V 6434 2850 50  0000 C CNN
F 2 "PT_Library_v001:PT_R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 6480 2850 50  0001 C CNN
F 3 "~" H 6550 2850 50  0001 C CNN
	1    6550 2850
	0    1    1    0   
$EndComp
Wire Wire Line
	6400 2850 6300 2850
$Comp
L Device:CP1 C1
U 1 1 5E639090
P 6900 3000
F 0 "C1" H 7015 3046 50  0000 L CNN
F 1 "47uF" H 7015 2955 50  0000 L CNN
F 2 "PT_Library_v001:PT_CP_Radial_D8.0mm_P2.50mm" H 6900 3000 50  0001 C CNN
F 3 "~" H 6900 3000 50  0001 C CNN
	1    6900 3000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 5E639A2C
P 6900 3200
F 0 "#PWR09" H 6900 2950 50  0001 C CNN
F 1 "GND" H 6905 3027 50  0000 C CNN
F 2 "" H 6900 3200 50  0001 C CNN
F 3 "" H 6900 3200 50  0001 C CNN
	1    6900 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 2850 6900 2850
Wire Wire Line
	6900 3150 6900 3200
Wire Wire Line
	3850 5650 3950 5650
$Comp
L power:+5V #PWR08
U 1 1 5E634A45
P 5900 2450
F 0 "#PWR08" H 5900 2300 50  0001 C CNN
F 1 "+5V" H 5915 2623 50  0000 C CNN
F 2 "" H 5900 2450 50  0001 C CNN
F 3 "" H 5900 2450 50  0001 C CNN
	1    5900 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 2450 5900 2550
$Comp
L power:+5V #PWR03
U 1 1 5E6357FF
P 3950 5450
F 0 "#PWR03" H 3950 5300 50  0001 C CNN
F 1 "+5V" H 3965 5623 50  0000 C CNN
F 2 "" H 3950 5450 50  0001 C CNN
F 3 "" H 3950 5450 50  0001 C CNN
	1    3950 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 5550 3950 5450
$Comp
L power:GND #PWR02
U 1 1 5E63635F
P 3750 5550
F 0 "#PWR02" H 3750 5300 50  0001 C CNN
F 1 "GND" H 3755 5377 50  0000 C CNN
F 2 "" H 3750 5550 50  0001 C CNN
F 3 "" H 3750 5550 50  0001 C CNN
	1    3750 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 5650 3850 5450
Wire Wire Line
	3850 5450 3750 5450
Wire Wire Line
	3750 5450 3750 5550
Wire Wire Line
	5200 3800 3650 3800
Wire Wire Line
	3650 3800 3650 5750
Wire Wire Line
	3650 5750 3950 5750
Wire Wire Line
	5200 3600 3450 3600
Wire Wire Line
	5200 3700 3550 3700
Wire Wire Line
	3550 3700 3550 5950
Wire Wire Line
	3550 5950 3950 5950
Wire Wire Line
	3950 5850 3450 5850
Wire Wire Line
	3450 5850 3450 3600
Wire Wire Line
	6200 3150 6650 3150
Wire Wire Line
	6200 3250 6600 3250
Wire Wire Line
	6200 3350 6550 3350
$Comp
L Arduino_NW_Template-rescue:PT_Conn_01x06 J5
U 1 1 5E76203C
P 4200 4450
F 0 "J5" H 4118 4867 50  0000 C CNN
F 1 "PT_Conn_01x06" H 4118 4776 50  0001 C CNN
F 2 "PT_Library_v001:PT_PinHeader_1x06_P2.54mm_Vertical" H 4200 4450 50  0001 C CNN
F 3 "~" H 4200 4450 50  0001 C CNN
	1    4200 4450
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5200 4200 5200 4750
Wire Wire Line
	5200 4750 4400 4750
Wire Wire Line
	5200 4100 5100 4100
Wire Wire Line
	5100 4100 5100 4650
Wire Wire Line
	5100 4650 4400 4650
Wire Wire Line
	5200 4000 5000 4000
Wire Wire Line
	5000 4000 5000 4550
Wire Wire Line
	5000 4550 4400 4550
$Comp
L power:GND #PWR06
U 1 1 5E7817B9
P 4750 4200
F 0 "#PWR06" H 4750 3950 50  0001 C CNN
F 1 "GND" H 4755 4027 50  0000 C CNN
F 2 "" H 4750 4200 50  0001 C CNN
F 3 "" H 4750 4200 50  0001 C CNN
	1    4750 4200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR05
U 1 1 5E78236E
P 4500 4050
F 0 "#PWR05" H 4500 3900 50  0001 C CNN
F 1 "+5V" H 4515 4223 50  0000 C CNN
F 2 "" H 4500 4050 50  0001 C CNN
F 3 "" H 4500 4050 50  0001 C CNN
	1    4500 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 4050 4500 4250
Wire Wire Line
	4500 4250 4400 4250
Wire Wire Line
	4750 4200 4750 4100
Wire Wire Line
	4750 4100 4650 4100
Wire Wire Line
	4650 4100 4650 4350
Wire Wire Line
	4650 4350 4400 4350
$Comp
L Device:R R2
U 1 1 5E7905FE
P 4750 3400
F 0 "R2" V 4850 3400 50  0000 C CNN
F 1 "330" V 4850 3250 50  0000 C CNN
F 2 "PT_Library_v001:PT_R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 4680 3400 50  0001 C CNN
F 3 "~" H 4750 3400 50  0001 C CNN
	1    4750 3400
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R1
U 1 1 5E791245
P 4350 3500
F 0 "R1" V 4500 3550 50  0000 C CNN
F 1 "330" V 4500 3400 50  0000 C CNN
F 2 "PT_Library_v001:PT_R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" V 4280 3500 50  0001 C CNN
F 3 "~" H 4350 3500 50  0001 C CNN
	1    4350 3500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5200 3400 4900 3400
Wire Wire Line
	5200 3500 4500 3500
$Comp
L Device:LED D2
U 1 1 5E7A041C
P 3100 3650
F 0 "D2" V 3139 3533 50  0000 R CNN
F 1 "Red" V 3048 3533 50  0000 R CNN
F 2 "LED_THT:LED_D5.0mm" H 3100 3650 50  0001 C CNN
F 3 "~" H 3100 3650 50  0001 C CNN
	1    3100 3650
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D1
U 1 1 5E7A19F6
P 2750 3650
F 0 "D1" V 2789 3533 50  0000 R CNN
F 1 "Green" V 2698 3533 50  0000 R CNN
F 2 "LED_THT:LED_D5.0mm" H 2750 3650 50  0001 C CNN
F 3 "~" H 2750 3650 50  0001 C CNN
	1    2750 3650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3100 3500 4200 3500
Wire Wire Line
	4600 3400 2750 3400
Wire Wire Line
	2750 3400 2750 3500
Wire Wire Line
	3100 3800 3100 3900
Wire Wire Line
	3100 3900 2950 3900
Wire Wire Line
	2750 3900 2750 3800
$Comp
L power:GND #PWR01
U 1 1 5E7C0073
P 2950 4000
F 0 "#PWR01" H 2950 3750 50  0001 C CNN
F 1 "GND" H 2955 3827 50  0000 C CNN
F 2 "" H 2950 4000 50  0001 C CNN
F 3 "" H 2950 4000 50  0001 C CNN
	1    2950 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 4000 2950 3900
Connection ~ 2950 3900
Wire Wire Line
	2950 3900 2750 3900
$Comp
L Connector:Conn_01x08_Female J6
U 1 1 5E7C8A00
P 6350 5700
F 0 "J6" H 6200 6150 50  0000 L CNN
F 1 "Conn_01x08_Female" H 6378 5585 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Vertical" H 6350 5700 50  0001 C CNN
F 3 "~" H 6350 5700 50  0001 C CNN
	1    6350 5700
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x08_Female J7
U 1 1 5E7C9A36
P 6800 5700
F 0 "J7" H 6650 6150 50  0000 L CNN
F 1 "Conn_01x08_Female" H 6828 5585 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Vertical" H 6800 5700 50  0001 C CNN
F 3 "~" H 6800 5700 50  0001 C CNN
	1    6800 5700
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x08_Female J8
U 1 1 5E7CA9FF
P 7250 5700
F 0 "J8" H 7100 6150 50  0000 L CNN
F 1 "Conn_01x08_Female" H 7278 5585 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Vertical" H 7250 5700 50  0001 C CNN
F 3 "~" H 7250 5700 50  0001 C CNN
	1    7250 5700
	1    0    0    -1  
$EndComp
Text Notes 5200 2100 0    50   ~ 0
Cannot use D4 and D10 as they are used by the Ethernet shield
Text Notes 6550 5150 0    50   ~ 0
Spares
Text Notes 2700 3350 0    50   ~ 0
Green Led  - Flashes once per second
Text Notes 2700 4600 0    50   ~ 0
Red LED - solid\non until packet \nis successfully\nsent to controller
Text Notes 4350 5500 0    50   ~ 0
Output to Max7219\nLed Driver
Text Notes 4050 5200 0    50   ~ 0
LedControl lc_2=LedControl(9,8,7,1); \n9 - DATA IN\n8 - CLK\n7 - LOAD/CS
Text Notes 4300 5800 0    50   ~ 0
Data In - Orange
Text Notes 4300 5900 0    50   ~ 0
Load/CS - Yellow
Text Notes 4300 6000 0    50   ~ 0
Clock - Green
$Comp
L PT_Symbol_Library_v001:MUX U2
U 1 1 5EDEBE76
P 8650 3150
F 0 "U2" H 9369 2761 50  0000 L CNN
F 1 "MUX" H 9369 2670 50  0000 L CNN
F 2 "PT_Library_v001:Adafruit_TCA9548A" H 8650 3150 50  0001 C CNN
F 3 "" H 8650 3150 50  0001 C CNN
	1    8650 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 2850 6300 2450
Wire Wire Line
	6300 2450 7300 2450
Wire Wire Line
	7300 2450 7300 3150
Wire Wire Line
	7300 3150 8100 3150
Connection ~ 6300 2850
Wire Wire Line
	6300 2850 6200 2850
$Comp
L Arduino_NW_Template-rescue:PT_Conn_01x06 J3
U 1 1 5EDF7319
P 10400 2000
F 0 "J3" H 10318 2417 50  0000 C CNN
F 1 "PT_Conn_01x06" H 10318 2326 50  0001 C CNN
F 2 "PT_Library_v001:PT_PinHeader_1x06_P2.54mm_Vertical" H 10400 2000 50  0001 C CNN
F 3 "~" H 10400 2000 50  0001 C CNN
	1    10400 2000
	1    0    0    -1  
$EndComp
$Comp
L PT_Symbol_Library_v001:PT_Conn_01x04 J9
U 1 1 5EDF9E7F
P 10400 2700
F 0 "J9" H 10318 3117 50  0000 C CNN
F 1 "PT_Conn_01x04" H 10318 3026 50  0001 C CNN
F 2 "PT_Library_v001:PT_PinHeader_1x04_P2.54mm_Vertical" H 10400 2700 50  0001 C CNN
F 3 "~" H 10400 2700 50  0001 C CNN
	1    10400 2700
	1    0    0    -1  
$EndComp
$Comp
L PT_Symbol_Library_v001:PT_Conn_01x04 J10
U 1 1 5EDFACEC
P 10400 3450
F 0 "J10" H 10318 3867 50  0000 C CNN
F 1 "PT_Conn_01x04" H 10318 3776 50  0001 C CNN
F 2 "PT_Library_v001:PT_PinHeader_1x04_P2.54mm_Vertical" H 10400 3450 50  0001 C CNN
F 3 "~" H 10400 3450 50  0001 C CNN
	1    10400 3450
	1    0    0    -1  
$EndComp
$Comp
L PT_Symbol_Library_v001:PT_Conn_01x04 J11
U 1 1 5EDFBEDB
P 10400 4200
F 0 "J11" H 10318 4617 50  0000 C CNN
F 1 "PT_Conn_01x04" H 10318 4526 50  0001 C CNN
F 2 "PT_Library_v001:PT_PinHeader_1x04_P2.54mm_Vertical" H 10400 4200 50  0001 C CNN
F 3 "~" H 10400 4200 50  0001 C CNN
	1    10400 4200
	1    0    0    -1  
$EndComp
$Comp
L PT_Symbol_Library_v001:PT_Conn_01x04 J12
U 1 1 5EDFCB54
P 10400 4950
F 0 "J12" H 10318 5367 50  0000 C CNN
F 1 "PT_Conn_01x04" H 10318 5276 50  0001 C CNN
F 2 "PT_Library_v001:PT_PinHeader_1x04_P2.54mm_Vertical" H 10400 4950 50  0001 C CNN
F 3 "~" H 10400 4950 50  0001 C CNN
	1    10400 4950
	1    0    0    -1  
$EndComp
$Comp
L PT_Symbol_Library_v001:PT_Conn_01x04 J13
U 1 1 5EDFD911
P 10400 5700
F 0 "J13" H 10318 6117 50  0000 C CNN
F 1 "PT_Conn_01x04" H 10318 6026 50  0001 C CNN
F 2 "PT_Library_v001:PT_PinHeader_1x04_P2.54mm_Vertical" H 10400 5700 50  0001 C CNN
F 3 "~" H 10400 5700 50  0001 C CNN
	1    10400 5700
	1    0    0    -1  
$EndComp
$Comp
L Arduino_NW_Template-rescue:PT_Conn_01x06 J2
U 1 1 5EDFE6CA
P 10400 1200
F 0 "J2" H 10318 1617 50  0000 C CNN
F 1 "PT_Conn_01x06" H 10318 1526 50  0001 C CNN
F 2 "PT_Library_v001:PT_PinHeader_1x06_P2.54mm_Vertical" H 10400 1200 50  0001 C CNN
F 3 "~" H 10400 1200 50  0001 C CNN
	1    10400 1200
	1    0    0    -1  
$EndComp
$Comp
L PT_Symbol_Library_v001:PT_Conn_01x04 J1
U 1 1 5EDFF575
P 9150 5700
F 0 "J1" H 9068 6117 50  0000 C CNN
F 1 "PT_Conn_01x04" H 9068 6026 50  0001 C CNN
F 2 "PT_Library_v001:PT_PinHeader_1x04_P2.54mm_Vertical" H 9150 5700 50  0001 C CNN
F 3 "~" H 9150 5700 50  0001 C CNN
	1    9150 5700
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Female J14
U 1 1 5EDF0391
P 8150 1600
F 0 "J14" H 8178 1576 50  0000 L CNN
F 1 "Conn_01x02_Female" H 8178 1485 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 8150 1600 50  0001 C CNN
F 3 "~" H 8150 1600 50  0001 C CNN
	1    8150 1600
	1    0    0    -1  
$EndComp
Text Notes 7600 1450 0    50   ~ 0
External jumper to Mega I2C \n20 SDA Orange\n21 SCL Yellow
Wire Wire Line
	7950 1600 7700 1600
Wire Wire Line
	7700 1600 7700 2900
Wire Wire Line
	7700 2900 8100 2900
Wire Wire Line
	7950 1700 7750 1700
Wire Wire Line
	7750 1700 7750 3000
Wire Wire Line
	7750 3000 8100 3000
Text Notes 4550 1500 0    50   ~ 0
Colour coding for OLED displays\n1: Red +5V\n2: Black GND\n3: Yellow SCL\n4: Orange SDA\n5: Green Reset (Optional)
Wire Bus Line
	9900 6300 8650 6300
Entry Wire Line
	9900 2600 10000 2700
Entry Wire Line
	9900 2500 10000 2600
Entry Wire Line
	9900 2400 10000 2500
Entry Wire Line
	9900 2700 10000 2800
Entry Wire Line
	9900 900  10000 1000
Entry Wire Line
	9900 1000 10000 1100
Entry Wire Line
	9900 1100 10000 1200
Entry Wire Line
	9900 1200 10000 1300
Entry Wire Line
	9900 1300 10000 1400
Entry Wire Line
	9900 1700 10000 1800
Entry Wire Line
	9900 1800 10000 1900
Entry Wire Line
	9900 1900 10000 2000
Entry Wire Line
	9900 2000 10000 2100
Entry Wire Line
	9900 2100 10000 2200
Entry Wire Line
	9900 3150 10000 3250
Entry Wire Line
	9900 3250 10000 3350
Entry Wire Line
	9900 3350 10000 3450
Entry Wire Line
	9900 3450 10000 3550
Entry Wire Line
	9900 3900 10000 4000
Entry Wire Line
	9900 4000 10000 4100
Entry Wire Line
	9900 4100 10000 4200
Entry Wire Line
	9900 4200 10000 4300
Entry Wire Line
	9900 4750 10000 4850
Entry Wire Line
	9900 4850 10000 4950
Entry Wire Line
	9900 4950 10000 5050
Entry Wire Line
	9900 4650 10000 4750
Entry Wire Line
	9900 5400 10000 5500
Entry Wire Line
	9900 5500 10000 5600
Entry Wire Line
	9900 5600 10000 5700
Entry Wire Line
	9900 5700 10000 5800
Entry Wire Line
	8650 5400 8750 5500
Entry Wire Line
	8650 5500 8750 5600
Entry Wire Line
	8650 5600 8750 5700
Entry Wire Line
	8650 5700 8750 5800
Entry Wire Line
	9250 2650 9350 2750
Entry Wire Line
	9250 2750 9350 2850
Entry Wire Line
	9250 2950 9350 3050
Entry Wire Line
	9250 3050 9350 3150
Entry Wire Line
	9250 3200 9350 3300
Entry Wire Line
	9250 3300 9350 3400
Entry Wire Line
	9250 3450 9350 3550
Entry Wire Line
	9250 3550 9350 3650
Entry Wire Line
	9250 3700 9350 3800
Entry Wire Line
	9250 3800 9350 3900
Entry Wire Line
	9250 3950 9350 4050
Entry Wire Line
	9250 4050 9350 4150
Entry Wire Line
	9250 4200 9350 4300
Entry Wire Line
	9250 4300 9350 4400
Entry Wire Line
	9250 4450 9350 4550
Entry Wire Line
	9250 4550 9350 4650
Wire Bus Line
	9350 4700 9900 4700
Wire Wire Line
	9050 2650 9250 2650
Wire Wire Line
	9050 2750 9250 2750
Wire Wire Line
	8750 5700 8950 5700
Wire Wire Line
	8750 5800 8950 5800
Text Label 9100 2650 0    50   ~ 0
SD7
Text Label 9100 2750 0    50   ~ 0
SC7
Text Label 8800 5800 0    50   ~ 0
SD7
Text Label 8800 5700 0    50   ~ 0
SC7
Wire Wire Line
	9050 2950 9250 2950
Wire Wire Line
	9050 3050 9250 3050
Wire Wire Line
	9050 3200 9250 3200
Wire Wire Line
	9050 3300 9250 3300
Wire Wire Line
	9050 3450 9250 3450
Wire Wire Line
	9050 3550 9250 3550
Wire Wire Line
	9050 3700 9250 3700
Wire Wire Line
	9050 3800 9250 3800
Wire Wire Line
	9050 3950 9250 3950
Wire Wire Line
	9050 4050 9250 4050
Wire Wire Line
	9050 4200 9250 4200
Wire Wire Line
	9050 4300 9250 4300
Wire Wire Line
	9050 4450 9250 4450
Wire Wire Line
	9050 4550 9250 4550
Wire Wire Line
	10000 4000 10200 4000
Wire Wire Line
	10000 4100 10200 4100
Wire Wire Line
	10000 4200 10200 4200
Wire Wire Line
	10000 4300 10200 4300
Wire Wire Line
	10000 1000 10200 1000
Wire Wire Line
	10000 1100 10200 1100
Wire Wire Line
	10200 1200 10000 1200
Wire Wire Line
	10200 1300 10000 1300
Wire Wire Line
	10200 1400 10000 1400
Wire Wire Line
	10000 1800 10200 1800
Wire Wire Line
	10000 1900 10200 1900
Wire Wire Line
	10000 2000 10200 2000
Wire Wire Line
	10200 2100 10000 2100
Wire Wire Line
	10200 2200 10000 2200
Connection ~ 9900 4700
Wire Wire Line
	10200 2500 10000 2500
Wire Wire Line
	10200 2600 10000 2600
Wire Wire Line
	10200 2700 10000 2700
Wire Wire Line
	10200 2800 10000 2800
Wire Wire Line
	10200 3250 10000 3250
Wire Wire Line
	10200 3350 10000 3350
Wire Wire Line
	10200 3450 10000 3450
Wire Wire Line
	10200 3550 10000 3550
Wire Wire Line
	10200 4750 10000 4750
Wire Wire Line
	10200 4850 10000 4850
Wire Wire Line
	10200 4950 10000 4950
Wire Wire Line
	10200 5050 10000 5050
Wire Wire Line
	10200 5500 10000 5500
Wire Wire Line
	10200 5600 10000 5600
Wire Wire Line
	10200 5700 10000 5700
Wire Wire Line
	10200 5800 10000 5800
Wire Wire Line
	8950 5500 8750 5500
Wire Wire Line
	8750 5600 8950 5600
Text Label 8800 5500 0    50   ~ 0
+5V
Text Label 8800 5600 0    50   ~ 0
GND
Text Label 10050 5500 0    50   ~ 0
+5V
Text Label 10050 5600 0    50   ~ 0
GND
Text Label 10050 5700 0    50   ~ 0
SC6
Text Label 10050 5800 0    50   ~ 0
SD6
Text Label 10050 5050 0    50   ~ 0
SD5
Text Label 10050 4950 0    50   ~ 0
SC5
Text Label 10050 4850 0    50   ~ 0
GND
Text Label 10050 4750 0    50   ~ 0
+5V
Text Label 10050 4000 0    50   ~ 0
+5V
Text Label 10050 3250 0    50   ~ 0
+5V
Text Label 10050 2500 0    50   ~ 0
+5V
Text Label 10050 1800 0    50   ~ 0
+5V
Text Label 10050 1000 0    50   ~ 0
+5V
Text Label 10050 1100 0    50   ~ 0
GND
Text Label 10050 1900 0    50   ~ 0
GND
Text Label 10050 2600 0    50   ~ 0
GND
Text Label 10050 3350 0    50   ~ 0
GND
Text Label 10050 4100 0    50   ~ 0
GND
Text Label 10050 4200 0    50   ~ 0
SC4
Text Label 10050 4300 0    50   ~ 0
SD4
Text Label 10050 3550 0    50   ~ 0
SD3
Text Label 10050 3450 0    50   ~ 0
SC3
Text Label 10050 2800 0    50   ~ 0
SD2
Text Label 10050 2700 0    50   ~ 0
SC2
Text Label 10050 2100 0    50   ~ 0
SD1
Text Label 10050 2000 0    50   ~ 0
SC1
Text Label 10050 1300 0    50   ~ 0
SD0
Text Label 10050 1200 0    50   ~ 0
SC0
Text Label 10050 1400 0    50   ~ 0
RST
Text Label 10050 2200 0    50   ~ 0
RST
Text Label 7500 3150 0    50   ~ 0
RST
Wire Bus Line
	8650 5250 8650 6300
Wire Bus Line
	9900 4700 9900 6300
Wire Bus Line
	9350 2750 9350 4700
Wire Bus Line
	9900 800  9900 4700
Text Label 9100 2950 0    50   ~ 0
SD6
Text Label 9100 3050 0    50   ~ 0
SC6
Text Label 9100 3200 0    50   ~ 0
SD5
Text Label 9100 3300 0    50   ~ 0
SC5
Text Label 9100 3450 0    50   ~ 0
SD4
Text Label 9100 3550 0    50   ~ 0
SC4
Text Label 9100 3700 0    50   ~ 0
SD3
Text Label 9100 3800 0    50   ~ 0
SC3
Text Label 9100 3950 0    50   ~ 0
SD2
Text Label 9100 4050 0    50   ~ 0
SC2
Text Label 9100 4200 0    50   ~ 0
SD1
Text Label 9100 4300 0    50   ~ 0
SC1
Text Label 9100 4450 0    50   ~ 0
SD0
Text Label 9100 4550 0    50   ~ 0
SC0
$EndSCHEMATC

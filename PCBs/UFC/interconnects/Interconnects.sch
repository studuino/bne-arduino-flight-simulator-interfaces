EESchema Schematic File Version 2
LIBS:KiCadCustomLib
LIBS:74xgxx
LIBS:74xx
LIBS:ac-dc
LIBS:actel
LIBS:adc-dac
LIBS:allegro
LIBS:Altera
LIBS:analog_devices
LIBS:analog_switches
LIBS:atmel
LIBS:audio
LIBS:battery_management
LIBS:bbd
LIBS:bosch
LIBS:brooktre
LIBS:cmos_ieee
LIBS:cmos4000
LIBS:conn
LIBS:contrib
LIBS:cypress
LIBS:dc-dc
LIBS:device
LIBS:digital-audio
LIBS:diode
LIBS:display
LIBS:dsp
LIBS:elec-unifil
LIBS:ESD_Protection
LIBS:ftdi
LIBS:gennum
LIBS:graphic_symbols
LIBS:hc11
LIBS:infineon
LIBS:intel
LIBS:interface
LIBS:intersil
LIBS:ir
LIBS:Lattice
LIBS:leds
LIBS:LEM
LIBS:linear
LIBS:logic_programmable
LIBS:maxim
LIBS:mechanical
LIBS:memory
LIBS:microchip
LIBS:microchip_dspic33dsc
LIBS:microchip_pic10mcu
LIBS:microchip_pic12mcu
LIBS:microchip_pic16mcu
LIBS:microchip_pic18mcu
LIBS:microchip_pic24mcu
LIBS:microchip_pic32mcu
LIBS:microcontrollers
LIBS:modules
LIBS:motor_drivers
LIBS:motorola
LIBS:motors
LIBS:msp430
LIBS:nordicsemi
LIBS:nxp
LIBS:nxp_armmcu
LIBS:onsemi
LIBS:opto
LIBS:Oscillators
LIBS:philips
LIBS:power
LIBS:Power_Management
LIBS:powerint
LIBS:pspice
LIBS:references
LIBS:regul
LIBS:relays
LIBS:rfcom
LIBS:RFSolutions
LIBS:sensors
LIBS:silabs
LIBS:siliconi
LIBS:stm8
LIBS:stm32
LIBS:supertex
LIBS:switches
LIBS:texas
LIBS:transf
LIBS:transistors
LIBS:triac_thyristor
LIBS:ttl_ieee
LIBS:valves
LIBS:video
LIBS:wiznet
LIBS:Worldsemi
LIBS:Xicor
LIBS:xilinx
LIBS:zetex
LIBS:Zilog
LIBS:UFC-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 1350 3850 0    80   ~ 0
PANEL MOUNTED UFC SWITCHES\n(BRT/VOL2/ADF/VOL1)
Text Notes 1550 3100 1    80   ~ 0
COMM 1/2 ENCODERS
$Comp
L Conn_01x04_Female J10
U 1 1 5A436125
P 1800 1800
F 0 "J10" H 1800 2000 50  0000 C CNN
F 1 "COM1 ENC" H 1800 1500 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm_SMD_Pin1Left" H 1800 1800 50  0001 C CNN
F 3 "" H 1800 1800 50  0001 C CNN
	1    1800 1800
	-1   0    0    -1  
$EndComp
$Comp
L Conn_02x04_Counter_Clockwise J16
U 1 1 5A436145
P 9600 3550
F 0 "J16" H 9650 3750 50  0000 C CNN
F 1 "AP BTNS " H 9650 3250 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x04_Pitch2.54mm_SMD" H 9600 3550 50  0001 C CNN
F 3 "" H 9600 3550 50  0001 C CNN
	1    9600 3550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR063
U 1 1 5A43614C
P 9400 3750
F 0 "#PWR063" H 9400 3500 50  0001 C CNN
F 1 "GND" H 9400 3600 50  0000 C CNN
F 2 "" H 9400 3750 50  0001 C CNN
F 3 "" H 9400 3750 50  0001 C CNN
	1    9400 3750
	1    0    0    -1  
$EndComp
Text Label 9900 3550 0    60   ~ 0
30
Text Label 9900 3450 0    60   ~ 0
31
Text Label 9400 3650 2    60   ~ 0
32
Text Label 9900 3750 0    60   ~ 0
33
Text Label 9400 3450 2    60   ~ 0
34
Text Label 9900 3650 0    60   ~ 0
35
Text Label 9400 3550 2    60   ~ 0
36
Text Notes 8750 3350 0    80   ~ 0
AP PANEL
Text Notes 4700 3200 0    80   ~ 0
HUD PANEL
Text Notes 4700 1650 2    80   ~ 0
HUD BIT TEST
$Comp
L Conn_01x04_Female J14
U 1 1 5A436185
P 5050 2250
F 0 "J14" H 5050 2450 50  0000 C CNN
F 1 "HUD BIT" H 5200 1950 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm_SMD_Pin1Left" H 5050 2250 50  0001 C CNN
F 3 "" H 5050 2250 50  0001 C CNN
	1    5050 2250
	1    0    0    -1  
$EndComp
$Comp
L Rotary_Encoder_Switch SW21
U 1 1 5A4368A8
P 2700 1850
F 0 "SW21" V 2550 1550 50  0000 C CNN
F 1 "COMM 1 ENCODER" V 3200 1850 50  0000 C CNN
F 2 "KiCAD Libraries:BLANK_SYMBOL_NOT_FOR_ROUTING" H 2600 2010 50  0001 C CNN
F 3 "" H 2700 2110 50  0001 C CNN
F 4 "PEC11R-4220F-S0012" V 2700 1850 60  0001 C CNN "PN"
	1    2700 1850
	0    1    1    0   
$EndComp
$Comp
L Conn_01x04_Female J11
U 1 1 5A437CBE
P 1800 2850
F 0 "J11" H 1800 3050 50  0000 C CNN
F 1 "COM2 ENC" H 1800 2550 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm_SMD_Pin1Left" H 1800 2850 50  0001 C CNN
F 3 "" H 1800 2850 50  0001 C CNN
	1    1800 2850
	-1   0    0    -1  
$EndComp
$Comp
L Rotary_Encoder_Switch SW22
U 1 1 5A437CC4
P 2700 2900
F 0 "SW22" V 2550 2600 50  0000 C CNN
F 1 "COMM 2 ENCODER" V 3200 2900 50  0000 C CNN
F 2 "KiCAD Libraries:BLANK_SYMBOL_NOT_FOR_ROUTING" H 2600 3060 50  0001 C CNN
F 3 "" H 2700 3160 50  0001 C CNN
F 4 "PEC11R-4220F-S0012" V 2700 2900 60  0001 C CNN "PN"
	1    2700 2900
	0    1    1    0   
$EndComp
$Comp
L Conn_02x03_Counter_Clockwise J12
U 1 1 5A430F81
P 2350 4200
F 0 "J12" H 2400 4400 50  0000 C CNN
F 1 "BRT/COMM2" H 2400 4000 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x03_Pitch2.54mm_SMD" H 2350 4200 50  0001 C CNN
F 3 "" H 2350 4200 50  0001 C CNN
	1    2350 4200
	1    0    0    -1  
$EndComp
$Comp
L POT RV1
U 1 1 5A430FF9
P 1950 4200
F 0 "RV1" V 1775 4200 50  0000 C CNN
F 1 "UFC BRT" V 1850 4200 50  0000 C CNN
F 2 "KiCAD Libraries:BLANK_SYMBOL_NOT_FOR_ROUTING" H 1950 4200 50  0001 C CNN
F 3 "" H 1950 4200 50  0001 C CNN
F 4 "EVU-F2MFL3B14" V 1950 4200 60  0001 C CNN "PN"
	1    1950 4200
	1    0    0    -1  
$EndComp
$Comp
L POT RV2
U 1 1 5A4313B0
P 2850 4200
F 0 "RV2" V 2675 4200 50  0000 C CNN
F 1 "COMM 2 VOL" V 2750 4200 50  0000 C CNN
F 2 "KiCAD Libraries:BLANK_SYMBOL_NOT_FOR_ROUTING" H 2850 4200 50  0001 C CNN
F 3 "" H 2850 4200 50  0001 C CNN
F 4 "EVU-F2MFL3B14" V 2850 4200 60  0001 C CNN "PN"
	1    2850 4200
	-1   0    0    -1  
$EndComp
$Comp
L Conn_02x03_Counter_Clockwise J13
U 1 1 5A4318D4
P 2350 4900
F 0 "J13" H 2400 5100 50  0000 C CNN
F 1 "ADF/COMM1" H 2400 4700 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x03_Pitch2.54mm_SMD" H 2350 4900 50  0001 C CNN
F 3 "" H 2350 4900 50  0001 C CNN
	1    2350 4900
	1    0    0    -1  
$EndComp
$Comp
L POT RV3
U 1 1 5A431973
P 2850 4900
F 0 "RV3" V 2675 4900 50  0000 C CNN
F 1 "COMM 1 VOL" V 2750 4900 50  0000 C CNN
F 2 "KiCAD Libraries:BLANK_SYMBOL_NOT_FOR_ROUTING" H 2850 4900 50  0001 C CNN
F 3 "" H 2850 4900 50  0001 C CNN
F 4 "EVU-F2MFL3B14" V 2850 4900 60  0001 C CNN "PN"
	1    2850 4900
	-1   0    0    -1  
$EndComp
$Comp
L SW_SP3T SW20
U 1 1 5A431B85
P 1800 4900
F 0 "SW20" H 1800 5100 50  0000 C CNN
F 1 "ADF 1/OFF/2" H 1800 4700 50  0000 C CNN
F 2 "KiCAD Libraries:BLANK_SYMBOL_NOT_FOR_ROUTING" H 1175 5075 50  0001 C CNN
F 3 "" H 1175 5075 50  0001 C CNN
F 4 "100SP3T2B3M2RE" H 1800 4900 60  0001 C CNN "PN"
	1    1800 4900
	1    0    0    -1  
$EndComp
NoConn ~ 2000 4900
$Comp
L SW_Push SW26
U 1 1 5A43351D
P 4100 2800
F 0 "SW26" H 4150 2900 50  0000 L CNN
F 1 "BIT START" H 4100 2740 50  0000 C CNN
F 2 "KiCAD Libraries:BLANK_SYMBOL_NOT_FOR_ROUTING" H 4100 3000 50  0001 C CNN
F 3 "" H 4100 3000 50  0001 C CNN
F 4 "30-3UL" H 4100 2800 60  0001 C CNN "PN"
	1    4100 2800
	1    0    0    -1  
$EndComp
$Comp
L LED D11
U 1 1 5A433580
P 4050 2000
F 0 "D11" H 4050 2100 50  0000 C CNN
F 1 "BIT GO" H 4050 1850 50  0000 C CNN
F 2 "KiCAD Libraries:BLANK_SYMBOL_NOT_FOR_ROUTING" H 4050 2000 50  0001 C CNN
F 3 "" H 4050 2000 50  0001 C CNN
F 4 "334-15/X1C5-1QSA" H 4050 2000 60  0001 C CNN "PN"
	1    4050 2000
	1    0    0    -1  
$EndComp
$Comp
L LED D12
U 1 1 5A4335DA
P 4050 2400
F 0 "D12" H 4050 2500 50  0000 C CNN
F 1 "BIT NOGO" H 4050 2250 50  0000 C CNN
F 2 "KiCAD Libraries:BLANK_SYMBOL_NOT_FOR_ROUTING" H 4050 2400 50  0001 C CNN
F 3 "" H 4050 2400 50  0001 C CNN
F 4 "334-15/X1C5-1QSA" H 4050 2400 60  0001 C CNN "PN"
	1    4050 2400
	1    0    0    -1  
$EndComp
$Comp
L R R10
U 1 1 5A433AA7
P 4400 2000
F 0 "R10" V 4480 2000 50  0000 C CNN
F 1 "100" V 4400 2000 50  0000 C CNN
F 2 "KiCAD Libraries:BLANK_SYMBOL_NOT_FOR_ROUTING" V 4330 2000 50  0001 C CNN
F 3 "" H 4400 2000 50  0001 C CNN
	1    4400 2000
	0    1    1    0   
$EndComp
$Comp
L R R11
U 1 1 5A433BF2
P 4400 2400
F 0 "R11" V 4480 2400 50  0000 C CNN
F 1 "100" V 4400 2400 50  0000 C CNN
F 2 "KiCAD Libraries:BLANK_SYMBOL_NOT_FOR_ROUTING" V 4330 2400 50  0001 C CNN
F 3 "" H 4400 2400 50  0001 C CNN
	1    4400 2400
	0    1    1    0   
$EndComp
Wire Notes Line
	1350 1350 3350 1350
Wire Notes Line
	8700 3200 10100 3200
Wire Notes Line
	10100 3200 10100 3950
Wire Notes Line
	10100 3950 8700 3950
Wire Notes Line
	8700 3950 8700 3200
Wire Notes Line
	3700 2950 3700 1500
Wire Wire Line
	2000 1700 2200 1700
Wire Wire Line
	2200 1450 2200 2150
Wire Wire Line
	2200 1450 2700 1450
Wire Wire Line
	2700 1450 2700 1550
Wire Wire Line
	2200 2150 2600 2150
Connection ~ 2200 1700
Wire Wire Line
	2000 1800 2150 1800
Wire Wire Line
	2150 1800 2150 2200
Wire Wire Line
	2150 2200 2800 2200
Wire Wire Line
	2800 2200 2800 2150
Wire Wire Line
	2000 1900 2100 1900
Wire Wire Line
	2100 1900 2100 2250
Wire Wire Line
	2100 2250 3000 2250
Wire Wire Line
	3000 2250 3000 1550
Wire Wire Line
	3000 1550 2800 1550
Wire Wire Line
	2600 1400 2600 1550
Wire Wire Line
	2000 2000 2050 2000
Wire Wire Line
	2050 2000 2050 2300
Wire Wire Line
	2050 2300 3050 2300
Wire Wire Line
	3050 2300 3050 1400
Wire Wire Line
	3050 1400 2600 1400
Wire Wire Line
	2000 2750 2200 2750
Wire Wire Line
	2200 2500 2200 3200
Wire Wire Line
	2200 2500 2700 2500
Wire Wire Line
	2700 2500 2700 2600
Wire Wire Line
	2200 3200 2600 3200
Connection ~ 2200 2750
Wire Wire Line
	2000 2850 2150 2850
Wire Wire Line
	2150 2850 2150 3250
Wire Wire Line
	2150 3250 2800 3250
Wire Wire Line
	2800 3250 2800 3200
Wire Wire Line
	2000 2950 2100 2950
Wire Wire Line
	2100 2950 2100 3300
Wire Wire Line
	2100 3300 3000 3300
Wire Wire Line
	3000 3300 3000 2600
Wire Wire Line
	3000 2600 2800 2600
Wire Wire Line
	2600 2450 2600 2600
Wire Wire Line
	2000 3050 2050 3050
Wire Wire Line
	2050 3050 2050 3350
Wire Wire Line
	2050 3350 3050 3350
Wire Wire Line
	3050 3350 3050 2450
Wire Wire Line
	3050 2450 2600 2450
Wire Notes Line
	1350 1350 1350 3500
Wire Notes Line
	1350 3500 3350 3500
Wire Notes Line
	3350 3500 3350 1350
Wire Wire Line
	2150 4050 2150 4100
Wire Wire Line
	2150 4350 2150 4300
Wire Wire Line
	2650 4050 2650 4100
Wire Wire Line
	2650 4350 2650 4300
Wire Wire Line
	2150 4200 2100 4200
Wire Wire Line
	2150 4050 1950 4050
Wire Wire Line
	1950 4350 2150 4350
Wire Wire Line
	2650 4350 2850 4350
Wire Wire Line
	2850 4050 2650 4050
Wire Wire Line
	2650 4200 2700 4200
Wire Wire Line
	2850 4750 2650 4750
Wire Wire Line
	2650 4750 2650 4800
Wire Wire Line
	2700 4900 2650 4900
Wire Wire Line
	2650 5000 2650 5050
Wire Wire Line
	2650 5050 2850 5050
Wire Wire Line
	1600 4750 1600 4900
Wire Wire Line
	1600 4750 2150 4750
Wire Wire Line
	2150 4750 2150 4800
Wire Wire Line
	2000 4800 2100 4800
Wire Wire Line
	2100 4800 2100 4900
Wire Wire Line
	2100 4900 2150 4900
Wire Wire Line
	2000 5000 2150 5000
Wire Notes Line
	1350 3600 3350 3600
Wire Notes Line
	3350 3600 3350 5250
Wire Notes Line
	3350 5250 1350 5250
Wire Notes Line
	1350 5250 1350 3600
Wire Wire Line
	4750 1750 3800 1750
Wire Wire Line
	3800 1750 3800 2800
Wire Wire Line
	3800 2000 3900 2000
Wire Wire Line
	3800 2400 3900 2400
Connection ~ 3800 2000
Wire Wire Line
	3800 2800 3900 2800
Connection ~ 3800 2400
Wire Wire Line
	4300 2800 4750 2800
Wire Wire Line
	4750 2800 4750 2450
Wire Wire Line
	4750 2450 4850 2450
Wire Wire Line
	4750 1750 4750 2150
Wire Wire Line
	4750 2150 4850 2150
Wire Wire Line
	4850 2250 4650 2250
Wire Wire Line
	4650 2250 4650 2000
Wire Wire Line
	4650 2000 4550 2000
Wire Wire Line
	4250 2000 4200 2000
Wire Wire Line
	4200 2400 4250 2400
Wire Wire Line
	4550 2400 4650 2400
Wire Wire Line
	4650 2400 4650 2350
Wire Wire Line
	4650 2350 4850 2350
Wire Notes Line
	3700 1500 5450 1500
Wire Notes Line
	5450 1500 5450 2950
Wire Notes Line
	5450 2950 3700 2950
$Comp
L Conn_02x08_Counter_Clockwise J15
U 1 1 5A434BBE
P 5250 3900
F 0 "J15" H 5300 4300 50  0000 C CNN
F 1 "HUD PANL" H 5300 3400 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x08_Pitch2.54mm_SMD" H 5250 3900 50  0001 C CNN
F 3 "" H 5250 3900 50  0001 C CNN
	1    5250 3900
	1    0    0    -1  
$EndComp
$Comp
L POT RV4
U 1 1 5A434C92
P 4050 4100
F 0 "RV4" V 3875 4100 50  0000 C CNN
F 1 "BRT" V 3950 4100 50  0000 C CNN
F 2 "KiCAD Libraries:BLANK_SYMBOL_NOT_FOR_ROUTING" H 4050 4100 50  0001 C CNN
F 3 "" H 4050 4100 50  0001 C CNN
F 4 "EVU-F2MFL3B14" V 4050 4100 60  0001 C CNN "PN"
	1    4050 4100
	1    0    0    -1  
$EndComp
$Comp
L SW_SPDT SW24
U 1 1 5A435146
P 4000 4550
F 0 "SW24" H 4000 4720 50  0000 C CNN
F 1 "DAY/NIGHT" H 4050 4350 50  0000 C CNN
F 2 "KiCAD Libraries:BLANK_SYMBOL_NOT_FOR_ROUTING" H 4000 4550 50  0001 C CNN
F 3 "" H 4000 4550 50  0001 C CNN
F 4 "100SP1T8B13M1QEH" H 4000 4550 60  0001 C CNN "PN"
	1    4000 4550
	1    0    0    -1  
$EndComp
$Comp
L SW_SP3T SW23
U 1 1 5A4351E3
P 4000 3600
F 0 "SW23" H 4000 3800 50  0000 C CNN
F 1 "NORM/REJ" H 4050 3400 50  0000 C CNN
F 2 "KiCAD Libraries:BLANK_SYMBOL_NOT_FOR_ROUTING" H 3375 3775 50  0001 C CNN
F 3 "" H 3375 3775 50  0001 C CNN
F 4 "100SP3T8B13M1QEH" H 4000 3600 60  0001 C CNN "PN"
	1    4000 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 3600 4950 3600
Wire Wire Line
	4950 3600 4950 3300
Wire Wire Line
	3800 3300 6250 3300
Wire Wire Line
	3800 3300 3800 5100
Connection ~ 3800 3600
Wire Wire Line
	3800 4300 4050 4300
Wire Wire Line
	4050 4300 4050 4250
Connection ~ 3800 4300
NoConn ~ 4200 3600
NoConn ~ 4200 4650
Wire Wire Line
	4200 3500 4900 3500
Wire Wire Line
	4900 3500 4900 3800
Wire Wire Line
	4900 3800 5050 3800
Wire Wire Line
	4200 3700 4850 3700
Wire Wire Line
	4850 3700 4850 3900
Wire Wire Line
	4850 3900 5050 3900
Wire Wire Line
	4200 4100 4850 4100
Wire Wire Line
	4850 4100 4850 4000
Wire Wire Line
	4850 4000 5050 4000
Wire Wire Line
	5050 4100 4900 4100
Wire Wire Line
	4900 4100 4900 4450
Wire Wire Line
	4900 4450 4200 4450
Wire Wire Line
	3750 3900 4050 3900
Wire Wire Line
	3750 3900 3750 3250
Wire Wire Line
	3750 3250 6200 3250
Wire Wire Line
	5000 3250 5000 3700
Wire Wire Line
	5000 3700 5050 3700
Wire Wire Line
	4050 3900 4050 3950
$Comp
L SW_SP3T SW25
U 1 1 5A435E01
P 4000 5100
F 0 "SW25" H 4000 5300 50  0000 C CNN
F 1 "BLK LVL" H 4000 4900 50  0000 C CNN
F 2 "KiCAD Libraries:BLANK_SYMBOL_NOT_FOR_ROUTING" H 3375 5275 50  0001 C CNN
F 3 "" H 3375 5275 50  0001 C CNN
F 4 "100SP3T8B13M1QEH" H 4000 5100 60  0001 C CNN "PN"
	1    4000 5100
	1    0    0    -1  
$EndComp
Connection ~ 3800 4550
Wire Wire Line
	4200 5000 4950 5000
Wire Wire Line
	4950 5000 4950 4200
Wire Wire Line
	4950 4200 5050 4200
Wire Wire Line
	5050 4300 5000 4300
Wire Wire Line
	5000 4300 5000 5200
Wire Wire Line
	5000 5200 4200 5200
NoConn ~ 4200 5100
$Comp
L POT RV5
U 1 1 5A43639D
P 5950 3600
F 0 "RV5" V 5775 3600 50  0000 C CNN
F 1 "BAL" V 5850 3600 50  0000 C CNN
F 2 "KiCAD Libraries:BLANK_SYMBOL_NOT_FOR_ROUTING" H 5950 3600 50  0001 C CNN
F 3 "" H 5950 3600 50  0001 C CNN
F 4 "EVU-F2MFL3B14" V 5950 3600 60  0001 C CNN "PN"
	1    5950 3600
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6250 3300 6250 5400
Wire Wire Line
	6250 3750 5950 3750
Connection ~ 4950 3300
Wire Wire Line
	6200 3250 6200 3850
Wire Wire Line
	6200 3450 5950 3450
Connection ~ 5000 3250
Wire Wire Line
	5800 3600 5550 3600
$Comp
L POT RV6
U 1 1 5A43666C
P 5950 4000
F 0 "RV6" V 5775 4000 50  0000 C CNN
F 1 "AOA" V 5850 4000 50  0000 C CNN
F 2 "KiCAD Libraries:BLANK_SYMBOL_NOT_FOR_ROUTING" H 5950 4000 50  0001 C CNN
F 3 "" H 5950 4000 50  0001 C CNN
F 4 "EVU-F2MFL3B14" V 5950 4000 60  0001 C CNN "PN"
	1    5950 4000
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6200 3850 5950 3850
Connection ~ 6200 3450
Wire Wire Line
	6250 4150 5950 4150
Connection ~ 6250 3750
Wire Wire Line
	5800 4000 5800 3700
Wire Wire Line
	5800 3700 5550 3700
$Comp
L SW_SP3T SW27
U 1 1 5A4369F8
P 6050 4450
F 0 "SW27" H 6050 4650 50  0000 C CNN
F 1 "W/B /VID" H 6100 4250 50  0000 C CNN
F 2 "KiCAD Libraries:BLANK_SYMBOL_NOT_FOR_ROUTING" H 5425 4625 50  0001 C CNN
F 3 "" H 5425 4625 50  0001 C CNN
F 4 "100SP3T8B13M1QEH" H 6050 4450 60  0001 C CNN "PN"
	1    6050 4450
	-1   0    0    -1  
$EndComp
$Comp
L SW_SP3T SW29
U 1 1 5A436AAA
P 6050 5400
F 0 "SW29" H 6050 5600 50  0000 C CNN
F 1 "ATT" H 6100 5200 50  0000 C CNN
F 2 "KiCAD Libraries:BLANK_SYMBOL_NOT_FOR_ROUTING" H 5425 5575 50  0001 C CNN
F 3 "" H 5425 5575 50  0001 C CNN
F 4 "100SP3T8B13M1QEH" H 6050 5400 60  0001 C CNN "PN"
	1    6050 5400
	-1   0    0    -1  
$EndComp
$Comp
L SW_SPDT SW28
U 1 1 5A436B25
P 6050 4900
F 0 "SW28" H 6050 5070 50  0000 C CNN
F 1 "ALT" H 6100 4700 50  0000 C CNN
F 2 "KiCAD Libraries:BLANK_SYMBOL_NOT_FOR_ROUTING" H 6050 4900 50  0001 C CNN
F 3 "" H 6050 4900 50  0001 C CNN
F 4 "100SP1T8B13M1QEH" H 6050 4900 60  0001 C CNN "PN"
	1    6050 4900
	-1   0    0    -1  
$EndComp
Connection ~ 6250 4150
Connection ~ 6250 4450
Connection ~ 6250 4900
NoConn ~ 5850 4450
NoConn ~ 5850 5000
NoConn ~ 5850 5400
Wire Wire Line
	5850 4350 5850 4050
Wire Wire Line
	5850 4050 5750 4050
Wire Wire Line
	5750 4050 5750 3800
Wire Wire Line
	5750 3800 5550 3800
Wire Wire Line
	5850 4550 5800 4550
Wire Wire Line
	5800 4550 5800 4100
Wire Wire Line
	5800 4100 5700 4100
Wire Wire Line
	5700 4100 5700 3900
Wire Wire Line
	5700 3900 5550 3900
Wire Wire Line
	5850 4800 5750 4800
Wire Wire Line
	5750 4800 5750 4150
Wire Wire Line
	5750 4150 5650 4150
Wire Wire Line
	5650 4150 5650 4000
Wire Wire Line
	5650 4000 5550 4000
Wire Wire Line
	5850 5300 5700 5300
Wire Wire Line
	5700 5300 5700 4200
Wire Wire Line
	5700 4200 5600 4200
Wire Wire Line
	5600 4200 5600 4100
Wire Wire Line
	5600 4100 5550 4100
Wire Wire Line
	5850 5500 5650 5500
Wire Wire Line
	5650 5500 5650 4300
Wire Wire Line
	5650 4300 5550 4300
Wire Notes Line
	3700 3050 6350 3050
Wire Notes Line
	6350 3050 6350 5700
Wire Notes Line
	6350 5700 3700 5700
Wire Notes Line
	3700 5700 3700 3050
$EndSCHEMATC

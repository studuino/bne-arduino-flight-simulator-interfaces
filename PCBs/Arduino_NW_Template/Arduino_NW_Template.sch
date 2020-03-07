EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 4900 1050 0    50   ~ 0
Connector_PinHeader_2.54mm:PinHeader_1x10_P2.54mm_Vertical
$Comp
L Arduino_NW_Template-rescue:PT_Conn_01x06 J2
U 1 1 5E66B8DF
P 4150 5750
F 0 "J2" H 4230 5742 50  0000 L CNN
F 1 "PT_Conn_01x06" H 4230 5651 50  0000 L CNN
F 2 "PT_Library_v001:PT_Ethernet_Shield_v001" H 4150 5750 50  0001 C CNN
F 3 "~" H 4150 5750 50  0001 C CNN
	1    4150 5750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5E675100
P 3300 6150
F 0 "R1" H 3370 6196 50  0000 L CNN
F 1 "R" H 3370 6105 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Vertical" V 3230 6150 50  0001 C CNN
F 3 "~" H 3300 6150 50  0001 C CNN
	1    3300 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 6050 3700 6050
Wire Wire Line
	3700 6050 3700 6300
Wire Wire Line
	3700 6300 3300 6300
Wire Wire Line
	3950 5950 3300 5950
Wire Wire Line
	3300 5950 3300 6000
$EndSCHEMATC

#!/usr/bin/python

# Arduino Sendor Emulator
# https://github.com/bnepethomas/bne-arduino-flight-simulator-interfaces


# Emulates a Arduino running OverPros Joystick interface with a Ethernet shield
# As we aren't exposed to an any Joystick button limits, there are 256 buttons supported
# Instead of using the stub to provide a Joystick via USB, delta are sent to a
# process running on a Raspberry Pi which maps these deltas to commands for the Sim
#
# The Arduino code is independant of the aircraft and simulator that is running,
# which simplifies its operation.
#
# There is a receive operation where the Arduino will report the state of all
# 256 inputs.  This will be spread across several packets with a 300mS delay between
# the packets.  The trigger packet is a simple 'CQ'




import argparse
import numbers
import os
import re
import socket
import sys
import time


import random


# Global Variables
Input_Module_Numer = 0
debugging = False
total_entries = 10
likelihood_of_change = 0.505
# 0.0.0.0 will listen on all addresses, other specify desired source address
UDP_IP = "0.0.0.0"
UDP_PORT = 7788
UDP_Reflector_IP = "127.0.0.1"
UDP_Reflector_Port = 27000

Source_IP = 0
Source_Port = 0
Last_Source_IP = "127.0.0.1"

# Initialise array to 0 
switch_array = []
counter = 0
while counter < total_entries:
    switch_array.append(0)
    counter = counter + 1
print('There are ' + str(len(switch_array)) + ' switches')
print(switch_array)


# Randonmise initial values
counter = 0
while counter < total_entries:
    
    if random.random() > 0.5:
        switch_array[counter] = 1
    else:
        switch_array[counter] = 0
    counter = counter + 1
print(switch_array)


def Send_UDP_Command(command_to_send):
    UDP_IP = "127.0.0.1"
    TX_UDP_PORT = 26027

    global UDP_Reflector_IP, UDP_Reflector_Port


    if debugging: print ("UDP target IP:" + UDP_IP)
    if debugging: print ("UDP target port:" + str(TX_UDP_PORT))

    txsock = socket.socket(socket.AF_INET, # Internet
                     socket.SOCK_DGRAM) # UDP

    reflector_sock = socket.socket(socket.AF_INET, # Internet
                     socket.SOCK_DGRAM) # UDP

    

    txsock.sendto("00:098:1,02:003:0", (UDP_IP, TX_UDP_PORT))
    reflector_sock.sendto("00:098:1,02:003:0", (UDP_Reflector_IP, UDP_Reflector_Port))



def SendAllSwitchStates():
    print ("Sending Switch States")



# Setup inputs and outputs


sock = socket.socket(socket.AF_INET, # Internet
                     socket.SOCK_DGRAM) # UDP
sock.bind((UDP_IP, UDP_PORT))

# Act on global var

while True:
    try:
       while True:
          print(time.asctime()) 
          Send_UDP_Command("C15,3004,-1")

          counter = 0
          while counter < total_entries:           
            if (random.random() * likelihood_of_change) > 0.5:
                print('Changing Switch '  + str(counter))
                if switch_array[counter] == 0:
                    switch_array[counter] = 1
                else:
                    switch_array[counter] = 0
                Send_UDP_Command(str(Input_Module_Numer) + ':' + %2d %counter + ':' + str(switch_array[counter]))
            counter = counter + 1
          print(switch_array)

          
          sock.settimeout(0.25)
          data, (Source_IP, Source_Port) = sock.recvfrom(1500) # buffer size is 1024 bytes
          if (Source_IP != Last_Source_IP):
            Last_Source_IP = Source_IP  
            print ("New Source Address Found")
            SendAllSwitchStates()
          
          
          
          #print "received message:", data
          words = data.split(":")
          #print words



          for current_word in words:
                #print(current_word)
                #print(len(current_word))

                # Basic sanity check to catch values that are too short
                if len(current_word) >= 3:
                    values = current_word.split("=")
                    #print values
                    #print values[0] + "+" + values[1]

                    if values[0] == '91':
                        print ("Handling 91-lamp_ENGINE_OIL_PRESS")


                    if values[0] == '999':
                        print ("Handling SHUTDOWN")
                        if values[1] == "ShutdownAndHalt":
                            # Stop listening on original port
                            sock.close()
                            ShutdownAndHalt()
                        elif values[1] == "Reboot":
                            # Stop listening on original port
                            sock.close()
                            Reboot()                                      
                        else:
                            print ("Received a Invalid Shutdown Request")


    


    except socket.timeout:
        print(time.asctime() + " timeout")       
        continue
        

    except KeyboardInterrupt:
        # Catch Ctl-C and quit
        sys.exit(0)
        
    except Exception as other:
        print(time.asctime() + "[e] Error in Main: " + str(other))
        continue
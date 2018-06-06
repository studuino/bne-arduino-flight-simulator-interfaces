#!/usr/bin/python

# UDP_Test_Sender - Interactive sender of UDP Test Data
# https://github.com/bnepethomas/bne-arduino-flight-simulator-interfaces


import logging
import os
import socket
import sys
import time


import random




# Global Variables
debugging = True
command_string = ''
prefix_with_D = ''
target_IP  = ''
target_Port = ''


UDP_IP = "0.0.0.0"
UDP_PORT = 26029
UDP_Reflector_IP = "127.0.0.1"
UDP_Reflector_Port = 27000

Source_IP = 0
Source_Port = 0
Last_Source_IP = "127.0.0.1"


#logging.basicConfig(format='%(asctime)s:%(levelname)s:%(message)s',level=logging.DEBUG)
logging.basicConfig(format='%(asctime)s:%(levelname)s:%(message)s')



sock = socket.socket(socket.AF_INET, # Internet
                     socket.SOCK_DGRAM) # UDP
sock.bind((UDP_IP, UDP_PORT))







def Send_UDP_Command(command_to_send):


    global sock



    try:

        logging.debug('UDP target IP: ' + str(target_IP)
                             + '  UDP target port: ' + str(target_Port))
        logging.debug('Sending: "' + command_to_send + '"')
        
        sock.sendto(command_to_send,
                    (target_IP , target_Port))
        sock.sendto(command_to_send,
                    (UDP_Reflector_IP, UDP_Reflector_Port))

    

    except Exception as other:
        logging.critical('Error in Send_UDP_Command: ' + str(other))




def main():


    global prefix_with_D
    global target_IP, target_Port

    try:
        print('UDP_Test_Sender - ctl-c at anytime to exit')
        print('')
        target_IP = raw_input('Enter Target IP Address [127.0.0.1]: ')
        if len(target_IP) == 0:
            target_IP = '127.0.0.1'



        target_Port = ''
        while not isinstance(target_Port, int):
            target_Port = raw_input('Enter Target Port [27000]: ')
            if len(target_Port) == 0:
                target_Port = 27000
            try:
                target_Port = int(target_Port)
                
            except:
                target_Port = ''
                print('Target Port needs to be an integer between 1 and 65535')

        prefix_with_D = raw_input(
            'Would you like all commands to be prefex with a D [Y]: ')
        if prefix_with_D.upper() != 'N':
            prefix_with_D = True
        else:
            prefix_with_D = False


        logging.debug('UDP target IP: ' + str(target_IP)
                             + '  UDP target Port: ' + str(target_Port))       
        


        while True:


            command_string = raw_input('Enter Command String to Send: ')

            if prefix_with_D:
                command_string = 'D' + command_string

            Send_UDP_Command(command_string)

            

    except KeyboardInterrupt:
        # Catch Ctl-C and quit
        print('Exiting')
        print('')
        sock.close()
        sys.exit(0)
        
    except Exception as other:
        logging.critical('[e] Error in Main: ' + str(other))




main()
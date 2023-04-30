# switchinputs



# Find the values
You will have to figure out what the correct command is that you have to send to your devices for them to switch.

Switch MX Mechanical to input 2:

'''hidapitester --vidpid 046D/C548 --usage 0x0001 --usagePage 0xFF00 --open --length 7 --send-output 0x10,0x01,0x09,0x1C,0x01,0x00,0x00'''

Switch Lift mouse to inpute 3:
'''hidapitester --vidpid 046D/C548 --usage 0x0001 --usagePage 0xFF00 --open --length 7 --send-output 0x10,0x02,0x0A,0x1C,0x02,0x00,0x00'''

***--vidpid 046D:C52B***  
This is the ID of the Logitech Bolt receiver. Normally this ID is the same for all receivers. 
In Linux you can easily find this by running the '''lsusb''' commmand in a terminal.

These are the default parameters.

***--usage 0x0001***  
***--usagePage 0xFF00***  
***--open***  
***--length 7***  

These are the bytes that are sent to the bolt receiver.

***--send-output 0x10,0x01,0x09,0x1C,0x01,0x00,0x00**  

MX Mechanical Keyboard:
| Header | Slot | CHANGE HOST | Magic number | Input | Padding | Padding |
|--------|------|-------------|--------------|-------|---------|---------|
|  0x10  | 0x01 |     0x09    |     0x1C     | 0x01  |  0x00   |  0x00   |

Logitech Lift Mouse:
| Header | Slot | CHANGE HOST | Magic number | Input | Padding | Padding |
|--------|------|-------------|--------------|-------|---------|---------|
|  0x10  | 0x02 |     0x0A    |     0x1C     | 0x02  |  0x00   |  0x00   |


To figure out the Slot and Host you can use the following command:

'''solaar -dd config "LIFT" change-host 2'''

You should see your mouse switch to input 2. At the end of the solaar debug log you will see something like this:

*logitech_receiver.base: (10) <= w[11 02 0A1C 01000000000000000000000000000000]*



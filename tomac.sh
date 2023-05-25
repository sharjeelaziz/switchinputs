
#!/bin/bash
# Switch Mechanical Keyboard to input 3:
./hidapitester --vidpid 046D/C548 --usage 0x0001 --usagePage 0xFF00 --open --length 7 --send-output 0x10,0x01,0x09,0x1C,0x02,0x00,0x00
# Switch Lift Mouse to input 1:
./hidapitester --vidpid 046D/C548 --usage 0x0001 --usagePage 0xFF00 --open --length 7 --send-output 0x10,0x02,0x0A,0x1C,0x02,0x00,0x00
#Switch monitor to HDMI 1
ddcutil --display 2 setvcp 0x60 0x11

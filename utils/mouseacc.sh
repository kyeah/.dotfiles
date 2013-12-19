#!/bin/bash
# Linux startup script for disabling touchpad accel
# find devices with xinput list

# Allow computer to settle down
sleep 5

xinput set-prop 'SynPS/2 Synaptics TouchPad' 'Device Accel Profile' -1
xinput set-prop 'SynPS/2 Synaptics TouchPad' 'Device Accel Constant Deceleration' 1

## Yoga 2 Pro 
xinput set-prop "SynPS/2 Synaptics TouchPad" "Device Accel Velocity Scaling" 8
xinput set-prop "SynPS/2 Synaptics TouchPad" "Synaptics Finger" 35 45 0
xinput set-prop "SynPS/2 Synaptics TouchPad" "Synaptics Coasting Speed" 5 15
xinput set-prop "SynPS/2 Synaptics TouchPad" "Synaptics Tap Time" 120
xinput set-prop "SynPS/2 Synaptics TouchPad" "Synaptics Tap Move" 300
xinput set-prop "SynPS/2 Synaptics TouchPad" "Synaptics Noise Cancellation" 20 20

synclient FingerHigh=46
synclient FingerLow=46

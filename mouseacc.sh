#!/bin/bash
# Linux startup script for disabling touchpad accel
# find devices with xinput list

# Allow computer to settle down
sleep 5

xinput set-prop 'SynPS/2 Synaptics TouchPad' 'Device Accel Profile' -1
xinput set-prop 'SynPS/2 Synaptics TouchPad' 'Device Accel Constant Deceleration' 1
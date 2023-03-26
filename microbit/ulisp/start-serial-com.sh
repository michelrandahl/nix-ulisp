#!/usr/bin/env bash
# Start serial communication with the board
# 
# test it with for example `(+ 2 2)`
picocom -b 9600 /dev/ttyACM0

#!/usr/bin/env bash
arduino-cli compile -p /dev/ttyACM0 --fqbn sandeepmistry:nRF5:BBCmicrobitV2 ulisp.ino --output-dir .

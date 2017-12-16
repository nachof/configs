#!/bin/bash

if [ -z "$1" ]; then
  echo "Need filename"
  exit 1
fi
adb shell screencap -p | sed 's/\r$//' > $1


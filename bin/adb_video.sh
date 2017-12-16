#!/bin/bash

tmpfile=/sdcard/__video_tmp_000.mp4

if [ -z "$1" ]; then
  echo "Need filename"
  exit 1
fi
if [ -z "$2" ]; then
  echo "Need time"
  exit 1
fi
adb shell screenrecord $tmpfile --time-limit $2
adb pull $tmpfile $1


#!/bin/sh

while /bin/true; do
  feh --bg-scale $(ls /home/nacho/wallpapers/* | sort -R | head -1)
  sleep 30m
done

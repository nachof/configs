#!/bin/bash

osd_cat_cmd="osd_cat -A left -p bottom -l 2 -s 1 -d 30 --age=0 --lines=1 -c red --font=-*-lucidabright-demibold-r-*-*-14-*-*-*-*-*-*-*"

time_cmd="/home/nacho/bin/pretty_time"

true="/bin/true"

update=30

(while $true; do
  $time_cmd
  echo
  sleep $update
done) | $osd_cat_cmd

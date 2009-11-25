#!/bin/bash
osd_cat_cmd="osd_cat -A right -p bottom -l 2 -s 1 -d 30"

percent_size=10
red_limit=5

while true; do
  info=$(acpi | cut -d : -f 2-)
  state=$(echo $info | cut -d, -f1)
  level=$(echo $info | cut -d, -f2 | cut -d% -f 1 | sed -e 's/\s//g')
  (( level_round=$level*$percent_size/100 ))
  (( dot_count=percent_size-level_round ))
  left=$(echo $info | cut -d, -f3)

  case $state in
    Discharging)
      color=yellow
      if [[ $level -lt $red_limit ]]; then
        color=red
      fi
      ;;
    Charging)
      color=blue
      ;;
    *)
      color=green
      ;;
  esac


  (
    if [[ -n "$left" ]]; then
      echo -n "$left, "
    fi
    echo $level%
    for n in $(eval echo {1..$level_round}); do 
      echo -n '|'
    done
    if [[ $dot_count -gt 0 ]]; then
      for n in $(eval echo {1..$dot_count}); do
        echo -n '.'
      done
    fi
  ) | $osd_cat_cmd -c $color
done

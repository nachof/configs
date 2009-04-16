#!/bin/bash

screen_available_sessions() {
  screen -ls | grep '[0-9]\+\.\w' | cut -d. -f2 | cut -f1 | grep -v '^pts-' | sort
}

dialog() {
  if [[ -n "$DISPLAY" ]]; then
    echo "Xdialog"
  else
    echo "dialog"
  fi
}

screen_open() {
  echo '#!/bin/bash' > /tmp/thiscommand
  echo '[[ -n "'$2'" ]] && echo -e "\033]2;'$2'\007"' >> /tmp/thiscommand
  echo "screen $1 $2" >> /tmp/thiscommand
  chmod u+x /tmp/thiscommand
  if [[ -n "$DISPLAY" ]]; then
    urxvt -e /tmp/thiscommand
  else
    /tmp/thiscommand
  fi
}

screen_load_or_create() {
  name=$1
  if screen_available_sessions | grep -q "^$1$"; then
    screen_open -x $1
  else
    screen_open -S $1 &
    if [[ -e ".screensession" ]]; then
      sleep 0.5
      screen -S $1 -X source .screensession
    fi
  fi
}


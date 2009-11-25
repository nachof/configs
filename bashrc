. /etc/bash_completion
. ~/.functions

set -o vi

alias ls='ls --color=auto'

alias spec='spec --color -f s'

alias ':e'=vim

screen_stuff='\[\033k\033\\\]'
PS1='\[\e[37;1m\]\u@\H\[\e[0m\] \[\e[33m\]$(__git_repo_name)$(__git_ps1 "%s) ")\[\e[0m\]\W \n\[\e[32;1m\]\$\[\e[0m\]\[\e[0m\] '$screen_stuff

eval $(keychain --eval -q)

export PATH=~/bin:$PATH

export QEMU_AUDIO_DRV=sdl
export SDL_AUDIODRIVER=alsa

export EDITOR=vim

# rvm-install added line:
if [[ -s /home/nacho/.rvm/scripts/rvm ]] ; then
  source /home/nacho/.rvm/scripts/rvm ;
  rvm use 1.8.7 &> /dev/null
fi



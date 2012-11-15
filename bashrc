. /etc/bash.bashrc
. /usr/share/bash-completion/completions/git
. /usr/share/bash-completion/bash_completion
. /usr/share/git/completion/git-prompt.sh
. ~/.functions

set -o vi

alias ls='ls --color=auto'

alias spec='spec --color -f s'

alias ':e'=vim

alias caploy='cap deploy'
alias CAPLOY='cap deploy'

screen_stuff='\[\033k\033\\\]'
PS1='\[\e[37;1m\]\u@\H\[\e[0m\] \[\e[33m\]$(__git_repo_name)$(__git_ps1 "%s) ")\[\e[0m\]\W \n\[\e[32;1m\]\$\[\e[0m\]\[\e[0m\] '$screen_stuff

eval $(keychain --eval -q)

export PATH=~/bin:$PATH:/opt/android-sdk/tools

export QEMU_AUDIO_DRV=sdl
export SDL_AUDIODRIVER=alsa

export EDITOR=vim
export BROWSER=chromium

# rvm-install added line:
if [[ -s /home/nacho/.rvm/scripts/rvm ]] ; then
  source /home/nacho/.rvm/scripts/rvm ;
  rvm use 1.9.3 &> /dev/null
  #rvm use ree &> /dev/null
  #rvm use 1.9.2 &> /dev/null
  if [[ -s $(pwd)/.rvmrc ]]; then
    rvm rvmrc load
  fi
fi

export RUBYOPT="rubygems"

fortune -s

alias grep='grep --color '

alias ssh="TERM=linux ssh"

export JAVA_HOME=/usr/lib/jvm/java-7-openjdk/jre
alias gemi="gem install --no-ri --no-rdoc"

if _inside_screen; then
  screen -X hardstatus string "%{= kG}[%= %{= kw}%?%-Lw%?%{r}(%{W}%n*%f%t%?(%u)%?%{r})%{w}%?%+Lw%?%= %{g}][%{B} $(_screen_id) %{g}]"
fi

export MANPAGER="/bin/sh -c \"unset PAGER;col -b -x | \
    vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
    -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
    -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""


alias b="bundle exec"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

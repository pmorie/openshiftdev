#!/bin/bash

# Get the aliases and functions
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

# User specific environment and startup programs
PATH=$PATH:$HOME/bin
export PATH

function log {
  echo "$(date) $1" >> /root/devenv-prep.log
}

/root/prepare-devenv.sh

prep_retcode=$?

if [ $prep_retcode == 0 ] ; then
  _byobu_sourced=1 . byobu-tmux
else
  log "Devenv preparation failed with exit code: $prep_retcode"
fi

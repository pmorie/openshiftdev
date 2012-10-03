#!/bin/bash

function pushdq {
  pushd $1 >/dev/null
}

function popdq {
  popd $1 >/dev/null
}

function present_on_path {
  query=$1
  which $query &>/dev/null
  return $?
}

function install_tmux {
  if present_on_path "tmux" ; then
    echo "tmux already installed; skipping installation"
    return
  fi

  echo "Installing tmux..."

  yum install -y tmux
}

function install_byobu {
  if present_on_path "byobu-tmux" ; then
    echo "Byobu is already installed; skipping installation"
    return
  fi

  echo "Installing Byobu..."

  pushdq /tmp
  
  wget https://launchpad.net/byobu/trunk/5.21/+download/byobu_5.21.orig.tar.gz
  tar zxf byobu_5.21.orig.tar.gz
  
  pushdq byobu-5.21
  ./configure
  make
  make install
  popdq

  rm -rf byobu-5.21

  # exit /tmp
  popdq
}

pushdq /root

install_tmux
install_byobu

popdq

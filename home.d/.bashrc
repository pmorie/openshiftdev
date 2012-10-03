#!/bin/bash

prompt_title="\033]0;\W@\h\007\n\[\e[1;37m\]"
prompt_glyph="★"

color_reset="\[\e[0;39m\]"
color_user="\[\e[1;33m\]"
color_host="\[\e[1;36m\]"
color_pwd="\[\e[0;33m\]"
color_git="\[\e[0;36m\]"
color_glyph="\[\e[35;40m\]"

PROMPT_COMMAND='PS1="${prompt_title}${color_glyph}${prompt_glyph}${color_reset} ${color_user}\u${color_reset}@${color_user}\h${color_reset}:${color_pwd}\w${color_reset} \[\e[1;37m\]${color_reset}\n$ "'

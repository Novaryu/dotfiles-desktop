#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias edit='sudo -E nvim'
alias audio='~/bin/audio_output_switch.sh'
PS1='[\u@\h \W]\$ '

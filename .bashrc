#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias edit='sudo -E nvim'
alias update='sudo pacman -Syu'
alias audio='~/bin/audio_output_switch.sh'

export PATH=/opt/cuda/bin${PATH:+:${PATH}} 
export LD_LIBRARY_PATH=/opt/cuda/lib64 

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

PS1='[\u@\h \W]\$ '

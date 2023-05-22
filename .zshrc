zmodload zsh/zprof

# set up helpers
source ~/.shell/init.sh

# color support
autoload colors && colors
LS_COLORS='no=00;37:fi=00:di=00;33:ln=04;36:pi=40;33:so=01;35:bd=40;33;01:'
export LS_COLORS

export PATH="/usr/local/opt/ansible@2.9/bin:$PATH"


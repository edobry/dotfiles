alias please='sudo $(fc -ln -1)'

alias editZshrc='nano ~/.zshrc && zsh'

SHELL_DIR="$HOME/.shell"

alias editZplug='nano $SHELL_DIR/zplug.sh && source $SHELL_DIR/zplug.sh && zplug install && zplug load'
alias editAliases='nano $SHELL_DIR/aliases.sh && source $SHELL_DIR/aliases.sh'

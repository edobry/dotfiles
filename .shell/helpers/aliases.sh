alias please='sudo $(fc -ln -1)'

alias editZshrc='nano ~/.zshrc && zsh'

SHELL_DIR="$HOME/.shell/helpers"

alias editZplug='nano $SHELL_DIR/zplug-env.sh && source $SHELL_DIR/zplug-env.sh && zplug install && zplug load'
alias editAliases='nano $SHELL_DIR/aliases.sh && source $SHELL_DIR/aliases.sh'
#
# alias reloadHelpers='for f in $SHELL_DIR/helpers/*; do source $f; done'
# alias reloadEnv='for f in $SHELL_DIR/*-env.sh; do source $f; done'

function editHelpers() {
    local file=$SHELL_DIR/helpers/${1}.sh
    nano $file
    source $file
}

DC_DIR="$HOME/.shell"
DC_HELPERS_DIR="$DC_DIR/helpers"

alias dotconfig='/usr/bin/git --git-dir=$HOME/.files/ --work-tree=$HOME'
alias dotc='dotconfig'
alias dotcs='dotconfig status | less -R'
alias dotclog='dotconfig log --graph --decorate --all --color | less -R'
alias dotcd='cd $DC_DIR'

alias dotcls='ls $DC_HELPERS_DIR'
alias doterc='$EDITOR $HOME/.zshrc && exec zsh'
alias dotcd='dotconfig diff'
alias dotca='dotconfig add'
alias dotcap='dotconfig add -p'
alias dotcc='dotconfig commit -m'
alias dotcp='dotconfig push'

function dotcat() {
    bat "$DC_DIR/$1"
}

function dotcath() {
    bat "$DC_HELPERS_DIR/$1"
}

function dotce() {
    $EDITOR "$DC_DIR/$1"
}

function dotcdh() {
    dotconfig diff "$DC_HELPERS_DIR/$1"
}

function dotceh() {
    $EDITOR "$DC_HELPERS_DIR/$1"
}

function dotcehr() {
    dotceh $1 && dotcrh $1
}

function dotcrh() {
    source "$DC_HELPERS_DIR/$1"
}

alias dotcea='dotcehr aliases.sh'

function dotcezi() {
    dotcehr zinit-env.sh
    zinit install && zinit load
}

function dotcah() {
    dotca "$DC_HELPERS_DIR/$1"
}

function dotcaph() {
    dotcap "$DC_HELPERS_DIR/$1"
}

alias dotcem='dotceh meta.sh'

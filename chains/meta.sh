DC_DIR="$HOME/.shell"
DC_HELPERS_DIR="$DC_DIR/chains"

# scope git to the dotfiles repo
alias dotconfig='/usr/bin/git --git-dir=$HOME/.files/ --work-tree=$HOME'
alias dotc='dotconfig'

# dotc status
alias dotcs='dotc status'

# dotc git log
alias dotclog='dotc log --graph --decorate --all --color'

# cd to dotc
alias dotccd='cd $DC_DIR'

# dotc ls chains
alias dotcls='ls $DC_HELPERS_DIR'

# edit .zshrc and reload shell
alias doterc='$EDITOR $HOME/.zshrc && exec zsh'

# dotc diff
alias dotcd='dotc diff HEAD --'

# dotc diff helper
function dotcdh() {
    dotcd "$DC_HELPERS_DIR/$1"
}

# dotc cat
function dotcat() {
    bat "$DC_DIR/$1"
}

# dotc cat helper
function dotcath() {
    bat "$DC_HELPERS_DIR/$1"
}

# dotc edit
function dotce() {
    $EDITOR "$DC_DIR/$1"
}

# dotc edit helper
function dotceh() {
    $EDITOR "$DC_HELPERS_DIR/$1"
}

# dotc reload helper
function dotcrh() {
    source "$DC_HELPERS_DIR/$1"
}

# dotc edit and reload helper
function dotcehr() {
    dotceh $1 && dotcrh $1
}

# dotc edit aliases
alias dotcea='dotcehr aliases.sh'

# dotc edit meta helper
alias dotcem='dotceh meta.sh'

# dotc edit & reload zinit 
function dotcezi() {
    dotcehr zinit-env.sh
    zinit install && zinit load
}

# dotc git add
alias dotca='dotc add'

# dotc git add patch
alias dotcap='dotca -p'

# dotc git add helper
function dotcah() {
    dotca "$DC_HELPERS_DIR/$1"
}

# dotc git add helper patch
function dotcaph() {
    dotcap "$DC_HELPERS_DIR/$1"
}

# dotc git restore staged
alias dotcrs='dotc restore --staged'

# dotc git restore staged patch
alias dotcrsp='dotcrs -p'

# dotc git checkout patch
alias dotccp='dotc checkout -p'

# dotc git restore staged helper
function dotcrsh() {
    dotcrs "$DC_HELPERS_DIR/$1"
}

# dotc restore staged helper patch
function dotcrsph() {
    dotcrsp "$DC_HELPERS_DIR/$1"
}

# dotc git checkout patch helper
function dotccph() {
    dotccp "$DC_HELPERS_DIR/$1"
}

# dotc git commit
alias dotcc='dotc commit -m'

# dotc push
alias dotcp='dotc push'

function chezmoiCd() {
    cd $(chezmoi source-path)
}

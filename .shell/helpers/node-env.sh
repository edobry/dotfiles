#export NVM_DIR="$HOME/.nvm"

#function loadNVM() {
#    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#}

export PATH="$HOME/.local/share/fnm:$PATH"
eval "$(fnm env --use-on-cd)"


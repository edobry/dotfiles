#export NVM_DIR="$HOME/.nvm"

#function loadNVM() {
#    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#}

if checkCommand "fnm"; then
    chiToolsAddDirToPath "$HOME/.local/share/fnm"

    # completions
    zinit light-mode lucid wait has"fnm" for \
        id-as"fnm_completion" \
        as"completion" \
        atclone"fnm completions --shell zsh > _fnm" \
        atpull"%atclone" \
        run-atpull \
        zdharma-continuum/null

    eval "$(fnm env --use-on-cd)"
fi

function nodeEnvInit() {
    npm install -g corepack
    corepack enable
}

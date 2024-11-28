function dotAddCompletion() {
    requireArg "a command" "$1" || return 1
    requireArg "a completion generation command" "$2" || return 1

    local completionPath="$CHI_DOTFILES_DIR/completions/_$1"

    [[ ! -f "$completionPath" ]] && \
        $2 "$(basename $(echo $SHELL))" > "$completionPath"

}

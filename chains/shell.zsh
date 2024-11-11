if isMacOS; then
    ITERM_PATH=$HOME/.iterm2_shell_integration.zsh
    test -s $ITERM_PATH && source $ITERM_PATH || true
fi

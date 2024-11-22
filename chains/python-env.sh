if checkCommand "pyenv"; then
    export PYENV_ROOT="$HOME/.pyenv"

    # https://github.com/pyenv/pyenv/blob/master/plugins/python-build/README.md#building-for-maximum-performance
    export PYTHON_CONFIGURE_OPTS='--enable-optimizations --with-lto'
    export PYTHON_CFLAGS='-march=native -mtune=native'

    chiToolsAddDirToPath "$PYENV_ROOT/bin"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

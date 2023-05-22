if ! isMacOS; then
    export GOROOT=$(dirname $(which go))
    export PATH=$PATH:$GOROOT/bin
fi

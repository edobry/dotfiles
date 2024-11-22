if ! isMacOS; then
    export GOROOT="$(dirname $(which go))"
    chiToolsAddDirToPath "$GOROOT/bin"
fi

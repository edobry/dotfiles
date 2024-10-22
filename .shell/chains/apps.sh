function installFromUrl() {
    local url="$1"
    local name="$2"

    local installPath="/usr/local/bin/$name"

    curl -L "$1" --output $installPath
    chmod +x $installPath

    if ! checkCommand "$name"; then
        echo "something went wrong!"
        return 1
    fi

    echo "successfully installed '$name'!"
}

sourceEnv() {
    local envFile="$(pwd)/.env";
    if [ -f $envFile ]; then
        while IFS= read -r line; do
            eval "export $line"
        done < "$envFile"
    fi
}

alias originalCd="cd"
chdir() {
    originalCd $1
    sourceEnv
}

alias cd="chdir"

#!/usr/bin/env bash

SOURCE_DIR=$(dirname "$0")

if [[ "$0" = /* ]]; then
    SCRIPT_PATH="$0"
elif [ ! -z ${BASH_SOURCE[0]} ]; then
    SCRIPT_PATH="${BASH_SOURCE[0]}"
else
    SCRIPT_PATH="$SOURCE_DIR/init.sh"
fi

export SHELL_DIR="$(dirname $SCRIPT_PATH)"
export PROJECT_DIR="$HOME/Projects"

function loadDir() {
    for f in "$@";
        do source $f;
    done
}

function checkDeps() {
    local expectedYqVersion="v4.33.3"
    if [[ $(yq --version | awk '{ print $4 }') != $expectedYqVersion ]]; then
        echo "incorrect yq version, '$expectedYqVersion' expected!"
        return 1
    fi

    local expectedJqVersion="1.6"
    if [[ $(jq --version | awk -F '-' '{ print $2 }') != $expectedJqVersion ]]; then
        echo "incorrect jq version, '$expectedJqVersion' expected!"
        return 1
    fi
}

if ! checkDeps; then
    echo "exiting!"
    return 1
fi


# load init scripts
loadDir $SHELL_DIR/helpers/init/*.sh

# zsh features loaded on zsh shells
if [ -n "$ZSH_VERSION" ]; then
    loadDir $SHELL_DIR/helpers/*.zsh
fi

# load helpers
loadDir $SHELL_DIR/helpers/*.sh


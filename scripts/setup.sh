#!/bin/bash

function log() {
    echo -e "\n$1..."
}

function waitForUser() {
    read -r -p "Press Enter to continue"
    echo
}

function macosSetup() {
    local email="$1"
    local ghUser="$2"
    local ghToken="$3"

    # configure macos settings
    echo "disable spotlight indexing..."
    sudo mdutil -i off -a
    waitForUser

    # setup git
    log "configure git"
    gitSetup "$email" "$ghToken"

    # log "setup package managers"

    # setup tea
    # log "install tea"
    # sh <(curl https://tea.xyz)
    # waitForUser

    log "configure shell"

    log 'configure iTerm manually:
     - iTerm Settings > Profiles > Default > Text > Font
     - Select "MesloLGS Nerd Font Mono"
     - Enable "Use ligatures"'
    waitForUser

    log "setup chitin"
    
    sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply "$ghUser"
}

function gitSetup() {
    local email="$1"
    local ghToken="$2"

    local keyPath="~/.ssh/id_github"

    log "generate ssh key"
    ssh-keygen -t ed25519 -C "$email" -f "$keyPath"
    ssh-add --apple-use-keychain "$keyPath"

    log "add ssh key to Github"
    githubAddSshKey $ghToken "$keyPath" "$(uname -n)-cli"

    log "configure git to use ssh for all Github"
    git config --global url."git@github.com:".insteadOf "https://github.com/"
}

function githubAddSshKey() {
    local pat=$1
    local pubkeyPath=$2
    local keyTitle=$3

    local pubkey=$(cat $pubkeyPath)

    # GitHub API URL
    local ghApiUrl="https://api.github.com/user/keys"

    curl -H "Authorization: token $pat" \
        -H "Accept: application/vnd.github.v3+json" \
        --data "{\"title\":\"${keyTitle}\",\"key\":\"${pubkey}\"}" \
        $ghApiUrl
}

echo "Starting first-time MacOS setup..."
waitForUser
macosSetup "$EMAIL" "$GH_USERNAME" "$GH_TOKEN"

#!/bin/bash

function log() {
    echo -e "\n$1..."
}

function waitForUser() {
    read -r -p "Press Enter to continue"
    echo
}

function macosSetup() {
    local email=$1
    local ghToken=$2

    # configure macos settings
    echo "disable spotlight indexing..."
    sudo mdutil -i off -a
    waitForUser

    # prereqs
    log "install XCode Developer Tools"
    xcode-select --install
    waitForUser

    setup git
    log "configure git"
    gitSetup $email $ghToken

    log "setup package managers"

    ## setup brew
    log "install brew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
    brew analytics off
    waitForUser

    # setup tea
    log "install tea"
    sh <(curl https://tea.xyz)
    waitForUser

    log "install packages"
    
    log "fetching Brewfile"
    local brewfileName="core.Brewfile"
    local brewfilePath="/tmp/$brewfileName"
    curl -fLo $brewfilePath https://raw.githubusercontent.com/edobry/dotfiles/master/.shell/resources/$brewfileName

    brew bundle install --file=$brewfilePath
    waitForUser

    log "configure shell"
    
    log "install iTerm shell integration"
    curl -L https://iterm2.com/shell_integration/zsh | bash
    waitForUser

    # log "setup zsh"

    # log "setup zinit"
    
    # bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

    log "install menlo lgs NF font"
    local fontsPath=~/Library/Fonts
    local fontName=MesloLGSNerdFontMono-Regular.ttf
    curl -fLo $fontsPath/$fontName https://github.com/ryanoasis/nerd-fonts/raw/v3.0.0/patched-fonts/Meslo/S/Regular/$fontName

    # ## configure iTerm manually
    # ### - iTerm Settings > Profiles > Default > Text > Font
    # ### - Select "MesloLGS Nerd Font Mono"
    # ### - Enable "Use ligatures"

    # log "setup dotfiles"
    # git clone --bare git@github.com:edobry/dotfiles.git $HOME/.files
    # git --git-dir=$HOME/.files/ --work-tree=$HOME checkout -f
}

function gitSetup() {
    local email=$1
    local ghToken=$2

    local keyPath="~/.ssh/id_github"

    echo "generate ssh key..."
    ssh-keygen -t ed25519 -C "$email" -f $keyPath
    ssh-add --apple-use-keychain $keyPath

    echo "add ssh key to Github..."
    githubAddSshKey $ghToken $keyPath "$(uname -n)-cli"

    ## configure git to use ssh for all Github
    # [url "ssh://git@github.com/"]
    # insteadOf = https://github.com/

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
macosSetup $EMAIL $GH_TOKEN

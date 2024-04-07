function macosSetup() {
    local email=$1
    local ghToken=$2

    # configure macos settings
    ## disable spotlight indexing
    sudo mdutil -i off

    # prereqs
    ## XCode Developer Tools
    xcode-select --install

    # setup git
    gitSetup $email $ghToken

    # setup package managers

    ## setup brew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew analytics off

    ## setup tea
    sh <(curl [https://tea.xyz](https://tea.xyz/))

    # install packages
    local brewfileName="Brewfile-core"
    local brewfilePath="/tmp/$brewfileName"
    curl -fLo $brewfilePath https://raw.githubusercontent.com/edobry/dotfiles/master/resources/$brewfileName
    brew bundle install --file=$brewfilePath

    # configure shell
    
    ## install iTerm shell integration
    curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash

    # setup zsh

    ## setup zinit
    ### setup subversion?
    echo
    bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

    ## install menlo lgs NF font
    cd ~/Library/Fonts && curl -fLo MesloLGSNerdFontMono-Regular.ttf https://github.com/ryanoasis/nerd-fonts/raw/v3.0.0/patched-fonts/Meslo/S/Regular/MesloLGSNerdFontMono-Regular.ttf
    mv ~/Library/Fonts/MesloLGSNerdFontMono-Regular.ttf

    ## configure iTerm manually
    ### - iTerm Settings > Profiles > Default > Text > Font
    ### - Select "MesloLGS Nerd Font Mono"
    ### - Enable "Use ligatures"
}

function gitSetup() {
    local email=$1
    local ghToken=$2

    local keyPath="~/.ssh/id_github"
    ssh-keygen -t ed25519 -C "$email" -f $keyPath
    ssh-add --apple-use-keychain $keyPath
    cat $keyPath.pub | toClip
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
macosSetup eugene@dobry.me

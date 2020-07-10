# checking if we're in macOS or linux

function isOSX() {
    [[ $(uname) == 'Darwin' ]]
}

if [[ `uname` == 'Darwin' ]]; then
    function toClip() {
        pbcopy
    }

    function openUrl() {
        open $1
    }

    source ~/.iterm2_shell_integration.zsh
else
    function toClip() {
        xclip -selection clipboard
    }

    function openUrl() {
        xdg-open $1
    }

    alias bat='batcat'
fi

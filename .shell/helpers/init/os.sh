# checking if we're in macOS or linux

function isOSX() {
    [[ $(uname) == 'Darwin' ]]
}

if isOSX; then
    function toClip() {
        pbcopy
    }

    function openUrl() {
        open $1
    }

    alias flushDNS='sudo killall -HUP mDNSResponder'

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

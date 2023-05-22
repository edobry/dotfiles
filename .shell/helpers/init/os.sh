# checking if we're in macOS or linux

function isMacOS() {
    [[ $(uname) == 'Darwin' ]]
}

if isMacOS; then
    function toClip() {
        pbcopy
    }

    function openUrl() {
        open $1
    }

    alias flushDNS='sudo killall -HUP mDNSResponder'

    test -e ~/.iterm2_shell_integration.zsh && source ~/.iterm2_shell_integration.zsh || true
else
    function toClip() {
        xclip -selection clipboard
    }

    function openUrl() {
        xdg-open $1
    }

    alias bat='batcat'
fi

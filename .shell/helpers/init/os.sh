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

    function checkCpuLimit() {
        pmset -g therm | grep 'CPU_Speed_Limit' | awk '{ print $3 }'
    }

    function netGetCurrentWifiName() {
        /Sy*/L*/Priv*/Apple8*/V*/C*/R*/airport -I | awk '/ SSID:/ {print $2}'
    }

    function netGetCurrentWifiPassword() {
        security find-generic-password -wa $(netGetCurrentWifiName)
    }
    
    alias flushDNS='sudo killall -HUP mDNSResponder'

    ITERM_PATH=$HOME/.iterm2_shell_integration.zsh
    test -s $ITERM_PATH && source $ITERM_PATH || true
else
    function toClip() {
        xclip -selection clipboard
    }

    function openUrl() {
        xdg-open $1
    }

    alias bat='batcat'
fi

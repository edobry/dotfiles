function bwUnlock() {
    local sessionKey="$(bw unlock --raw)"
    export BW_SESSION=$sessionKey
}

function bwGetItems() {
    [[ -z $BW_SESSION ]] && bwUnlock

    bw list items | jq -r '.[].name'
}

DOT_AUTH_CREDS_DIR_FIELD="credsDir"
DOT_AUTH_GPG_KEY_NAME_FIELD="keyName"

function dotAuthGetCredsDir() {
    chiExpandPath "$(chiConfigUserRead dotfiles auth "$DOT_AUTH_CREDS_DIR_FIELD")"
}

function dotAuthGetKeyName() {
    chiConfigUserRead dotfiles auth "$DOT_AUTH_GPG_KEY_NAME_FIELD"
}

function gpgImport() {
    gpg --import "$(dotAuthGetCredsDir)/$(dotAuthGetKeyName)"
}

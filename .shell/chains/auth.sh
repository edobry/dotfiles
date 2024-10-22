function bwUnlock() {
    local sessionKey=$(bw unlock --raw)
    export BW_SESSION=$sessionKey
}

function bwGetItems() {
    [[ -z $BW_SESSION ]] && bwUnlock

    bw list items | jq -r '.[].name'
}

alias st="/Applications/Syncthing.app/Contents/Resources/syncthing/syncthing"

function stGetKnownDevices() {
    st cli config dump-json | jq '.devices[] | { deviceID, name, addresses }'
}

function stEncReadFolderTokenFile() {
    local folder=$1

    cat $1/.stfolder/syncthing-encryption_password_token
}

function stEncGetFolderToken() {
    local folder=$1

    stEncReadFolderTokenFile $folder | jq -r '.Token'
}

function stEncGetFolderID() {
    local folder=$1

    stEncReadFolderTokenFile $folder | jq -r '.FolderID'
}

function stEncMakeSaltedFolderID() {
    local folder=$1

    echo "syncthing$(stEncGetFolderID $folder)"
}

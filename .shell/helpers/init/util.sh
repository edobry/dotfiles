#args: length of string
function randomString() {
    cat /dev/urandom | LC_CTYPE=C tr -dc 'a-z0-9' | fold -w $1 | head -n 1
}

function escapeCommas(){
    sed 's/,/\\\,/g'
}

function checkNumeric() {
    [[ $1 =~ '^[0-9]+$' ]]
}

# checks if a command exists
# args: command
function checkCommand() {
    command -v "$1" >/dev/null 2>&1
}

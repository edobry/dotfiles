# https://docs.brew.sh/Analytics
export HOMEBREW_NO_ANALYTICS=1

function fixBrewCompletions() {
    rm ~/.zcompdump*
    brew cleanup
}

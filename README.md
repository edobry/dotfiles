# .files

My personal shell configuration, featuring:

- [dependency management](https://github.com/edobry/chitin) (`chitin`)
- [intelligent module loading]((https://github.com/edobry/chitin)) (`chitin`)
- [dotfiles management](https://www.chezmoi.io/) (`chezmoi`)
- [zsh plugin management](https://github.com/zdharma-continuum/zinit/) (`zinit`)
- [powerlevel10k](https://github.com/romkatv/powerlevel10k) zsh theme
- automatic envfile loading
- handy aliases
- and much more!

## Setup

Follow these instructions to set up a new machine for the first time:

> [!CAUTION]
> Note that this may overwrite any existing dotfiles on the machine.

1. Sign into Github and [generate a new (classic) PAT](https://github.com/settings/tokens/new), making sure to record it
2. Open `Terminal` and run the following command, substituting the appropriate values:

    ```shell
    EMAIL= \
    GH_USERNAME= \
    GH_TOKEN= \
    PROJECT_DIR= \
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/edobry/dotfiles/HEAD/scripts/setup.sh)"
    ```

3. Follow the instructions to configure `chitin` (run `chiConfigUserModify` and fill in the appropriate values)
4. Update the instructions/script to account for any steps that may be missing, incomplete, or incorrect
5. ????
6. profit

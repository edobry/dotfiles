# .files

My personal shell configuration, intended for use with [chitin](https://github.com/edobry/chitin).

Requirements:

- `zsh >=5.8`
- `git >= 2.31`

## Installation

This repo uses [chezmoi](https://www.chezmoi.io/) to manage dotfiles. Configure a new machine by running the following command:

> [!CAUTION]
> Note that this will overwrite any existing managed files on the machine.

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply $GITHUB_USERNAME
```

This command will also [configure your system](./home/run_once_after_install_macos.sh) on first install.

## References

<https://www.atlassian.com/git/tutorials/dotfiles>

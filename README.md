# .files

My personal shell configuration, using a modular initialization system.

Requirements:

- `zsh >=5.8`
- `git >= 2.31`

## Installation

Configure these dotfiles on a new machine by running the following commands:

```bash
git clone --bare git@github.com:edobry/dotfiles.git $HOME/.files
git --git-dir=$HOME/.files/ --work-tree=$HOME checkout
```

## References

<https://www.atlassian.com/git/tutorials/dotfiles>

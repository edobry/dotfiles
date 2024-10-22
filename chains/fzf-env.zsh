# give a preview of directory by eza when completing cd
zstyle ':fzf-tab:complete:cd:*' extra-opts --preview=$extract'eza -1 --color=always $realpath'

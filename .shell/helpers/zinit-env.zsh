# zplug

source ~/.zinit/bin/zinit.zsh

zinit ice  lucid atload'source ~/.p10k.zsh; _p9k_precmd; p10k finalize' nocd
zinit light romkatv/powerlevel10k

zinit ice svn
zinit snippet OMZ::plugins/osx

zinit ice svn
zinit snippet OMZ::plugins/aws

zinit ice svn
zinit snippet OMZP::kubectl

zinit ice svn
#zinit snippet OMZP::autojump
zinit load "agkozak/zsh-z"

zinit light "DarrinTisdale/zsh-aliases-exa"

zinit ice as"completion"
zinit light "gradle/gradle-completion"

zinit load "Dbz/kube-aliases"

zinit ice svn
zinit snippet OMZP::history-substring-search

#zinit light "zsh-users/zsh-syntax-highlighting"
#zinit light "zsh-users/zsh-autosuggestions"
zinit light "Aloxaf/fzf-tab"
zinit light "reegnz/jq-zsh-plugin"

#zinit wait lucid atload"zicompinit; zicdreplay" blockf for \
#    zsh-users/zsh-completions

zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma/fast-syntax-highlighting \
 blockf \
    "zsh-users/zsh-completions" \
 atload"!_zsh_autosuggest_start" \
    "zsh-users/zsh-autosuggestions"

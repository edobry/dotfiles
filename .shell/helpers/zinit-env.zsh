# zplug

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
ZINIT_INSTALL_DIR="$(dirname $ZINIT_HOME)"
mkdir -p $ZINIT_INSTALL_DIR
if [ -d "${ZINIT_INSTALL_DIR}/.git" ]; then
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

zinit ice lucid atload'source ~/.p10k.zsh; _p9k_precmd; p10k finalize' nocd
zinit light romkatv/powerlevel10k

if isMacOS; then
    zinit ice svn
    zinit snippet OMZ::plugins/macos
fi

zinit ice svn
zinit snippet OMZ::plugins/aws

zinit ice svn
zinit snippet OMZP::kubectl

zinit ice svn
zinit load "agkozak/zsh-z"

zinit light "DarrinTisdale/zsh-aliases-exa"

zinit ice as"completion"
zinit light "gradle/gradle-completion"

zinit load "Dbz/kube-aliases"

zinit ice svn
zinit snippet OMZP::history-substring-search

zinit light "reegnz/jq-zsh-plugin"

zinit light-mode lucid wait has"kubectl" for \
   id-as"kubectl_completion" \
   as"completion" \
   atclone"kubectl completion zsh > _kubectl" \
   atpull"%atclone" \
   run-atpull \
   zdharma-continuum/null

zinit light-mode lucid wait has"helm" for \
   id-as"helm_completion" \
   as"completion" \
   atclone"helm completion zsh > _helm" \
   atpull"%atclone" \
   run-atpull \
   zdharma-continuum/null

zinit light-mode lucid wait has"kustomize" for \
   id-as"kustomize_completion" \
   as"completion" \
   atclone"kustomize completion zsh > _kustomize" \
   atpull"%atclone" \
   run-atpull \
   zdharma-continuum/null

zinit light-mode lucid wait has"stern" for \
   id-as"stern_completion" \
   as"completion" \
   atclone"stern --completion=zsh > _stern" \
   atpull"%atclone" \
   run-atpull \
   zdharma-continuum/null

zinit light-mode lucid wait has"fnm" for \
   id-as"fnm_completion" \
   as"completion" \
   atclone"fnm completions --shell zsh > _fnm" \
   atpull"%atclone" \
   run-atpull \
   zdharma-continuum/null

zinit light "Aloxaf/fzf-tab"

zinit wait lucid for \
    zdharma-continuum/fast-syntax-highlighting \
 blockf \
    "zsh-users/zsh-completions" \
 atload"!_zsh_autosuggest_start" \
    "zsh-users/zsh-autosuggestions"

zinit ice lucid wait atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay"

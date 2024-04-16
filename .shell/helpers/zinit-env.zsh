# zinit

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
ZINIT_INSTALL_DIR="$(dirname $ZINIT_HOME)"
mkdir -p $ZINIT_INSTALL_DIR
if [ ! -d "${ZINIT_INSTALL_DIR}/zinit.git" ]; then
    echo "Running first-time zinit setup..."
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

zinit ice lucid atload'source ~/.p10k.zsh; _p9k_precmd; p10k finalize' nocd
zinit light romkatv/powerlevel10k

# https://github.com/zdharma-continuum/zinit/issues/481#issuecomment-1480192402
function zinitSnippetOmz() {
   local snippet=$1
   local type=${2:-OMZ}

   # init repo if not exists
   local dir="$ZINIT_INSTALL_DIR/snippets/OMZ::plugins"
   local omzRepoDir=$dir/ohmyzsh
   if [[ ! -d "$omzRepoDir" ]]; then
      (( !OPTS[opt_-q,--quiet] )) && +zi-log "{i} Initializing sparse {file}OMZ::plugins{rst} repository"

      mkdir -p $omzRepoDir && pushd $dir > /dev/null
      git clone -n --depth=1 --filter=tree:0 https://github.com/ohmyzsh/ohmyzsh
   elif [[ -d "$dir/$snippet" ]]; then
      return
   fi

   # prefix snippet name with "plugins" if type is OMZ
   local snippetName=$([[ $type == "OMZ" ]] && echo plugins/$snippet || echo $snippet)

   (( !OPTS[opt_-q,--quiet] )) && +zi-log "{nl}{i} Initializing {file}$snippetName{rst} (with git sparse-checkout)"
   (( !OPTS[opt_-q,--quiet] )) && +zi-log "{info}Note{info}:{msg} See {url}https://github.com/zdharma-continuum/zinit/issues/504#issuecomment-1887858354{msg} for details"

   pushd $omzRepoDir > /dev/null
   local pluginDir=plugins/$snippet
   (( !OPTS[opt_-q,--quiet] )) && +zi-log "{i} Shallow cloning & installing{rst}"
   git sparse-checkout set --no-cone $pluginDir > /dev/null 2>&1
   git checkout > /dev/null 2>&1
   cp -R $pluginDir ../$snippet
   popd > /dev/null

   zinit snippet $type::$snippetName
}

if isMacOS; then
   zinitSnippetOmz macos
fi

# shell features

# zinit ice svn
zinit load "agkozak/zsh-z"

zinit light "DarrinTisdale/zsh-aliases-exa"

zinitSnippetOmz history-substring-search

zinit ice lucid wait'0'
zinit light joshskidmore/zsh-fzf-history-search

# shell utils

zinit light "reegnz/jq-zsh-plugin"

# runtimes - java

zinit ice as"completion"
zinit light "gradle/gradle-completion"

# aws

zinitSnippetOmz aws OMZP

# k8s

zinitSnippetOmz kubectl OMZP

zinit load "Dbz/kube-aliases"

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

zinit ice wait"1" lucid
zinit light "Aloxaf/fzf-tab"

function zinitCompSetup() {
   zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
   zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

   zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
   zstyle ':completion:*' menu select=1
   zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
   zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
   zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
   zstyle :compinstall filename "$HOME/.zshrc"

   # End of lines added by compinstall
   zstyle ':fzf-tab:complete:cd:*' extra-opts --preview=$extract'eza -1 --color=always $realpath'
   # set descriptions format to enable group support
   zstyle ':completion:*:descriptions' format '[%d]'
}

zinit wait"0a" lucid for \
atclone"zinit creinstall -q /usr/share/zsh/site-functions" \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay; zinitCompSetup;" \
   zdharma-continuum/fast-syntax-highlighting \
 blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    "zsh-users/zsh-autosuggestions" \

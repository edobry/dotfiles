# zplug
source ~/.zplug/init.zsh

zplug romkatv/powerlevel10k, as:theme, depth:1

zplug "plugins/git", from:oh-my-zsh
zplug "plugins/osx", from:oh-my-zsh
zplug "plugins/aws", from:oh-my-zsh
zplug "plugins/kubectl", from:oh-my-zsh
zplug "plugins/autojump", from:oh-my-zsh

zplug "zsh-users/zsh-completions"
zplug "DarrinTisdale/zsh-aliases-exa"
zplug "gradle/gradle-completion"
zplug "Dbz/kube-aliases"

zplug "plugins/history-substring-search", from:oh-my-zsh, defer:3
zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug load

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

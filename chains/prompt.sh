# https://github.com/romkatv/powerlevel10k/issues/563#issuecomment-1473727359
printf '\n%.0s' {1..$LINES}

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
P10K_PATH="${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
if [[ -r "$P10K_PATH" ]]; then
  source "$P10K_PATH"
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source "$HOME/dotfiles/zsh-linux-common/.zsh-common"

export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

export EDITOR="nvim"
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source <(fzf --zsh)

eval "$(zoxide init zsh)"


# cargo env
export PATH="$PATH:$HOME/.cargo/bin"
source $HOME/.cargo/env

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

plugins=(git)

xdg-open() {
  if [[ -n $WAYLAND_DISPLAY || -n $DISPLAY ]]; then
      command xdg-open "$@"
  else
      ssh -p 43022 localhost env WAYLAND_DISPLAY=wayland-1 xdg-open \"$@\"
  fi
}

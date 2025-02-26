source "$HOME/dotfiles/zsh-linux-common/.zsh-common"

export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh


# ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
# source /home/aaron/.oh-my-zsh/custom/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
plugins=(git)

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source ~/powerlevel10k/powerlevel10k.zsh-theme

# if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
#   exec sway
# fi

if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec env XDG_CURRENT_DESKTOP=sway dbus-run-session /usr/bin/sway > /home/aaron/log/sway.log 2>&1
fi
source ~/powerlevel10k/powerlevel10k.zsh-theme

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

eval "$(zoxide init zsh)"

# bindkey "^G" push-line

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Load Angular CLI autocompletion.
source <(ng completion script)

alias tlvim="NVIM_APPNAME=nvim-tlv nvim"

export PATH="$HOME/.local/share/flutter/bin:$PATH"
export PATH="$PATH":"$HOME/.pub-cache/bin"

source <(fzf --zsh)

alias wsa="ssh -R 43022:localhost:22 workstation-aaron"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

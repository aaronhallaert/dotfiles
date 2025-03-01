source "$HOME/dotfiles/zsh-linux-common/.zsh-common"

eval "$(starship init zsh)"

if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec env XDG_CURRENT_DESKTOP=sway dbus-run-session /usr/bin/sway > /home/aaron/log/sway.log 2>&1
fi

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# eval "$(zoxide init zsh)"

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

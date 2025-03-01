source "$HOME/dotfiles/zsh-linux-common/.zsh-common"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
source <(fzf --zsh)

alias wsa="ssh -R 43022:localhost:22 workstation-aaron"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init - zsh)"

export PATH="$HOME/.local/share/flutter/bin:$PATH"
export PATH="$PATH":"$HOME/.pub-cache/bin"

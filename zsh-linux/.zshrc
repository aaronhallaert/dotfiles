source "$HOME/dotfiles/zsh-linux-common/.zsh-common"

export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

plugins=(git)


# User configuration
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/powerlevel10k/powerlevel10k.zsh-theme

# CUSTOM

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"


export MASON="$HOME/.local/share/nvim/mason/bin/"
export PATH="$PATH:$MASON"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/aaron/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/aaron/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/aaron/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/aaron/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


export CMAKE_ROOT="/opt/cmake-3.28.1-linux-x86_64/share/cmake-3.28/"
# export BOOST_ROOT=/opt/boost_1_84_0
# export BOOST_INCLUDEDIR=/opt/boost_1_84_0/include
# export BOOST_LIBRARYDIR=/opt/boost_1_84_0/lib
export VALGRIND_LIB="/usr/local/libexec/valgrind"

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# make sure snap applications can open when sway is running with `dbus-run-session`
# export DBUS_SESSION_BUS_ADDRESS="unix:path=$XDG_RUNTIME_DIR/bus"
eval "$(zoxide init zsh)"


# Load Angular CLI autocompletion.
source <(ng completion script)

function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec env XDG_CURRENT_DESKTOP=sway dbus-run-session /usr/local/bin/sway > /home/aaron/log/sway.log 2>&1
fi

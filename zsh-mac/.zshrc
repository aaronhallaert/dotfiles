# Enabl ePowerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"
export PATH="$HOME/.mint/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

plugins+=(git)
# ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
# plugins+=(zsh-vi-mode)
# plugins+=(zsh-vi-search)

autoload -U edit-command-line
export EDITOR=nvim
bindkey '\ev' edit-command-line

source $ZSH/oh-my-zsh.sh

# User configuration
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# CUSTOM
export PATH="$HOME/dotfiles/usr/scripts:$PATH"
export PATH="$HOME/dotfiles/usr/scripts/nipro:$PATH"
export PATH="$HOME/dotfiles/usr/scripts/nipro/tmux:$PATH"
export PATH="$HOME/dotfiles/usr/scripts/nipro/run:$PATH"
export PATH="$HOME/dotfiles/usr/scripts/nipro/database:$PATH"
export PATH="$HOME/dotfiles/usr/scripts/git_aliases:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/usr/local/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/Developer/programs/lua-language-server/bin"

export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/bin:$PATH"
source "$HOME/dotfiles/zsh/aliases.zsh"
source "$HOME/dotfiles/zsh/keys"
alias xdg-open="open"


export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_311.jdk/Contents/Home"
alias luamake=/Users/aaronhallaert/Developer/programs/lua-language-server/3rd/luamake/luamake

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

unsetopt AUTO_CD

export GO111MODULE=on
export CGO_ENABLED=on
export GOPATH=$HOME/go
export GPG_TTY=$(tty)

export THEME="gruvbox"


if [ -d "/opt/homebrew/opt/ruby/bin" ]; then
  export PATH=/opt/homebrew/opt/ruby/bin:$PATH
  export PATH=`gem environment gemdir`/bin:$PATH
fi

# eval "$(atuin init zsh)"
# alias grep="/opt/homebrew/bin/grep"

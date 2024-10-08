# ALIASES
alias start-airplay="~/Developer/programs/UxPlay/uxplay &!"
alias stop-airplay="pkill uxplay"
alias dotf="cd ~/dotfiles"
alias lg="lazygit"
alias ld="lazydocker"
alias vi="nvim"

alias ape="source ~/.virtualenvs/\$(ls ~/.virtualenvs | fzf)/bin/activate"
# alias cat="bat"
alias gp="git pull"
alias gP="git push"
alias git commit="git commit -S"
alias wip="git commit -m 'wip' --no-verify"
alias nipro="tmux_nipro.sh"
alias plugins="cd ~/.local/share/nvim/lazy/"

alias devup="devcontainer up --workspace-folder ./"

alias vpnu="openvpn3 session-start --config ~/Documents/televic.ovpn"
alias vpnd="openvpn3 session-manage --disconnect --path \$(openvpn3 sessions-list | grep Path | cut -d ':' -f2 | tr -d ' ')"

alias dcd="docker compose down"
alias dcu="docker compose up"
alias dcr="docker compose run --rm --service-ports"

alias cowt="source git_cowt"
alias chwt="source git_chwt"
alias rmwt="source git_rmwt"

alias ta="tmux attach"

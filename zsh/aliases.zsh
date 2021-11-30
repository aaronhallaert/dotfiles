# ALIASES
alias open="xdg-open 2>/dev/null"
alias start-airplay="~/Developer/programs/UxPlay/build/uxplay &!"
alias stop-airplay="pkill uxplay"
alias dotf="cd ~/dotfiles"
alias lg="lazygit"

alias dump_db="pg_dump -h localhost -U postgres -c --file ~/Developer/nephroflow/development.sql --format=c nephroflow_development"
alias restore_db="dropdb -h localhost -U postgres nephroflow_development && createdb -h localhost -U postgres nephroflow_development && pg_restore -h localhost -U postgres -d nephroflow_development ~/Developer/nephroflow/development.sql"


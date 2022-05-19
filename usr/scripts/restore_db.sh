#!/bin/zsh
selected_file=$(ls ~/Developer/nephroflow/db_dumps | fzf | tr -d '* [:space:]')
selected_file=${selected_file//\//-}

# if selected_file is empty, exit
if [[ -z $selected_file ]]; then
  exit
fi
echo "Restoring database from" $selected_file
dropdb -h localhost -U postgres nephroflow_development && createdb -h localhost -U postgres nephroflow_development && pg_restore -h localhost -U postgres -d nephroflow_development --no-owner --role=postgres ~/Developer/nephroflow/db_dumps/$selected_file

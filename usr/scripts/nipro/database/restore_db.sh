#!/bin/zsh

selected_file=""

if [ $# -eq 0 ]
  then
    selected_file=$(ls ~/Developer/nephroflow/db_dumps | fzf | tr -d '* [:space:]')
    selected_file=${selected_file//\//-}
  else
    selected_file="$1.sql"
fi

# if selected_file is empty, exit
if [[ -z $selected_file ]]; then
  exit
fi


docker exec -it selfweb pkill -9 ruby
echo "Restoring database from" $selected_file
dropdb -h localhost -U postgres nephroflow_development && createdb -h localhost -U postgres nephroflow_development && pg_restore -h localhost -U postgres -d nephroflow_development --no-owner --role=postgres ~/Developer/nephroflow/db_dumps/$selected_file

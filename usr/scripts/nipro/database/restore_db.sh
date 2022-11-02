#!/bin/zsh

selected_file_name=""
folder="$HOME/Developer/nephroflow/db_dumps"

if [ $# -eq 0 ]
  then
    selected_file_name=$(ls $folder | fzf | tr -d '* [:space:]')
    selected_file_name=${selected_file_name//\//-}
  else
    selected_file_name="$1.sql"
fi

# if selected_file_name is empty, exit
if [[ -z $selected_file_name ]]; then
  exit 1
fi

# if selected_file_name is empty, exit
if ! [ -f "$folder/$selected_file_name" ]; then
    echo "$folder/$selected_file_name does not exists."
    exit 1
fi

docker exec -it selfweb pkill -9 ruby
echo "Restoring database from" $selected_file_name
dropdb -h localhost -U postgres nephroflow_development && createdb -h localhost -U postgres nephroflow_development && pg_restore -h localhost -U postgres -d nephroflow_development --no-owner --role=postgres $folder/$selected_file_name

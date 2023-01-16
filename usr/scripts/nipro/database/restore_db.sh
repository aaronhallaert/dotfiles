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

run_api.sh -- 'pkill -9 ruby'
echo "Dropping database"
dropdb -h localhost -U postgres nephroflow_development 
wait
echo "Creating database"
createdb -h localhost -U postgres nephroflow_development 
wait
echo "Restoring database from" $selected_file_name
pg_restore -h localhost -U postgres -d nephroflow_development --no-owner --role=postgres $folder/$selected_file_name
wait

# reseeding patients
# echo "Reseeding patients and users for avatars to work"
# run_api.sh -- 'rake dev:seed:200_patients'
# run_api.sh -- 'rake dev:seed:100_users'


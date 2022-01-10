#!/bin/bash
selected_file=$(ls ~/Developer/nephroflow/db_dumps | fzf | tr -d '* [:space:]')
selected_file=${selected_file//\//-}

# if selected_file is empty, exit
if [[ -z $selected_file ]]; then
  exit
fi

path=~/Developer/nephroflow/db_dumps/$selected_file
echo "Removing database dump: " $path
rm $path

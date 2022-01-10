#!/bin/zsh
selected_branch=$(git rev-parse --abbrev-ref HEAD)
selected_branch=${selected_branch//\//-}
echo "Dumping database to" $selected_branch
pg_dump -h localhost -U postgres -c --file ~/Developer/nephroflow/db_dumps/$selected_branch.sql --format=c nephroflow_development

#!/bin/zsh


file_dump=""

if [ $# -eq 0 ]
  then
    file_dump=$(git rev-parse --abbrev-ref HEAD)
    file_dump=${file_dump//\//-}
  else
    file_dump=$1
fi

echo "Dumping database to" $file_dump
pg_dump -h localhost -U postgres -c --file ~/Developer/nephroflow/db_dumps/$file_dump.sql --format=c nephroflow_development

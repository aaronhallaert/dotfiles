#!/bin/zsh

# swith worktree
cd $(git worktree list | grep dummy | cut -f 1 -d " ")
selected_worktree_folder=$(git worktree list | fzf | cut -f 1 -d " ")

if [[ -z $selected_worktree_folder ]]; then
  return
fi

cd $selected_worktree_folder

# restore database
bash restore_db.sh 
wait
run_api.sh -- bundle install
wait
docker-compose down

for _pane in $(tmux list-panes -t nipro:api -F '#P'); do
  tmux send-keys -t nipro:api.${_pane} "cd $selected_worktree_folder" "Enter"
  tmux send-keys -t nipro:api.${_pane} "clear" "Enter"
done


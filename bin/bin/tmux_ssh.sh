#!/bin/bash
echo "Select a host to ssh to"
host=$(cat /etc/hosts | grep -v '^#' | awk '{print $2}' | fzf)

echo ${host}
# escape the "." in the host name
host_tmux=$(echo ${host} | sed 's/\./\_/g')
session="SSH//${host_tmux}"


if tmux has-session -t "${session}" 2>/dev/null; then
  tmux switch-client -t "${session}"
else
  tmux new-session -s "${session}" -d
  tmux send-keys -t "${session}" "ssh ${host}" Enter
  tmux switch-client -t "${session}"
fi

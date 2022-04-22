# echo "==> CHANGE BRANCH"
# tmux send-keys -t nipro:api.2 "git checkout ah/assign_machine_session_on_session_start" 'Enter'
# wait

echo "==> RESTORING DB"
restore_db.sh
wait

TOKEN=$(docker exec -it selfweb rake users:issue_integration_token | grep "eyJ")
echo "==> CREATING TOKEN: $TOKEN"


tmux send-keys -t nipro:link.0 "export ACCESS_TOKEN=${TOKEN}" 'Enter'
tmux send-keys -t nipro:link.1 "export ACCESS_TOKEN=${TOKEN}" 'Enter'
tmux send-keys -t nipro:link.2 "export ACCESS_TOKEN=${TOKEN}" 'Enter'
wait

echo "==> STARTING SERVER THROUGH TMUX"
tmux send-keys -t nipro:api.1 "rails s" 'Enter'
sleep 5

echo "==> OPENING CHANNELHOST THROUGH TMUX"
tmux send-keys -t nipro:link.0 "docker-compose run --rm --service-ports --name channel_host channel_host sh" 'Enter'
sleep 5

# echo "==> REMOVING DEVICE"
# docker exec -it channel_host rake store:list_all_devices | grep "18DS4545" | sed 's/|/\n/g' | grep -m2 "" | sed '1,1d' | sed 's/\s//g' | xargs -I{} sh -c 'echo "Removing {}"; docker exec channel_host pwd; docker exec channel_host rake store:remove_device[{}]'
# rake store:remove_device[{}]
# wait

echo "==> PURGING QUEUES"
docker exec -it channel_host rake queues:purge_all
wait

echo "==> STARTING CHANNELHOST THROUGH TMUX"
tmux send-keys -t nipro:link.0 "bin/hermes --host channel --host-config config/channels.yml --cloud-config config/cloud.yml" 'Enter'
sleep 5

echo "==> STARTING PROCESSORHOST THROUGH TMUX"
tmux send-keys -t nipro:link.1 "docker-compose run --rm --service-ports --name processor_host processor_host" 'Enter'
sleep 10

echo "==> STARTING SIMULATOR THROUGH TMUX"
tmux send-keys -t nipro:link.2 "docker-compose run --rm --service-ports --name sim dialysis_simulator" 'Enter'

docker exec -it channel_host rake store:list_all_devices | grep "18DS4545" | sed 's/|/\n/g' | grep -m2 "" | sed '1,1d' | sed 's/\s//g' | xargs -I{} sh -c 'echo "Removing {}"; docker exec channel_host pwd; docker exec channel_host rake store:remove_device[{}]'
# rake store:remove_device[{}]
wait
docker exec -it channel_host rake queues:purge_all
wait
TOKEN=$(docker exec -it selfweb rake users:issue_integration_token | grep "eyJ")
REPL="274s/\(\s*access_token: \)[^ ]*/\1\"$TOKEN\"/"
sed -i'.original' "$REPL" config/cloud.yml


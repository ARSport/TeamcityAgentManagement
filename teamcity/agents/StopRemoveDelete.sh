#!/bin/bash

#Get the agents names from docker (container id is the agent name)
agents=$(sudo docker ps |grep docker | awk '{ print $1 }')

#Loop to Delete agent from team city
for agent in $agents
 do
  #Stop and remove container
  sudo docker stop $agent
  sudo docker rm $agent
 done

We wait for 2 minutes while the agents show as shutdown, this setting may need to be tunned depending on how long does it takes to show in your system
sleep 120

for agent in $agents
 do
  #Rest call to delete the agent
  sudo curl -v --basic -contentType "text/plain" --user ansible:password -H 'Content-Type: text/plain' -U ansible:password -X DELETE http://teamcity.server.com:8111/httpAuth/app/rest/agents/name:$agent
 done

rm -rf ontent*

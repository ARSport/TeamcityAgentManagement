#!/bin/bash

#Get the agents names from docker (container id is the agent name)
agents=$(sudo docker ps | grep docker | awk '{ print $1 }')

#loop to to the Authorization, enablement and add to the TUKD agents pool
for agent in $agents
 do
  #Authorize agente
  sudo curl -v --basic -contentType "text/plain" --user ansible:password -H 'Content-Type: text/plain' -U ansible:password -X PUT http://teamcity.server.com:8111/httpAuth/app/rest/agents/name:$agent/authorized --data true
  #Enable agents
  sudo curl -v --basic -contentType "text/plain" --user ansible:password -H 'Content-Type: text/plain' -U ansible:password -X PUT http://teamcity.server.com:8111/httpAuth/app/rest/agents/name:$agent/enabled --data true
  #Add to the correct pool in this case pool 7 (see id:7)
  sudo curl -v --basic --user ansible:password -H 'Content-Type: application/xml' -U ansible:password —request POST http://teamcity.server.com:8111/httpAuth/app/rest/agentPools/id:7/agents --data "<agent locator='$agent'/>"
 done
#Removing temp work file from where the file is run.
rm -rf ontent*

#!/bin/bash

#Get the agents names from docker (container id is the agent name)
agents=$(sudo docker ps -a |grep aws | awk '{ print $1 }')
#Loop to Delete agent from team city
for agent in $agents
 do
  #Stop and remove container
  sudo docker start $agent
 done

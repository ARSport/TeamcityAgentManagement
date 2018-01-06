#!/bin/bash

#Get the agents names from docker (container id is the agent name)
agents=$(sudo docker ps | grep docker | awk '{ print $1 }')

#Pull the new image for the agents
sudo docker pull teamcity.server.com/teamcity-agent

#Loop to create the new agents from the docker hosts in this case we will create 1 agent
for i in 1
do
	sudo docker run teamcity-agent
done

#Get the orphaned images if latest image was pulled
images=$(sudo docker images | grep "<none>                                                         <none>" | awk '{ print $3 }')

#Loop to remove images orphaned if any
if [ -n "$images" ]; then
	for image in $images
	do
		sudo docker rmi $image
	done
else
    echo "no orphaned images"
fi

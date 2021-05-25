# learn-docker


### check any ports open
sudo lsof -i tcp:3000


#Get any image from hub (official)
> docker pull wordpress

#View all images
> docker images

#run an image in a container
> docker run wordpress

#run an specific version of image in a container
> docker run wordpress:<version>


#run an image in a new container in detached mode 
> docker  run -d wordpress 

## Interesting fact: The host port must be different but they can point to same port on the container
#specify host port and bind to container port to make it usable
> docker run -p 80:80 wordpress


#important to know that docker run is dealing with image and creation of a container
# docker start / stop is dealing with container

> docker run -d -p 80:80 


#check status of all the running containers
> docker ps

#check status of running or not running containers
> docker ps -a


#to stop/ start a docker container, copy the id by running docker ps 
> docker stop <id>
> docker start <id>


> docker logs <app name>


#get into terminal of the container
>  docker exec -it <container_id> /bin/bash


#Create a docker network to keep components isolated

# view list of available networks
> docker network ls  

# create network 
> docker create network <network-name>

# to run an mongo db within a network hint: -d = detached mode -p80:90 = port number of host followed by container -e = environment var
> docker run -d -p 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=admin -e MONGO_INITDB_ROOT_PASSWORD=password --name=mongodb --network=mongo-network mongo

#check logs 
> docker logs <container id>

# to run mongo express that connects to mongo db in the network created in the previous step
> docker run -d -p 8081:8081 -e ME_CONFIG_MONGODB_ADMINUSERNAME=admin -e ME_CONFIG_MONGODB_ADMINPASSWORD=password -e ME_CONFIG_MONGODB_SERVER=mongodb --name=mongo-express --network=mongo-network  mongo-express


# KNOWLEDGE: If you use docker compose yaml, and do not provide container names and network names, it automatically creates containers listed in the yaml within a network of its own

#To bring up services from the configuration, to bring down write down at the end instead of up
> docker-compose -f <yaml-file-name> up


===========
Docker File
=========== 

Docker file is a blueprint to create docker images from code repository

Example Structure:

————————————
FROM node   //name of the application, installs node

ENV  //provide environmental variables, recommended to define in docker-compose yaml file

RUN mkdir -p /home/app      // RUN is to run any linux command, this command creates directory

COPY . /home/app         // COPY command  copies from host to container 

CMD [“node”, “server.js”]    //entry point linux command , difference from RUN is that it is entry point 

————————————

Command to compile:
> docker build -t my-app:1.0 .   //builds image

//starts container from the image
> docker run my-app:1.0

//stop container
> docker stop <container id>

//remove container that is running
> docker rm <container-id>

//remove image
> docker rmi <image_id>


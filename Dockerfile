# 1 - base image to start from
FROM node:13-alpine

# 2 - optional - set environment variables (better to set in docker-compose)
ENV MONGO_INITDB_ROOT_USERNAME=admin MONGO_INITDB_ROOT_PASSWORD=password

# 3 - RUN command to run any linux command inside of the container , in this case create directory in the container
RUN mkdir -p /home/app

# 4 - COPY command to run any linux command on HOST server. In this example copy files from the current folder in host machine to /home/app directory of the container
COPY . /home/app

# 5 - CMD command is used as starting command of the docker image. In this case it is the first js file to be executed as part of the node project in example
CMD ["node", "server.js"]

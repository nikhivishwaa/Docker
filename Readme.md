###### run the contaner in interactive mode
```
docker run -it ubuntu
```

###### view available docker images in local machine
```
docker images
```
```
docker images ls
```

###### list running containers
```
docker container ls
```

###### list all container
```
docker container ls -a
```

###### start a container
```
docker start "container name"
```

###### stop a container
```
docker stop "container name"
```

###### execute a command in container from normal terminal
```
docker exec "container name" "command"
```

###### connect terminal to container's terminal
```
docker exec -it "container name" bash
```

###### port maping - exposing container port to local machine port
```
docker run -it -p "local port":"internal port" "image"
```
```
docker run -it -p 6000:80 nginx
```

###### passing env vars for container
```
docker run -it -p 6000:8000 -e key=value -e key=value nginx
```

##### containerizing nodejs app

###### step 1 : create `Dockerfile` in the application source code

###### step 2 : add details/configuration of image
```
FROM ubuntu

RUN apt-get update
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get upgrade -y
RUN apt-get install -y nodejs

COPY package.json package.json
COPY package-lock.json package-lock.json
COPY main.js main.js

RUN npm install

ENTRYPOINT [ "node", "main.js" ] // if the container started this command executed
```

###### step 3 : run the following command to create your custom image 
```
docker build -t "image name" "Folder location of Dockerfile"
```
```
docker build -t myfirst-image .
```

###### step 4 : create repository on dockerhub like `nodejsapp` then copy image name `<username>/nodejsapp` and build your image with this name locally and move to step 5

###### step 5 : publish docker image on dockerhub
```
docker push nikhivishwa/nodejsapp
```

###### step 6 : use docker image
```
docker run -e PORT=8000 -p 8000:8000 nikhivishwa/nodejsapp
```

###### running docker compose
```
docker compose up
```

###### running docker compose in detach mode (in background)
```
docker compose up -d
```

###### remove docker compose
```
docker compose down
```

##### Docker net working

###### inspect bridge network (it is default mode)
```
docker network inspect bridge
```

###### list all networks
```
 docker network ls
```
###### networking types

###### in bridge network we have to explicitly mention or expose ports bcz the are inside the docker container

###### in host network the docker container and locale machine are at same network so the machine's port is availabvle to container

###### in none network the docker container doesnot have the internet access

###### create custom network
```
docker network create -d bridge mynetwork
```

###### create container with custom network
```
docker run -it --network-mynetwork --name tony_stark ubuntu
```
############################################
############# install docker ###############  
############################################
1. install docker library

sudo apt-get update && sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

2. add GPG key

sudo mkdir -p /etc/apt/keyrings && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

3. set stable saving library

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

4. install docker engin

sudo apt-get update && sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

5. use hello-world to test whether install successful

sudo docker run hello-world

## you will get 

Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
2db29710123e: Pull complete 
Digest: sha256:e18f0a777aefabe047a671ab3ec3eed05414477c951ab1a6f352a06974245fe7
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/

############# install success ###############

#############################################
############### other setup ################# 
#############################################

1. create docker group

sudo groupadd docker

2. add user in your group

sudo usermod -aG docker $USER

3. restart group member

newgrp docker

4. test whether execute docker without sudo

docker run hello-world

5. let docker autostart when it start

sudo systemctl enable docker.service
############### finish setup #################

##############################################
########## NVIDIA-container-runtime ##########
##############################################

1. check your driver

nvidia-smi

2. install nvidia docker 

sudo apt-get update && sudo apt-get install -y nvidia-docker2

3. restart docker

sudo systemctl restart docker

4. create a container and delete it

sudo docker run --rm --gpus all nvidia/cuda:11.0.3-basenv.04 nvidia-smi
############### test finish ##################
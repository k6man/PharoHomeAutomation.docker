from : http://wiki.astares.com/pharo/613

# build the docker image:
sudo docker build -t k6man/pharohomeautomation:v0.1 .

# Run it interactively as a container
sudo docker run -it k6man/pharohomeautomation:v0.1 /bin/bash

# Run container as server
sudo docker run --name pharohomeautomation -p:8080:8080 -p:40423:40423 --ulimit rtprio=2:2   k6man/pharohomeautomation:v0.1
sudo docker run --name pharohomeautomation -p:8080:8080 -p:40423:40423 --ulimit rtprio=2:2 -v $HOME/pharo:/pharo   k6man/pharohomeautomation:v0.1

#mkdir $HOME/pharo
xhost +SI:localuser:root
docker run -e DISPLAY=$DISPLAY \
           -v $HOME/pharo:/data \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
           --rm -it leoditommaso/pharo



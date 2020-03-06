
sudo docker run --name pharohomeautomation -it -d -p:8080:8080 -p:40423:40423 --ulimit rtprio=2:2 -v $HOME/pharo:/pharo   k6man/pharohomeautomation:v0.1


######################################
# Based on Ubuntu image
######################################
FROM ubuntu:18.04

######################################
# Basic project infos
######################################
LABEL maintainer="Christophe Vaugelade"

######################################
# Update Ubuntu apt and install some tools
######################################
RUN  apt-get update \
  && apt-get install -y wget \
  && apt-get install -y git \
  && apt-get install -y unzip \
  && rm -rf /var/lib/apt/lists/*

######################################
# Have an own directory for the tool
######################################
RUN mkdir pharo
VOLUME /pharo
WORKDIR /pharo

######################################
# Download Pharo using Zeroconf & start script
######################################
RUN echo "*      hard    rtprio  2" >> /etc/security/limits.d/pharo.conf 
RUN echo "*      soft    rtprio  2" >> /etc/security/limits.d/pharo.conf 
#RUN wget -O- https://get.pharo.org/64/70+vm | bash
#RUN wget -O- https://get.pharo.org/64/stable | bash

#COPY load.st load.st
#RUN ./pharo Pharo.image load.st

######################################
# Expose port 8080 of Zinc outside the container
######################################
EXPOSE 8080
EXPOSE 40423

######################################
# Finally run headless as server
######################################
CMD ./pharo --headless Pharo.image remotePharo --startServerOnPort=40423 --no-quit

FROM debian:latest

MAINTAINER Caio Mathielo <mathielo@gmail.com>

# Install required packages
RUN dpkg --add-architecture i386 && apt-get update
RUN apt-get install -y curl lib32gcc1 lib32stdc++6 libcurl4-gnutls-dev:i386 && apt-get clean

# Create specific user to run DST server
RUN useradd -ms /bin/bash/ dst
USER dst
WORKDIR /home/dst

# Install Steam CMD (https://developer.valvesoftware.com/wiki/SteamCMD#Downloading_SteamCMD)
RUN curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -
RUN mkdir -p server_dst/mods

# Install Don't Starve Together
RUN ./steamcmd.sh +@ShutdownOnFailedCommand 1 +@NoPromptForPassword 1 +login anonymous +force_install_dir /home/dst/server_dst +app_update 343050 validate +quit

VOLUME ["/home/dst/.klei/DoNotStarveTogether", "/home/dst/server_dst/mods"]

COPY ["start-container-server.sh", "/home/dst/"]

ENTRYPOINT ["/home/dst/start-container-server.sh"]

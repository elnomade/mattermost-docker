# Copyright (c) 2016 Mattermost, Inc. All Rights Reserved.
# See License.txt for license information.
FROM mysql:5

#
# Configure SQL
#

ENV MYSQL_ROOT_PASSWORD=h4bfSE4YvxFRvVZ2PrbHUD8DWFfJKG
ENV MYSQL_USER=matter
ENV MYSQL_PASSWORD=h4bfSE4YvxFRvVZ2PrbHUD8DWFfJKG
ENV MYSQL_DATABASE=mm3

#
# Configure Mattermost
#
WORKDIR /opt

# Copy over files
ADD https://releases.mattermost.com/3.5.1-rc2/mattermost-team-3.5.1-rc2-linux-amd64.tar.gz .
RUN tar -zxvf ./mattermost-team-3.5.1-rc2-linux-amd64.tar.gz
ADD config_docker.json ./mattermost/config/config_docker.json
ADD docker-entry.sh . 

RUN chmod +x ./docker-entry.sh
ENTRYPOINT ./docker-entry.sh

# Create default storage directory
RUN mkdir ./mattermost-data
VOLUME ./mattermost-data

# Ports
EXPOSE 8065

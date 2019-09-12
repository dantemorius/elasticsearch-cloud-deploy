#!/bin/bash
set -e

# Get the PGP Key
# wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

# echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-7.x.list

apt-get update
if [ -z "$ES_VERSION" ]; then
    echo "Installing latest Logstash version"
    apt-get install logstash
else
    echo "Installing Logstash version $ES_VERSION"
    apt-get install logstash=$ES_VERSION
fi

# This needs to be here explicitly because of a long first-initialization time of logstash
systemctl daemon-reload
systemctl enable logstash.service
sudo service logstash start
sudo service logstash status


#!/bin/bash

# Use bundle to install the needed Ruby Gems
bundle install

# Install and start elasticsearch
wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb http://packages.elastic.co/elasticsearch/2.x/debian stable main" | sudo tee -a /etc/apt/sources.list.d/elasticsearch-2.x.list
sudo apt-get update && sudo apt-get install elasticsearch
sudo update-rc.d elasticsearch defaults 95 10
sudo /etc/init.d/elasticsearch restart

# Migrate the database appropriately using rake and elasticsearch
rake db:migrate
rake searchkick:reindex:all
rake db:seed
rake db:migrate

#!/bin/bash

# Use bundle to install the needed Ruby Gems
bundle install

# Install and start elasticsearch
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-6.x.list
echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | sudo tee -a /etc/apt/sources.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | sudo tee -a /etc/apt/sources.list
sudo apt update
sudo apt-add-repository ppa:webupd8team/java
sudo apt install apt-transport-https -y
sudo apt update
sudo apt-get install oracle-java8-installer -y
sudo apt-get update && sudo apt-get install elasticsearch

sudo update-rc.d elasticsearch defaults 95 10
sudo -i service elasticsearch start

sleep 10
# Migrate the database appropriately using rails and elasticsearch
rails db:environment:set RAILS_ENV=development
rails db:reset
rails searchkick:reindex:all

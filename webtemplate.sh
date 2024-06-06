#!/bin/bash
###### Script for deploying website #############

#Installing Dependencies

echo "#########################################"
echo "Installing dependencies"
echo "########################################"

sudo yum install httpd wget unzip -y > /dev/null
echo

# Enabling services

echo "########################################"
echo "Start and Enable HTTPD service"
echo "########################################"

sudo systemctl start httpd
sudo systemctl enable httpd
echo

# Creating Temp Directory

echo "########################################"
echo "Start Artifact Deployment"
echo "########################################"

mkdir -p /tmp/webfiles
cd /tmp/webfiles
echo

wget https://www.<add_your_url>.zip

#Copying the web template files to public_html

sudo cp -r <replace_your_foldername_here>/* /var/www/html
echo
#Bounce Service

echo "########################################"
echo "Restating HTTPD SErvice"
echo "########################################"

sudo systemctl restart httpd
echo
# REmoving temp files

echo "########################################"
echo "Clean up"
echo "########################################"
sudo rm -rf tmp/webfiles

echo

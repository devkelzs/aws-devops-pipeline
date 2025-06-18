#!/bin/bash
exec > /var/log/user-data.log 2>&1
set -xe

# Update system
sudo apt update -y

# Install OpenJDK 17
sudo apt install -y openjdk-17-jdk

# Add Jenkins GPG key and repository
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update package list again
sudo apt update -y

# Install Jenkins
sudo apt install -y jenkins

# Start and enable Jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins
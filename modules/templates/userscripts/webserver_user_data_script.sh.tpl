#!/bin/bash

sudo touch /tmp/authorized_keys
sudo echo "${public_key_openssh}" > /tmp/authorized_keys

info () {
            printf "\e[1;34m[Configuration]:: %s ::\e[0m\n" "$*"
    }

error () {
            printf "\e[1;31m[Configuration.bash]:: %s ::\e[0m\n" "$*"
    }


user_create (){
    uname=$1
    if sudo id -u "$uname" >/dev/null 2>&1; then
    info "user $uname already exists"
    else
    info "user does not exist, user $uname will be created"
    sudo useradd $uname
    info "$uname created"
    info "adding user configuration for ssh"
    sudo echo "$uname  ALL=(ALL:ALL) ALL" | sudo tee -a /etc/sudoers.d/$uname
    sudo echo "$uname ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers.d/$uname
    sudo mkdir -p /home/$uname/.ssh
    sudo cp /tmp/authorized_keys /home/$uname/.ssh/authorized_keys
    sudo chown -R $uname:$uname /home/$uname/.ssh
    sudo chmod 700 /home/$uname/.ssh
    sudo chmod 600 /home/$uname/.ssh/authorized_keys
    sudo usermod -aG sudo $uname
    info "user configuration for ssh completed"
    sudo service sshd restart
    fi
}

sudo yum install telnet net-tools wget unzip python3 automake fuse fuse-devel gcc-c++ git libcurl-devel libxml2-devel make openssl-devel -y

sudo yum update -y

sudo yum install httpd -y

sudo service httpd start

sudo chkconfig httpd on

sudo mkdir -p /var/www/html

sudo touch /var/www/html/index.html

hostname -f >> /var/www/html/index.html

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

user_create "${user-role}-user"
rm -rf /tmp/*

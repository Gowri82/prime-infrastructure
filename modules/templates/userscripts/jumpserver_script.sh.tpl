#!/bin/bash
sudo touch /tmp/authorized_keys
sudo touch /tmp/id_rsa
sudo echo "${public_key_openssh}" > /tmp/authorized_keys
sudo echo "${private_key_pem}" > /tmp/id_rsa


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
    sudo cp /tmp/id_rsa /home/$uname/.ssh/id_rsa
    sudo chown -R $uname:$uname /home/$uname/.ssh
    sudo chmod 700 /home/$uname/.ssh
    sudo chmod 600 /home/$uname/.ssh/authorized_keys
    sudo chmod 600 /home/$uname/.ssh/id_rsa
    sudo usermod -aG sudo $uname
    info "user configuration for ssh completed"
    sudo service sshd restart
    fi
}

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

user_create "${user-role}-user"

rm -rf /tmp/*

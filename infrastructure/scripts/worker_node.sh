#!/bin/bash
sudo apt update -y
sudo apt install -y python3

sudo useradd -m ansible
sudo mkdir -p /home/ansible/.ssh

sudo cat <<EOF > /home/ansible/.ssh/authorized_keys
${control_pubkey}
EOF

sudo chmod 600 /home/ansible/.ssh/authorized_keys
sudo chown -R ansible:ansible /home/ansible/.ssh

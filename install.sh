#!/usr/bin/bash

mkdir -p ~/.local/bin/
wget https://raw.githubusercontent.com/sreedevk/aws-ssh/main/aws-ssh -P ~/.local/bin
cat > ~/.aws-ssh-config <<-EOF
# PRIVATE_KEY=~/.ssh/somekey.pem
# BASTION=username@192.168.50.100
# DEFAULT_USER=ec2-user
EOF

echo -e "\033[0;32mAWS-SSH Has Been Installed Successfully\033[0m"
echo "Post Installation Steps:"
echo "1. Configure AWS-SSH settings at ~/.aws-ssh-config"
echo "2. Restart your bash/zsh Session"

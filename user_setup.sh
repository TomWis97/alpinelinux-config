#!/bin/bash
echo "################################################"
echo "# Generating SSH keys. Input required.         #"
echo "################################################"
ssh-keygen -b 4096 -f ~/.ssh/id_rsa
echo 
echo "################################################"
echo "# Add this key to GitHub.                      #"
echo "################################################"
cat ~/.ssh/id_rsa.pub
echo "################################################"
read -p "Press Enter to continue."
git clone git@github.com:TomWis97/alpinelinux-config.git ~/alpinelinux-config
pip3 install --user git+https://github.com/powerline/powerline
ln -s ~/alpinelinux-config/configs/bashrc ~/.bashrc
ln -s ~/alpinelinux-config/configs/tmux.conf ~/.tmux.conf
ln -s ~/alpinelinux-config/configs/vimrc ~/.vimrc
echo 'source ~/.bashrc' > ~/.bash_profile

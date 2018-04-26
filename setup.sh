#!/bin/ash
username=tom
uid=`id -u`
if [[ $uid != 0 ]]
then
    echo "Run as root"
    exit 1
fi
set -xe
apk add bash bash-doc bash-completion python3 git vim tmux
pip3 install --upgrade pip
adduser -s /bin/bash $username
userscript="/home/$username/user_setup.sh"
cp ~/alpinelinux-config/user_setup.sh "$userscript"
chown $username $userscript
chmod 550 $userscript
su - tom $userscript
rm $userscript
echo Done.

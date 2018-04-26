#!/bin/ash
echo $0
if [[ $0 != "./setup.sh" ]]
then
    echo "cd to the git repo first."
    exit 1
fi
username=tom
uid=`id -u`
if [[ $uid != 0 ]]
then
    echo "Run as root"
    exit 1
fi
set -xe
apk update
apk upgrade
apk add bash bash-doc bash-completion python3 git vim tmux ncurses
pip3 install --upgrade pip
adduser -s /bin/bash $username
userscript="/home/$username/user_setup.sh"
cp ~/alpinelinux-config/user_setup.sh "$userscript"
chown $username $userscript
chmod 550 $userscript
echo Running script as user.
su - tom $userscript
rm $userscript
echo Done.

#!/bin/bash
# example ./new-repo.sh foo

# colors for output
D_COLOR='\033[1;33m'
H_COLOR='\033[0;32m'
NO_COLOR='\033[0m'

# location where the repos are stored
GIT_DIR="/git"

# username and group of the git server user
GIT_USER="git-server"
GIT_GROUP="git-server"

# end of the repo name, default is .git
GIT_END=".git"

# remote name and port for the server, used to help the user copy paste the remote command
GIT_REMOTE_NAME="local-lan"
GIT_REMOTE_PORT="1776"

# get the local IP if the server has ifconfig
L_IP=$(ifconfig 2>/dev/null | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')

if [ -z $L_IP ]
then
	L_IP="<ip-address>"
fi

# start
if [ -z $1 ]
then
	echo "Syntax error, please type './new-repo.sh <repo_name>'"
else
	printf "${D_COLOR}Creating Repo '%s%s' in '%s'${NO_COLOR}\n" $1 $GIT_END $GIT_DIR
	cd $GIT_DIR
	sudo mkdir $1$GIT_END
	cd $1$GIT_END
	sudo git init --bare
	cd ..
	printf "${D_COLOR}Giving ownership of folders to '%s'${NO_COLOR}\n" $GIT_USER
	sudo chown -R $GIT_USER:$GIT_GROUP $1$GIT_END
	printf "${D_COLOR}Complete.\nDon't forget to add this server to your git remote via:${NO_COLOR}\n"
	printf "${H_COLOR}git remote add %s ssh://%s@%s:%s%s/%s%s${NO_COLOR}\n" $GIT_REMOTE_NAME $GIT_USER $L_IP $GIT_REMOTE_PORT $GIT_DIR $1 $GIT_END
fi


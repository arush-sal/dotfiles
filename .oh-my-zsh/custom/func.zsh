#git remote add upstream https://github.com/whoever/whatever.git

# Fetch all the branches of that remote into remote-tracking branches,
# # such as upstream/master:
#
# git fetch upstream
#
# # Make sure that you're on your master branch:
#
# git checkout master
#
# # Rewrite your master branch so that any commits of yours that
# # aren't already in upstream/master are replayed on top of that
# # other branch:
#
# git rebase upstream/master

minikube-restart() {
	minikube stop $@;
	minikube start $@;
}

goclone(){
	floc=$(echo "$@" | grep -o -E 'github.com[:/].+')
	floc=$(echo $floc | sed -r 's|:|/|g' | cut -d'.' -f-2)
	echo $floc
	git clone $@ $GOSRC/$floc
}

ggocd(){
	dir=$(find $GOSRC -maxdepth 3 -iname $1 -type d)
	cd $dir
}

update_github_tool() {
	download_url=$(curl -s https://api.github.com/repos/$1/releases/latest | jq -r '.assets[].browser_download_url' | grep "linux-amd64")
	download_location=/tmp/$2
	bin_location=$(which $2)
	echo "\nDownloading $2 in /tmp\n"
	wget -q --show-progress -c -O $download_location $download_url
	sudo mv $download_location $bin_location
	sudo chmod +x $bin_location
}

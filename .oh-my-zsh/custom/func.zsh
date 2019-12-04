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
	echo $floc
	git clone $@ $GOGITHUB/$floc
}

ggocd(){
	dir=$(find $GOSRC -maxdepth 3 -iname $1 -type d)
	cd $dir
}

 export GOPATH=~/go
 export GOBIN="$GOPATH/bin"
 export GOSRC="$GOPATH/src"
 export GOGITHUB="$GOSRC/github.com"
 export GOARUSH="$GOGITHUB/arush-sal"
 export GO111MODULE=off
 export DOCKER_BUILDKIT=1
 export PATH="$PATH:$GOBIN:$HOME/.local/bin:${KREW_ROOT:-$HOME/.krew}/bin"

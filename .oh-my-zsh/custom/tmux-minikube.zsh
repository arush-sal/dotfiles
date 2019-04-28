function minikube-tmux() {
    if ! tmux ls|grep "minikube"; then {
    	tmux new-session -d -s minikube
    }
    fi
    tmux send-keys -t minikube:1 'clear; minikube start' Enter
    tmux select-window -t minikube:1
    tmux switch-client -t minikube
}
function odo-tmux() {
    if ! tmux ls|grep "minikube"; then {
    	tmux new-session -d -s minikube
    }
    fi
    tmux send-keys -t minikube:1 'clear; minikube start -p odo' Enter
    tmux select-window -t minikube:1
    tmux switch-client -t minikube
}

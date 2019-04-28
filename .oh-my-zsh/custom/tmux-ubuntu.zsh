function ubuntu-tmux() {
	if ! tmux ls|grep "ubuntu-vm"; then {
		tmux new-session -d -s ubuntu-vm
	}
	fi
	tmux split-window -v -t ubuntu-vm:1
	tmux send-keys -t ubuntu-vm:1.2 'VBoxManage startvm test_ubuntu --type headless && logout' Enter
	tmux send-keys -t ubuntu-vm:1.1 'clear; printf "VM starting"; while; do if ssh -q noob@192.168.99.101 exit&> /dev/null; then ssh noob@192.168.99.101; break;else printf .; fi; done' Enter
	tmux switch-client -t ubuntu-vm
}

init:
	@echo "Installing Ansible Modules"
	ansible-galaxy collection install ansible.posix

kconf:
	@echo "export KUBECONFIG='~/.kube/Terryon-Lock-kubeconfig.yaml'"

mkssh: 
	ssh-keygen -b 2048 -t rsa -f ~/.ssh/cluster -q -N "" | bash

clean-up:
	@echo "Cleaning up..."
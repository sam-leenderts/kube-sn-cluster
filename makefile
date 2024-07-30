init:
	make setup | tee logs/init.log

kconf:
	@echo "export KUBECONFIG='~/.kube/Terryon-Lock-kubeconfig.yaml'"

build-SN:
	ansible-playbook -i ansible/hosts ansible/initial.yml | tee logs/build.log
	ansible-playbook -i ansible/hosts ansible/kube-dependencies.yml | tee -a logs/build.log
	ansible-playbook -i ansible/hosts ansible/kube-init.yml | tee -a logs/build.log

set-up: 
	@echo "Installing Ansible Modules"
	@echo "-----------------------------"
	ansible-galaxy collection install ansible.posix
	@echo "-----------------------------"
	@echo "Checking for logs/"
	@if ! [ -d ./logs/ ]; then \
			echo "Making logs/"; \
            mkdir logs; \
        fi
	@echo "-----------------------------"
	@echo "Checking for cluster SSH key"
	@if ! [ -f ~/.ssh/cluster ]; then \
			echo "Key not found, making SSH Key"; \
             ssh-keygen -b 2048 -t rsa -f ~/.ssh/cluster -q -N "" | bash; \
        fi
	@echo "-----------------------------"

clean-up:
	@echo "Cleaning up..."
	rm -rf logs/
	rm -rf ~/.ssh/cluster ~/.ssh/cluster.pub
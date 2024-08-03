# Kubernetes single node cluster
This guide has been tested using docker as the container runtime and Kubernetes V1.30

## Prerequisites
- A machine running Ubuntu 24.04 LTS with a minimum 2 GiB of RAM and 2 CPUs
    - A ssh key installed on the target machine
- [Ansible Installed on your local machine](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-the-control-machine)
- Clone this repo to your local machine

## Set-up
```bash
make init
```

# Instructions

The cluster can be build by following each step below or by using the `make build` command. This command use the default settings and will build a Kubernetes 1.30 single node Cluster.

## Creating a Non-Root User

The non-root user is used to access the Kubernetes' API from the node

Edit the IP address for **singlenode** machine in the `ansible/host` file to your machine's IP address

```yaml
[master_node]
singlenode ansible_host=<Master_Node_IP> ansible_user=root 
```

Run the `initial.yml` playbook 
``` bash
ansible-playbook -i ansible/hosts ansible/initial.yml
```

## Installing Kubernetes' Dependencies 
Update the **kube_version** in host in the `ansible/host` file 

```yaml
kube_version=1.30
```

Run the `kube-dependencies.yml` playbook 
``` bash
ansible-playbook -i ansible/hosts ansible/kube-dependencies.yml
```

## Creating the Cluster

Run the `kube-init.yml` playbook 
``` bash
ansible-playbook -i ansible/hosts ansible/kube-init.yml
```

# Connecting to the Kube API

```bash 
ssh ubuntu@Master_Node_IP
```

```bash 
kubectl get nodes
kubectl get pods -A
```

# References 
- [How To Create a Kubernetes Cluster Using Kubeadm on Ubuntu 20.04](https://www.digitalocean.com/community/tutorials/how-to-create-a-kubernetes-cluster-using-kubeadm-on-ubuntu-20-04#step-7-running-an-application-on-the-cluster)
- [Create a k8 cluster with kubeadm](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/#before-you-begin)
- [Install-kubeadm](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/)
- [Bug - Updating from such a repository can't be done securely, and is therefore disabled by default](https://stackoverflow.com/questions/70318835/ansible-throwing-a-failed-to-update-apt-cache-wupdating-from-such-a-repositor)
- [CSI Drivers](https://kubernetes-csi.github.io/docs/drivers.html)
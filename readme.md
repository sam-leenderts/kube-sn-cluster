# Kube SNO Cluster

## Prerequisites
- Ubuntu 24.04 LTS installed on the node 
- Ansible Installed on your local machine

# Instructions
## Creating Non-Root User
Edit the ip address for **singlenode** host in the `ansible/host` file

```yaml
[control_plane]
singlenode ansible_host=<control_plane_ip> ansible_user=root 
```

Run the playbook
`ansible-playbook -i ansible/hosts ansible/initial.yml`

## Installing Kube Dependencies 
Update the **kube_version** in host in the `ansible/host` file 

```yaml
kube_version=1.29.7-00
```

`ansible-playbook -i ansible/hosts ansible/kube-dependencies.yml`

# References 
[How To Create a Kubernetes Cluster Using Kubeadm on Ubuntu 20.04](https://www.digitalocean.com/community/tutorials/how-to-create-a-kubernetes-cluster-using-kubeadm-on-ubuntu-20-04
)
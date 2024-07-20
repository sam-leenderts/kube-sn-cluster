# Kube SNO Cluster

## Prerequisites
- Ubuntu 24.04 LTS installed on the node 
- Ansible Installed

# Instructions
## Creating Non-Root User
Edit the ip address for **singlenode** host in the `ansible/host` file

```yaml
[control_plane]
singlenode ansible_host=<control_plane_ip> ansible_user=root 
```

Run the playbook
`ansible-playbook -i ansible/hosts ansible/initial.yml`
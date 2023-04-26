# Clone Virtual Machines in Proxmox

Assumes you already have a base image VM created and an ssh key to run `qm` commands on the proxmox server.

# TODO

Enable cloud-init.

# How to use

```
export PM_API_TOKEN_ID='terraform@pve!terraform' PM_API_TOKEN_SECRET=xxxxxxxxxxxxxxxxxxxxxxx
terraform init
terraform plan
terraform apply

```
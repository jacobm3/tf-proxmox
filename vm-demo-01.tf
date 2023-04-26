resource "proxmox_vm_qemu" "tf-demo-01" {
  name        = "tf-demo-01"
  target_node = "proxmox"

  clone = "ubuntu-22.04-lts-clone-me"

  cores   = 2
  memory  = 2048
  balloon = 1024

  agent = 1

  lifecycle {
    ignore_changes = [
      network
    ]
  }

#   os_type = "cloud-init"

  # bug in proxmox provider. Tell provider to not start the vm, 
  # just start it manually with qm cli
  # https://github.com/Telmate/terraform-provider-proxmox/issues/460
  oncreate = false
  provisioner "local-exec" {
    command = "ssh root@mox.home.internal qm start `basename ${self.id}` "
  }

}

output "vmid" {
  value = proxmox_vm_qemu.tf-demo-01.id
}
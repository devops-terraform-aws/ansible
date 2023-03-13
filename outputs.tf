output "ansible_controller_ssh" {
  value = "ssh -i '${module.unique_name.unique}.pem' ubuntu@${module.ansible_controller.ip_address}"
}

output "tomcat_servers" {
  value = [
    for instance in module.worker : {
      "${instance.tags.Name}" = "ssh -i '${module.unique_name.unique}.pem' ubuntu@${instance.ip_address}"
    }
  ]
}


# output "controller_ssh" {
#   value = "ssh -i '${module.unique_name.unique}.pem' ubuntu@${module.jenkins.ip_address}"
# }

# output "tomcat_servers" {
#   value = [
#     for instance in module.tomcat : {
#       "${instance.tags.Name}" = format("%s:%d", instance.ip_address, 8080)
#     }
#   ]
# }


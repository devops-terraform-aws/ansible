# Ansible Controller and Worker
- The Ansible controller is a machine where Ansible is installed, and from which Ansible is run. Worker nodes are the machines that Ansible controls.
## Setup Environment
- Configure virtual environment on `Ubuntu WSL`
```
sudo ln -sf $(which python3) /usr/bin/python && sudo apt install python3-venv -y && sudo apt install unzip -y
```
```
python --version
```
```
python -m venv venv && source venv/bin/activate
```

## Automated Terraform Installation
- Run `install-terraform.sh` and source `venv`
```
./install-terraform.sh 
```
```
source venv/bin/activate
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.11 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.20.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.58.0 |
| <a name="provider_http"></a> [http](#provider\_http) | 3.2.1 |
| <a name="provider_null"></a> [null](#provider\_null) | 3.2.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ansible_controller"></a> [ansible\_controller](#module\_ansible\_controller) | ./modules/ec2-instance | n/a |
| <a name="module_aws_key"></a> [aws\_key](#module\_aws\_key) | ./modules/ssh-key | n/a |
| <a name="module_security_group"></a> [security\_group](#module\_security\_group) | ./modules/security-group | n/a |
| <a name="module_unique_name"></a> [unique\_name](#module\_unique\_name) | ./modules/random | n/a |
| <a name="module_worker"></a> [worker](#module\_worker) | ./modules/ec2-instance | n/a |

## Resources

| Name | Type |
|------|------|
| [null_resource.generated_key](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [aws_ami.ubuntu-linux-2004](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [http_http.myip](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Instance type to use for the instance. Updates to this field will trigger a stop/start of the EC2 instance. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name to assign to the resource. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Specify the region to for resources to be created. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ansible_controller_ssh"></a> [ansible\_controller\_ssh](#output\_ansible\_controller\_ssh) | n/a |
| <a name="output_tomcat_servers"></a> [tomcat\_servers](#output\_tomcat\_servers) | n/a |

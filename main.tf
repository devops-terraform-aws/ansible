module "ansible_controller" {
  source          = "./modules/ec2-instance"
  ami             = data.aws_ami.ubuntu-linux-2004.id
  key_name        = module.aws_key.get_key_name
  instance_type   = var.instance_type
  name            = "ansible-controller-${var.name}"
  user_data       = file("${path.module}/modules/scripts/ansible.sh")
  security_groups = module.security_group.security_name
  region          = var.region
}

module "worker" {
  source = "./modules/ec2-instance"
  for_each = {
    for index, i in local.ec2_instance :
    i.name => i
  }
  ami             = data.aws_ami.ubuntu-linux-2004.id
  key_name        = module.aws_key.get_key_name
  instance_type   = "t2.micro"
  security_groups = module.security_group.security_name
  name            = "worker-${each.value.name}-${var.name}"
  # user_data       = templatefile("${path.module}/scripts/tomcat.sh.tftpl", { env = each.value.name })
  user_data = ""
  region    = var.region
}

module "aws_key" {
  source   = "./modules/ssh-key"
  key_name = module.unique_name.unique
}

module "unique_name" {
  source = "./modules/random"
}

resource "null_resource" "generated_key" {
  provisioner "local-exec" {
    command = <<-EOT
        echo '${module.aws_key.private_key}' > ./'${module.unique_name.unique}'.pem
        chmod 400 ./'${module.unique_name.unique}'.pem
      EOT
  }
}

module "security_group" {
  source      = "./modules/security-group"
  name        = "${local.name}-${module.unique_name.unique}"
  cidr_blocks = ["${chomp(data.http.myip.response_body)}/32"]
}
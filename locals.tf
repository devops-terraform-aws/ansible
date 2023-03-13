locals {
  name = "security-${var.name}"
  ec2_instance = [{
    name = "worker-1"
    },
    {
      name = "worker-2"
    },
    {
      name = "worker-3"
    }
  ]
}
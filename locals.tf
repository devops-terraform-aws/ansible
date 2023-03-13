locals {
  name = "security-${var.name}"
  ec2_instance = [{
    name = "1"
    },
    {
      name = "2"
    },
    {
      name = "3"
    },
    {
      name = "4"
    }
  ]
}
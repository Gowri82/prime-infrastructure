### SECURITY GROUP RESOURCES ###

resource "aws_security_group" "sg" {
  name   = var.security_group_name
  vpc_id = var.vpc_id
  tags = {
    "Name"        = var.security_group_name
    "role"        = var.user-role
    "Owner"       = var.owner
  }
}


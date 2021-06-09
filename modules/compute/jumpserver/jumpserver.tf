data "template_file" "user_data" {
  template = file("${var.user_data}")
  vars = {
    user-role       = var.user-role
    public_key_openssh = var.public_key_openssh
    private_key_pem = var.private_key_pem
  }
}

# Referencing latest AMI

/*data "aws_ami" "amazon-linux-2" {
  most_recent = true
  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["amazon"]
}*/

resource "aws_instance" "jumpserver" {
  ami                     = var.ami_id
  key_name                = var.key_name
  subnet_id               = var.subnet_id
  instance_type           = "t2.micro"
  security_groups         = var.security_group_id
  iam_instance_profile    = var.iam_instance_profile
  user_data               = data.template_file.user_data.rendered
  root_block_device {
    volume_type           = "gp2"
    volume_size           = "30"
    delete_on_termination = "true"
  }
  tags = {
    "Name"                = "${var.project}-${var.user-role}-jumpserver"
    "Role"                = var.user-role
 	  "Region"              = var.region
    "Owner"               = var.owner
    "Project"             = var.project
  }
}

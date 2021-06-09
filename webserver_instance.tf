##************ EC2 Instance - Web Server ***********************##

module "webserver" {
source               = "./modules/compute/webserver"
key_name             = module.key.key_name
owner                = var.owner
project              = var.project
user-role            = var.user-role
region               = var.region
subnet_id            = module.vpc.private_subnets_id[0]
security_group_id    = module.web_sg.security_group_id
user_data            = module.templates.webserver_user_data
public_key_openssh   = module.key.public_key_openssh
ami_id               = data.aws_ami.amazon-linux-2.id
}
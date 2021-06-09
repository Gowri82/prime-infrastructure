##************ EC2 Instance - Jump Server ***********************##

module "jumpserver" {
source               = "./modules/compute/jumpserver"
key_name             = module.key.key_name
owner                = var.owner
project              = var.project
user-role            = var.user-role
region               = var.region
subnet_id            = module.vpc.public_subnets_id[0]
security_group_id    = module.sg.security_group_id
iam_instance_profile = module.iam_ec2_profile.ec2_instance_profile
user_data            = module.templates.jumpserver_user_data
public_key_openssh   = module.key.public_key_openssh
private_key_pem      = module.key.private_key_pem
ami_id               = data.aws_ami.amazon-linux-2.id
}
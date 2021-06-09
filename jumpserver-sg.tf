##***************** Security Group & Rules - Jumpserver*************************##

module "sg" {
  source                  = "./modules/securitygp"
  security_group_name     = "jumpserver_sg"
  vpc_id                  = module.vpc.vpc_id
  user-role               = var.user-role
  description             = "instance security group"
  owner                   = var.owner
}

module "ingress_rule1" {
  source                  = "./modules/sgrules/cidr_range"
  ip_cidr_range           = ["${module.local_ip.public_ip}/32"]
  security_group_id       = module.sg.security_group_id[0]
  type                    = var.direction1
  from_port               = "22"
  to_port                 = "22" 
  protocol                = var.protocol1
  description             = "ssh traffic allow to dock ip"
}


module "ingress_rule2" {
  source                  = "./modules/sgrules/cidr_range"
  ip_cidr_range           = "${var.ingress_ip_cidr_range}"
  security_group_id       = module.sg.security_group_id[0]
  type                    = var.direction1
  from_port               = "80"
  to_port                 = "80" 
  protocol                = var.protocol1
  description             = "http traffic allow all"
}

module "ingress_rule3" {
  source                  = "./modules/sgrules/cidr_range"
  ip_cidr_range           = "${var.ingress_ip_cidr_range}"
  security_group_id       = module.sg.security_group_id[0]
  type                    = var.direction1
  from_port               = "443"
  to_port                 = "443" 
  protocol                = var.protocol1
  description             = "https traffic allow all"
}

module "ingress_rule4" {
  source                  = "./modules/sgrules/dest_sg"
  security_group_id       = module.sg.security_group_id[0]
  type                    = var.direction1
  from_port               = "0"
  to_port                 = "0" 
  protocol                = var.protocol3
  source_security_group_id = module.sg.security_group_id[0]
  description             = "allow all traffic to self"
}

module "egress_rule1" {
  source                  = "./modules/sgrules/cidr_range"
  ip_cidr_range           = "${var.egress_ip_cidr_range}"
  security_group_id       = module.sg.security_group_id[0]
  type                    = var.direction2
  from_port               = "0"
  to_port                 = "0" 
  protocol                = var.protocol3
  description             = "dock instance egress allow all traffic"
}
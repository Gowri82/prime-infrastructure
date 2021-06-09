##***************** Security Group & Rules - Webserver *******************##

module "web_sg" {
  source                  = "./modules/securitygp"
  security_group_name     = "webserver_sg"
# vpc_id                  = var.vpc_id
  vpc_id                  = module.vpc.vpc_id
# environment             = var.environment
  description             = "instance security group"
  owner                   = var.owner
}

module "web_ingress_rule1" {
  source                  = "./modules/sgrules/dest_sg"
  security_group_id       = module.web_sg.security_group_id[0]
  type                    = var.direction1
  from_port               = "22"
  to_port                 = "22" 
  protocol                = var.protocol1
  source_security_group_id = module.sg.security_group_id[0]
  description             = "ssh traffic allow to jump server"
}

module "web_ingress_rule2" {
  source                  = "./modules/sgrules/dest_sg"
  security_group_id       = module.web_sg.security_group_id[0]
  type                    = var.direction1
  from_port               = "80"
  to_port                 = "80" 
  protocol                = var.protocol1
  source_security_group_id = module.sg.security_group_id[0]
  description             = "http traffic allow to jump server"
}

module "web_ingress_rule3" {
  source                  = "./modules/sgrules/dest_sg"
  security_group_id       = module.web_sg.security_group_id[0]
  type                    = var.direction1
  from_port               = "443"
  to_port                 = "443" 
  protocol                = var.protocol1
  source_security_group_id = module.sg.security_group_id[0]
  description             = "https traffic allow to jump server"
}


module "web_ingress_rule4" {
  source                  = "./modules/sgrules/dest_sg"
  security_group_id       = module.web_sg.security_group_id[0]
  type                    = var.direction1
  from_port               = "0"
  to_port                 = "0" 
  protocol                = var.protocol3
  source_security_group_id = module.web_sg.security_group_id[0]
  description             = "allow all traffic to self"
}



module "web_egress_rule1" {
  source                  = "./modules/sgrules/cidr_range"
  ip_cidr_range           = "${var.egress_ip_cidr_range}"
  security_group_id       = module.web_sg.security_group_id[0]
  type                    = var.direction2
  from_port               = "0"
  to_port                 = "0" 
  protocol                = var.protocol3
  description             = "dock instance egress allow all traffic"
}


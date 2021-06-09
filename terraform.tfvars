region = "ap-south-1"
project = "prime"
owner = "prime"
user-role = "dev"

vpc_cidr = "10.0.0.0/16"
public_subnets_cidr = ["10.0.1.0/24"]
private_subnets_cidr = ["10.0.2.0/24"]
availability_zones = ["ap-south-1a","ap-south-1b","ap-south-1c"]

#Whitelisting all traffic for Port 80 & 443
ingress_ip_cidr_range = ["0.0.0.0/0"]
egress_ip_cidr_range = ["0.0.0.0/0"]






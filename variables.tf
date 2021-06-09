## Provider variable ##
variable "aws_access_key"                  {default = ""}
variable "aws_secret_key"                  {default = ""}

# Enivornment Variable
variable "region"                      {default = ""}
variable "project"                     {default = ""}
variable "owner"                       {default = ""}
variable "user-role"                   {default = ""}

##VPC Variables
#variable "environment" {
#  description = "The Deployment environment"
#}

variable "vpc_cidr" {
  description = "The CIDR block of the vpc"
}

variable "public_subnets_cidr" {
  type        = list
  description = "The CIDR block for the public subnet"
}

variable "private_subnets_cidr" {
  type        = list
  description = "The CIDR block for the private subnet"
}

variable "availability_zones"  {
  type =list
  description = "AZ list"
}

## Security Group Variables ##
variable "security_group_name"         {default = ""}
variable "vpc_id"                      {default = ""}

## security group default variables do not change ##
variable "protocol1"                   {default = "tcp"}
variable "protocol2"                   {default = "udp"}
variable "protocol3"                   {default = "-1"}
variable "direction1"                  {default = "ingress"}
variable "direction2"                  {default = "egress"} 
              
## Security Group Rules variable ##
variable "ingress_ip_cidr_range" {
  type        = list
  description = "ingress_ip_cidr_range"
}

variable "egress_ip_cidr_range" {
  type        = list
  description = "egress_ip_cidr_range"
}

## IAM Variables ##
variable "ec2_role_name"               {default = "iam-role"}
variable "ec2_profile_name"            {default = "iam-profile"}
variable "ec2_iam_policy_name"         {default = "iam-policy"}

## Ec2 compute variables ##

variable "instance_type"         {default = ""}
variable "iam_instance_profile"  {default = ""}
variable "security_group_id"     {default = [""]}
variable "user_data"             {default = ""}

##Inatance tags variables ##
variable "release"               {default = ""}

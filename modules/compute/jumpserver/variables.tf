## Ec2 compute variables ##

variable "key_name"              {default = ""}
variable "subnet_id"             {default = ""}
variable "iam_instance_profile"  {default = ""}
variable "security_group_id"     {default = ""}
variable "user_data"             {default = ""}

##Inatance tags variables ##
variable "user-role"             {default = ""}
variable "owner"                 {default = ""}
variable "project"               {default = ""}
variable "region"                {default = ""}
variable "public_key_openssh"    {default = ""}
variable "private_key_pem"       {default = ""}
variable "ami_id"                   {default = ""}
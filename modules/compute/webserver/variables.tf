## Ec2 compute variables ##

variable "key_name"              {default = ""}
variable "subnet_id"             {default = ""}
variable "security_group_id"     {default = [""]}
variable "user_data"             {default = ""}
variable "user-role"             {default = ""}

##Inatance tags variables ##
variable "owner"                 {default = ""}
variable "project"               {default = ""}
variable "region"                {default = ""}
variable "public_key_openssh"    {default = ""}
variable "ami_id"   {default = ""}

## CIDR_RANGE Based security group rule ##

variable "security_group_id"     {default = ""}
#variable "ip_cidr_range"         {default = [""]}
variable "ip_cidr_range" {
  type        = list
  description = "ingress_ip_cidr_range"
}
variable "type"                  {default = ""}
variable "from_port"             {default = ""}
variable "to_port"               {default = ""}
variable "protocol"              {default = ""}
variable "description"           {default = ""}
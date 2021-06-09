variable "user-role"                 {default = ""}

output "iam_role_assume_policy" {
  description = "IAM assume role policy file path to input for policy creation"
#  value = "${path.module}/policies/assume_role_ec2_policy.json.tpl"
  value = "${path.module}/policies/${var.user-role}_assume_role_ec2_policy.json.tpl"
}

# user policy
output "iam_role_ec2_policy" {
  description = "IAM ec2 role policy file path to input for policy creation "
  value = "${path.module}/policies/${var.user-role}_iam_ec2_role_policy.json.tpl"
}


output "webserver_user_data" {
  description = "webserver user data script"
  value = "${path.module}/userscripts/webserver_user_data_script.sh.tpl"
}

output "jumpserver_user_data" {
  description = "ec2 useradd user data script"
  value = "${path.module}/userscripts/jumpserver_script.sh.tpl"
}


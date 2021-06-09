## Ec2 compute Output ##
output "ec2_public_ip" {
  description = "The ec2 public ip "
  value       = aws_instance.jumpserver.public_ip
}

output "ec2_instance_id" {
  description = "The ec2 instance id "
  value       = aws_instance.jumpserver.id
}


output "jump_server_public_dns" {
  description = "The Instance DNS "
  value       = aws_instance.jumpserver.public_dns
}

output "jump_server_public_ip" {
  description = "The Instance public ip "
  value       = aws_instance.jumpserver.public_ip
}
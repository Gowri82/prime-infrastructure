## Ec2 compute Output ##
output "ec2_instance_id" {
  description = "The ec2 instance id "
  value       = aws_instance.webserver.id
}

output "web_server_private_dns" {
  description = "The Instance DNS "
  value       = aws_instance.webserver.private_dns
}

output "web_server_private_ip" {
  description = "The Instance public ip "
  value       = aws_instance.webserver.private_ip
}
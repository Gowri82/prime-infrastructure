output "key_name" {
  description = "key_name "
  value       = module.key.key_name
}

output "s3_bucket_name" {
  description = "The private secure s3 bucket id "
  value       = module.s3_bucket.s3_bucket_id
}

output "web_server_private_dns" {
  description = "The Instance DNS "
  value       = module.webserver.web_server_private_dns
}

output "web_server_private_ip" {
  description = "The Instance public ip "
  value       = module.webserver.web_server_private_ip
}

output "jump_server_public_dns" {
  description = "The Instance DNS "
  value       = module.jumpserver.jump_server_public_dns
}

output "jump_server_public_ip" {
  description = "The Instance public ip "
  value       = module.jumpserver.jump_server_public_ip
}
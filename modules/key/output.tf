output "id" {
  description = "key id "
  value       = aws_key_pair.key.id
}

output "arn" {
  description = "key arn"
  value       = aws_key_pair.key.arn
}

output "key_name" {
  description = "key_name "
  value       = aws_key_pair.key.key_name
}

output "public_key_openssh" {
  description = "public_key_openssh"
  value       = tls_private_key.key.public_key_openssh
}
output "private_key_pem" {
  description = "private_key_pem"
  value       = tls_private_key.key.private_key_pem
}
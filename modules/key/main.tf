resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_secretsmanager_secret" "pri_key_pem" {
  name = var.private_key_pem_secret
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "pri_key_pem" { 
  secret_id     = aws_secretsmanager_secret.pri_key_pem.id
  secret_string = tls_private_key.key.private_key_pem
  
}

resource "aws_secretsmanager_secret" "pub_key_pem" {
  name = var.public_key_pem_secret
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "pub_key_pem" { 
  secret_id     = aws_secretsmanager_secret.pub_key_pem.id
  secret_string = tls_private_key.key.public_key_pem

}

resource "aws_secretsmanager_secret" "pub_key_openssh" {
  name = var.public_key_openssh_secret
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "pub_key_openssh" { 
  secret_id     = aws_secretsmanager_secret.pub_key_openssh.id
  secret_string = tls_private_key.key.public_key_openssh
}

resource "aws_key_pair" "key" {
  key_name   = var.key_name
  public_key = tls_private_key.key.public_key_openssh
}

resource "local_file" "pem_file" {
  filename = pathexpand("./${var.key_name}.pem")
  file_permission = "600"
  directory_permission = "700"
  sensitive_content = tls_private_key.key.private_key_pem
}


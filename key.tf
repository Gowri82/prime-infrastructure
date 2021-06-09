module "key" {
  source                    = "./modules/key"
  key_name                  = "instance_key"
  private_key_pem_secret    = "private_key_pem_secret"
  public_key_pem_secret     = "public_key_pem_secret"
  public_key_openssh_secret = "public_key_openssh_secret"
}

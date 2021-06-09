# Configure AWS connection, secrets are in terraform.tfvars
provider "aws" {
  profile    = "default"
  region     = "${var.region}"
}
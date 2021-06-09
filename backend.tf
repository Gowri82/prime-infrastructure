terraform {
  backend "s3" {
    bucket  = "demoapsouth"
    key     = "tf/statefile/terraform.tfstate"
    region  = "ap-south-1"
    profile = "default"
  }
}
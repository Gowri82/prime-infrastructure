terraform {
  backend "s3" {
    bucket  = "primetfstatedata"
    key     = "tf/statefile/terraform.tfstate"
    region  = "$$$$$$"
    profile = "default"
  }
}

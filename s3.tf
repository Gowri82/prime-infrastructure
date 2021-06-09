##************************* s3 Module *****************************##

module "s3_bucket" {
  source                  = "./modules/s3bucket"
   project                 = var.project
   user-role               = var.user-role
   region                  = var.region
}
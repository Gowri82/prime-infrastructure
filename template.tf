##****************** Template Module *****************************##

module "templates" {
  source                  = "./modules/templates"
  user-role               = var.user-role
}

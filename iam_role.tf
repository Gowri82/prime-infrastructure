##************ IAM Ec2 Role, Profile & Policy Modules ************##

module "iam_ec2_role" {
  source                  = "./modules/iamrole"
  user-role               = var.user-role
  ec2_role_name           = var.ec2_role_name
  policy                  = module.templates.iam_role_assume_policy
}

module "iam_ec2_policy" {
  source                  = "./modules/iampolicy"
  user-role               = var.user-role
  ec2_iam_policy_name     = var.ec2_iam_policy_name
  policy                  = module.templates.iam_role_ec2_policy
  role                    = module.iam_ec2_role.ec2_role_id
  s3_bkt_arn              = module.s3_bucket.s3_bucket_arn
}

module "iam_ec2_profile" {
  source                  = "./modules/instanceprofile"
  ec2_profile_name        = var.ec2_profile_name
  role                    = module.iam_ec2_role.ec2_role_name
  user-role               = var.user-role
}
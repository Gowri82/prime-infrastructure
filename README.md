## Prime-Infrastructure ##

Repository "prime-infrastructure" holds terraform modules and resources code to provision following resources.
1. Networking - VPC, Subnets (private & Public), NAT Gateway and all unerlying components
2. Security - Security Group and it's rules (ingress and egress traffic to port 80, 443 & 22)
3. IAM - IAM EC2 role, instance profile & corresponding policy with role based s3 & EC2 access 
4. Compute - Instance (Server hosted in private subnet with httpd & Server hosted in public subnet pretending as Jump server)
5. Storage - S3 bucket created with respective role's (DEV & QA)
6. Configuration changes will be managed using shell script userdata. (user creation, Password disabling, SSH Seamless authentication)
7. Local IP of terraform executing machine has been whitelisted for SSH (Port 22) in security group i.e., Module publicip
8. SSH_Key generated and stored in AWS secret manager dynamically

## Architecture diagram: ##
 
![Image of Architecture](https://github.com/jaipraveen/prime-infrastructure/blob/c9485894c5cd0c7fa9c7e989ab8f61a77d01b39c/arch.PNG)

## Terraform code module structure: ##
```
root
├─── ami.tf
├─── backend.tf
├─── caller_id.tf
├─── iam_role.tf
├─── jumpserver-sg.tf
├─── jumpserver_instance.tf
├─── key.tf
├─── localip.tf
├─── output.tf
├─── provider.tf
├─── s3.tf
├─── template.tf
├─── terraform.tfvars
├─── variables.tf
├─── versions.tf
├─── vpc.tf
├─── webserver-sg.tf
├─── webserver_instance.tf
└───modules/
    ├───calleridentity
    │       caller_id.tf
    │       output.tf
    │       variables.tf
    ├───compute
    │   ├───jumpserver
    │   │       jumpserver.tf
    │   │       output.tf
    │   │       variables.tf
    │   └───webserver
    │           output.tf
    │           variables.tf
    │           webserver.tf
    ├───iampolicy
    │       iam_policy.tf
    │       output.tf
    │       variables.tf
    ├───iamrole
    │       iam_role.tf
    │       output.tf
    │       variables.tf
    ├───instanceprofile
    │       iam_instance_profile.tf
    │       output.tf
    │       variables.tf
    ├───key
    │       main.tf
    │       output.tf
    │       variable.tf
    ├───publicip
    │       publicip.tf
    ├───s3bucket
    │       output.tf
    │       s3_bucket.tf
    │       variables.tf
    ├───securitygp
    │       output.tf
    │       security_gp.tf
    │       variables.tf
    ├───sgrules
    │   ├───cidr_range
    │   │       output.tf
    │   │       security_gp_rules.tf
    │   │       variables.tf
    │   ├───dest_ip
    │   │       output.tf
    │   │       security_gp_rules.tf
    │   │       variables.tf
    │   ├───dest_selfsg
    │   │       output.tf
    │   │       security_gp_rules.tf
    │   │       variables.tf
    │   └───dest_sg
    │           output.tf
    │           security_gp_rules.tf
    │           variables.tf
    ├───templates
    │   │   templates.tf
    │   ├───policies
    │   │       dev_assume_role_ec2_policy.json.tpl
    │   │       dev_iam_ec2_role_policy.json.tpl
    │   │       qa_assume_role_ec2_policy.json.tpl
    │   │       qa_iam_ec2_role_policy.json.tpl
    │   └───userscripts
    │           jumpserver_script.sh.tpl
    │           webserver_user_data_script.sh.tpl
    └───vpc
         ├───   output.tf
         ├───   variables.tf
         └───   vpc.tf    
```
## Prerequisite: ##
 * Terraform version v0.13.7 is used 
 * Refer below links to download and configure terraform v0.13.7 on your machine.
   https://releases.hashicorp.com/terraform/0.13.7/
   https://learn.hashicorp.com/terraform/getting-started/install.html   
 * terraform.tfvars should be updated with required inputs. Sample file attached
 * Create a S3 bucket for Remote backend. S3 bucket name should be "primetfstatedata" and Update the region in backend.tf file.
 * Region should be common to all provisioned resources both programatically & manually (S3 bucket for backend)
 * Install awscli and configure aws profile with Access & Secret access key. Default is used
   Command : aws configure
 
## Module execution steps: ## 
 * terraform version
 * terraform init
 * terraform plan
 * terraform apply --auto-approve
 * terraform destroy --auto-approve

## Security features: ## 
 * Whitelisted local terraform executor machine's IP only to SSH jump server.
 
## Reference Links: ## 
       Terraform:      https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/
             

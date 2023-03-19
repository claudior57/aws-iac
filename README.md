# aws-iac
demo - aws basic iac configs for a working cluster (should be used only for demonstration purposes NOT READY FOR PRODUCTION)
### Requirements:

[AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

[Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### First Steps:
- install AWS CLI and Terraform

  ```
    this have a different setup for each OS so suit yourself
  ``` 

- create the aws user for the automations with programmatic access and set up the ~/.aws/config to have this profile:
  ```
  [profile iac_lab]
  output = json
  region = us-east-1
  ``` 

- on the ~/.aws/config file:
  ```
  [iac_lab]
  aws_access_key_id = AKIAX3QZ5FAKEKEY574NOCFGZ
  aws_secret_access_key = umZMaDCqFAKESECRETKEYDSPiTV6k/6mUj12TG****
  ```
  
- create the s3 bucket to store the terraform states
  ```
    aws s3api create-bucket --bucket iaclab-terraform-states --region us-east-1 --acl private
  ```  

- run generate the ssh-keys to use (use a real email that you own)
  ```
    ssh-keygen -f ./id_rsa_iaclab -C devops@iaclab.com
  ```

- run terraform plan and verify the resources that will be created
  ```
    terraform init
  ```

- run terraform plan and verify the resources that will be created
  ```
    terraform plan
  ```

- run terraform apply and verify the resources that were created
  ```
    terraform apply
  ```

- after running the command terraform apply you will need to confirm the email subscription on the sns topic 

# Additional information:
  this project uses the modules for: 

  vpc - https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest

  cloudwatch - https://registry.terraform.io/modules/terraform-aws-modules/cloudwatch/aws/latest

  ec2-instance - https://registry.terraform.io/modules/terraform-aws-modules/ec2-instance/aws/latest

  sgr - https://registry.terraform.io/modules/terraform-aws-modules/security-group/aws/latest

  sns - https://registry.terraform.io/modules/terraform-aws-modules/sns/aws/latest

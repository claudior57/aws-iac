# aws-iac
aws basic iac configs for a full working cluster
### Requirements:

[AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

[Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### First Steps:
- install AWS CLI and Terraform

  ```
    this have a different setup for each OS so suit yourself
  ``` 

- create the aws user for the automations with programmatic access and export the AWS as in the example bellow:
  ```
  echo "those are fake ACCESS KEYS, change it to meet your reality"
  export AWS_ACCESS_KEY_ID=AKIAX3QZ5FAKEKEY574NOCX6Z
  export AWS_SECRET_ACCESS_KEY=umZMaDCqFAKESECRETKEYDSPiTV6k/6mUjkmTG

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

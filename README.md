# aws-iac
aws basic iac configs for a full working cluster

#First Steps:
- install AWS CLI and Terraform
  
  ```
    this have a different setup for each OS so suit yourself
  ``` 
  
- create the aws user for the automations with programmatic access and export the AWS as in the example bellow:
  ```
  echo "those are fake ACCESS KEYS, change it to meet your reality"
  export AWS_ACCESS_KEY_ID=AKIAX3QZ574NA3CE574NOCX6Z
  export AWS_SECRET_ACCESS_KEY=umZMaDCq526X3odQz6quzKxDSPiTV6k/6mUjkmTG

  ```
- run generate the ssh-keys to use 
  ```
    ssh-keygen -f ./id_rsa_iaclab -C devops@iaclab.com
  ```
  

- after running the terraform apply you will need to confirm the email subscription on the sns topic 

  

variable "tags" {
  type = map(any)
  default = {
    Team        = "DevOps"
    Environment = "Staging"
    Purpose     = "Basic cloud foundation setup"
    Terraform   = "true"
  }
}

variable "ssh_public_key" {
  default = "../../id_rsa_iaclab.pub"
}

variable "user_data" {
  default = "../../singlePageNginx.sh"

}
//  <<EOF
//#!/bin/bash
//echo "Hello Terraform!"
//sudo amazon-linux-extras enable nginx1
//sudo yum -y install nginx
//
//yum -y install firewalld
//systemctl unmask firewalld
//systemctl restart firewalld
//firewall-cmd --zone=public --permanent --add-service=http
//firewall-cmd --zone=public --permanent --add-service=https
//firewall-cmd --reload
//systemctl enable firewalld
//systemctl restart firewalld
//
//systemctl enable nginx
//systemctl restart nginx
//EOF
//
//}
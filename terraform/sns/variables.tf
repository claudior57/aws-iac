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

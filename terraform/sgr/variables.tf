variable "tags" {
  type = map(any)
  default = {
    Team        = "DevOps"
    Environment = "Staging"
    Purpose    = "Basic cloud foundation setup"
    Terraform   = "true"
  }
}

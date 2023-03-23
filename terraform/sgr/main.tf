data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}

module "public-sgr-basic" {
  source                   = "terraform-aws-modules/security-group/aws"
  name                     = "public-sgr-basic"
  description              = "Basic sgr for public access"
  vpc_id                   = data.terraform_remote_state.vpc.outputs.vpc_id
  tags                     = var.tags
  ingress_cidr_blocks      = ["0.0.0.0/0"]
  ingress_ipv6_cidr_blocks = ["::/0"]
  ingress_rules            = ["https-443-tcp"]
  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "Allow ssh from my home office"
      cidr_blocks = "${chomp(data.http.myip.body)}/32"
    }
  ]
  egress_rules = ["all-all"]
}
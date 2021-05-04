resource "aws_kms_key" "public_instances" {
}

resource "aws_key_pair" "iaclab-user" {
  key_name   = "iaclab-user"
  public_key = file(var.ssh_public_key)
}

module "ec2_cluster" {
  source                      = "terraform-aws-modules/ec2-instance/aws"
  name                        = "nginx-instance"
  instance_count              = 1
  associate_public_ip_address = true
  ami                         = "ami-048f6ed62451373d9"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.iaclab-user.key_name
  monitoring                  = true
  vpc_security_group_ids      = [data.terraform_remote_state.sgr.outputs.public_sgr_basic_id]
  subnet_id                   = data.terraform_remote_state.vpc.outputs.public_subnets[0]

  user_data_base64 = base64encode(file(var.user_data))

  ebs_block_device = [
    {
      device_name = "/dev/sdf"
      volume_type = "gp2"
      volume_size = 5
      encrypted   = true
      kms_key_id  = aws_kms_key.public_instances.arn
    }
  ]

  tags = var.tags
}
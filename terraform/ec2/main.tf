resource "aws_kms_key" "public_instances" {
}

resource "aws_key_pair" "iaclab-user" {
  key_name   = "iaclab-user"
  public_key = file(var.ssh_public_key)
}

resource "aws_ebs_volume" "ec2_volume" {
  availability_zone = "us-east-1a"
  size              = 5
  encrypted   = true
  kms_key_id  = aws_kms_key.public_instances.arn
}

module "ec2_instance" {
  source                      = "terraform-aws-modules/ec2-instance/aws"
  name                        = "nginx-instance"
  associate_public_ip_address = true
  ami                         = "ami-04581fbf744a7d11f"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.iaclab-user.key_name
  monitoring                  = true
  vpc_security_group_ids      = [data.terraform_remote_state.sgr.outputs.public_sgr_basic_id]
  subnet_id                   = data.terraform_remote_state.vpc.outputs.public_subnets[0]

  user_data_base64 = base64encode(file(var.user_data))

  ebs_block_device = [
    {
      device_name = "/dev/sdh"
      volume_type = "gp2"
      volume_size = 5
      encrypted   = true
      kms_key_id  = aws_kms_key.public_instances.arn
    }
  ]

  tags = var.tags
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdf"
  volume_id   = aws_ebs_volume.ec2_volume.id
  instance_id = module.ec2_instance.id
}
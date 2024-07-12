module "workstation" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "workstation"

  instance_type          = "t3.micro"
  vpc_security_group_ids = [var.sg_id] #replace your SG
  subnet_id = var.public_subnet_id #replace your Subnet
  ami = data.aws_ami.ami_info.id
  user_data = file("eks.sh")

  root_block_device = [
    {
      volume_type = "gp3"
      volume_size = 50
    }
  ]
  tags = {
    Name = "workstation"
  }
}

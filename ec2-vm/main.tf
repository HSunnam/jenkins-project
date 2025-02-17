

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-22.04-amd64-server-*"]
  }

  filter {
    name   = "owner-id"
    values = ["099720109477"] # Canonical's AWS Account ID
  }
}

#aws instance module
module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name                        = "jenkins-server"
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  key_name                    = "ssh_key"
  monitoring                  = true
  vpc_security_group_ids      = [aws_default_security_group.jenkins-sg.id]
  subnet_id                   = aws_subnet.jenkins-subnet-1.id
  availability_zone           = var.availability_zone
  associate_public_ip_address = true
  user_data                   = file("jenkins-script.sh")
  tags = {
    Name = "${var.env_prefix}-server"
  }
}
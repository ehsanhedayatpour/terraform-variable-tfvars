data "aws_ami" "ubuntu-ami" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"]
}

resource "aws_instance" "ec2_example" {
  ami           = "data.aws_ami.ubuntu-ami.id"
  instance_type =  var.instance_type
  key_name                = "rootkey"

  tags = {
    Name = var.tag
  }
}

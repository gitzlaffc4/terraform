provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "ec2" {
  ami           = "ami-0866a04d72a1f5479"
  instance_type = "t2.micro"
}

resource "aws_eip" "elasticeip" {
  instance = aws_instance.ec2.id
}

output "EIP" {
  value = aws_eip.elasticeip.public_ip
}
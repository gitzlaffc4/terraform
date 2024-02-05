provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "ec2" {
  ami           = "ami-0866a04d72a1f5479"
  instance_type = "t2.micro"
}
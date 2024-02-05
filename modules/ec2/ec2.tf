variable "ec2name" {
  type = string
}

resource "aws_instance" "ec2" {
  ami           = "ami-0866a04d72a1f5479"
  instance_type = "t2.micro"
  tags = {
    Name = var.ec2name
  }
}

output "instance_id" {
  value = aws_instance.ec2.id
}
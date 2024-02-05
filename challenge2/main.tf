provider "aws" {
  region = "us-east-2"
}

variable "ingressrules" {
  type    = list(number)
  default = [80, 443]
}

variable "egressrules" {
  type    = list(number)
  default = [80, 443]
}

resource "aws_instance" "db" {
  ami             = "ami-0866a04d72a1f5479"
  instance_type   = "t2.micro"
  tags = {
    Name = "DB Server"
  }
}

resource "aws_eip" "db_ip" {
  instance = aws_instance.db.id
}


resource "aws_instance" "webserver" {
  ami             = "ami-0866a04d72a1f5479"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.webtraffic.name]
  user_data = file("server-script.sh")
  tags = {
    Name = "Web Server"
  }
}

resource "aws_eip" "webserver_ip" {
  instance = aws_instance.webserver.id
}

resource "aws_security_group" "webtraffic" {
  name = "Allow HTTPS"

  dynamic ingress {
    iterator = port
    for_each = var.ingressrules
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic egress {
    iterator = port
    for_each = var.egressrules
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

output "db_private" {
  value = aws_eip.db_ip.private_ip
}

output "web_public" {
  value = aws_eip.webserver_ip.public_ip
}

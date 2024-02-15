variable "ec2name" {
  type = string
}


resource "aws_instance" "webserver" {
  ami             = "ami-0866a04d72a1f5479"
  instance_type   = "t2.micro"
  security_groups = [module.sg.sg_name]
  user_data       = file("./web/server-script.sh")
  tags            = {
    Name = "Web Server"
  }
}

module "sg" {
  source = "../securitygroups"
}

module "eip" {
  source = "../eip"
  instance_id = aws_instance.webserver.id
}

output "web_public" {
  value = module.eip.PublicWebIP
}
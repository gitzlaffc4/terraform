variable "instance_id" {
  type = string
}


resource "aws_eip" "webserver_ip" {
  instance = var.instance_id
}

output "PublicWebIP" {
  value = aws_eip.webserver_ip.public_ip
}
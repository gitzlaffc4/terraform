variable "dbname" {
  type = string
}



resource "aws_instance" "db" {
  ami           = "ami-0866a04d72a1f5479"
  instance_type = "t2.micro"
  tags = {
    Name = var.dbname
  }
}

resource "aws_eip" "db_ip" {
  instance = aws_instance.db.id
}

output "db_private" {
  value = aws_eip.db_ip.private_ip
}
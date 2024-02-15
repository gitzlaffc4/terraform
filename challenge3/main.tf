provider "aws" {
  region = "us-east-2"
}

module "dbmodule" {
  source = "./db"
  dbname = "DB Server"
}

module "webmodule" {
  source  = "./web"
  ec2name = "Web Server"
}

output "PrivateDBIP" {
  value = module.dbmodule.db_private
}

output "PublicWebIP" {
  value = module.webmodule.web_public
}







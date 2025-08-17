provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "insecure_bucket" {
  bucket = "my-insecure-bucket"
  acl    = "public-read" 

  server_side_encryption_configuration {
  }
}

resource "aws_security_group" "open_sg" {
  name        = "open_sg"
  description = "Allow all traffic"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }
}

variable "db_password" {
  default = "SuperSecret123" 
}

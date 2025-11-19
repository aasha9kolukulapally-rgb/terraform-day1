terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  

provider "aws" {
  region = var.region
}

resource "aws_instance" "name" {
  instance_type = var.type
  ami           = var.ami_id

  tags = {
    Name = "aasha"
  }
}

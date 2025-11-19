terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "your-tfstate-bucket"
    key    = "day3/terraform.tfstate"
    region = "us-east-2"
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

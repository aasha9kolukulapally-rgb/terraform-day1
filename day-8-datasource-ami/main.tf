terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      #version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-west-2" # Change to your region
}

data "aws_subnet" "selected" {
  filter {
    name   = "tag:Name"
    values = ["datasource"]
  }
}

data "aws_ami" "amzlinux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "root-device-type"
   values = ["ebs"]
  }

filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

resource "aws_instance" "example" {
  ami           = data.aws_ami.amzlinux.id
  instance_type = "t3.micro"
  subnet_id     = data.aws_subnet.selected.id
}

#######################################################
# Terraform: Generate SSH Key and Launch EC2 Instance
#######################################################

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      #version = "~> 5.0"
    }
    tls = {
      source  = "hashicorp/tls"
      #version = "~> 4.0"
    }
    local = {
      source  = "hashicorp/local"
      #version = "~> 2.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"  # Change to your AWS region
}

provider "tls" {}
provider "local" {}

#######################################################
# Generate SSH Key Pair
#######################################################
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "private_key" {
  filename        = "${path.module}/id_rsa"
  content         = tls_private_key.ssh_key.private_key_pem
  file_permission = "0600"
}

resource "local_file" "public_key" {
  filename        = "${path.module}/id_rsa.pub"
  content         = tls_private_key.ssh_key.public_key_openssh
  file_permission = "0644"
}

#######################################################
# Fetch latest Amazon Linux 2 AMI automatically
#######################################################
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

#######################################################
# Create EC2 Instance
#######################################################
resource "aws_key_pair" "generated_key" {
  key_name   = "my-generated-key"
  public_key = tls_private_key.ssh_key.public_key_openssh
}

resource "aws_instance" "server" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t3.micro"
  key_name      = aws_key_pair.generated_key.key_name

  tags = {
    Name = "MyServer"
  }
}

#######################################################
# Outputs
#######################################################
output "ec2_public_ip" {
  value = aws_instance.server.public_ip
}

output "private_key_path" {
  value     = local_file.private_key.filename
  sensitive = true
}

output "public_key_path" {
  value = local_file.public_key.filename
}

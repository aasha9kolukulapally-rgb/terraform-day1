# EC2 instance in us-east-1 (default provider)
resource "aws_instance" "east_instance" {
  ami           = "ami-0c02fb55956c7d316"   # Amazon Linux 2 in us-east-1
  instance_type = "t3.micro"

  tags = {
    Name = "East-Instance"
  }
}

# EC2 instance in us-west-1 (Oregon, using profile aasha)
resource "aws_instance" "west_instance" {
  provider      = aws.oregon
  ami           = "ami-03ff9720b16e8da76"   # Amazon Linux 2 in us-west-1
  instance_type = "t3.micro"

  tags = {
    Name = "West-Instance"
  }
}
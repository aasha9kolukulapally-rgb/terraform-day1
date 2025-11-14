
resource "aws_instance" "app" {
  ami           = "ami-03ff9720b16e8da76"
  instance_type = "t3.micro"
  subnet_id     = var.subnet_id
  tags = {
    Name = "${var.env}-ec2"
  }
}
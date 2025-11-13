resource "aws_instance" "web" {
  ami           = "ami-0cae6d6fe6048ca2c"
  instance_type = "t3.micro"
  subnet_id     = var.subnet_1_id

  tags = {
    Name = "webserver"
  }
}
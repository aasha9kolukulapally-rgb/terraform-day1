resource "aws_instance" "back" {
    ami = "ami-00e15f0027b9bf02b"
    instance_type = "t3.micro"
    key_name = "aasha"
    subnet_id = aws_subnet.pub1.id
    vpc_security_group_ids = [aws_security_group.bastion-host.id ]
    tags = {
      Name= "bastion-server"
    }
}
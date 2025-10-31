

resource "aws_instance" "name" {
    ami = "ami-0e6be795b21969e1d"
    instance_type = "t3.micro"
    availability_zone = "us-west-1a"
    tags = {
        Name = "target-resource"
    }

}

resource "aws_s3_bucket" "name" {
    bucket = "asddfghhhjklloiuyt"
  

}

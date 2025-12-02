
resource "aws_instance" "name" { 
    instance_type = "t3.small"
     ami = "ami-025ca978d4c1d9825"
     tags = {
       Name = "rds-dependency"
     }
     
  
}

resource "aws_s3_bucket" "name" {
    bucket = "my-rds-dependencyyy"
    
  depends_on = [ aws_instance.name ]
}

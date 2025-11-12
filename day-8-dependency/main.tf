
resource "aws_instance" "name" { 
    instance_type = var.type
     ami = var.ami_id
     tags = {
       Name = "rds-dependency"
     }
     
  
}

resource "aws_s3_bucket" "name" {
    bucket = "my-rds-dependencyyy"
    
  depends_on = [ aws_instance.name ]
}

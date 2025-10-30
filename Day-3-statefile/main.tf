resource "aws_instance" "name" { 
    instance_type = var.type
     ami = var.ami_id
     tags = {
       Name = "aasha"
     }


  
}
resource "aws_s3_bucket" "name" {
  bucket = "chinnarikutty"
  
}


  

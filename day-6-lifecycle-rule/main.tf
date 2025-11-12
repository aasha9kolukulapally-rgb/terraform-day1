
resource "aws_instance" "name" {
    ami = "ami-0e6be795b21969e1d"
    instance_type = "t3.micro"
    tags = {
      Name = "life-cycle"
    }
      #lifecycle {
      #create_before_destroy = true
     #}
    # lifecycle {
      #ignore_changes = [tags,  ]
   # }
     lifecycle {
       prevent_destroy = true
     }
  
}
     
    

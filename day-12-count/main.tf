# resource "aws_instance" "name" {
#     ami = "ami-025ca978d4c1d9825"
#     instance_type = "m7i-flex.large"
#     count = 2
#     # tags = {
#     #   Name = "dev"
#     # }
#   tags = {
#       Name = "dev-${count.index}"
#     }
# }

variable "env" {
    type = list(string)
    default = [ "dev","prod"]
  
}

resource "aws_instance" "name" {
    ami = "ami-025ca978d4c1d9825"
    instance_type = "m7i-flex.large"
    count = length(var.env)
    # tags = {
    #   Name = "dev"
    # }
  tags = {
      Name = var.env[count.index]
    }
}


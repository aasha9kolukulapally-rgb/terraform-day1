variable "rds-password" {
    description = "rds password"
    type = string
    default = "aasha"
  
}
variable "rds-username" {
    description = "rds username"
    type = string
    default = "admin"
  
}
variable "ami" {
    description = "ami"
    type = string
    default = "ami-00e15f0027b9bf02b"
  
}
variable "instance-type" {
    description = "instance-type"
    type = string
    default = "t3.micro"
  
}
variable "key-name" {
    description = "keyname"
    type = string
    default = "us-west-2"
  
}
variable "backupr-retention" {
    type = number
    default = "7"
  
}
module "name" {
  source = "../day-2"     #added day-2 update omly instance
  ami_id = "ami-0e6be795b21969e1d"
  type = "t3.micro"
}
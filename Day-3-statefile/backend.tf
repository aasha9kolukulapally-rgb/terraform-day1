terraform {
  backend "s3" {
    bucket = "chinnarikutty"
    key    = "terraform.tfstate"
    region = "us-west-1"
  }
}
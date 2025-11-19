terraform {
  backend "s3" {
    bucket = "chinnarikutty"
    key    = "terraform.tfstate"
    region = "us-east-2"
  }
}

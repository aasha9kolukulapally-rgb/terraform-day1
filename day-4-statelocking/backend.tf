terraform {
  backend "s3" {
    bucket = "kuttychinnarii"
    key    = "terraform.tfstate"
    #use_lockfile = true # to use s3 native locking 1.19 version above
    region = "us-west-1"

  }
}

terraform {
  backend "s3" {
    bucket = "chinnarikutty"
     key    = "terraform.tfstate"
    #use_lockfile = true # to use s3 native locking 1.19 version above
    region = "us-west-1"
   dynamodb_table = "statelock" # any version we can use dynamodb locking 
    encrypt = true
  }
}



provider "aws" {
  region  = "us-east-1"
  profile = "aasha"
}
provider "aws" {
    region = "us-west-2"
    alias = "oregon"
    profile = "aasha"
  
}
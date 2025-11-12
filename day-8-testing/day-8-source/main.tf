resource "aws_s3_bucket" "day8_bucket" {
  bucket = "my-day8-terraform-bucket-12345"  # must be globally unique

  tags = {
    Name        = "Day8Bucket"
    Environment = "Dev"
  }
}

variable "aws_region" {
  description = "AWS region to deploy resources"
  default     = "us-west-2"
}

variable "db_username" {
  description = "Database master username"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Database master password"
  type        = string
  sensitive   = true
  default     = "aasha123456"
}

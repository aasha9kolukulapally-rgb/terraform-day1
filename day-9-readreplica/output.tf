output "vpc_id" {
  value = "vpc-045d41e9748cf81c0"
}

output "primary_endpoint" {
  value = "my-primary-db.ctgwyocecxed.us-west-2.rds.amazonaws.com"
}

output "replica_endpoint" {
  value = aws_db_instance.read_replica.endpoint
}

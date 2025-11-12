resource "aws_db_instance" "read_replica" {
  identifier             = "${var.primary_rds_identifier}-read-replica"
  replicate_source_db    = var.primary_rds_identifier     # Use primary identifier directly
  instance_class         = var.read_replica_instance_class
  db_subnet_group_name   = var.db_subnet_group_name
  vpc_security_group_ids = var.vpc_security_group_ids
  skip_final_snapshot    = true
  publicly_accessible    = false

  tags = {
    Name = "${var.primary_rds_identifier}-read-replica"
  }
}

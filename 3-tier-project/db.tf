# DB Subnet Group
resource "aws_db_subnet_group" "db_subnets" {
  name       = "db-subnet-group"
  subnet_ids = aws_subnet.private[*].id

  tags = {
    Name = "db-subnet-group"
  }
}

# RDS Instance
resource "aws_db_instance" "db" {
  identifier             = "mydb-instance"       # unique identifier for the instance
  allocated_storage      = 20
  engine                 = "mysql"               # you can change to postgres, etc.
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  db_name                  = "mydatabase"          # must start with letter, alphanumeric only
  username               = "admin"               # DB master username
  password               = "MyPassword123"       # DB master password
  parameter_group_name   = "default.mysql8.0"
  skip_final_snapshot    = true                  # for testing, remove for production
  publicly_accessible    = false
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.db_subnets.name
  multi_az               = false
  storage_type           = "gp2"

  tags = {
    Name = "MyDBInstance"
  }
}

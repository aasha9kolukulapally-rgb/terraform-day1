
provider "aws" {
  region = "us-west-1"
}

# 1️⃣ Get existing VPC (by name tag)
data "aws_vpc" "myvpc" {
  filter {
    name   = "tag:Name"
    values = ["my-vpc"]
  }
}

# 2️⃣ Create a new subnet (subnet-3)
resource "aws_subnet" "subnet2" {
  vpc_id                  = data.aws_vpc.myvpc.id
  cidr_block              = "172.31.1.0/24"
  availability_zone       = "us-west-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet-2"
  }
}

# resource "aws_internet_gateway" "igw" {
#   vpc_id = data.aws_vpc.myvpc.id
# }
data "aws_internet_gateway" "igw" {
  filter {
    name   = "attachment.vpc-id"
    values = [data.aws_vpc.myvpc.id]
  }
}



# 3️⃣ Create an Internet Gateway (if not already there)
data "aws_internet_gateway" "existing_igw" {
  filter {
    name   = "attachment.vpc-id"
    values = [data.aws_vpc.myvpc.id]
  }
}

# 4️⃣ Create a route table for the subnet
resource "aws_route_table" "public_rt" {
  vpc_id = data.aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = data.aws_internet_gateway.existing_igw.id

  }

  tags = {
    Name = "public-route-table"
  }
}

# 5️⃣ Associate route table with subnet-3
resource "aws_route_table_association" "subnet2_assoc" {
  subnet_id      = aws_subnet.subnet2.id
   route_table_id = aws_route_table.public_rt.id
}

# 6️⃣ Create EC2 instance in subnet-3
resource "aws_instance" "teja" {
  ami           = "ami-0b333beaa03b5978c"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.subnet2.id
  user_data     = file("aasha.sh")

  tags = {
    Name = "aasha"
  }

  depends_on = [
    aws_subnet.subnet2,
    aws_route_table_association.subnet2_assoc
  ]
}

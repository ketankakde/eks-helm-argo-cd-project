resource "aws_db_subnet_group" "rds_subnet" {
  subnet_ids = [var.private_subnet_id, var.private_2_id]

  tags = {
    Name = "rds-subnet-group"
  }
}

resource "aws_security_group" "rds_sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [var.ec2_sg_id] 
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "mysql" {
  identifier = var.identifier

  engine         = var.engine
  engine_version = var.engine_version

  instance_class = var.instance_class

  allocated_storage = var.allocated_storage

  db_name  = var.db_name
  username = var.username
  password = var.password

  db_subnet_group_name   = aws_db_subnet_group.rds_subnet.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  skip_final_snapshot = true
}

resource "aws_db_instance" "default" {
  provider = aws.tokyo

  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = "foobarbaz"
  skip_final_snapshot  = true
  deletion_protection  = false
  db_subnet_group_name = aws_subnet._7["tokyo-c-private"].name
}
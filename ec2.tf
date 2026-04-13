resource "aws_instance" "public_instance" {
  ami                    = var.ecs_cluster_name.ami
  count                  = length(var.intance_name)
  instance_type          = var.ecs_cluster_name.instance_type
  provider               = aws.Virginia
  subnet_id              = aws_subnet.public_subnet_primaria.id
  key_name               = data.aws_key_pair.key.key_name
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  user_data              = file("scripts/userdata.sh")

    tags = {
      Name  = "${var.intance_name[count.index]}-${local.sufix}"
  }

}
resource "aws_instance" "apache_instance" {
  count                  = var.enable_monitoring == 1 ? 1 : 0
  ami                    = var.ecs_cluster_name.ami
  instance_type          = var.ecs_cluster_name.instance_type
  provider               = aws.Virginia
  subnet_id              = aws_subnet.public_subnet_primaria.id
  key_name               = data.aws_key_pair.key.key_name
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
 
 

  tags = {
    Name = "Monitoring Instance-${local.sufix}  "

  }

}










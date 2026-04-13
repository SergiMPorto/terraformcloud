resource "aws_vpc" "vpc_virginia" {
  cidr_block = var.virginia_cidr


  provider = aws.Virginia
  tags = {
    Name = "vpc_virginia"
    name = "vpc_virginia-${local.sufix}"
  }
}

resource "aws_subnet" "public_subnet_primaria" {
  provider                = aws.Virginia
  vpc_id                  = aws_vpc.vpc_virginia.id
  cidr_block              = var.subnets[0]
  map_public_ip_on_launch = true
  tags = {
    Name = "public_subnet_temp"
    name = "public_subnet-${local.sufix}"
  }

}

resource "aws_subnet" "private_subnet" {
  provider   = aws.Virginia
  vpc_id     = aws_vpc.vpc_virginia.id
  cidr_block = var.subnets[1]
  tags = {
    Name = "private_subnet_temp"
    name = "private_subnet"
  }
  depends_on = [aws_subnet.public_subnet_primaria]
}

resource "aws_internet_gateway" "gw" {
  vpc_id   = aws_vpc.vpc_virginia.id
  provider = aws.Virginia

  tags = {
    Name = "igw vpc virginia"
  }
}



resource "aws_route_table" "public_crt" {
  vpc_id   = aws_vpc.vpc_virginia.id
  provider = aws.Virginia

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }



  tags = {
    Name = "public_crt vpc virginia"
  }
}

resource "aws_route_table_association" "crt_public_subnet" {
  subnet_id      = aws_subnet.public_subnet_primaria.id
  route_table_id = aws_route_table.public_crt.id
  provider       = aws.Virginia
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc_virginia.id
  provider    = aws.Virginia

  tags = {
    Name = "allow_ssh"
  }
 dynamic  "ingress" {
    for_each = var.ingress_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
}
}

/*
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc_virginia.id
  provider    = aws.Virginia

  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4" {
  security_group_id = aws_security_group.allow_ssh.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
  provider          = aws.Virginia

}

resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv4" {
  security_group_id = aws_security_group.allow_ssh.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 86
  ip_protocol       = "tcp"
  to_port           = 86
  provider          = aws.Virginia

}

resource "aws_vpc_security_group_ingress_rule" "allow_https_ipv4" {
  security_group_id = aws_security_group.allow_ssh.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
  provider          = aws.Virginia

}


*/


resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_ssh.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
  provider          = aws.Virginia
}



# id es un atributo que se genera automáticamente al crear el recurso, no es necesario definirlo en el bloque de recursos.




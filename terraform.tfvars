virginia_cidr = "10.10.0.0/16"
#public_subnet = "10.10.0.0/24"
#private_subnet = "10.10.1.0/24"

subnets = [
  "10.10.0.0/24",
  "10.10.1.0/24"
]

tags = {
  "env"         = "dev"
  "owner"       = "sergio"
  "cloud"       = "aws"
  "IAC"         = "terraform"
  "IAC_Version" = "0.14"
  project       = "infrastructure-stack"
  region        = "Virginia"
}
ecs_cluster_name = {
  "ami"         = "ami-02dfbd4ff395f2a1b"
  instance_type = "t2.micro"

}

enable_monitoring = 0
# true nos crea la instancia y false no la crea

intance_name = [ "apache"
]
ingress_ports = [ 22,80,443 ]
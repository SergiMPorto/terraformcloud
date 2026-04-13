variable "virginia_cidr" {
  description = "CIDR Virginia"
  type        = string

}


/*variable "public_subnet" {
    description = "CIDR Public Subnet"
    type = string
}


variable "private_subnet" {
    description = "CIDR Private Subnet"
    type = string
}*/

variable "subnets" {
  description = "Lista de subnets"
  type        = list(string)
}

variable "tags" {
  description = "Tags para los recursos"
  type        = map(string)
}

variable "ecs_cluster_name" {
  description = "Nombre del cluster ECS"
  type        = map(string)
}

variable "enable_monitoring" {
  description = "Habilitar monitoreo detallado"
  type        = number
 
}

variable "intance_name" {
  description = "Nombre de la instancia"
  type        = list(string)
}

variable "ingress_ports" {
  description = "Puertos de ingreso para el grupo de seguridad"
  type        = list(number)
}

variable "access_key" {
  description = "AWS Access Key"
  type        = string
}

variable "secret_key" {
  description = "AWS Secret Key"
  type        = string
}
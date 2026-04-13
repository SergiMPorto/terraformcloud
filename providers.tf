terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.36.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.8.1"
    }
  }
}
provider "aws" {
  alias  = "Virginia"
  region = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
  default_tags {
    tags = var.tags
  }

}
#Provider para la region de Virginia, se le asigna un alias para poder usarlo en los recursos que se quieran crear en esa region


provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = var.tags
  }
}

#Provider por defecto, se usará para los recursos que no se especifique el provider, en este caso se usará para la creación del bucket de S3 en la region de Virginia, ya que el provider de Virginia tiene un alias y no se usará para los recursos que se quieran crear en esa region.





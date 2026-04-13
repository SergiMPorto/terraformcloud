locals{
    sufix = "${var.tags.project}-${var.tags.env}" # concatenamos el nombre del proyecto y el entorno para crear un sufijo común para los recursos
}

resource "random_string" "sufijo-s3" {
  length  = 8
  upper   = false
  special = false
}

locals {
    s3-sufix = "${var.tags.project}-${var.tags.env}-${random_string.sufijo-s3.result}"
}
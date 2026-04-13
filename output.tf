output "ecs_public_ip" {
  description = "IP pública de la instancia"
  value       = aws_instance.public_instance[*].public_ip # aws_instance tipo de recurso y public_instance es el nombre del recurso que se le dio en el archivo ec2.tf y public_ip es el atributo que se quiere mostrar
}


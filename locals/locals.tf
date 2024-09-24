locals {
  zone_id = "Z02407683B5E3VJB82WZG"
  domain_name = "kondarao.online"
  instances_type = var.envi == "prod" ? "t3.small" : "t3.micro"
  records = var.instances[count.index] == "frontend" ? [aws_instance.terraform[count.index].public_ip] : [aws_instance.terraform[count.index].private_ip]
}
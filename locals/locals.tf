locals {
  count = length(var.instances)
  #instant =[ "mysql","backend","frontend" ]
  zone_id = "Z02407683B5E3VJB82WZG"
  domain_name = "kondarao.online"
  instances_type = var.envi == "prod" ? "t3.small" : "t3.micro"
  }
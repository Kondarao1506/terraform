resource "aws_route53_record" "record" {
  count = length(var.instances)
  zone_id = var.zone_id
  name    = var.instances[count.index] == "frontend" ? var.domain_name : "${var.instances[count.index]}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records =   local.records
  allow_overwrite = true
}

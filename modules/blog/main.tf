
data "aws_route53_zone" "selected" {
  name = "${var.domain_name}."
  #   private_zone = true
}

# www -> static-site
# . -> static-site

resource "aws_route53_record" "dev" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "blog.dev.${data.aws_route53_zone.selected.name}"
  type    = "A"
  ttl     = "300"
  records = [var.dev_ip]
}

resource "aws_route53_record" "prod" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "blog.prod.${data.aws_route53_zone.selected.name}"
  type    = "A"
  ttl     = "300"
  records = [var.prod_ip]
}

resource "aws_route53_record" "sbox" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "blog.sbox.${data.aws_route53_zone.selected.name}"
  type    = "A"
  ttl     = "300"
  records = [var.sbox_ip]
}



module "cloudfront_wordpress" {
  source                 = "../aws-cloudfront-wordpress"
  cnames                 = ["blog.prod.${var.domain_name}"]
  domain_name            = "google.com"
  origin_id              = var.origin_id
  enabled                = true
  origin_protocol_policy = "http-only"
  acm_certificate_arn    = var.acm_arn
  tags = {
    name = "production"
  }
}

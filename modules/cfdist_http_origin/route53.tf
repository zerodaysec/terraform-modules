# Route 53 for domain
#resource "aws_route53_zone" "main" {
#  name = var.domain_name
#  tags = var.common_tags
#}

data "aws_route53_zone" "main" {
  name         = "${var.r53_domain_name}."
  private_zone = false
}

resource "aws_route53_record" "root-a" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = var.dns_domain_name
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.cf_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.cf_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}


# the below block performs certificate validation using DNS
resource "aws_route53_record" "cert_validation" {
  for_each = {
    for dvo in aws_acm_certificate.ssl_certificate.domain_validation_options : dvo.domain_name => {
      name    = dvo.resource_record_name
      record  = dvo.resource_record_value
      type    = dvo.resource_record_type
      zone_id = data.aws_route53_zone.main.zone_id
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = each.value.zone_id
}

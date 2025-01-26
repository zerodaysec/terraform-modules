resource "aws_route53_record" "www" {
  zone_id = "aws_route53_zone.primary.zone_id"
  name    = "www.example.com"
  type    = "A"
  ttl     = 300
  records = ["10.0.0.233"]
}

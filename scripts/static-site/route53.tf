data "aws_route53_zone" "site" {
  name = "${var.domain}."
}

resource "aws_route53_record" "site" {
  zone_id = "${data.aws_route53_zone.site.zone_id}"
  name    = "${var.domain}"
  type    = "A"

  alias {
    name                   = "${aws_s3_bucket.site.website_domain}"
    zone_id                = "${aws_s3_bucket.site.hosted_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www" {
  zone_id = "${data.aws_route53_zone.site.zone_id}"
  name    = "www.${var.domain}"
  type    = "A"

  alias {
    name                   = "${aws_s3_bucket.redirect.website_domain}"
    zone_id                = "${aws_s3_bucket.redirect.hosted_zone_id}"
    evaluate_target_health = false
  }
}


data "aws_acm_certificate" "ssl_cert" {
    domain = "${var.root_domain}"
    types = ["AMAZON_ISSUED"]
    statuses = ["ISSUED"]
    most_recent = true
}
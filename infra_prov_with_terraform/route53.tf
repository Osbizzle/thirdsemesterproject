resource "aws_route53_zone" "domain-name" {
    name = "projectpipe.name.ng"
    
    tags = {
      Name = "projectpipe.name.ng"
    }
}

resource "aws_route53_record" "record" {
    zone_id = aws_route53_zone.domain-name.zone_id
    name = "terraform-test.projectpipe.name.ng"
    type = "CNAME"
    ttl = 300
    records = ["${aws_lb.server-load-balancer.dns_name}"]
}

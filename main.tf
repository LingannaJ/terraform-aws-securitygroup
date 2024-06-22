resource "aws_security_group" "allow_tls" {
  name        = local.sg_name_final
  description = var.sg_description
  vpc_id      = var.vpc_id


dynamic "ingress" {
      for_each = var.outbound_rules
      content {

        from_port = ingress.value["from_port"]
        to_port = ingress.value["to_port"]
        protocol = ingress.value["protocal"]
        cidr_blocks = ingress.value["cidr_block"]
      }

    }

    
    dynamic "egress" {
      for_each = var.outbound_rules
      content {

        from_port = egress.value["from_port"]
        to_port = egress.value["to_port"]
        protocol = egress.value["protocal"]
        cidr_blocks = egress.value["cidr_block"]
      }

    }
tags = merge(
  var.common_tags,
  var.sg_tags,
  {
          name = local.sg_name_final

  }
)
}


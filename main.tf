provider "aws" {
  region     = "${var.aws_alt_tg_region}"
}

resource "aws_lb_target_group" "create_alb_tg" {
  name     = "${var.aws_alb_tg_tg_name}"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${var.aws_alb_tg_vpcid}"
  health_check {
    healthy_threshold   = 2
    timeout             = 5
    interval            = 10
  }
}


resource "aws_lb" "create_alb" {
  name               = "${var.aws_alb_tg_alb_name}"
  internal           = false
  load_balancer_type = "application"
  security_groups    = "${var.aws_alb_tg_security_groups}"
  subnets            = "${var.aws_alb_tg_subnet_ids}"
}

resource "aws_lb_listener" "create_alb_listener" {
  load_balancer_arn = "${aws_lb.create_alb.arn}"
  port              = "${var.aws_alb_listener_port}"
  protocol          = "${var.aws_alb_listener_protocol}"
  ssl_policy        = "${var.aws_alb_listener_ssl_policy}"
  certificate_arn   = "${var.aws_alb_listener_certificate_arn}"

  default_action {
    target_group_arn = "${aws_lb_target_group.create_alb_tg.arn}"
    type             = "forward"
  }
}

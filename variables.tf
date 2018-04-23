variable "aws_alt_tg_region" {
  default = "us-east-1"
}

variable "aws_alb_tg_tg_name" {
  default = "test-target-group"
}

variable "aws_alb_tg_alb_name" {
  default = "test-alb-name"
}

variable "aws_alb_tg_subnet_ids" {
  default = ["subnet-b52c97ba" , "subnet-bf14e2d8", "subnet-ec1717d3"]
}

variable "aws_alb_tg_vpcid" {
  default = "vpc-ec612297"
}

variable "aws_alb_tg_security_groups" {
  default = ["sg-6555262c"]
}

variable "aws_alb_listener_certificate_arn" {
  default = "arn:aws:acm:us-east-1:329942816198:certificate/338d2752-79c7-4cb6-a022-eb2f0d558704"
}

variable "aws_alb_listener_ssl_policy" {
  default = "ELBSecurityPolicy-2015-05"
}

variable "aws_alb_listener_protocol" {
  default = "HTTPS"
}

variable "aws_alb_listener_port" {
  default = "443"
}


resource "aws_lb_target_group" "terraform_target_group" {
  name        = "tf-test-target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = module.aws_vpc.vpc_id
  target_type = "instance"

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 10
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = "tf-test-target-group"
  }

  depends_on = [module.terraform-public-ec2-module-set]

  lifecycle {
    create_before_destroy = false
  }
}

resource "aws_lb_target_group_attachment" "terraform_tg_attachment_one" {
  target_group_arn = aws_lb_target_group.terraform_target_group.arn
  target_id        = module.terraform-public-ec2-module-set["one"].id
  port             = 80
}

resource "aws_lb_target_group_attachment" "terraform_tg_attachment_two" {
  target_group_arn = aws_lb_target_group.terraform_target_group.arn
  target_id        = module.terraform-public-ec2-module-set["two"].id
  port             = 80
}

resource "aws_lb" "terraform_lb" {
  name               = "tf-test-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups = [
    module.http_https_ssh_sg.security_group_id,
  ]
  subnets = module.aws_vpc.public_subnets

  enable_deletion_protection = false

  tags = {
    Environment = "production"
  }

  depends_on = [aws_lb_target_group.terraform_target_group]
}

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.terraform_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"
    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "https_listener" {
  load_balancer_arn = aws_lb.terraform_lb.arn
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = var.route53_credentials

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.terraform_target_group.arn
  }
}
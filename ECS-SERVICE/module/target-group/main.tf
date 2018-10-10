resource "aws_alb_target_group" "create_tg" {
 name     = "${terraform.workspace}-tg"
 port     = 80
 protocol = "HTTP"
 vpc_id   = "${var.vpc}"
}

resource "aws_alb_listener_rule" "listner_rule" {
 listener_arn = "${var.listener-arn-80}"
 priority     = "${var.priority}"

 action {
   type = "forward"
   target_group_arn = "${aws_alb_target_group.create_tg.arn}"
 }

 condition {
   field  = "host-header"
   values = ["${terraform.workspace}.${var.domainame}"]
 }
}
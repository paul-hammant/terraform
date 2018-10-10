# Security Group for ALB
# Create security group for the Application Load Balancer
resource "aws_security_group" "create-sg" {
   name = "${var.workload}-load-balancer"
   description = "allow HTTPS to ${var.workload} Load Balancer (ALB)"
   vpc_id = "${var.vpc}"
   ingress {
       from_port = "80"
       to_port = "80"
       protocol = "tcp"
       cidr_blocks = ["0.0.0.0/0"]
   }
   ingress {
       from_port = "443"
       to_port = "443"
       protocol = "tcp"
       cidr_blocks = ["0.0.0.0/0"]
   }
   egress{
        from_port         = 0
        to_port           = 0
        protocol          = "-1"
        cidr_blocks       = ["0.0.0.0/0"]
   }
   tags {
       Name = "${var.workload}"
   }
}

resource "aws_alb" "create_alb" {
 name            = "${var.workload}"
 internal        = "${var.alb_internet_accessbility}"
 idle_timeout    = "300"
 load_balancer_type = "${var.alb_load_balancer_type}"
 security_groups = [
   "${aws_security_group.create-sg.id}"
 ]
 subnets = ["${var.custom-subnets}"]
 enable_deletion_protection = "${var.deletion_protection}"
 tags {
   Name = "${var.workload}"
 }
}

resource "aws_alb_listener" "create_listner_80" {
 load_balancer_arn = "${aws_alb.create_alb.arn}"
 port              = "80"
 protocol          = "HTTP"

 default_action {
   type = "fixed-response"
    fixed_response {
      content_type = "application/json"
      message_body = "SORRY"
      status_code = "506"
    }
 }
}
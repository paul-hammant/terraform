resource "aws_security_group" "create-sg" {
   name = "ecs-launch-configuration-sg"
   description = "allow HTTPS to ecs-launch-configuration-sg"
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
    ingress {
       from_port = "0"
       to_port = "0"
       protocol = "-1"
       security_groups = ["${var.alb_security_group}"]
   }
   
   egress{
        from_port         = 0
        to_port           = 0
        protocol          = "-1"
        cidr_blocks       = ["0.0.0.0/0"]
   }
   tags {
       Name = "kss"
   }
}
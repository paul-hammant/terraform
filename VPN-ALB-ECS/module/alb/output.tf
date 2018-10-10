output "alb_security_group" {
 description = "Security Group ID to your Auto Scaling group."
 value       = "${aws_security_group.create-sg.id}"
}

output "alb_arn" {
  description = "Application Load Balancer ARN"
  value = "${aws_alb.create_alb.arn}"
}

output "listener-arn-80" {
  description = "Listener ARN on Port 80"
  value = "${aws_alb_listener.create_listner_80.arn}"
}

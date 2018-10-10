output "ecs_cluster" {
  description = "ECS Cluster ID"
  value = "${aws_ecs_cluster.test-ecs-cluster.id}"
}

output "service_role_arn" {
  description = "Service Role"
  value = "${aws_iam_role.ecs_service_role.arn}"
}

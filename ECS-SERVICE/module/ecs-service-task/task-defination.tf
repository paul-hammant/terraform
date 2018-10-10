data "aws_ecs_task_definition" "task" {
  task_definition = "${aws_ecs_task_definition.task.family}"
}

resource "aws_ecs_task_definition" "task" {
    family                = "${terraform.workspace}-jib"
    container_definitions = <<DEFINITION
[
  {
    "portMappings": [
      {
        "containerPort": 8080,
        "hostPort": 0
      }
    ],
    "name": "jib",
    "image": "${var.image_name}",
    "cpu": 10,
    "memory": 500,
    "essential": true
  }
]
DEFINITION
}

resource "aws_ecs_service" "test-ecs-service" {
        name            = "${terraform.workspace}-jib-ecs-service"
  	    iam_role        = "${var.ecs_service_rolearn}"
  	    cluster         = "${var.ecs_cluster_id}"
        desired_count = "${var.desire_count}"
  	    task_definition = "${aws_ecs_task_definition.task.family}:${max("${aws_ecs_task_definition.task.revision}", "${data.aws_ecs_task_definition.task.revision}")}"
        load_balancer {
            target_group_arn  = "${var.ecs_targetgroup_arn}"
            container_port    = 8080
            container_name    = "jib"
	    }
}
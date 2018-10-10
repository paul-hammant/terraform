provider "aws" {
  region = "${var.region}"
}

module "target-group" {
  source = "module/target-group"
  vpc = "${var.vpc}"
  listener-arn-80 = "${var.listener-arn-80}" 
  domainame = "${var.domainame}"
  priority = "${var.priority}"
  
}
output "${terraform.workspace}-tg" {
  value = "${module.target-group.tg}"
}

module "ecs-service" {
  source = "module/ecs-service-task"
  ecs_cluster_id = "${var.ecs_cluster_id}"
  ecs_service_rolearn = "${var.ecs_service_rolearn}" 
  ecs_targetgroup_arn = "${module.target-group.tg}"
  desire_count = "${var.desire_count}"
  image_name ="${var.image_name}"
}
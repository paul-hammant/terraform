provider "aws" {
  region = "${var.region}"
}

module "create_vpc" {
  source = "module/vpc"
}


module "create_alb" {
  source = "module/alb"
  custom-subnets = ["${module.create_vpc.public_subnet1of2}","${module.create_vpc.public_subnet2of2}"]
  vpc = "${module.create_vpc.id}"
}

module "create_ecr" {
  source = "module/ecr"
}
module "create_ecs" {
  source = "module/ecs"
  vpc = "${module.create_vpc.id}"
  vpc_private_01 = "${module.create_vpc.private_subnet}"
  ecs_key_pair_name = "${var.keypair}"
  ec2_ami_id = "${var.ec2_ami_id}"
  alb_security_group = "${module.create_alb.alb_security_group}"
}



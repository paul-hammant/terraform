variable "region" {
  description ="AWS Region in which you are working"
  default = ""
}

variable "vpc" {
  description = "VPC name for Test environment"
  default = ""
}
variable "listener-arn-80" {
    description = "Listen ARN for Port 80"
    default = ""
}

variable "priority" {
    description = "Listener Rule Priority"
    default = 101
}

variable "domainame" {
    description = "Endpoint Domian Apex name"
    default = ""
}



variable "ecs_cluster_id" {
    description = "ECS Cluster ID"
    default =""
}

variable "image_name" {
    description = "Docker Image"
    default ="prasvats/jib"
}

variable "ecs_service_rolearn" {
    description = "ECS Service Role ARN"
    default = ""
}

variable "desire_count" {
    description = "Number of container"
    default = 3
}